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
        height: 90%;
        }
        
	.fc-day-sun a {
	  color: red;
	  text-decoration: none;
	}  
	.fc-day-sat a {
	  color: blue;
	  text-decoration: none;
	}
	.fc-day-mon a {
	  color: black;
	  text-decoration: none;
	}
	.fc-day-tue a {
	  color: black;
	  text-decoration: none;
	}
	.fc-day-wed a {
	  color: black;
	  text-decoration: none;
	}
	.fc-day-thu a {
	  color: black;
	  text-decoration: none;
	}
	 .fc-day-fri a {
	  color: black;
	  text-decoration: none;
	}
	      
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	
	<div style="height:2%"></div>
	
		<div id="outer" style="width:80%">
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
			  //googleCalendarApiKey: 'AIzaSyDb-QzeaUWOmy40bh95g5FO0qfU9X6Hz6g',
			  titleFormat: function (date) {
			      year = date.date.year;
			      month = date.date.month + 1;
					
			      return year + "년 " + month + "월";
			    }, 
       

			    eventSources: [
				    {
			          googleCalendarId: 'ko.south_korea.official#holiday@group.v.calendar.google.com',
			          color: "red", //rgb,#ffffff 등의 형식으로 할 수 있어요.
			          textColor: "white"
			          
			          //textColor: 'black' 
			        },
			    ],
			    events:[
			    	  	
			    		  <c:forEach var="c" items="${list}">   // 연휴
			    		  {
			    			  title:"${c.holName}",
			    			  start:"${c.holDay}",
			    			  color : "#FF0000", 
			    			  textColor : "white"
			    		  },
			    		  </c:forEach>
			    		  
			    		  <c:forEach var="a" items="${list2}">  // 결근
			    		  {
			    			  title:"${a.status}",
			    			  start:"${a.dt}",
			    			  content: "출근 : ${a.attCmt} / 퇴근시간 : ${a.attQt}",
			    			  color: "green"
			    			  
			    		  },
			    		  </c:forEach>
			    		  
			    		  <c:forEach var="b" items="${list3}">  // 정상
			    		  {
			    			  title:"${b.status}",
			    			  start:"${b.dt}",
			    			  color : "#0000FF", 
			    			  textColor : "white",
			    			  
			    		  },
			    		  </c:forEach>
			    		  <c:forEach var="b" items="${list3}">
			    		  {
			    			  title:"출근 : ${b.attCmt} / 퇴근 : ${b.attQt}",   //정상
			    			  start:"${b.dt}",
			    			  color : "#0000FF", 
			    			  textColor : "white" 
			    			  
			    		  },
			    		  </c:forEach>
			    		  
			    		  <c:forEach var="d" items="${list4}">        //연차
			    		  {
			    			  title:"${d.status}",
			    			  start:"${d.dt}",
			    			  content: "출근시간 : ${d.attCmt} / 퇴근시간 : ${d.attQt}",
			    			  color: "yellow",
			    		      textColor : "red" 
			    			  
			    		  },
			    		  </c:forEach>
			    		  
			    		  <c:forEach var="b" items="${list5}">  // 지각, 조퇴
			    		  {
			    			  title:"${b.status}",
			    			  start:"${b.dt}",
			    			  color : "skyblue", 
			    			  textColor : "white",
			    			  
			    		  },
			    		  </c:forEach>
			    		  <c:forEach var="b" items="${list5}">
			    		  {
			    			  title:"출근 : ${b.attCmt} / 퇴근 : ${b.attQt}",   // 지각, 조퇴
			    			  start:"${b.dt}",
			    			  color : "skyblue", 
			    			  textColor : "white" 
			    			  
			    		  },
			    		  </c:forEach>
			    		  
				          {
				        	  title:'zzz',
				        	  start:'21000902'
				          }
			    ]
			  });
			  calendar.render();
			});
	
	</script>
</body>
</html>