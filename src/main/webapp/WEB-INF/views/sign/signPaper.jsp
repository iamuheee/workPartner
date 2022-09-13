<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
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
	opacity: 0.4;
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
	width: 400px;
	height: 250px;
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

.modal-window textarea {
	width: 80%;
	resize: none;
	font-size: 16px;
}

.replyArea {
	margin-left: 50;
	margin-right: 50;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    $(document).ready(function(){

        $( "#selectVacation" ).change(function() {
            console.log($("#selectVacation").val());

            if($("#selectVacation").val() == "연차"){
                $("#startTime").hide();
                $("#endTime").hide();
            }else{
                $("#startTime").show();
                $("#endTime").show();
            }

        });
    });
</script>
</head>
<!-- onload="window.resizeTo(620,800)" -->
<body style="width: 800px; font-family: 'Noto Sans KR', sans-serif;">
	<section class="mainTitle">
		<form action="insertSign.me" name="insertSignForm" style="float: left">
			<a class="insertBtn" onclick="insertSign();">승인하기</a>
		</form>
		<form action="reSign.me" name="reSignForm" style="float: left">
			<a class="insertBtn" id="btn-modal" onclick="reSign()">반려</a>
		</form>
		<c:if test="${loginUser.empNo == d.empNo}">
			<form action="deletePaper.bo" name="deleteForm" style="float: left">
				<a class="insertBtn" onclick="deleteCheck()">기안 취소하기</a>
			</form>
			<form action="deletePaper.bo" name="saveForm">
				<a class="insertBtn" onclick="deleteCheck()">결재선 변경</a>
			</form>
		</c:if>
		<hr>
	</section>
	<script>
        function insertSign() {
            if (confirm("승인하시겠습니까?") == true){    //확인
                document.insertSignForm.submit();
            }else{   //취소
                return false;
            }
            }
    </script>

	<section>
		<div>
			<h1 class="dtpaperName">
				XX 신청서 - <span style="font-weight: lighter;">김종군(영업부)</span>
			</h1>
			<hr>
		</div>
	</section>
	<section class="signSelect">
		<div>
			<h3>결재선</h3>
			<table align="center">
				<tr>
					<th width="100">결재</th>
					<td style="border-right: 0.5px solid rgba(143, 143, 143, 0.547);"><span>김종군(마케팅부)</span></td>
					<th>결재</th>
					<td style="border-right: 0.5px solid rgba(143, 143, 143, 0.547);"></td>
					<th>결재</th>
					<td></td>
				</tr>
			</table>
		</div>
	</section>
	<hr style="margin-top: 10px;">
	<section class="publicPaper">
		<div>
			<table align="center">
				<tr class="titleSection">
					<th style="border-bottom: 0.5px solid rgba(143, 143, 143, 0.547);">제목</th>
					<td align="left"
						style="border-bottom: 0.5px solid rgba(143, 143, 143, 0.547);"><span
						style="margin-left: 10px;">외근신청서 결재 부탁드립니다.</span></td>
				</tr>
				<tr style="border-top: 0.5px solid rgba(143, 143, 143, 0.547);">
					<th>첨부파일</th>
					<td align="left"><input type="file"
						style="margin-left: 10px; border: 0;"></td>
				</tr>
			</table>
		</div>
	</section>

	<section class="modal">
		<div id="modal" class="modal-overlay">
			<div class="modal-window">
				<div class="modaltitle">
					<p>반려 사유를 입력해주세요.</p>
					<span class="material-symbols-outlined close-area"> close </span>
				</div>
				<div class="replyArea">
					<textarea name="" id="" cols="30" rows="5">

                    </textarea>
				</div>
			</div>
		</div>
	</section>


	<script>
        const modal = document.getElementById("modal")
        const btnModal = document.getElementById("btn-modal")
        btnModal.addEventListener("click", e => {
            modal.style.display = "flex"
        })
        const closeBtn = modal.querySelector(".close-area")
        closeBtn.addEventListener("click", e => {
            modal.style.display = "none"
        })
        window.addEventListener("keyup", e => {
            if (modal.style.display === "flex" && e.key === "Escape") {
                modal.style.display = "none"
            }
        })
    </script>
</body>
</html>