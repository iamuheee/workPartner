<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='${pageContext.request.contextPath}/resources/css/fullcalendar-scheduler/main.css' rel='stylesheet' />
<script src='${pageContext.request.contextPath}/resources/js/fullcalendar-scheduler/main.js'></script>
</head>
<style>
	#bookList-outer {
        /* border:1px solid blue; */
        width:100%;
        height:100vh;
        padding:10px;
        margin:auto;
        position:relative;
    }

	a {
		text-decoration:none;
	}
	
	#selectDate {
	padding:20px;
	text-align:center;
	display:flex;
	justify-content:center;
	align-items:center;
	}
	
	#selectDate * {
	margin-right:10px;
	}
	
   #calendar{
   	padding-bottom:50px;
   }
    
    /* ================ */
    
    .modal-body #bookInfo {
        margin:auto;
    }

    #bookInfo {
        width:100%;
    }

    #bookInfo th{
        height:50px;
        width: 25%;
        font-size:16px;
    }

    #bookInfo td {
        font-size:16px;
    }

    #bookInfo input {
        height:40px;
        padding-left:10px;
        border:1px solid #b7b9cc;
    }

    #rmNo {
        width: 150px;
        height:40px;
        padding-left:10px;
    }

    #bkStart, #bkEnd {
        width: 100px;
        height:40px;
        padding-left:10px;
    }

    #bkTimeArea {
        display: flex;
        align-items: center;
    }

    #bkTimeArea select {
        border:1px solid #b7b9cc;
        height:40px;
        width:100px;
        padding-left:10px;
    }

    #bkTitle {
        width: 100%;
    }
    
    #roomAndDate{
    	display:flex;
    	justify-content: space-between;
    	margin-bottom:10px;
    }
    
    #roomAndDate input,select {
    	height:33px;
    	border:1px solid lightgray;
    	margin:0 5px;
    }
    
    #inputDate {
    	display:flex;
    	align-items: center;
    }
    
    
    .fc-datagrid-cell{
    	width:200px !important;
    }
    
    .fc-timeline-slot-cushion {	/* 헤더 시간 수정 */
    	color:#000
    }
    
    .fc-timeline-slot-cushion:hover {
		text-decoration: none;
		color:#000;
    }
    
    .fc-datagrid-cell-frame{
    	width:200px;
    }
    
    .fc-datagrid-cell-frame fc-datagrid-cell-frame-liquid{
    	width:200px;
    }
