<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link href="resources/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
    rel="stylesheet">

    <!-- 구글 아이콘 -->
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

    <!-- 구글폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&family=Poppins:wght@300&display=swap"
        rel="stylesheet">

    <!-- 부트스트랩 5.1.3-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>

/* ------------------------------------------------------------- */

.searchBar{
	
	margin-left:5px;
	margin-bottom:30px;
}
.board1 {
	margin-top: 20px;
}

.endListBox {
	margin: 20px 20px 25px 20px
}

.endSignList {
	border-top: 1px solid #878787;
	border-bottom: 1px solid #878787;
	text-align: center;
	width: 100%;
}

.endSignList tr {
	border-top: 1px solid #8787874c;
	border-bottom: 1px solid #8787874c;
}

.endSignList th {
	background-color: #8787872c;
}

.endNum {
	width: 10%;
}

.endCreate {
	width: 30%
}

.endTitle {
	width: 60%;
}

#listSection {
	height: 50%;
	box-shadow: 0px 0px 4px #8787877d;
}
.card-header {
	background-color: white !important;;
}

.col-md-6 {
	width: 20% !important;
	text-align: center !important;
}

.bg-primary, .bg-warning, .bg-success, .bg-danger {
	color: black !important;
	width: 70% !important;
	display: inline-block !important;
	height: 200px !important;
	border-radius: 25px !important;
	font-size: 25px !important;
	vertical-align: middle !important;
	box-shadow: 0px 0px 4px #878787 !important;
}


.bg-primary {
	background-color: rgba(52, 152, 219, 0.2) !important;
	color: white !important;;
}

.bg-warning {
	background-color: rgba(243, 156, 18, 0.2) !important;
}

.bg-success {
	background-color: rgba(46, 204, 113, 0.2) !important;
}

.bg-danger {
	background-color: rgba(255, 24, 0, 0.2) !important;
}

#totalBox {
	background-color: rgba(61, 96, 122, 0.2) !important;
}

#listSection a {
	height: 100%;
	vertical-align: middle;
	font-size: 60px;
	color: black !important;
	margin: auto;
	text-decoration: none;
}
.col-xi-3{

}
#signColorBox {
	margin-top: 20px;
	margin-left: 15px;
	margin-right: 15px;
}

#detailListIcon {
	vertical-align: middle;
	float: right;
}

#detailListIcon:hover {
	cursor: pointer;
	background-color: #8787871c;
}

.card-footer {
	background: none !important;
	padding-top: 15px !important;
}

tr {
	font-size: 20px !important;;
}

