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
.mainOuter{
	margin-top:0 !important;
}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />

	<c:choose>
		<c:when test="${ flag == 'otherSign' }">
			<div class="container-fluid px-4" style="margin-top: 30px;">
				<div style="margin-bottom: 50px; line-height: 10px;">
					<ol class="breadcrumb mb-4" style="font-size: 18px; width: 100%;">
						<li>결재함 >&nbsp</a></li>
						<li><b>타부서 결재하기</b></li>
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
						</select> <span style="font-size: 14px; float: left; margin-left: 15px;">부서명
							: </span> <select>
							<option value="" hidden>부서선택</option>
							<option value="">인사부</option>
							<option value="">영업부</option>
							<option value="">개발부</option>
							<option value="">총무부</option>
							<option value="">마케팅부</option>
							<option value="">재무회계부</option>
						</select> <input type="text"
							style="width: 15%; box-shadow: 0px 0px 2px #878787; border: none;"
							align="right">
						<button
							style="width: 60px; padding: 0; border: none; background: #87878740; box-shadow: 0px 0px 2px #878787;">검색</button>
					</div>

					<table class="endSignList" width="100%">

						<tr align="center">
							<th class="endNum" width="7%">서식</th>
							<th class="endTitle" width="30%">제목</th>
							<th class="endCreate" width="10%">요청부서</th>
							<th width="10%">기안자</th>
							<th width="10%">기안일</th>
							<th width="10%">현재결재자</th>
							<th width="10%">최종결재자</th>
						</tr>

						<tr align="center">
							<td>업무협조</td>
							<td>여기는 제목이 나타나는 곳</td>
							<td>마케팅</td>
							<td>김범진</td>
							<td>2022-09-01</td>
							<td>강보람(인사)</td>
							<td>김종군(마케팅)</td>
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
						<li>결재함 >&nbsp</a></li>
						<li><b>타부서 결재완료</b></li>
					</ol>
					<hr>
				</div>

				<div>
					<div class="searchbar" style="width: 100%;" align="right">
						<span style="font-size: 16px; float: left;">서식명 : </span> <select>
							<option value="">전체</option>
							<option value="">연차</option>
							<option value="">업무협조</option>
							<option value="">외근</option>
							<option value="">퇴직원</option>
						</select> <span style="font-size: 16px; float: left; margin-left: 15px;">부서명
							: </span> <select>
							<option value="" hidden>부서선택</option>
							<option value="">인사부</option>
							<option value="">영업부</option>
							<option value="">개발부</option>
							<option value="">총무부</option>
							<option value="">마케팅부</option>
							<option value="">재무회계부</option>
						</select> <input type="text"
							style="width: 15%; box-shadow: 0px 0px 2px #878787; border: none;"
							align="right">
						<button
							style="width: 60px; padding: 0; border: none; background: #87878740; box-shadow: 0px 0px 2px #878787;">검색</button>
					</div>

					<table class="endSignList" width="100%">

						<tr align="center">
							<th width="5%">번호</th>
							<th class="endNum" width="5%">서식</th>
							<th class="endTitle" width="30%">제목</th>
							<th class="endCreate" width="10%">요청부서</th>
							<th width="5%">기안자</th>
							<th width="10%">나의 결재일</th>
							<th width="10%">최종결재자</th>
						</tr>

						<tr align="center">
							<td>1</td>
							<td>업무협조</td>
							<td>여기는 제목이 나타나는 곳</td>
							<td>마케팅</td>
							<td>김범진</td>
							<td>2022-09-01</td>
							<td>강보람(인사)</td>
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
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script src="js/datatables-simple-demo.js"></script>
</body>
</html>