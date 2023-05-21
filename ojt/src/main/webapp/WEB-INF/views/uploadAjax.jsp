<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/resources/libs/bower/jquery/dist/jquery.js"></script>
<style>
.uploadResult{
width:100%;
background-color:gray;
}

.uploadResult ul{
display:flex;
flex-flow:row;
justify-content:center;
align-items:center;
}

.uploadResult ul li{
list-style : none;
padding: 10px;
}

.uploadResult ul li img{
width:20px;
}
.uploadResult ul li span{
color:white;
cursor:pointer;
}
.bigPictureWrapper {
position:absolute;
display: none;
justify-content: center;
align-items: center;
top:0%;
width:100%;
height:100%;
background-color: gray;
z-index:100;
background: rgba(255,255,255, 0.5);
}

.bigPicture{
position: relative;
display: flex;
justify-content: center;
align-items: center;

}
.bigPicture img {
width: 600px;
}
</style>


</head> 
<body>
<div class="bigPictureWrapper">
	<div class="bigPicture">
	</div>
</div>



<h1>Upload with Ajax</h1>
<div class="uploadDiv">
	<input type="file" name="uploadFile" multiple>
</div>
<div class="uploadResult">
	<ul>
	</ul>
</div>
<button id="uploadBtn">Upload</button>
</body>
<script>
function showImage(fileCallPath){
	$(".bigPictureWrapper").css("display","flex").show();
	
	$(".bigPicture").html("<img src='/display?fileName="+fileCallPath+"'>")
	.animate({width:'100%',height:'100%'}, 1000);
}


$(document).ready(function(){
	
	let regex = new RegExp("(.*?)\.(png|gif|jpg|txt)$");
	let maxSize = 5242880;//5Mbyte
	
	function checkExtension(fileName, fileSize){
		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
		
		if(!regex.test(fileName)){
			alert("해당 종류의 파일은 업로드 할 수 없습니다.");
			return false;
		}
		return true;
	}
	
	
	var cloneObj = $(".uploadDiv").clone();
	
	$("#uploadBtn").on("click", function(){
		let formData = new FormData();
		let inputFile = $("input[name=uploadFile]");
		
		let files = inputFile[0].files;
		console.log(files);
		
		for(let i = 0; i < files.length; i++){
			
			if(!checkExtension(files[i].name, files[i].size)){
				return false;
			}
			
			formData.append("uploadFile", files[i]);
		}
		
		$.ajax({
			url:'/uploadAjaxAction',
			processData:false,
			contentType:false,
			data:formData,
			type:'POST',
			dataType:'json',
			success:function(result){
				console.log(result);
				/* input type=file 을 초기화 */
				$(".uploadDiv").html(cloneObj.html());
				
				/* ajax 결과값을 출력 */
				showUploadedFile(result);
				
			}
		});
		
		
	});
	
	let uploadResult = $(".uploadResult ul");
	
	function showUploadedFile(uploadResultArr){
		let str = "";
		
		$(uploadResultArr).each(function(i, obj){
			
			let fileDownPath = obj.uploadPath+"/"+obj.uuid+"_"+encodeURIComponent(obj.fileName);
			
			if(!obj.image){
				str += "<li><a href='/download?fileName="+fileDownPath+"'><img src='/resources/assets/images/attach.png'>" + obj.fileName + "</a><span data-file='"+fileDownPath+"' data-type='file'>&times;</span></li>";
			} else {
				let fileCallPath = encodeURIComponent(obj.uploadPath + "/thum_"+obj.uuid+"_"+obj.fileName);
				
				fileDownPath = fileDownPath.replace(new RegExp(/\\/g), "/");
				
				str += "<li><a href='javascript:showImage(\""+fileDownPath+"\")'><img src='/display?fileName="+fileCallPath+"'></a><span data-file='"+fileCallPath+"' data-type='image'>&times;</span></li>";
			}
		});
		
		uploadResult.append(str);
	}
	
	$(".bigPictureWrapper").on("click", function(){
		$(".bigPicture").animate({width:'0%',height:'0%'}, 1000);
		setTimeout(()=>{
			$(this).hide();
		}, 1000);
	});
	
	$(".uploadResult").on("click","span", function(){
		let targetFile = $(this).data("file");
		let type = $(this).data("type");
		let my = $(this);
		//console.log(my);
		$.ajax({
			url:'/deleteFile',
			data: {fileName:targetFile, type:type},
			dataType:'text',
			type:'post',
			success: function(result){
				my.parent().remove();
			}
		});
	});
	
	
	
	
	
});//$(document).ready(function(){
</script>
</html>