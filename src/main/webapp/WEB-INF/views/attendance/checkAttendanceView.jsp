<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fullcalendar/main.css">
<script src='${pageContext.request.contextPath}/resources/js/fullcalendar/main.js'></script>
<style>
    .div1{
        display:inline-block;
        width: 100%;
        height: 80%;
        }
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	
	<div style="height:2%"></div>
	
		<div id="outer" style="width:96%">
			<!-- 상단 메뉴 제목 영역 -->
			<div id="header">
			    <h3>근태 등록</h3>
			</div>
			
			<hr>
			<div style="float:right">
				<button>연장근무신청</button>
			</div>
			
			<br><br>	
			
			<div style="clear:both"></div>
			
		 	<div id='calendar' class="div1">
		 		
			</div>
	          
	</div>
	
	<br><br>
	
	
	<script>

		document.addEventListener('DOMContentLoaded', function() {
		  var calendarEl = document.getElementById('calendar');
		  var calendar = new FullCalendar.Calendar(calendarEl, {
			  initialView: 'dayGridMonth',
			  googleCalendarApiKey: 'AIzaSyDb-QzeaUWOmy40bh95g5FO0qfU9X6Hz6g',
			    eventSources: [
				    {
			          googleCalendarId: 'ko.south_korea.official#holiday@group.v.calendar.google.com',
			          color: "red", //rgb,#ffffff 등의 형식으로 할 수 있어요.
			          textColor: "white"
			          //textColor: 'black' 
			        },
			    ],
			    event:[
			      
			    ]
			  });
			  calendar.render();
			});
	
	</script>
</body>
</html>