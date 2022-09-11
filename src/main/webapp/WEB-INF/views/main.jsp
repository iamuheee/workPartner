<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#main-outer {
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: space-between;
	padding-top:10px;
}

#main-outer a {
	text-decoration:none;
}

#left-area {
	width: 25%;
	height: 100%;
}

#right-area {
	width:23%;
	height:100%;
}

#profile-area, #timeMenu-area, #dashboard-area, #quickMenu-area {
	width: 100%;
	max-width:100%;
	padding:0;
}

.card text-black mb-4 {
	width:100%;
}

#profileCard {
	width:100%;
	height: auto;
	background-color: #E6EEFF;
}

#profile-tb {
	width: 100%;
}

#profileImg {
	width: 110px;
	height: 110px;
	border: 1px solid lightgray;
	border-radius: 50%;
}

#pf-card-body {
	height: 70%;
	color: black;
}

#pf-card-body a {
	text-decoration: none;
	color: #fff;
}

#pf-card-footer {
	disply:flex;
	justify-content: center;
}

#timeMenu-body, #dashboard-body, #quickMenu-body {
	height: auto;
}

#timeMenu-body *, #dashboard-body *, #quickMenu-body * {
	margin: 0;
	display: flex;
	justify-content: center;
	align-items: center;
}

#timeMenu-tb, #quickMenu-tb {
	width: 100%;
	text-align: center;
	font-size:14px;
}

#timeMenu-tb button {
	width: 45%;
	margin-bottom: 5px;
}

#dashboard-tb {
	width: 100%;
	font-size:14px;
}

#dashboard-tb tr {
	border-bottom: 1px solid #f1f1f1;
	height: 30px;
}

.new-num {
	color: red;
	font-weight: 500;
}

.quickA {
	display: block;
	width: 100%;
	height: 100%;
	text-decoration: none;
	color: black;
}

#center-area {
	width: 50%;
	height: 100%;
}

.card mb-4 {
	width: 100%;
}

.card-header {
	height:auto;

}

.card-total-title {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.read-more {
	text-decoration: none;
	color: black;
	font-size:12px;
}

.card-title {
	display: flex;
	align-items: center;
	margin-bottom:0 !important;
}

.header-title {
	font-size: 16px;
	font-weight: 300;
}

.card-body table {
	width: 100%;
	font-size:14px;
}

#noticeList tr:hover{
	cursor:pointer;
}

#signList tr:hover {
	cursor:pointer;
}

#mailList tr:hover{
	cursor:pointer;
}

