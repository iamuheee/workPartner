<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>WorkPartner!</title>
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <script src="https://use.fontawesome.com/95b5cbecad.js"></script>
        
        <!-- Full Calendar -->
		<link href='${pageContext.request.contextPath}/resources/css/fullcalendar-scheduler/main.css' rel='stylesheet' />
		<script src='${pageContext.request.contextPath}/resources/js/fullcalendar-scheduler/main.js'></script>
		
        <style>
            table a{
                text-decoration: none;
                color:black;
                font-size: small;
            }
            .title{
                font-size: larger;
                font-weight: bolder;
            }
            .inner-area{
                padding:10px;
            }
            .left{
                width:40%;
                height:150px;
                float: left;
            }
            .right{
                float:right;
                width:59%;
                height:150px;
            }
            .pmenu-item{
                float:left;
                list-style: none;
                padding-left: 0px;
                margin-left:30px;
                padding-bottom: 15px;
                font-weight: bold;
            }
            .content>p{
                padding:20px;
                white-space:pre-line;
            }
            .btn-area button{
                width:50px;
                height:20px;
                font-size: 10px;
                line-height: 10px;
                background-color: lightgray;
            }
            .card-comment{
                width:100%;
                background-color: lightgray;
                border-bottom-left-radius: 5px;
                border-bottom-right-radius: 5px;
            }
            ul{
                list-style: none;
            }
            .description{
            	color:gray;
            	font-size:small;
            }
            .pmenu-item>span{
            	cursor:pointer;
            }
        </style>
    
    </head>
    <body>
    	<jsp:include page="../common/menubar.jsp" />
    
        <br><br><br>
        <div class="container">
		<jsp:include page="projectDetailMenubar.jsp"/>

		<div style="clear:both;"></div><br>
            
		<%-- 캘린더가 들어갈 div --%>
		<div class="card shadow-sm border-1 rounded-lg"  style="height:700px;">
	   		<div class="card-body">
	    		<div class="title-area">
                    <span class="title">프로젝트 일정</span>
				</div><br>
				<div id='calendar' style="width:90%; margin:auto;"></div>
     		</div>
		</div>
		
		<br><br>
			
		<div class="card shadow-sm border-1 rounded-lg" style="width:35%; height:480px; float:left;">
			<div class="card-body">
	       		<div class="title-area">
					<span class="title">팀원 연락망</span>
				</div>
				<div class="inner-area">
					<ul>
                        <c:forEach var="m" items="${p.mlist}">
                            <li style="margin-bottom:10px;">
                            	<c:choose>
                            		<c:when test="${not empty m.empProfile}">
                            		<img src="${m.empProfile}" style="width:30px;height:30px;border-radius:50%;">
									</c:when>
									<c:otherwise>
									<i class="fa-solid fa-user fa-2x" style="color:lightgray; height:25px; width:30px"></i>
									</c:otherwise>
								</c:choose>
                                <span>${m.memName}</span>
                                <span style="color:gray; font-size:small">${m.memRole}</span>&nbsp;&nbsp;
                                <form action="selectEmail.ma" method="post" style="display:inline-block">
                                	<input type="hidden" name="email" value="${m.email}">
	                                <button type="submit" class="btn btn-sm btn-primary envelope" style="height:20px;width:50px;font-size:12px;line-height:10px">메일</button>&nbsp;
                                </form>
                            </li>
						</c:forEach>
					</ul>
				</div>
       		</div>
		</div>
		<div class="card shadow-sm border-1 rounded-lg"  style="width:63%; height:480px;float:right;">
	   		<div class="card-body">
	    		<div class="title-area">
                    <span class="title">오늘의 회의 일정</span>
				</div><br>
				<div id="meeting" style="width:90%; margin:auto;"></div>
     		</div>
		</div>
        <br style="clear:both"><br><br><br><br><br><br><br><br><br>
	</div>
        
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
				selectable: false,	// 캘린더의 시간을 드래그해서 선택할 수 있게 함
				nowIndicator: false,	// 현재 시간 표시
				
				events:[
					// 업무 : 준비/진행/지연, 회의 => 총 4가지 들어감
					<c:forEach var="r" items="${rlist}">
						// 준비중인 업무
						{
							title:"${r.title}",
							start:"${r.start}",
							end:"${r.end}",
							color:"gold",
							textColor:"black"
						},
					</c:forEach>
					<c:forEach var="c" items="${clist}">
						// 진행중인 업무
						{
							title:"${c.title}",
							start:"${c.start}",
							end:"${c.end}",
							color:"lightgreen",
							textColor:""
						},
					</c:forEach>
					<c:forEach var="r" items="${dlist}">
						// 지연된 업무
						{
							title:"${r.title}",
							start:"${r.start}",
							end:"${r.end}",
							color:"orchid",
							textColor:""
						},
					</c:forEach>
					<c:forEach var="mt" items="${mtlist}">
						// 예정된 회의
						{
							title:"${mt.title}",
							start:"${mt.start}",
							end:"${mt.end}",
							color:"skyblue",
							textColor:""
						},
					</c:forEach>
			          {
			        	  title:'zzz',
			        	  start:'21000902'
			          }
				]
				
			});
	   
			calendar.render();
			calendar.updateSize();
			// -------------------- 캘린더 렌더링 끝 --------------------
			
			showMeeting();
		})	
	</script>
	
	
	<script>
		function showMeeting(){
			// -------------------- 회의 캘린더 렌더링 --------------------
			var meetingEl = document.getElementById('meeting');
			var meeting = new FullCalendar.Calendar(meetingEl, {
				locale: 'kr',	// 언어 설정
		     
				height:'400px',	// 캘린더 높이 설정
				expandRows:true,
				initialView: 'timeGridDay',	// 화면 포맷 설정
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
				nowIndicator: false,	// 현재 시간 표시
				events:[
					<c:forEach var="mt" items="${mtlist}">
						// 예정된 회의
						{
							title:"${mt.title}",
							start:"${mt.start}",
							end:"${mt.end}",
							content:"${mt.content}",
							color:"skyblue"
						},
					</c:forEach>
			          {
			        	  title:'zzz',
			        	  start:'21000902'
			          }
				]
			});
	   
			meeting.render();
			meeting.updateSize();
			// -------------------- 회의 주간캘린더 렌더링 끝 --------------------
		}
	</script>        
        

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
