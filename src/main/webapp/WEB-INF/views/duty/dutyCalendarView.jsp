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

<style>
	#calendar a{
		color:black
	}
	.left{
		width:45%;
		float:left;
	}
	.right{
		width:45%;
		float:right;
	}
</style>

</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<br><br>
	<%-- 캘린더가 들어갈 div --%>
	<div id='calendar' style="width:80%; margin:auto;">
	<br>
	<button class="btn btn-sm btn-primary" data-toggle="modal" data-target="#newSchedule">새로운 캘린더 일정 추가하기</button>
	</div>
	<br><br><br>
	
	<div class="modal fade" id="newSchedule" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">캘린더 일정 추가</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form action="sche.du" action="post">
					<div class="modal-body">
						  <input type="hidden" name="empNo" value="${loginUser.empNo}">
						  <span class="title">일정 제목</span>
						  <input type="text" class="form-control" name="title" required>
						  <br>
						  <div class="left">
							  <span class="title">시작일</span>
							  <input type="date" class="form-control" name="start" required>
						  </div>
						  <div class="right">
							  <span class="title">종료일</span>
							  <input type="date" class="form-control" name="end" required>
						  </div>
					<br style="clear:both">
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
						<button type="submit" class="btn btn-primary">확인</button>
					</div>
				</form>
			</div>
		</div>
	</div>	
	
	
	
	<script>
	
	// 시작일 날짜로 오늘 이전 날짜 불가능하도록 만들기
	$(function(){
		let year = new Date().getFullYear();
		let month = ('0' + (new Date().getMonth() + 1)).slice(-2);
		let date = ('0' + new Date().getDate()).slice(-2);
		$("input[name=start]").attr("min", year + '-' + month + '-' + date );
		$("input[name=end]").attr("min", year + '-' + month + '-' + date );
	})
		
	// 마감일 날짜로 시작일 이전 날짜 불가능하도록 만들기
	$("input[name=start]").change(function(){
		$("input[name=end]").attr("min", $(this).val());
	})
	
	
	$(function(){
		// -------------------- 캘린더 렌더링 --------------------
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			locale: 'kr',	// 언어 설정
	     
			height:'700px',	// 캘린더 높이 설정
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
						start:"${r.startDate}",
						end:"${r.endDate}",
						color:"gold",
						textColor:"black"
					},
				</c:forEach>
				<c:forEach var="c" items="${clist}">
					// 진행중인 업무
					{
						title:"${c.title}",
						start:"${c.startDate}",
						end:"${c.endDate}",
						color:"lightgreen",
						textColor:"black"
					},
				</c:forEach>
				<c:forEach var="r" items="${dlist}">
					// 지연된 업무
					{
						title:"${r.title}",
						start:"${r.startDate}",
						end:"${r.endDate}",
						color:"orchid",
						textColor:""
					},
				</c:forEach>
				<c:forEach var="f" items="${flist}">
					// 완료된 업무
					{
						title:"${f.title}",
						start:"${f.startDate}",
						end:"${f.endDate}",
						color:"gray",
						textColor:"white"
					},
				</c:forEach>
				<c:forEach var="ca" items="${calist}">
					// 완료된 업무
					{
						title:"${ca.title}",
						start:"${ca.start}",
						end:"${ca.end}",
						color:"beige",
						textColor:"black"
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
	})
	
	</script>
</body>
</html>