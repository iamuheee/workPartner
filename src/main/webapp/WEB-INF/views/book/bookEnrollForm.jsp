<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
        border-bottom:1px solid #D7DBE0;
    }

    #bookInfo td {
        font-size:16px;
        border-bottom:1px solid #D7DBE0;
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
</style>
<body>
	
	<jsp:include page="../common/menubar.jsp"/>
	
	<div id="bookList-outer">
		<!-- 상단 메뉴 제목 영역 -->
		<div id="bookList-header">
		    <h3>회의실 예약</h3>
		</div>
		<hr>
		
		<!-- 날짜 페이징 처리 영역 -->
		<div id="selectDate">
			<a href=""><i class="fas fa-chevron-left"></i></a>
			<h4>2022-08-22 (월) <i class="far fa-calendar-check"></i> </h4>
			<a href=""><i class="fas fa-chevron-right"></i></a>
		</div>
		
		<!--  예약 등록 버튼 영역 -->
		<div id="bookEnroll">
	        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#insertBookMd" ><i class="fa-solid fa-plus"></i>&nbsp;회의실 예약</button>
	    </div>
		
		<!-- 회의실 예약 캘린더 영역 -->
		<div id="bkCalendar">
		
		</div>
		
	
		<!-- 회의실 예약 버튼 클릭 시 뜨는 모달 ==> 예약 정보 수정 -->
		<div class="modal" id="insertBookMd">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <!-- Modal Header -->
		            <div class="modal-header">
		                <h4 class="modal-title"><i class="far fa-clock"></i>&nbsp;&nbsp;회의 일정</h4>
		                <button type="button" class="close" data-dismiss="modal">&times;</button> 
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
		                                        <option value="0800">08:00</option>
		                                        <option value="0900">09:00</option>
		                                        <option value="1000">10:00</option>
		                                        <option value="1100">11:00</option>
		                                        <option value="1200">12:00</option>
		                                        <option value="1300">13:00</option>
		                                        <option value="1400">14:00</option>
		                                        <option value="1500">15:00</option>
		                                        <option value="1600">16:00</option>
		                                        <option value="1700">17:00</option>
		                                        <option value="1800">18:00</option>
		                                        <option value="1900">19:00</option>
		                                    </select>
		                                    <span>&nbsp;&nbsp;~&nbsp;&nbsp;</span>
		                                    <select name="bkEnd" id="bkEnd" class="bkInfoTd" required>
		                                        <option value="">종료 시간</option>
		                                        <option value="0900">09:00</option>
		                                        <option value="1000">10:00</option>
		                                        <option value="1100">11:00</option>
		                                        <option value="1200">12:00</option>
		                                        <option value="1300">13:00</option>
		                                        <option value="1400">14:00</option>
		                                        <option value="1500">15:00</option>
		                                        <option value="1600">16:00</option>
		                                        <option value="1700">17:00</option>
		                                        <option value="1800">18:00</option>
		                                        <option value="1900">19:00</option>
		                                        <option value="2000">20:00</option>
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
		                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
		                </div>
	                </form>
		        </div>
		    </div>
		</div>
		
		<script>
		
		$(function(){
			selectRoomList();
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
		/*function insertBook(){
			
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
		}*/
		
		</script>
		
		

</body>
</html>