</style>
<body>
	
	<jsp:include page="../common/menubar.jsp"/>
	
	<div id="bookList-outer">
		<!-- 상단 메뉴 제목 영역 -->
		<div id="bookList-header">
		    <h3>회의실 예약 이력 조회</h3>
		</div>
		<hr>
		
		<!-- 회의실 예약 캘린더 영역 -->
		<div id='calendar'></div>
		
	
		<!-- 회의실 예약 버튼 클릭 시 뜨는 모달 ==> 예약 정보 수정 -->
		<div class="modal fade" id="selectBookDetail">
		    <div class="modal-dialog modal-xl">
		        <div class="modal-content">
		            <!-- Modal Header -->
		            <div class="modal-header">
		                <h4 class="modal-title"><i class="fas fa-calendar-check"></i>&nbsp;&nbsp;예약 이력 상세 조회</h4>
		                <button type="button" class="close" onclick="closeModal();">&times;</button> 
		            </div>
		                <div class="modal-body">
						    <!-- 날짜 선택 영역 -->
						    <!-- 캘린더 아이콘 눌러서 특정 날짜 선택했을 때 그 날짜의 회의실 예약 내역들이 조회되도록 해야 함 -->
						    <div id="roomAndDate">
						    	<div id="selectRmName">
						    		회의실 : 
						        	<select id="rmName" name="rmName" onchange="searchBookList()">
							        	<!-- ajax로 받을 영역 -->
						        	</select>
						    	</div>
						        <div id="inputDate">
						        	기간별 조회 :
							        <input type="date" id="startDate" name="startDate" onchange="searchBookList()">&nbsp;~&nbsp; 
							        <input type="date" id="endDate" name="endDate" onchange="searchBookList()">
							        <button type="button" class="btn btn-sm btn-primary" onclick="selectAllBookList()"><i class="fa-solid fa-arrows-rotate"></i></button>
						        </div>
						    </div>
						    <!-- =========================================================== -->
						    <div id="historyArea">
						        <table id="historyTable" class="table table-hover display">
						            <thead>
						                <tr>
						                    <th scope="col">No.</th>
						                    <th scope="col">회의실</th>
						                    <th scope="col">회의명</th>
						                    <th scope="col">예약자</th>
						                    <th scope="col">인원</th>
						                    <th scope="col">예약일정</th>
						                    <th scope="col">예약상태</th>
						                </tr>
						            </thead>
						            <tbody id="historyList">
						                <tr >
							            <!-- ================== ajax로 받을 영역===================== -->
						               	</tr>
						            </tbody>
						        </table>
							</div>
							
							 <!-- 페이징 처리 -->
					        <div id="pagingArea">
        					</div>  
														
							 <!-- =========================================================== -->
						                    
		                    
		                    
		                <!-- Modal footer -->
		                <div class="modal-footer">
		                    <button type="submit" class="btn btn-primary" id="insertBk" style="margin-right:5px;">예약</button>
		                    <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="closeModal();">취소</button>
		                </div>
		        </div>
		    </div>
		</div>
		
		
		<script>
		
        /* date = new Date();
        year = date.getFullYear();
        month = date.getMonth() + 1;
        day = date.getDate();
        document.getElementById("current_date").innerHTML = year + " / " + month + " / " + day; */
		
		function closeModal(){
        	$("#selectRmName").find("#rmName").val("none");	// 모달창 비우기
        	$("#inputDate").find("#startDate").val("");
        	$("#inputDate").find("#endDate").val("");
			$('#selectBookDetail').modal('hide');
		}
        
        $(function(){
        	selectRoomList();	// modal select opiton에 넣을 회의실 목록 조회
        })
        
        // 모달창이 열렸을 때 예약 목록 조회하도록 함
        $("#selectBookDetail").on('show.bs.modal', function(e){
        	selectAllBookList();
        })
        
        /* 회의실 목록을 조회해 오는 ajax */
		/* 모달창 내 select option 값으로 뿌려줘야 함 */
		function selectRoomList(){
			$.ajax({
				url:"selectList.ro",
				type:"post",
				success:function(result){
					console.log("회의실 목록 조회용 ajax 통신 성공");
					//console.log(result);
					let value = "<option value='none'>회의실명</option>";
					
					for(let i=0; i<result.length; i++) {
						value += '<option value="' + result[i].rmNo + '">' + result[i].rmName + '</option>';
					}
										
					$("#rmName").html(value);
				},
				error:function(){
					console.log("회의실 목록 조회용 ajax 통신 실패");
				}
			})
		}  
        
		  /* fullcalendar-scheduler 사용  */
		  document.addEventListener('DOMContentLoaded', function() {
			  
			  $(function(){
					 getBookCal();	// 캘린더 띄우기
				  })

		  /* 캘린더 띄우기용 ajax */
		  function getBookCal(){
			  $.ajax({
				  url: "calendar.bk",	// 전달할 데이터 없으므로 type, data 생략
				  success:function(result){
					  console.log("캘린더 띄우기용 ajax 통신 성공")
					  //console.log(result);
					  
					  let book = result.book;
					  let room = result.room;
					  
					  // 넘기려는 값들을 data라는 이름의 배열에 담아야 함
					  let dataBook = [];
					  let dataRoom = [];
					  
					  // 회의실 갯수 최대 8개로 생각하고 저장해 놨음에 주의!!
					  let eventColor=["#dc3545", "#fd7e14", "#ffc107", "#198754", "#0d6efd", "#20c997", "#0dcaf0", "#6c757d"];
					  
					  for(let i=0; i<book.length; i++){
						  
						  let objBook = {
								  id: book[i].bkNo,
								  resourceId: book[i].rmNo,
								  title: book[i].bkTitle,
								  start: book[i].bkDate + " " + book[i].bkStart,
								  end: book[i].bkDate + " " + book[i].bkEnd,
								  
						  };
						  
						  dataBook.push(objBook);	// objBook 값을 dataBook 배열 안에 담아 캘린더 events로 넘길 것임
					  }	
					  
					  for(let i=0; i<room.length; i++){
						  
						  let objRoom = {
								  id: room[i].rmNo,
								  title: room[i].rmName,
								  eventColor: eventColor[i]
						  };
						  
						  //console.log("oR : " + objRoom);
				  		  dataRoom.push(objRoom);	// objRoom 값을 dataRoom 배열 안에 담아 캘린더 resource로 넘길 것임
					  }
					  
					  //console.log(dataBook);
					  //console.log(dataRoom);	// 성공
					  
					  // -------------------- 캘린더 렌더링 --------------------
					  var calendarEl = document.getElementById('calendar');
					    var calendar = new FullCalendar.Calendar(calendarEl, {
					      locale: 'kr',	// 언어 설정
					      
					      height:'80%',	// 캘린더 높이 설정
					      expandRows:true,
					      initialView: 'resourceTimelineDay',	// 화면 포맷 설정
					      aspectRatio: 1.5,
					      schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',	// trial 사용 위한 라이센스 키
					      titleFormat: { 	// 제목 포맷 설정
					    	    month: 'long',
					    	    year: 'numeric',
					    	    day: 'numeric',
					    	    weekday: 'long'
					    	  },
					   	  datesAboveResources: true,
					   	    headerToolbar: {	// 헤더 표시 툴바
					   	      left: 'myCustomButton',
					   	      right: 'prev,next',
					   	      center: 'title'
					   	    },
					   	  customButtons: {	// 헤더 툴바에 커스텀한 버튼 추가
					   		  myCustomButton: {
					   			  text: '예약상세조회',
					   			  click: function(){
					   					$('#selectBookDetail').modal('show');
					   			  }
					   		  }
					   	  },  
					  	  views: {
					  	     resourceTimeGridFourDay: {
					  	       type: 'resourceTimeGrid',
					  	       duration: { week: 1 },
					  	       buttonText: 'week'
					  	     }
					  	  },
					  	  weekends: false,	// 주말은 보이지 않게 함
					   	  slotMinTime: "08:00:00",	// 캘린더 시작 시간
					   	  slotMaxTime: "20:00:00",	// 캘린더 종료 시간
					   	  allDaySlot: false,
					   	  selectable: true,	// 캘린더의 시간을 드래그해서 선택할 수 있게 함
					   	  nowIndicator: true,	// 현재 시간 표시
					      events: dataBook,	// db에서 조회한 예약들을 캘린더 위에 뿌림
					      resources: dataRoom,	// db에서 조회한 회의실 이름을 컬럼명으로 뿌림
					      resourceAreaColumns: [
					    	  {
					    		  headerContent: '회의실'		// resource 컬럼명 
					    	  }
					      ],
					      resourceAreaWidth: "15%"	// th width
					    });
					    
					    calendar.render();
					    calendar.updateSize();
					 // -------------------- 캘린더 렌더링 끝 --------------------
					  }, // success 끝
				  	  error:function(){
					  console.log("캘린더 띄우기용 ajax 통신 성공");
				  }
			  })
		  	}
		  })

		  /* 풀캘린더 스케쥴러 css */
		  $(function(){
			  $(".fc-datagrid-cell-main").html("회의실명");
		  })
		 
		 /* 회의실 전체 예약 목록 조회용 ajax */
		  function selectAllBookList(cpage){
			  $.ajax({
				  url:"selectAll.bk",
				  data:{
					  cpage:cpage
				  },
				  success:function(result){
					  console.log("회의실 전체 예약 목록 조회용 ajax 통신 성공");
					  //console.log(result);
					  
					  let list = result.list;
					  let pi = result.pi;
					  
					  let value = "";
					  let pgValue = "";
					  
					  for(let i=0; i<list.length; i++) {
						  value += '<tr>' 
							  	 +		'<td>' + list[i].bkNo +'</td>'
							  	 +		'<td>' + list[i].rmName + '</td>'
							  	 +		'<td>' + list[i].bkTitle + '</td>'
							  	 +		'<td>' + list[i].empName + '</td>'
							  	 +		'<td>' + list[i].bkPerson + '</td>'
							  	 +		'<td>' + list[i].bkDate + ' ' + list[i].bkStart + ' ~ ' + list[i].bkEnd + '</td>';
						  	 if(list[i].bkStatus == 'N') {
						  		 value += '<td>예약완료</td>'; 
						  	 }else {
						  		value += '<td style="color:red;">예약취소</td>'; 
						  	 }
					  }
					
					   	/* 페이징 처리 */
						if(pi.currentPage != 1){
                 			pgValue += "<button class='btn btn-sm btn-outline-primary' onclick='selectAllBookList("+ (pi.currentPage - 1) + ")'>&lt;</button>"	
                 		}
                 		
                 		for(let p=pi.startPage; p<=pi.endPage; p++) { 
         		   			if(p == pi.currentPage) { 
         				   			pgValue += "<button class='btn btn-sm btn-outline-primary' disabled>"  + p  + "</button>"
         				   	}else {
         				   			pgValue += "<button class='btn btn-sm btn-outline-primary' onclick='selectAllBookList("+ p +")'>" + p + "</button>"
         		           	} 
         		         }     
                  
         		         if(pi.currentPage != pi.maxPage) {
         		        	  pgValue += "<button class='btn btn-sm btn-outline-primary' onclick='selectAllBookList("  + (pi.currentPage + 1) + ")'>&gt;</button>"
         		         }  
					
					$("#historyList").html(value);
					$("#pagingArea").html(pgValue);
							
				
				  },
				  error:function(){
					  console.log("회의실 전체 예약 목록 조회용 ajax 통신 실패");
				  }
				  
			  })
			  
		  } 
		 /* 회의실 예약 목록 조회용 ajax -- 회의실별 / 기간별 */
		 /* 선택 날짜 제한하기 */
		 $("input[name=startDate]").change(function(){
			 $("input[name=endDate]").attr("min", $("input[name=startDate]").val());
		 })
		 
		 $("input[name=endDate]").change(function(){
			 $("input[name=startDate]").attr("max", $("input[name=endDate]").val());
		 })
		 
		 function searchBookList(){
			 
  			 const rmNo = $("select[name=rmName]").val();
			 const start = $("input[name=startDate]").val();
			 const end = $("input[name=endDate]").val();  
			 
			 console.log(rmNo);
			 console.log(start);
			 console.log(end);
			 
			 if(rmNo != 'none') {	
				 if(!end){	// 회의실별로만 조회하는 경우
					 selectByRoom();
				 }else {	// 회의실별 + 기간별 조회하는 경우
					 selectByRoomAndDate();
				 }
			 }else {	// 기간별로만 조회하는 경우
			 	if(!end) {
			 		selectAllBookList();
			 	}
				 selectByDate();
			 }
		 }
		 
		 /* 회의실별 조회용 ajax */
		 function selectByRoom(rmNo, cpage){
			 $.ajax({
				 url:"selectByRoom.bk",
				 type:"post",
				 data:{
					 rmNo:$("select[name=rmName]").val(),
					 cpage:cpage
				 },
				 success:function(result){
					 console.log("회의실별 조회용 ajax 통신 성공");
					 //console.log(result);
					 
					  let list = result.list;
					  let pi = result.pi;
					  
					  let value = "";
					  let pgValue = "";
					  
					  for(let i=0; i<list.length; i++) {
						  value += '<tr>' 
							  	 +		'<td>' + list[i].bkNo +'</td>'
							  	 +		'<td>' + list[i].rmName + '</td>'
							  	 +		'<td>' + list[i].bkTitle + '</td>'
							  	 +		'<td>' + list[i].empName + '</td>'
							  	 +		'<td>' + list[i].bkPerson + '</td>'
							  	 +		'<td>' + list[i].bkDate + ' ' + list[i].bkStart + ' ~ ' + list[i].bkEnd + '</td>';
						  	 if(list[i].bkStatus == 'N') {
						  		 value += '<td>예약완료</td>'; 
						  	 }else {
						  		value += '<td style="color:red;">예약취소</td>'; 
						  	 }
					  }
					
					   	/* 페이징 처리 */
						if(pi.currentPage != 1){
                 			pgValue += "<button class='btn btn-sm btn-outline-primary' onclick='selectByRoom("+ rmNo + ", " + (pi.currentPage - 1) + ")'>&lt;</button>"	
                 		}
                 		
                 		for(let p=pi.startPage; p<=pi.endPage; p++) { 
         		   			if(p == pi.currentPage) { 
         				   			pgValue += "<button class='btn btn-sm btn-outline-primary' disabled>"  + p  + "</button>"
         				   	}else {
         				   			pgValue += "<button class='btn btn-sm btn-outline-primary' onclick='selectByRoom("+ rmNo + ", " + p +")'>" + p + "</button>"
         		           	} 
         		         }     
                  
         		         if(pi.currentPage != pi.maxPage) {
         		        	  pgValue += "<button class='btn btn-sm btn-outline-primary' onclick='selectByRoom("+ rmNo + ", " + (pi.currentPage + 1) + ")'>&gt;</button>"
         		         }  
					
					$("#historyList").html(value);
					$("#pagingArea").html(pgValue);
					
				 },
				 error:function(){
					 console.log("회의실별 조회용 ajax 통신 실패");
				 }
			 })
		 }
		 
		 /* 날짜별 조회용 ajax */
		 function selectByDate(start, end, cpage){
			 $.ajax({
				 url:"selectByDate.bk",
				 type:"post",
				 data:{
					 start:$("input[name=startDate]").val(),
					 end:$("input[name=endDate]").val(),
					 cpage:cpage
				 },
				 success:function(result){
					 console.log("날짜별 조회용 ajax 통신 성공");
					 //console.log(result);

					  let list = result.list;
					  let pi = result.pi;
					  
					  let value = "";
					  let pgValue = "";
					  
					  for(let i=0; i<list.length; i++) {
						  value += '<tr>' 
							  	 +		'<td>' + list[i].bkNo +'</td>'
							  	 +		'<td>' + list[i].rmName + '</td>'
							  	 +		'<td>' + list[i].bkTitle + '</td>'
							  	 +		'<td>' + list[i].empName + '</td>'
							  	 +		'<td>' + list[i].bkPerson + '</td>'
							  	 +		'<td>' + list[i].bkDate + ' ' + list[i].bkStart + ' ~ ' + list[i].bkEnd + '</td>';
						  	 if(list[i].bkStatus == 'N') {
						  		 value += '<td>예약완료</td>'; 
						  	 }else {
						  		value += '<td style="color:red;">예약취소</td>'; 
						  	 }
					  }
					
					   	/* 페이징 처리 */
						if(pi.currentPage != 1){
                 			pgValue += "<button class='btn btn-sm btn-outline-primary' onclick='selectByDate(" + start + ", " + end + ", " + (pi.currentPage - 1) + ")'>&lt;</button>"	
                 		}
                 		
                 		for(let p=pi.startPage; p<=pi.endPage; p++) { 
         		   			if(p == pi.currentPage) { 
         				   			pgValue += "<button class='btn btn-sm btn-outline-primary' disabled>"  + p  + "</button>"
         				   	}else {
         				   			pgValue += "<button class='btn btn-sm btn-outline-primary' onclick='selectByDate(" + start + ", " + end + ", " + p +")'>" + p + "</button>"
         		           	} 
         		         }     
                  
         		         if(pi.currentPage != pi.maxPage) {
         		        	  pgValue += "<button class='btn btn-sm btn-outline-primary' onclick='selectByDate(" + start + ", " + end + ", " + (pi.currentPage + 1) + ")'>&gt;</button>"
         		         }  
					
					$("#historyList").html(value);
					$("#pagingArea").html(pgValue);
					
				 },
				 error:function(){
					 console.log("날짜별 조회용 ajax 통신 실패");
				 }
			 })
		 }
		 
		 /* 회의실별 + 날짜별 조회용 ajax */
		 function selectByRoomAndDate(rmNo, start, end, cpage){
			 $.ajax({
				 url:"selectByRD.bk",
				 type:"post",
				 data:{
					 rmNo:$("select[name=rmName]").val(),
					 start:$("input[name=startDate]").val(),
					 end:$("input[name=endDate]").val(),
					 cpage:cpage
				 },
				 success:function(result){
					 console.log("회의실+날짜별 조회용 ajax 통신 성공");
					 //console.log(result);
					 
					  let list = result.list;
					  let pi = result.pi;
					  
					  let value = "";
					  let pgValue = "";
					  
					  for(let i=0; i<list.length; i++) {
						  value += '<tr>' 
							  	 +		'<td>' + list[i].bkNo +'</td>'
							  	 +		'<td>' + list[i].rmName + '</td>'
							  	 +		'<td>' + list[i].bkTitle + '</td>'
							  	 +		'<td>' + list[i].empName + '</td>'
							  	 +		'<td>' + list[i].bkPerson + '</td>'
							  	 +		'<td>' + list[i].bkDate + ' ' + list[i].bkStart + ' ~ ' + list[i].bkEnd + '</td>';
						  	 if(list[i].bkStatus == 'N') {
						  		 value += '<td>예약완료</td>'; 
						  	 }else {
						  		value += '<td style="color:red;">예약취소</td>'; 
						  	 }
					  }
					
					   	/* 페이징 처리 */
						if(pi.currentPage != 1){
                 			pgValue += "<button class='btn btn-sm btn-outline-primary' onclick='selectByRoomAndDate(" + rmNo + ", " + start + ", " + end + ", " + (pi.currentPage - 1) + ")'>&lt;</button>"	
                 		}
                 		
                 		for(let p=pi.startPage; p<=pi.endPage; p++) { 
         		   			if(p == pi.currentPage) { 
         				   			pgValue += "<button class='btn btn-sm btn-outline-primary' disabled>"  + p  + "</button>"
         				   	}else {
         				   			pgValue += "<button class='btn btn-sm btn-outline-primary' onclick='selectByRoomAndDate(" + rmNo + ", " + start + ", " + end + ", " + p +")'>" + p + "</button>"
         		           	} 
         		         }     
                  
         		         if(pi.currentPage != pi.maxPage) {
         		        	  pgValue += "<button class='btn btn-sm btn-outline-primary' onclick='selectByRoomAndDate(" + rmNo + ", " + start + ", " + end + ", " + (pi.currentPage + 1) + ")'>&gt;</button>"
         		         }  
					
					$("#historyList").html(value);
					$("#pagingArea").html(pgValue);
					
				 },
				 error:function(){
					 console.log("회의실+날짜별 조회용 ajax 통신 실패");
				 }
				 
			 })
		 }
		 
		</script>
		
		

</body>
</html>