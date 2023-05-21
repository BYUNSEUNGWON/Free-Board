<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="includes/header.jsp" %>

			<div class="col-md-12">
				<div class="widget">
					<header class="widget-header">
						<h4 class="widget-title">숫자야구게임</h4>
					</header><!-- .widget-header -->
					<img class="img-body" src="https://media.istockphoto.com/id/1335861756/ko/%EC%82%AC%EC%A7%84/%ED%94%84%EB%A1%9C-%EC%95%BC%EA%B5%AC-%EC%84%A0%EC%88%98-%EB%AA%A8%EC%85%98-%EC%8A%A4%ED%8F%AC%ED%8A%B8%EB%9D%BC%EC%9D%B4%ED%8A%B8%EC%99%80-%ED%95%A8%EA%BB%98-%ED%91%B8%EB%A5%B8-%EC%A0%80%EB%85%81-%ED%95%98%EB%8A%98%EC%9D%84-%ED%86%B5%ED%95%B4-%EA%B2%BD%EA%B8%B0%EC%9E%A5%EC%97%90%EC%84%9C-%EA%B2%BD%EA%B8%B0-%EC%A4%91-%ED%96%89%EB%8F%99-%EC%8A%A4%ED%8F%AC%EC%B8%A0-%EC%87%BC-%EA%B2%BD%EC%9F%81%EC%9D%98-%EA%B0%9C%EB%85%90.jpg?b=1&s=170667a&w=0&k=20&c=JcpDk43HDI5KsGZuFeKxhZ9AxJtOa3uxq87TySx_Wl4=">
					<hr class="widget-separator">
					<div class="widget-body">
						 <div id="question">4자리의 랜덤 숫자 맞추기 !
						</div>
						<a href="#" id="question" class="new"><strong>게임 방법 바로 보기</strong> </a>
						    <div id="result"></div>
							    <form id="answer_form" action="submit">
							        <input id="answer" type="text">
							        <button>submit</button>
							    </form>
					    <div>
					        <span>남은 기회:</span>
					        <span id="remainedChance"></span>
					    </div>
					</div><!-- .widget-body -->
				</div><!-- .widget -->
			</div><!-- END column -->
			
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">New Modal</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label>게임방식</label>
					<div class="form-control" style="height: auto; font-size: 16px;">
						<ul>
						  <li> 1. 랜덤으로 숫자 4자리가 생성됩니다. ex) 1234, 7869 </li>
						  <li> 2. 플레이어는 숫자를 맞추면 이기는 게임입니다. </li>
						  <li> 3. 입력한 숫자가 값만 동일할 경우 ball, 값과 위치도 동일할 경우 strike 입니다.</li>
						  <li><small> ex) 정답이 1234인데 입력을 1256을 하면 2strike 0ball입니다.</li>
						  <li> ex) 정답이 1234인데 입력을 1356을 하면 1strike 1ball입니다.</small></li>
						  <li> 4. 총 10번의 기회가 주어집니다. 건승을 빕니다.</li>
						</ul>
					</div>
				</div>

			</div>
			<div class="modal-footer">
				<button id="modalCloseBtn" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div><!-- modal-footer -->
		</div><!-- modal-content -->
	</div><!-- modal-dialog -->
</div><!-- modal fade -->		
  
<%@ include file="includes/footer.jsp" %>	
</body>
<style>
.widget-body{
	text-align: center;
}

.img-body {
	display: block;
	margin: auto;
}
</style>

<script type="text/javascript">

$(document).ready(function(){
	//모달창 띄우기
	var modal = $(".modal");
	
	$(".new").on("click", function(e){
		
		modal.modal("show");
	});
});
	
var question = document.getElementById('question');
var result = document.getElementById('result');
var answer_form = document.getElementById('answer_form');
var answer = document.getElementById('answer');
var remainedChance = document.getElementById('remainedChance');
var number_candidate;
var number_picked;
var wrongAnswerNumbers = 0;

function random_number() {
    number_candidate = [1,2,3,4,5,6,7,8,9];
    number_picked = [];
    for (var i = 0; i < 4; i += 1) {
        var picked = number_candidate.splice(Math.floor(Math.random() * (9 - i)), 1)[0];
        number_picked.push(picked);
    }
}

random_number();

console.log(number_picked); // 뽑힌 4자리 숫자 확인용

answer.maxLength = 4;
answer.focus();
remainedChance.innerHTML = 10;

answer_form.addEventListener('submit', function(event) {
    event.preventDefault();
    question.textContent = '';
    if (answer.value === number_picked.join('')) { // 정답을 맞췄을 경우
        result.textContent = 'Home run! 정답입니다!'
        answer.value = '';
        answer.focus();
        random_number();
        console.log(number_picked);
        wrongAnswerNumbers = 0;
        remainedChance.innerHTML = 10;
    } else {
        var answer_array = answer.value.split('');
        var strike = 0;
        var ball = 0;
        wrongAnswerNumbers += 1;
        remainedChance.innerHTML -= 1; 
        if (wrongAnswerNumbers > 10) { // 10번 넘게 틀린 경우
            result.textContent = '아쉽게도 10회의 기회를 소진하셨습니다..ㅠㅠ 정답은 ' + number_picked.join('') + '였습니다.';
            answer.value = '';
            answer.focus();
            random_number();
            console.log(number_picked); // 새 문제 확인용
            wrongAnswerNumbers = 0;
            remainChance.innerHTML = 10;
        } else { // 10번 미만으로 틀린 경우
            for (var i = 0; i < 4; i += 1) {
                if (Number(answer_array[i]) === number_picked[i]) {
                    strike += 1;
                } else if (number_picked.indexOf(Number(answer_array[i])) > -1) {
                    ball += 1;
                }
            }
            result.textContent = strike + ' strike ' + ball + ' ball ';
            answer.value = '';
            answer.focus();
        }
        console.log(number_picked); // 새 문제 확인용
    }
});
</script>
</html>