td {
	font-size: 18px !important;;
}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />

	<div class="container-fluid  px-4">
		<div class="row" id="signSection">
			<div class="searchBar">
				<select
					style="height: 30px; width: 90px; text-align: center; border: none; box-shadow: 0px 0px 4px #878787;">
					<option value="agree">결재완료</option>
					<option value="re">반려됨</option>
				</select> <input type="text"
					style="width: 30%; height: 30px; box-shadow: 0px 0px 4px #878787; border: none;">
				<button
					style="width: 60px; height: 30px; padding: 0; border: none; background: #87878740; box-shadow: 0px 0px 4px #878787;">검색</button>
			</div>
			<div class="col-xl-6 board1">
				<div class="card mb-4"
					style="height: 90%; box-shadow: 0px 0px 4px #8787877d;">
					<div class="card-header">
						<i class="fas fa-chart-area me-1"></i> 최근 작성된 기안서 <span
							id="detailListIcon" class="material-icons"> navigate_next
						</span>
					</div>
					<div class="endListBox">
						<table class="endSignList">
							<tr>
								<th class="endNum">번호</th>
								<th class="endTitle">제목</th>
								<th class="endCreate">작성일</th>
							</tr>
							<tr>
								<td>3</td>
								<td>여기는 제목이 나타나는 곳</td>
								<td>2022-09-01</td>
							</tr>

							<tr>
								<td>3</td>
								<td>여기는 제목이 나타나는 곳</td>
								<td>2022-09-01</td>
							</tr>

							<tr>
								<td>3</td>
								<td>여기는 제목이 나타나는 곳</td>
								<td>2022-09-01</td>
							</tr>

							<tr>
								<td>3</td>
								<td>여기는 제목이 나타나는 곳</td>
								<td>2022-09-01</td>
							</tr>

							<tr>
								<td>3</td>
								<td>여기는 제목이 나타나는 곳</td>
								<td>2022-09-01</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class="col-xl-6">
				<div class="card mb-4"
					style="height: 90%; box-shadow: 0px 0px 4px #8787877d;">
					<div class="card-header">
						<i class="fas fa-chart-bar me-1"></i> 결재된 보관함 <span
							id="detailListIcon" class="material-icons"> navigate_next
						</span>
					</div>
					<div class="endListBox">
						<table class="endSignList">
							<tr>
								<th class="endNum">번호</th>
								<th class="endTitle">제목</th>
								<th class="endCreate">작성일</th>
							</tr>
							<tr>
								<td>3</td>
								<td>여기는 제목이 나타나는 곳</td>
								<td>2022-09-01</td>
							</tr>

							<tr>
								<td>3</td>
								<td>여기는 제목이 나타나는 곳</td>
								<td>2022-09-01</td>
							</tr>

							<tr>
								<td>3</td>
								<td>여기는 제목이 나타나는 곳</td>
								<td>2022-09-01</td>
							</tr>

							<tr>
								<td>3</td>
								<td>여기는 제목이 나타나는 곳</td>
								<td>2022-09-01</td>
							</tr>

							<tr>
								<td>3</td>
								<td>여기는 제목이 나타나는 곳</td>
								<td>2022-09-01</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>


		<div class="card mb-4" id="listSection">
			<div class="card-header">
				<i class="fas fa-table me-1"></i> 기안서 현황
			</div>
			<div class="row" id="signColorBox">
				<div class="col-xl-3 col-md-6">
					<div class="card bg-primary text-white mb-4" id="saveBoard">
						<div class="card-body">작성중</div>
						<div id="listblue"
							class="card-footer d-flex align-items-center justify-content-between">
							<a class="small text-white stretched-link" href="#">22</a>
						</div>
					</div>
				</div>

				<div class="col-xl-3 col-md-6">
					<div class="card bg-success text-white mb-4">
						<div class="card-body">진행중</div>
						<div
							class="card-footer d-flex align-items-center justify-content-between">
							<a class="small text-white stretched-link" href="#">13</a>
						</div>
					</div>
				</div>

				<div class="col-xl-3 col-md-6">
					<div class="card bg-warning text-white mb-4">
						<div class="card-body">결재완료</div>
						<div
							class="card-footer d-flex align-items-center justify-content-between">
							<a class="small text-white stretched-link" href="#">2</a>
						</div>
					</div>
				</div>


				<div class="col-xl-3 col-md-6">
					<div class="card bg-danger text-white mb-4">
						<div class="card-body">반려됨</div>
						<div
							class="card-footer d-flex align-items-center justify-content-between">
							<a class="small text-white stretched-link" href="#">0</a>
						</div>
					</div>
				</div>

				<div class="col-xl-3 col-md-6">
					<div class="card bg-danger text-white mb-4" id="totalBox">
						<div class="card-body">기안전체</div>
						<div
							class="card-footer d-flex align-items-center justify-content-between">
							<a class="small text-white stretched-link" href="#">13</a>
						</div>
					</div>
				</div>
			</div>
		</div>


		<!-- 기안서 리스트 -->

	</div>
	</main>
	<!-- 푸터에 div단는거 두 개 필요 인클루드 하면 밑에 두개 삭제 -->
	</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="resources/js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script src="js/datatables-simple-demo.js"></script>
</body>
</html>