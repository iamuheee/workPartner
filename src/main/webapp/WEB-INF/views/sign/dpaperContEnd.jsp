<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

/* ............................ */
table th {
	border-top: 1px solid #878787;
	border-bottom: 1px solid #878787;
	height: 50x;
	font-size: 16px;
}

table td {
	border-bottom: 0.5px solid #878787;
	font-size: 14px;
}

table {
	margin-top: 10px;
}

.searchbar select {
	margin-left: 5px;
	float: left;
	border: none;
	box-shadow: 0px 0px 2px #878787;
	font-size: 14px;
}

.pagination {
	font-size: 12px;
	margin-top: 10px;
	margin-right: auto;
	margin-left: auto;
	width: 280px;
}

#layoutSidenav_content {
	font-family: 'Noto Sans KR', sans-serif;
}
/* .mainOuter{
	margin-top:0 !important;
} */
</style>

</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<c:choose>
		<c:when test="${ flag == 'continue' }">
			<div class="container-fluid px-4" style="margin-top: 30px;">
				<div style="margin-bottom: 50px; line-height: 10px;">
					<ol class="breadcrumb mb-4" style="font-size: 18px; width: 100%;">
						<li>기안서 >&nbsp</a></li>
						<li><b>진행중</b></li>
					</ol>
					<hr>
				</div>

				<div>
					<div class="searchbar" style="width: 100%;" align="right">
						<span style="font-size: 14px; float: left;">서식명 : </span> <select>
							<option value="">전체</option>
							<option value="">연차</option>
							<option value="">업무협조</option>
							<option value="">외근</option>
							<option value="">퇴직원</option>
						</select> <span style="font-size: 14px; float: left; margin-left: 15px;">작성일
							: </span> <select>
							<option value="">최근 1개월</option>
							<option value="">최근 3개월</option>
							<option value="">최근 6개월</option>
						</select> <input type="text"
							style="width: 15%; box-shadow: 0px 0px 2px #878787; border: none;"
							align="right">
						<button
							style="width: 60px; padding: 0; border: none; background: #87878740; box-shadow: 0px 0px 2px #878787;">검색</button>
					</div>

					<table class="endSignList" width="100%">

						<tr align="center">
							<th width="5%">번호</th>
							<th class="endNum" width="10%">서식</th>
							<th class="endTitle" width="30%">제목</th>
							<th class="endCreate" width="10%">첨부파일</th>
							<th class="endCreate" width="10%">진행상태</th>
							<th width="10%">기안일</th>
							<th width="10%">최종결재자</th>
						</tr>
						<c:choose>
	                		<c:when test="${empty progressList }">
	                			<tr>
	                				<td colspan="6" align="center">현재 게시글이 없습니다.</td>
	                			</tr>
	                		</c:when>
	                		<c:otherwise>
	                			<c:forEach var="p" items="${ progressList }">
				                    <tr align="center">
				                   	    <td>${ p.dpNo }</td>
				                        <td>${ p.dpCategory }</td>
				                        <c:choose>
					                        <c:when test="${empty s.dpTitle }">
					                        	<td><a href="" class="dpTitle">제목없음</a></td>
					                        </c:when>
					                        <c:otherwise>
					                        	<td><a href="" class="dpTitle">${ s.dpTitle }</a></td>
					                        </c:otherwise>
				                        </c:choose>
				                        <td>${ s.dpCreate }</td>
				                        <td>
					                        <c:if test="${ not empty s.dpOrigin }">
					                       		<span class="material-icons" style="vertical-align:middle; font-size:17px; color:#878787;">
												attachment
												</span>
					                        </c:if>
				                        </td>
				                        <td></td>
                          				<td><a href="" class="dpTitle">작성하기</a></td>
				                    </tr>
				                    <script>
										$(document).ready(function(){
											$(".dpTitle").click(function(){
					                    		if('${s.dpCategory}' == '연차'){
													$(".dpTitle").attr("href", "detailVa.si");
												}else if('${s.dpCategory}' == '외근'){
													$(".dpTitle").attr("href", "detailOtw.si");
												}else if('${s.dpCategory}' == '퇴직원'){
													$(".dpTitle").attr("href", "detailRes.si");
												}else{
													$(".dpTitle").attr("href", "detailCo.si");
												}
											})
										})
									</script>
			                    </c:forEach>
	                		</c:otherwise>
	                   </c:choose>
						<tr align="center">
							<td>1</td>
							<td>업무협조</td>
							<td>여기는 제목이 나타나는 곳</td>
							<td><span style="color: #19ce60;">진행중</span></td>
							<td>2022-09-01</td>
							<td><a>작성하기</a></td>
						</tr>

					</table>
					<ul class="pagination"
						style="margin-top: 10px; margin-right: auto; margin-left: auto; width: 400px">
						<li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">4</a></li>
						<li class="page-item"><a class="page-link" href="#">5</a></li>
						<li class="page-item"><a class="page-link" href="#">다음</a></li>
					</ul>
				</div>
			</div>
		</c:when>

		<c:otherwise>
			<div class="container-fluid px-4" style="margin-top: 30px;">
				<div style="margin-bottom: 50px; line-height: 10px;">
					<ol class="breadcrumb mb-4" style="font-size: 18px; width: 100%;">
						<li>기안서 >&nbsp</a></li>
						<li><b>완료됨</b></li>

					</ol>
					<hr>
				</div>

				<div>
					<div class="searchbar" style="width: 100%;" align="right">
						<span style="font-size: 14px; float: left;">서식명 : </span> <select
							style="margin-left: 5px; float: left; width: 90px; text-align: center; border: none; box-shadow: 0px 0px 2px #878787;">
							<option value="">전체</option>
							<option value="">연차</option>
							<option value="">업무협조</option>
							<option value="">외근</option>
							<option value="">퇴직원</option>
						</select> <span style="font-size: 14px; float: left; margin-left: 15px;">작성일
							: </span> <select
							style="margin-left: 5px; float: left; width: 90px; text-align: center; border: none; box-shadow: 0px 0px 2px #878787;">
							<option value="">최근 1개월</option>
							<option value="">최근 3개월</option>
							<option value="">최근 6개월</option>
						</select> <input type="text"
							style="width: 15%; box-shadow: 0px 0px 2px #878787; border: none;"
							align="right">
						<button
							style="width: 60px; padding: 0; border: none; background: #87878740; box-shadow: 0px 0px 2px #878787;">검색</button>
					</div>

					<table class="endSignList" width="100%">

						<tr align="center">
							<th width="5%">번호</th>
							<th class="endNum" width="10%">서식</th>
							<th class="endTitle" width="30%">제목</th>
							<th width="10%">기안일</th>
							<th class="endCreate" width="10%">최종 결재자</th>
							<th width="10%">결재일</th>
						</tr>

						<tr align="center">
							<td>1</td>
							<td>업무협조</td>
							<td>여기는 제목이 나타나는 곳</td>
							<td>2022-09-01</td>
							<td>강보람 <span style="color: #19ce60;">결재완료</span></td>
							<td>2022-10-01</td>
						</tr>
					</table>
					<ul class="pagination"
						style="margin-top: 10px; margin-right: auto; margin-left: auto; width: 400px">
						<li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">4</a></li>
						<li class="page-item"><a class="page-link" href="#">5</a></li>
						<li class="page-item"><a class="page-link" href="#">다음</a></li>
					</ul>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
	</main>

	</div>
	</div>
</body>
</html>