<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WorkPartner!</title>

<!-- Full Calendar -->
<link href='${pageContext.request.contextPath}/resources/css/fullcalendar-scheduler/main.css' rel='stylesheet' />
<script src='${pageContext.request.contextPath}/resources/js/fullcalendar-scheduler/main.js'></script>

</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	
	<%-- 캘린더가 들어갈 div --%>
	<div id='calendar' style="width:70%; margin:auto"></div>

	<script>
	  
	$(function(){
		// -------------------- 캘린더 렌더링 --------------------
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			locale: 'kr',	// 언어 설정
	     
			height:'600px',	// 캘린더 높이 설정
			expandRows:true,
			initialView: 'dayGridMonth',	// 화면 포맷 설정
			schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',	// trial 사용 위한 라이센스 키
	
			views: {
			   resourceTimeGridFourDay: {
			     type: 'resourceTimeGrid',
			     duration: { week: 1 },
			     buttonText: 'week'
				}
			},
			weekends: false,	// 주말은 보이지 않게 함
			 slotMinTime: "09:00:00",	// 캘린더 시작 시간
			 slotMaxTime: "18:00:00",	// 캘린더 종료 시간
			 allDaySlot: false,
			 selectable: true,	// 캘린더의 시간을 드래그해서 선택할 수 있게 함
			 nowIndicator: true,	// 현재 시간 표시
		});
   
		calendar.render();
		calendar.updateSize();
		// -------------------- 캘린더 렌더링 끝 --------------------
	})
	
	</script>
</body>
</html>