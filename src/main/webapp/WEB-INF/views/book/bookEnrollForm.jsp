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
    
    /* 회의실 정보 모달창 ------------- */
    #roomInfoMdTb {
		height:auto;
    } 

	#roomInfoMdTb td img{
	max-width:100%;
	} 

	.roomCoverImg {
		max-width:100%;
		cursor:pointer;
	}

	.mdImg{
		width:300px;
		height:auto;
	}
	
	#equipBtn {
		border:1px solid #0442AF;
		color:#0442AF;
		margin-right:5px;
		cursor: default;
	}
	
	#chooseBtn{
		margin-right:5px;
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
		 
		<!-- 회의실 예약 캘린더 영역 -->
		<div id='calendar'></div>
		
	
		<!-- 회의실 예약 버튼 클릭 시 뜨는 모달 ==> 예약 정보 수정 -->
		<div class="modal fade" id="insertBookMd">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <!-- Modal Header -->
		            <div class="modal-header">
		                <h4 class="modal-title"><i class="far fa-clock"></i>&nbsp;&nbsp;회의실 예약</h4>
		                <button type="button" class="close" onclick="closeBkMd();">&times;</button> 
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
		                                <select name="rmNo" id="rmNo" onchange="selectTime();" required>
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
		                                <input type="date" class="bkInfoTd" name="bkDate" id="bkDate" onchange="selectTime();" required>
		                            </td>
		                        </tr>
		                        <tr>
		                            <th>시간</th>
		                            <td>
		                                <div id="bkTimeArea">
		                                    <select name="bkStart" id="bkStart" class="bkInfoTd" onchange="selectTime();" required>
		                                        <option value="" disabled selected>시작 시간</option>
		                                        <option value="08:00">08:00</option>
		                                        <option value="09:00">09:00</option>
	                                        <c:forEach var="i" begin="10" end="19">
		                                 		<option value="${ i }:00">${ i }:00</option>       
	                                        </c:forEach>
		                                    </select>
		                                    <span>&nbsp;&nbsp;~&nbsp;&nbsp;</span>
		                                    <select name="bkEnd" id="bkEnd" class="bkInfoTd" onchange="selectTime();" required>
		                                        <option value="" disabled selected>종료 시간</option>
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
		                                <input type="text" name="bkTitle" id="bkTitle" class="bkInfoTd" required>
		                            </td>
		                        </tr>
		                    </table>
		                </div>
		                <!-- Modal footer -->
		                <div class="modal-footer">
		                    <button type="submit" class="btn btn-primary" id="insertBk" style="margin-right:5px;">예약</button>
		                    <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="closeBkMd();">취소</button>
		                </div>
	                </form>
		        </div>
		    </div>
		</div>
		
		<script>
		
		function closeModal(){
			$('#insertBookMd').modal('hide');
			selectRoom();
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
					   	      left: 'room myCustomButton prev,next',
					   	      center: 'title',
					   	      right: 'today resourceTimeGridDay,resourceTimeGridFourDay'
					   	    },
					   	  customButtons: {	// 헤더 툴바에 커스텀한 버튼 추가
					   		  myCustomButton: {
					   			  text: '예약하기',
					   			  click: function(){
					   					$('#insertBookMd').modal('show');
					   					checkTime();
					   			  },
					   		  },
					   		 room: {
				   				  text:'회의실정보',
				   				  click: function(){
				   						modalOpen();
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
					      datesAboveResources:true
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
		
		/* 회의실 목록을 조회해 오는 ajax */
		/* 모달창 내 select option 값으로 뿌려줘야 함 */
		function selectRoomList(){
			$.ajax({
				url:"selectList.ro",
				type:"post",
				success:function(result){
					console.log("회의실 목록 조회용 ajax 통신 성공");
					console.log(result);
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
		
		
		function checkTime() {	// 모달 창 여는 버튼 누를 때 실행할 함수
			
			// 오늘 날짜 받기
			var now_utc = Date.now()	// 지금 날짜를 밀리초로
			var timeOff = new Date().getTimezoneOffset()*60000; // 분단위를 밀리초로 변환
			var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
			//console.log(today);
			
			$("input[name=bkDate]").attr("min", today);	// 오늘 날짜부터만 선택하게 함

			selectTime();	// 예약 시간 제한 함수
		}
		
		
		function selectTime(){
 		
			// 해당 날짜에 예약되어 있는 bkStart, bkEnd를 조회해 와서
			// 선택된 bkStart, bkEnd와 비교한 후 같으면 disabled 속성을 추가한다.
			
			// 조회에 넘길 값 : 선택된 rmNo, bkDate
			
			// 조회 후 비교할 값 
			var bkStart = $('select[name="bkStart"] option:selected').val();
			var bkEnd = $('select[name="bkEnd"] option:selected').val();
			
			if($('select[name="rmNo"] option:selected').val() != null && $("input[name=bkDate]").val() !=null) {	// 회의실과 예약 날짜가 모두 선택된 후에 실행
				
				$.ajax({
					url:"selectTime.bk",
					type:"post",
					data:{
						rmNo:$('select[name="rmNo"] option:selected').val(),
						bkDate:$("input[name=bkDate]").val()
					},
					success:function(list){
						console.log("예약완료된 시간 조회용 ajax 통신 성공");
						console.log(list);
						
						var $startOption = $('#bkStart option');
						var $endOption = $('#bkEnd option');
						var $startValue = $('select[name="bkStart"] option:selected').val();
						var $endValue = $('select[name="bkEnd"] option:selected').val();
						
						// 기본적으로 종료시간은 시작시간보다 늦은 시간만
						// 시작시간은 종료시간보다 이른 시간만 선택되도록 설정해야 함
						
						if(list.length != 0){	// 해당 날짜에 이미 예약이 있는 경우
											
							$endOption.each(function() {
								
								if($(this).val() <= $startValue) {	// 시작 날짜 이후의 종료 날짜만 선택되게 함
									$(this).attr("disabled", true);
								}
								
								
								for(let i=0; i<list.length; i++) {
									
									$startOption.each(function(){
										if($(this).val() >= list[i].bkStart && $(this).val() < list[i].bkEnd) {
											$(this).attr("disabled", true);
										}
									})
									
									$endOption.each(function(){
										if($(this).val() > list[i].bkStart && $(this).val() <= list[i].bkEnd) {
											$(this).attr("disabled", true);
										}
									})
									
								}// 반복문 끝 
							})
							
							if($endValue != "" && $endValue < $startValue) {
										alert("예약 시간을 다시 선택해 주세요");
								}
							
						}else {	// 예약이 없는 날짜 && 방
							
							$startOption.each(function() {
								$(this).attr("disabled", false);
							})
							
							$endOption.each(function(){
								$(this).attr("disabled", false);
								
								if($(this).val() <= $startValue) {
									$(this).attr("disabled", true);
								}
							})
						}
						
					},
					error:function(){
						console.log("예약완료된 시간 조회용 ajax 통신 실패");
					}
				})
			}
		}
		
		
		/* 예약용 모달창 열고 닫기 */
		function openBkMd(){
			$("#insertBookMd").modal('show');
		}
		
		/* 모달창 배경 클릭 시 끄기 닫기 */
		$(function(){
			$('#insertBookMd').modal({backdrop: 'static', keyboard: false}) ;
		})
		
		
		function closeBkMd(){
			$('select[name="rmNo"]').val("1").attr('selected', true);
			$("input[name=bkDate]").val("");
			$('select[name="bkStart"]').val("").attr('selected', true);
			$('select[name="bkEnd"]').val("").attr('selected', true);
			$('input[name=bkPerson]').val("");
			$('input[name=bkTitle]').val("");
			$("#insertBookMd").modal('hide');
		}
		
		/* 개별 회의실 조회용 ajax */
		function selectRoom(rmNo) {
			
			$.ajax({
				url:"select.ro",
				data:{
					rmNo:rmNo
				},
				success:function(result){
					console.log("개별 회의실 조회용 ajax 통신 성공");
					console.log(result);
					
					let room = result.r;
					let file = result.f;
					let using = result.u;
					let equip = result.e;
					let count = result.counts;
					
					// 이전 정보 지우기
					$("#mdImg1").html("");
					$("#mdImg2").html("");
					$("#mdImg3").html("");
					$("#mdImg4").html("");
					
					$("#mdEquip").html("");
					// 이전 정보 지우기
					
					$("#mdRmName").text(room[0].rmName);
					
					$("#mdPerson").text(room[0].rmPerson + "명");
					
					$("#mdImg1").html('<img src="' + file[0].filePath + '">');
					
					if(file[1] != null){
						$("#mdImg2").html('<img src="' + file[1].filePath + '">');					
					}
					
					if(file[2] != null){
						$("#mdImg3").html('<img src="' + file[2].filePath + '">');
					}
					
					if(file[3] != null){
						$("#mdImg4").html('<img src="' + file[3].filePath + '">');
					}

					var value = "";
					for(let i=0; i<using.length; i++){
						value += '<button class="btn btn-sm" id="equipBtn">' + using[i].eqName + '</button>'
					}
					$("#mdEquip").html(value);	
				},
				error:function(){
					console.log("개별 회의실 조회용 ajax 통신 실패");
				}
			})
			
		}
		
		/* 개별 회의실 조회 정보용 목록 조회 */
		function selectRoomListforDetail(){
			$.ajax({
				url:"selectList.ro",
				type:"post",
				success:function(result){
					console.log("회의실 목록 조회용 ajax 통신 성공");
					console.log(result);
					let value = "";
					
					for(let i=0; i<result.length; i++) {
						value += '<button class="btn btn-sm btn-primary" id="chooseBtn" onclick="changeRoom(' + result[i].rmNo + ');">' + result[i].rmName + '</button>';
					}
										
					$("#roomNameBtn").html(value);
				},
				error:function(){
					console.log("회의실 목록 조회용 ajax 통신 실패");
				}
			})
		}  
		
		/* 방 정보 바꾸기 */
		function changeRoom(rmNo) {
			// 모달창 비우기
			$("#mdImg1").html("");
			$("#mdImg2").html("");
			$("#mdImg3").html("");
			$("#mdImg4").html("");

			$("#mdEquip").html("");
			
			selectRoom(rmNo);
			
		}
		
		/* 모달창 열기 */
		function modalOpen(rmNo){
			$("#roomInfoMd").modal('show');
			selectRoomListforDetail();	// 버튼용 회의실 목록 조회
			selectRoom();	// 회의실 상세 정보 조회
		}
		
		
		/* 모달창 닫기 */
		function modalClose(){
			// 모달창 비우기
			$("#mdImg1").html("");
			$("#mdImg2").html("");
			$("#mdImg3").html("");
			$("#mdImg4").html("");
			
			//$("#mdEquip").remove();	// 회의실 장비 -->
			$("#mdEquip").html("");
			
			$("#roomInfoMd").modal('hide');
			
		}
		
		/* 모달창 배경 클릭 시 끄기 닫기 */
		$(function(){
			$('#roomInfoMd').modal({backdrop: 'static', keyboard: false}) ;
		})
		
		function userConfirm(rmNo) {
            if(confirm('회의실 삭제 시 복구할 수 없습니다.\n회의실을 삭제하시겠습니까?')) {
            	deleteRoom(rmNo);
            	
            }else {
                return false;
            }
        }
		</script>
		
		<!-- 회의실 정보 모달 -->
		  <!-- The Modal -->
		  <div class="modal fade" id="roomInfoMd">
		    <div class="modal-dialog modal-lg">
		      <div class="modal-content">
		    	<input type="hidden" name="rmNo">
		      
		        <!-- Modal Header -->
		        <div class="modal-header">
		          <h4 class="modal-title"><i class="fas fa-info-circle"></i>&nbsp;회의실 정보</h4>
		          <button type="button" class="close"  onclick="modalClose();">&times;</button>
		        </div>
		        
		        <!-- Modal body -->
		        
		        <div class="modal-body">
	           	<div id="roomNameBtn">
	           
               	</div>
		          <!-- 테이블 자리 -->
				  <table id="roomInfoMdTb">
					<tr>
						<th width="250px" height="60px">회의실명</th>
						<td colspan="2" id="mdRmName"></td>
					</tr>
					<tr>
						<th rowspan="2" height="360px">회의실 이미지</th>
						<td><div class="mdImg" id="mdImg1"></div></td>
						<td><div class="mdImg" id="mdImg2"></div></td>
					</tr>
					<tr>
						<td><div class="mdImg" id="mdImg3"></div></td>
						<td><div class="mdImg" id="mdImg4"></div></td>
					</tr>
					<tr>
						<th height="40px">수용인원</th>
						<td colspan="2" id="mdPerson"></td>
					</tr>
					<tr>
						<th height="auto">회의장비</th>
						<td colspan="2" id="mdEquip"></td>
					</tr>		
				  </table>
		        </div>
		        
		        <!-- Modal footer -->
		        <div class="modal-footer">
		          <button type="button" class="btn btn-secondary" onclick="modalClose();">닫기</button>
		        </div>
		      </div>
		    </div>
		  </div>
		

</body>
</html>