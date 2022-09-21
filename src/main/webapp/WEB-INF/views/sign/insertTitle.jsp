<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<!-- 구글폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&family=Poppins:wght@300&display=swap"
	rel="stylesheet">

<!-- 부트스트랩 4.6 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
	crossorigin="anonymous"></script>

<!-- jQuery 라이브러리 -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- css -->


<style>


.insertBtn {
	font-size: 18px;
	color: black;
	font-weight: bold;
	margin-left: 10px;
	border-right: 0.5px solid rgba(143, 143, 143, 0.547);
	padding-right: 15px;
}

.insertBtn:hover {
	color: gray;
	cursor: pointer;
}

.mainTitle {
	width: 100%;
	margin-top: 10px;
}

hr {
	opacity: 0.7;
	width: 100%;
}

h3 {
	margin: 0;
	margin-bottom: 10px;
	margin-left: 10px;
}

.dtpaperName {
	margin-left: 10px;
	line-height: 10px;
}

table {
	font-size: 16px;
	border-spacing: 0px;
	border: 0.5px solid rgba(143, 143, 143, 0.547);
}

tr {
	height: 30px;
}

a {
	color: blue
}

th {
	font-weight: 400;
}

th, td {
	border-right: 0.5px solid rgba(143, 143, 143, 0.547);
}

.signSelect tr {
	text-align: center;
	width: 100%;
}

.signSelect th {
	background-color: #f1f1f1;
	width: 101px;
}

.signSelect td {
	width: 150px;
	border: 0;
}

.publicPaper th {
	background-color: #f1f1f1;
	width: 100px;
}

.publicPaper td {
	width: 664px;
	border: 0;
}

.titleSection th, td {
	border-bottom: 0.5px solid rgba(143, 143, 143, 0.547);
}

.plusVa {
	margin-left: 10px;
	font-size: 16px;
	height: 30px;
	border: none;
	box-shadow: 0px 0px 4px #878787;
}

.plusVa:hover {
	cursor: pointer;
	background-color: #8787874d;
}

.selectVa {
	margin: 10px;
	font-size: 16px;
}

.selectVa>span {
	margin-right: 10px;
}

input, select, textarea {
	border: 0.5px solid rgba(143, 143, 143, 0.547)
}

/* -----------------모달----------------------- */
#modal {
	z-index: 1550;
}

#modal.modal-overlay {
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	top: 0;
	display: none;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	background: rgba(95, 95, 95, 0.666);
	box-shadow: 0 8px 32px 0 rgba(61, 61, 61, 0.37);
	backdrop-filter: blur(1.5px);
	-webkit-backdrop-filter: blur(1.5px);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
}

#modal .modal-window {
	background: rgba(255, 255, 255);
	box-shadow: 0 8px 32px 0 rgba(34, 34, 34, 0.37);
	backdrop-filter: blur(13.5px);
	-webkit-backdrop-filter: blur(13.5px);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
	width: 700px;
	height: 1100px;
	position: relative;
	top: 0;
}

#modal .modaltitle {
	display: inline-block;
	color: rgb(7, 7, 7);
	border-bottom: 1px solid #8787874d;
	padding-bottom: 10px;
	margin-top: 15px;
	width: 100%;
}

#modal .modaltitle h2 {
	display: inline;
	padding: 20px;
}

#modal .modalcontent {
	margin-top: 20px;
	padding: 0px 10px;
	text-shadow: 1px 1px 2px gray;
	color: rgb(0, 0, 0);
}

#modal .modaltitle>hr {
	margin-top: 15px;
	margin-bottom: 0;
	padding: 0;
}

.material-symbols-outlined {
	font-variation-settings: 'FILL' 0, 'wght' 600, 'GRAD' 0, 'opsz' 48;
	float: right;
	color: rgb(143, 143, 143);
	margin-right: 20px;
}

.close-area:hover {
	cursor: pointer;
	color: rgb(100, 100, 100);
	font-weight: 600;
}

.searchEmp {
	display: flex;
	width: 50%;
	height: 500px;
	border-right: 1px solid #8787874d;
	margin-top: 0;
}

.selectEmp {
	flex-direction: column;
	width: 50%;
}

