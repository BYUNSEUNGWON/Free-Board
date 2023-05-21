<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<%@ include file="../includes/header.jsp" %>

<div class="wrap">
	<section class="app-content">
		<div class="row">

			<div class="col-md-12">
				<div class="widget p-lg">
					<h4 class="m-b-lg">Hospital List</h4>
					<p class="m-b-lg docs">
					</p>
					<div class="text-right m-b-sm">
						<a href="/hospital/register" class="btn btn-success btn-sm" role="button">Register New Hospital</a>
					</div>
					<div class="table-responsive">
						<table class="table table-bordered">
							<colgroup>
							<col style="width:60px;"/>
							<col style="width:auto;"/>
							<col style="width:130px;"/>
							<col style="width:105px;"/>
							<col style="width:105px;"/>
							</colgroup>
							<thead>
								<tr class="info text-color">
									<th>#번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>수정일</th>
								</tr>
							</thead>
							<tbody>
							<c:set var="cnt" value="0"/>							
							<c:forEach var="hospital" items="${list}">
								<tr>
									<td>${hospital.bno }</td>
									<td><a href="get${pageMaker.cri.listLink }&bno=${hospital.bno}">${hospital.title }</a>
									<span class="badge badge-primary">${hospital.replyCnt }</span></td>
									<td>${hospital.writer }</td>
									<td><fmt:formatDate value="${hospital.regdate }" pattern="yyyy-MM-dd"/></td>
									<td><fmt:formatDate value="${hospital.updateDate }" pattern="yyyy-MM-dd"/></td>
								</tr>
							<c:set var="cnt" value="${cnt+1}"/>
							</c:forEach>
							<c:if test="${cnt == 0}">
								<tr>
									<td colspan="5">등록된 글이 없습니다.</td>
								</tr>
							</c:if>
							</tbody>
						</table>
						
					</div>
					<div class="text-center" style="margin-top:27px;">					
						<!-- search results navigation -->
						<nav class="search-results-navigation">
							<ul class="pagination m-0">
								<c:if test="${pageMaker.prev }">
								<li>
									<a href="${pageMaker.cri.pagingLink }&pageNum=${pageMaker.startPage-1}" aria-label="Previous">
									<span aria-hidden="true"><i class="fa fa-chevron-left"></i></span>
									</a>
								</li>
								</c:if>
								<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
								<li class="${pageMaker.cri.pageNum == num?"active":"" }">
								<a href="${pageMaker.cri.pagingLink }&pageNum=${num}">${num}</a>
								</li>
								</c:forEach>
								<c:if test="${pageMaker.next }">
								<li>
									<a href="${pageMaker.cri.pagingLink }&pageNum=${pageMaker.endPage+1}" aria-label="Next">
									<span aria-hidden="true"><i class="fa fa-chevron-right"></i></span>
									</a>
								</li>
								</c:if>
							</ul>
						</nav><!-- END search-results-navigation -->
					</div>
					<div class="text-center" style="margin-top:27px;">					
						<form id="searchForm" class="form-inline">
							<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
							<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
							<div class="form-group">
							
							<select name="type" class="form-control">
								<option value="">전체</option>
								<option value="T" ${pageMaker.cri.type eq "T"?"selected":"" }>제목</option>
								<option value="C" ${pageMaker.cri.type eq "C"?"selected":"" }>내용</option>
								<option value="W" ${pageMaker.cri.type eq "W"?"selected":"" }>작성자</option>
								<option value="TC" ${pageMaker.cri.type eq "TC"?"selected":"" }>제목OR내용</option>
								<option value="TW" ${pageMaker.cri.type eq "TW"?"selected":"" }>제목OR작성자</option>
								<option value="TWC" ${pageMaker.cri.type eq "TWC"?"selected":"" }>제목OR내용OR작성자</option>
							</select>
							<input type="text" name="keyword" class="form-control" value="${pageMaker.cri.keyword}">
							</div>
							<div class="form-group">
							<button class="btn btn-default btn-sm">Search</button>
							</div>
						</form>
					</div>
				</div>
				<!-- .widget -->
			</div>
			<!-- END column -->
		</div>
		<!-- .row -->
	</section>
	<!-- #dash-content -->
</div>
<!-- .wrap -->
<!-- 모달 추가 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">Modal title</h4>
			</div>
			<div class="modal-body">처리가 완료되었습니다.</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<!-- <button type="button" class="btn btn-primary">Save changes</button> -->
			</div><!-- modal-footer -->
		</div><!-- modal-content -->
	</div><!-- modal-dialog -->
</div><!-- modal fade -->
<!-- 모달 끝 -->

<form id="actionForm">
<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
<input type="hidden" name="type" value="${pageMaker.cri.type}">
<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
</form>

<script>
$(document).ready(function(){
	let result = '${result}';
	
	checkModal(result);
	
	function checkModal(result){
		if(result == ''){
			return;
		}
		
		if(parseInt(result) > 0){
			$(".modal-body").html("게시물 " + result + " 번이 등록되었습니다.");
		}
		
		$("#myModal").modal("show");
	}
			
	
	$("#searchForm button").on("click", function(event){
		
		if($("#searchForm").find("option:selected").val() == ''){
			return true;
		}

		event.preventDefault();
		
		if(!$("#searchForm").find("input[name=keyword]").val()){
			alert("키워드를 입력하세요");
			return false;
		}
		
		if(!$("#searchForm").find("option:selected").val()){
			alert("검색종류를 선택하세요");
			return false;
		}
		
		$("#searchForm").find("input[name=pageNum]").val(1);
		
		$("#searchForm").submit();
		
	});
	
});
</script>


<%@ include file="../includes/footer.jsp" %>