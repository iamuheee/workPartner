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
	
   #bkCalendar {
   	width:95%;
   	height:100%;
   	background-color:pink;
   	border:1px soild black;
   	margin:auto;
   	margin-top:30px;
   }
   
    
    /* --------- */
    
    #pagingArea {
        width: fit-content;
        margin: auto;
        margin-top:30px;
    }

    .page-link {
        color:#0442AF;
    }

    .modal-body #bookInfo {
        margin:auto;
        
    }
    

    #bookInfo {
        width:100%;
    }

    #bookInfo th{
        height:60px;
        width: 30%;
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
    
    #bkPerson{
    	width:70px;
    }

    #rmNo {
        width: 150px;
        height:40px;
        border:1px solid #b7b9cc;
        padding-left:10px;
    }

    #bkStart, #bkEnd {
        width: 100px;
        height:40px;
        border:1px solid #b7b9cc;
        padding-left:10px;
    }

    #bkTimeArea {
        display: flex;
        align-items: center;
    }

    #bkTimeArea select {
        border:1px solid #b7b9cc;
        height:40px;
        width:120px;
        padding-left:10px;
    }

    #bkTitle {
        width: 100%;
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
</style>
<body>
	
	<jsp:include page="../common/menubar.jsp"/>
	
	<div id="bookList-outer">
		<!-- 상단 메뉴 제목 영역 -->
		<div id="bookList-header">
		    <h3>회의실 예약</h3>
		</div>
		<hr>
		
		<!-- 
		<!-- 날짜 페이징 처리 영역
		<div id="selectDate">
			<a href=""><i class="fas fa-chevron-left"></i></a>
			<h4>2022-08-22 (월) <i class="far fa-calendar-check"></i> </h4>
			<a href=""><i class="fas fa-chevron-right"></i></a>
		</div>
		 -->
		
		<!-- 풀캘린더 내에서 사용할 수 있는 기능이 있을지?
		<!--  예약 등록 버튼 영역 
		<div id="bookEnroll">
	        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#insertBookMd" ><i class="fa-solid fa-plus"></i>&nbsp;회의실 예약</button>
	    </div>
		 -->
		 
		<!-- 회의실 예약 캘린더 영역 -->
		<div id='calendar'></div>
		
	
		<!-- 회의실 예약 버튼 클릭 시 뜨는 모달 ==> 예약 정보 수정 -->
		<div class="modal fade" id="insertBookMd">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <!-- Modal Header -->
		            <div class="modal-header">
		                <h4 class="modal-title"><i class="far fa-clock"></i>&nbsp;&nbsp;회의 일정</h4>
		                <button type="button" class="close" onclick="closeModal();">&times;</button> 
		            </div>
						<form action="insert.bk" method="post">		
		            	<!-- 예약자 사번을 hidden으로 같이 넘겨줌 -->
		            	<input type="hidden" value="${ loginUser.empNo }" name="empNo"> 
		                <!-- Modal Body -->
		                <div class="modal-body">
		                    <table id="bookInfo">
		                        <tr>
		                            <th>회의실</th>
		                            <td>
		                                <!-- 회의실 이름 뿌리고 회의실 번호 값으로 넘김 -->
		                                <select name="rmNo" id="rmNo" required>
		                                    <!-- ajax로 회의실 목록 조회 -->
		                                </select>
		                            </td>
		                        </tr>
		                        <tr>
		                            <th>예약자</th>
		                            <td>${ loginUser.empName } (${ loginUser.depCd })</td>
		                        </tr>
		                        <tr>
		                            <th>날짜</th>
		                            <td>
		                                <input type="date" class="bkInfoTd" name="bkDate" id="bkDate" required>
		                            </td>
		                        </tr>
		                        <tr>
		                            <th>시간</th>
		                            <td>
		                                <div id="bkTimeArea">
		                                    <select name="bkStart" id="bkStart" class="bkInfoTd" required>
		                                        <option value="">시작 시간</option>
		                                        <option value="08:00">08:00</option>
		                                        <option value="09:00">09:00</option>
	                                        <c:forEach var="i" begin="10" end="19">
		                                 		<option value="${ i }:00">${ i }:00</option>       
	                                        </c:forEach>
		                                    </select>
		                                    <span>&nbsp;&nbsp;~&nbsp;&nbsp;</span>
		                                    <select name="bkEnd" id="bkEnd" class="bkInfoTd" required>
		                                        <option value="">종료 시간</option>
		                                        <option value="09:00">09:00</option>
		                                        <option value="10:00">10:00</option>
	                                        <c:forEach var="i" begin="11" end="20">
		                                 		<option value="${ i }:00">${ i }:00</option>       
	                                        </c:forEach>
		                                    </select>
		                                </div>
		                            </td>
		                        </tr>
		                        <tr>
		                        	<th>참여 인원</th>
		                        	<td><input type="number" name="bkPerson" id="bkPerson" min="1" class="bkInfoTd" required>&nbsp;명
		                        </tr>
		                        <tr>
		                            <th colspan="2">회의 제목</th>
		                        </tr>
		                        <tr>
		                            <td colspan="2" style="height:60px;">
		                                <input type="text" name="bkTitle" id="bkTitle" placeholder="회의 제목 자리" class="bkInfoTd" required>
		                            </td>
		                        </tr>
		                    </table>
		                </div>
		                <!-- Modal footer -->
		                <div class="modal-footer">
		                    <button type="submit" class="btn btn-primary" id="insertBk" style="margin-right:5px;">예약</button>
		                    <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="closeModal();">취소</button>
		                </div>
	                </form>
		        </div>
		    </div>
		</div>
		
		<script>
		
		function closeModal(){
			$('#insertBookMd').modal('hide');
		}
		
		  /* fullcalendar-scheduler 사용  */
		  document.addEventListener('DOMContentLoaded', function() {
			  
			  $(function(){
					 getBookCal();	// 캘린더 띄우기
					 selectRoomList();	// 모달창 내 select option 값 주기 위함
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
					      
					      height:'900px',	// 캘린더 높이 설정
					      expandRows:true,
					      initialView: 'resourceTimeGridDay',	// 화면 포맷 설정
					      schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',	// trial 사용 위한 라이센스 키
					      titleFormat: { 	// 제목 포맷 설정
					    	    month: 'long',
					    	    year: 'numeric',
					    	    day: 'numeric',
					    	    weekday: 'long'
					    	  },
					   	  datesAboveResources: true,
					   	    headerToolbar: {	// 헤더 표시 툴바
					   	      left: 'myCustomButton resourceTimeGridDay,resourceTimeGridFourDay',
					   	      center: 'title',
					   	      right: 'prev,next'
					   	    },
					   	  customButtons: {
					   		  myCustomButton: {
					   			  text: '+ 회의실 등록',
					   			  click: function(){
					   					$('#insertBookMd').modal('show');
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
					      resources: dataRoom	// db에서 조회한 회의실 이름을 컬럼명으로 뿌림 
					    });
					    calendar.render();
					 // -------------------- 캘린더 렌더링 끝 --------------------
					  }, // success 끝
				  	  error:function(){
					  console.log("캘린더 띄우기용 ajax 통신 성공");
				  }
			  })
		  	}
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
					let value = "";
					
					for(let i=0; i<result.length; i++) {
						value += '<option value="' + result[i].rmNo + '">' + result[i].rmName + '</option>';
					}
										
					$("#bookInfo #rmNo").html(value);
				},
				error:function(){
					console.log("회의실 목록 조회용 ajax 통신 실패");
				}
			})
		}  
		  
		/* 회의실 예약 등록용 ajax */
		function insertBook(){
			
			let rmNo = $("select[name=rmNo]").val();
			let empNo = ${loginUser.empNo};
			let bkPerson = $("input[name=bkPerson]").val();
			let bkTitle = $("input[name=bkTitle]").val();
			let bkDate = $("input[name=bkDate]").val();
			let bkStart = $("select[name=bkStart]").val();
			let bkEnd = $("select[name=bkEnd]").val();
			
			if( rmNo.trim().length * bkPerson.trim().length * bkTitle.trim().length
				* bkDate.trim().length * bkStart.trim().length * bkEnd.trim().length != 0 ) {
				// 모든 항목이 입력되었는지 조건 검사
				
				$.ajax({
					url:"insert.bk",
					type:"post",
					data:{
						rmNo:$("select[name=rmNo]").val(),
						empNo:${loginUser.empNo},
						bkPerson:bkPerson,
						bkTitle:bkTitle,
						bkDate:bkDate,
						bkStart:bkStart,
						bkEnd:bkEnd
					},
					success:function(result){
						console.log("회의실 예약 등록용 ajax 통신 성공");
						console.log(result);
						$("#insertBookMd").modal('hide');
					},
					error:function(){
						console.log("회의실 예약 등록용 ajax 통신 실패");	
					}
				})
			}else {
				alert("회의 내용을 입력해 주세요.");
				$("#insertBookMd").modal('show');
			}
		}
		</script>
		
		

</body>
</html>