.material-symbols-outlined {
	font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 48
}

.modalSearch {
	position: relative;
	height: 30px;
	width: 95%;
	margin-left: 15px;
	margin-top: 15px;
}

.searchBtn {
	position: absolute;
	left: 140px;
	top: 80px;
	background-color: white;
	border: none;
}

.searchBtn:hover {
	cursor: pointer;
	color: black;
}

input[type=text] {
	width: 97%;
	box-sizing: border-box;
	margin: auto;
	height: 100%;
	border: 0;
	font-size: 16px;
	background-color: #ffffff48;
	padding: auto;
}

</style>



</head>
<body style="width: 800px; font-family: 'Noto Sans KR', sans-serif;">
	<c:if test="${ not empty alertSignMsg }">
		<script>
			alert("${alertSignMsg}");
		</script>
		<c:remove var="alertSignMsg" scope="session" />
	</c:if>
	<form action="" method="post" name="insertForm" id="insertForm" enctype="multipart/form-data"> 
	<input type="hidden" name="dpCategory" value="${ paperName }">
		
	<section class="mainTitle">
			<a class="insertBtn" onclick="insertCheck();">기안하기</a>
			<a class="insertBtn" onclick="saveCheck()">임시저장</a>
		<a class="insertBtn" id="btn-modal" onclick="openAddressWindow();">결재선 추가</a>
		<hr>
	</section>
	<script>
		function saveCheck() {
			if (confirm("임시저장하시겠습니까?") == true) { //확인
				
				if('${paperName}' == '연차'){
					document.insertForm.action = "saveVa.si";
				}else if('${paperName}' == '외근'){
					document.insertForm.action = "saveOt.si";
				}else if('${paperName}' == '업무협조'){
					document.insertForm.action = "saveCo.si";
				}else {
					document.insertForm.action = "saveRe.si";
				}
				document.insertForm.submit();
			} else { //취소
				return false;
			}
		}
	</script>
	<script>
		function insertCheck() {
			if (confirm("기안하시겠습니까?") == true) { //확인
				
				if('${paperName}' == '연차'){
					document.insertForm.action = "insertV.si";
				}else if('${paperName}' == '외근'){
					document.insertForm.action = "insertOw.si";
				}else if('${paperName}' == '업무협조'){
					document.insertForm.action = "insertCo.si";
				}else {
					document.insertForm.action = "insertRe.si";
				}
				document.insertForm.submit();

			} else { //취소
				return false;
			}
		}
	</script>
	
	
	
	<section>
		<div>
			<h3 class="dtpaperName">
				<span>${ paperName }</span> 신청서 - <span
					style="font-weight: lighter;"><input type="hidden" name="empNo" value="${ loginUser.empNo }">${ loginUser.empName }(${ loginUser.depCd })</span>
			</h3>
			<hr>
		</div>
	</section>
	<section class="signSelect">
		<div>
			<h3>결재선</h3>
			<table align="center" id="adminList">
			
			</table>
		</div>
	</section>
	<hr style="margin-top: 10px;">
	<section class="publicPaper">
		<div>
			<table align="center">
				<tr class="titleSection" align="center">
					<th style="border-bottom: 0.5px solid rgba(143, 143, 143, 0.547);">제목</th>
					<td align="left"
						style="border-bottom: 0.5px solid rgba(143, 143, 143, 0.547);">
						<input type="text" style="margin-left: 10px; width: 95%;"
						name="dpTitle">
					</td>
				</tr>
				<tr style="border-top: 0.5px solid rgba(143, 143, 143, 0.547);"  align="center">
					<th>첨부파일</th>
					<td align="left"><input type="file" id="upfile" name="upfile" style="margin-left: 10px; border: 0;"></td>
				</tr>
			</table>
		</div>
	</section>


	<script>
		var chartPopup;
		function openAddressWindow() {
			chartPopup = window.open(
					"${pageContext.request.contextPath}/addressAdmin.si",
					"addressWindow", "height=700, width=1100");
		}

		/* 자식창으로부터 전달된 정보  */
		function sendMeData(data) {
			//console.log(data);
			$("#adminList").append(data);
		}
	</script> 
</body>
</html>