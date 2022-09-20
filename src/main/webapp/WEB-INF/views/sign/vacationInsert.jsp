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

#layoutSidenav_content {
	font-family: 'Noto Sans KR', sans-serif;
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

</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	$(document).ready(function() {

		$("#selectVacation").change(function() {

			if ($("#selectVacation").val() == "연차") {
				$("#halfVa").attr("hidden", true);
				$("#startTime").hide();
				$("#endTime").hide();
				$("#halfVa").hide();
				$("#startTime").attr("disabled", true);
				$("#endTime").attr("disabled", true);
				$("#startTime2").attr("disabled", true);
				$("#endTime2").attr("disabled", true);
				
			} else {
				$("#halfVa").attr("hidden", false);
				$("#startTime").show();
				$("#endTime").show();
				$("#halfVa").show();
				$("#startTime").attr("hidden", false);
				$("#endTime").attr("hidden", false);
				$("#startTime").attr("disabled", false);
				$("#endTime").attr("disabled", false);
				$("#startTime2").attr("disabled", true);
				$("#endTime2").attr("disabled", true);
			}

		});
		$("#halfVa").change(function() {

			if ($("#selectVacation").val() == "오전") {
				$("#startTime2").hide();
				$("#endTime2").hide();
				$("#startTime2").attr("hidden", true);
				$("#endTime2").attr("hidden", true);
				$("#startTime").show();
				$("#endTime").show();
				$("#startTime").attr("dsiabled", false);
				$("#endTime").attr("disabled", false);
				$("#startTime2").attr("disabled", true);
				$("#endTime2").attr("disabled", true);
			} else {
				$("#startTime2").attr("disabled", false);
				$("#endTime2").attr("disabled", false);
				$("#startTime2").attr("hidden", false);
				$("#endTime2").attr("hidden", false);
				$("#startTime2").show();
				$("#endTime2").show();
				$("#startTime").hide();
				$("#endTime").hide();
				$("#startTime").attr("hidden", true);
				$("#endTime").attr("hidden", true);
				$("#startTime").attr("disabled", true);
				$("#endTime").attr("disabled", true);
			}

		});
	});
</script>
</head>
<body style="width: 800px; font-family: 'Noto Sans KR', sans-serif;">
	<jsp:include page="../sign/insertTitle.jsp"/>
	
	 <br>
    <section>
        <div style="margin:auto; margin-top: 10px; width: 800px;" >
            <table style="margin-left:30px; border:0; border-spacing: 10px;" align="center">
                <tr align="left">
                    <th width="70" style="border:0">
                        근태명
                    </th>
                    <td width="540" style="border:0">
                        <select name="vaCategory" id="selectVacation" style="height:30px; border-radius: 4px;">
                            <option value="연차">연차</option>
                            <option value="반차">반차</option>
                        </select>
                        <select name="halfVa" id="halfVa" style="height:30px; border-radius: 4px;" hidden>
                            <option value="오전">오전</option>
                            <option value="오후">오후</option>
                        </select>
                    </td>
                </tr>
                <tr align="left">
                    <th style="border:0">
                        시작일시
                    </th>
                    <td style="border:0">
                        	<input type="date" id="currentDate" name="vaStart"
                         	   style="height:30px; border-radius: 4px; text-align: center;">
                        <input type="time" name="vaStart" style="height:30px; border-radius: 4px; text-align: center;" id="startTime" value="09:00" disabled hidden readonly>
                        <input type="time" name="vaStart" style="height:30px; border-radius: 4px; text-align: center;" id="startTime2" value="13:00" disabled hidden readonly>
                    </td>
                </tr>
                <tr align="left">
                    <th style="border:0">
                        종료일시
                    </th>
                    <td style="border:0">
                        <input type="date" id="currentDate2" name="vaEnd"
                            style="height:30px; border-radius: 4px; text-align: center;" enabled>
                        <input type="time" name="vaEnd" style="height:30px; border-radius: 4px; text-align: center;" id="endTime" value="13:00" disabled hidden readonly>
                        <input type="time" name="vaEnd" style="height:30px; border-radius: 4px; text-align: center;" id="endTime2" value="18:00" step="1800" min="00:00" max="23:59" disabled hidden readonly>
                        
                    </td>
                </tr>
                <tr align="left">
                    <th style="border:0; vertical-align: top;">
                        사유
                    </th>
                    <td style="border:0">
                        <textarea name="vaContent" cols="30" rows="10"
                            style=" border-radius: 4px; width: 650px; resize: none;"></textarea>
                    </td>
                </tr>
            </table>
        </div>
        
    </section>
    <script>
        document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);
        document.getElementById('currentDate2').value = new Date().toISOString().substring(0, 10);;
    </script>
	</section>
	</form>


</body>
	
	
</html>