</style>
</head>
<body>
	<jsp:include page="common/menubar.jsp" />

			<!-- 메인페이지 전체 영역 -->
			<div id="main-outer">

				<!-- 왼쪽 영역 -->
				<div id="left-area">
					<!-- 프로필 박스 -->
					<div class="col-xl-3 col-md-6 left-box" id="profile-area">
						<div class="card text-white mb-4" id="profileCard">
							<div class="card-body" id="pf-card-body">
								<table id="profile-tb">
									<tr align="center">
										<td rowspan="2" width="50%;">
											<img src="${pageContext.request.contextPath}/resources/profile_images/defaultProfile.png" id="profileImg">
										</td>
										<td style="padding-top: 15px;"><h4>이름름</h4></td>
									</tr>
									<tr align="center">
										<td>
											<h6>
												부서 / 직위 자리 <br> Work Partner!
											</h6>
										</td>
									</tr>
								</table>
							</div>
							<div class="card-footer d-flex align-items-center" id="pf-card-footer">
								<a href="mypage.em" style="text-decoration: none; color: black;text-align:center;">내 정보 수정</a>
							</div>
						</div>
					</div>
					<!-- 프로필 박스 끝 -->

					<!-- 출근 / 퇴근 박스 -->
					<div class="col-xl-3 col-md-6 left-box" id="timeMenu-area">
						<div class="card text-black mb-4" id="timeMenu">
							<div class="card-body" id="timeMenu-body">
								<span id="realClock"></span>
							</div>
							<div class="card-footer d-flex align-items-center" id="timeMenu-footer">
								<table id="timeMenu-tb">
									<tr>
										<td width="50%">
											<button class="btn btn-primary btn-sm">출근</button> <br>
											MM : DD AM
										</td>
										<td>
											<button class="btn btn-danger btn-sm">퇴근</button> <br>
											MM : DD PM
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
					<!-- 출근 / 퇴근 박스 끝 -->

					<!-- 현재 시간 출력 -->
					<script>
						var value = document.getElementById("realClock");

						function clock() {

							const d = new Date();

							const y = String(d.getFullYear());
							const m = String(d.getMonth() + 1);
							const dd = String(d.getDate());
							const day = String(d.getDay());
							const week = [ '일', '월', '화', '수', '목', '금', '토' ];

							const h = String(d.getHours()).padStart(2, "0");
							const mi = String(d.getMinutes()).padStart(2, "0");
							const s = String(d.getSeconds()).padStart(2, "0");

							realClock.innerHTML = '<span class="material-symbols-outlined">schedule</span>&nbsp;'
												+ y + '-' + m + '-' + dd + ' (' + week[day] + ') '
												+ h + ':' + mi + ':' + s;
						}

						clock();
						setInterval(clock, 1000); // 1초마다 실행
					</script>

					<!-- Dashboard 박스 -->
					<div class="col-xl-3 col-md-6 left-box" id="dashboard-area">
						<div class="card text-black mb-4" id="dashboard">
							<div class="card-body" id="dashboard-body">
								<p id="dashboardHeader">
									<span class="material-symbols-outlined">speed</span>&nbsp;<em>Dashboard</em>
								</p>
							</div>
							<div class="card-footer d-flex align-items-center id="dashboard-footer">
								<table id="dashboard-tb">
									<tr>
										<td width="50%">메일 / 받은편지함</td>
										<!-- 새로 받은 메일 / 총 메일 수 -->
										<td align="right"><span class="new-num"> 2 </span> / 125
											건</td>
									</tr>
									<tr>
										<td>쪽지 / 받은쪽지함</td>
										<td align="right"><span class="new-num"> 7 </span> / 356
											건</td>
									</tr>
									<tr>
										<td>결재 / 결재할 문서</td>
										<td align="right"><span class="new-num"> 3 </span> 건</td>
									</tr>
									<tr>
										<td>결재 / 결재 완료</td>
										<td align="right"><span class="new-num"> 0 </span> 건</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
					<!-- Dashboard 박스 끝 -->

					<!-- QuickMenu 박스 -->
					<div class="col-xl-3 col-md-6 left-box" id="quickMenu-area">
						<div class="card text-black mb-4" id="quickMenu">
							<div class="card-body" id="quickMenu-body">
								<p id="quickMenuHeader">
									<span class="material-symbols-outlined">bolt</span>&nbsp;<em>Quick
										Menu</em>
								</p>
							</div>
							<div class="card-footer d-flex align-items-center id="quickMenu-footer">
								<table id="quickMenu-tb">
									<tr>
										<td style="border-right: 1px solid #b7b9cc"><a
											href="쪽지쓰기" class="quickA">쪽지 쓰기</a></td>
										<td><a href="" class="quickA">회의실 예약</a></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
					<!-- QuickMenu 박스 끝 -->
				</div>
				<!-- 왼쪽 영역 끝 -->

				<!-- 가운데 영역 -->
				<div id="center-area">

					<!-- 공지사항 박스-->
					<div class="card mb-4">
						<!-- 각 영역 제목 -->
						<div class="card-header">
							<div class="card-total-title">
								<div class="card-title">
									<span class="material-symbols-outlined">keyboard_voice</span>&nbsp;
									<span class="header-title">공지사항</span>
								</div>
								<a href="" class="read-more">더보기 +</a>
							</div>
						</div>
						<!-- 각 영역 테이블 자리 -->
						<div class="card-body">
							<table id="noticeList" class="table table-sm table-hover">
								<thead>
									<tr align="center">
										<th scope="col" width="80%">제목</th>
										<th scope="col">등록일</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>공지사항입니다5</td>
										<td align="center">2022-09-05</td>
									</tr>
									<tr>
										<td>공지사항입니다5</td>
										<td align="center">2022-09-05</td>
									</tr>
									<tr>
										<td>공지사항입니다5</td>
										<td align="center">2022-09-05</td>
									</tr>
									<tr>
										<td>공지사항입니다5</td>
										<td align="center">2022-09-05</td>
									</tr>
									<tr>
										<td>공지사항입니다5</td>
										<td align="center">2022-09-05</td>
									</tr>

								</tbody>
							</table>
						</div>
					</div>
					<!-- 공지사항 박스 끝 -->

					<!-- 전자결재 박스-->
					<div class="card mb-4">
						<!-- 각 영역 제목 -->
						<div class="card-header">
							<div class="card-total-title">
								<div class="card-title">
									<span class="material-symbols-outlined">approval_delegation</span>&nbsp;
									<span class="header-title">전자결재</span>
								</div>
								<a href="" class="read-more">더보기 +</a>
							</div>
						</div>
						<!-- 각 영역 테이블 자리 -->
						<div class="card-body">
							<table id="signList" class="table table-sm table-hover">
								<thead>
									<tr>
										<th scope="col" width="50%">결재할 문서</th>
										<th scope="col" width="50%">결재중</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>결재할 문서4</td>
										<td>결재 완료3</td>
									</tr>
									<tr>
										<td>결재할 문서4</td>
										<td>결재 완료3</td>
									</tr>
									<tr>
										<td>결재할 문서4</td>
										<td>결재 완료3</td>
									</tr>
									<tr>
										<td>결재할 문서4</td>
										<td>결재 완료3</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!-- 전자결재 박스 끝 -->

					<!-- 메일 박스-->
					<div class="card mb-4">
						<!-- 각 영역 제목 -->
						<div class="card-header">
							<div class="card-total-title">
								<div class="card-title">
									<span class="material-symbols-outlined">mail</span>&nbsp; <span	class="header-title">메일</span>
								</div>
								<a href="" class="read-more">더보기 +</a>
							</div>
						</div>
						<!-- 각 영역 테이블 자리 -->
						<div class="card-body">
							<table id="mailList" class="table table-sm table-hover">
								<thead>
									<tr align="center">
										<th scope="col" width="60%">제목</th>
										<th scope="col" width="20%">보낸사람</th>
										<th scope="col" width="20%">날짜</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>이메일입니다4</td>
										<td align="center">김곰돌</td>
										<td align="center">2022-09-05</td>
									</tr>
									<tr>
										<td>이메일입니다4</td>
										<td align="center">김곰돌</td>
										<td align="center">2022-09-05</td>
									</tr>
									<tr>
										<td>이메일입니다4</td>
										<td align="center">김곰돌</td>
										<td align="center">2022-09-05</td>
									</tr>
									<tr>
										<td>이메일입니다4</td>
										<td align="center">김곰돌</td>
										<td align="center">2022-09-05</td>
									</tr>
									<tr>
										<td>이메일입니다4</td>
										<td align="center">김곰돌</td>
										<td align="center">2022-09-05</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!-- 메일 박스 끝 -->

				</div>
				<!-- 가운데 영역 끝-->

				<!-- 오른쪽 영역 -->
				<div id="right-area">
					<!-- 업무 현황 박스-->
					<div class="card mb-4">
						<!-- 각 영역 제목 -->
						<div class="card-header">
							<div class="card-total-title">
								<div class="card-title">
									<span class="material-symbols-outlined">trending_up</span>&nbsp;&nbsp;
									<span class="header-title">업무 현황</span>
								</div>
								<a href="" class="read-more">더보기 +</a>
							</div>
						</div>
						<!-- 각 영역 테이블 자리 -->
						<div class="card-body">
							<table id="taskList" class="table table-sm">
								<thead>
									<tr align="center">
										<th scope="col" style="color: #1A7742">할 일</th>
										<th scope="col" style="color: #0b60e0">진행중</th>
										<th scope="col">완료</th>
										<th scope="col" style="color: #e74a3b">지연</th>
									</tr>
								</thead>
								<tbody>
									<tr align="center">
										<td>1</td>
										<td>2</td>
										<td>5</td>
										<td>84</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!-- 업무 현황 박스 끝 -->

					<!-- To do list 박스-->
					<div class="card mb-4">
						<!-- 각 영역 제목 -->
						<div class="card-header">
							<div class="card-total-title">
								<div class="card-title">
									<span class="material-symbols-outlined">checklist</span>&nbsp;&nbsp;
									<span class="header-title">To do List</span>
								</div>
								<a href="" class="read-more">더보기 +</a>
							</div>
						</div>
						<!-- 각 영역 테이블 자리 -->
						<div class="card-body">
							<table id="todoList" class="table table-sm">
								<thead>
									<tr align="center">
										<th scope="col">To do 리스트 자리</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>원하는만큼 채워주세요</td>
									</tr>
									<tr>
										<td>원하는만큼 채워주세요</td>
									</tr>
									<tr>
										<td>원하는만큼 채워주세요</td>
									</tr>
									<tr>
										<td>원하는만큼 채워주세요</td>
									</tr>
									<tr>
										<td>원하는만큼 채워주세요</td>
									</tr>
									<tr>
										<td>원하는만큼 채워주세요</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!-- To do list 박스 끝 -->

					<!-- 캘린더 박스 -->
					<div class="card mb-4">
						<!-- 각 영역 제목 -->
						<div class="card-header">
							<div class="card-total-title">
								<div class="card-title">
									<span class="material-symbols-outlined">calendar_month</span>&nbsp;&nbsp;
									<span class="header-title">캘린더</span>
								</div>
								<a href="" class="padding:0px;"></a>
							</div>
						</div>
						<!-- 각 영역 테이블 자리 -->
						<div class="card-body">캘린더를 넣고 싶다 넣을 수 있겠지 넣어야 한다</div>
					</div>
					<!-- 캘린더 박스 끝 -->
				</div>
				<!-- 오른쪽 영역 끝 -->

			</div>
</body>
</html>