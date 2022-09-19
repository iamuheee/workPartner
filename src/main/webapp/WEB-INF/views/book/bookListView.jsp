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
        padding:10px;
        margin:auto;
        position:relative;
    }

    #bookList {
        width:100%;
        font-size:16px;
    }
    
    #bookList button{
    	margin-right:5px;
    }

    #bookDate {
        font-size:14px;
    }

	
    
    /* --------- */
    
    #pagingArea {
        width: fit-content;
        margin: auto;
        margin-top:30px;
    }
    
    #pagingArea button{
    	cursor:pointer;
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
		    <h3>내 예약 현황</h3>
		</div>
		<hr>
		
		<!-- 예약 이력 목록 -->
		<div id="bookListArea">
		    <table id="bookListTb" class="table table-hover">
		        <thead>
		            <tr>
		                <th scope="col">No.</th>
		                <th scope="col">회의실</th>
		                <th scope="col">회의명</th>
		                <th scope="col">예약일정</th>
		                <th scope="col">상태</th>
		            </tr>
		        </thead>
		        <tbody id="bookList">
		        <!-- ---------------------------- -->
		            <tr>
		                <td>5</td>
		                <td>회의실 이름</td>
		                <td>동해물과 백두산이 마르고 닳도록</td>
		                <td id="bookDate">YYYY-MM-DD HH:00 ~ YYYY:MM:DD HH:00</td>
		                <td>
		                	<button type="button" class="btn btn-secondary btn-sm">이용완료</button>
		                    <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#updateBook">변경</button>
		                    <button type="button" class="btn btn-danger btn-sm" onclick="return userConfirm();">취소</button>
		                </td>
		            </tr>
	           <!-- ---------------------------- -->
		        </tbody>
		    </table>
		</div>
		
		<!-- 취소 버튼 클릭 시 뜨는 컨펌창 ==> 예약 취소 -->
		<script>
		    function userConfirm() {
		            if(confirm('회의실 예약을 취소하시겠습니까?')) {
		                return true;
		            }else {
		                return false;
		            }
		        }
		</script>
		
		<!-- 수정 버튼 클릭 시 뜨는 모달 ==> 예약 정보 수정 -->
		<div class="modal fade" id="updateBook">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <!-- Modal Header -->
		            <div class="modal-header">
		                <h4 class="modal-title"><span class="material-symbols-outlined">update</span>&nbsp;회의실 예약 변경</h4>
		                <button type="button" class="close" data-dismiss="modal">&times;</button> 
		            </div>
		
		            <form action="회의실예약수정받아주는url" method="post">
		                <!-- Modal Body -->
		                <div class="modal-body">
		                    <table id="bookInfo">
		                        <tr>
		                            <th>회의실</th>
		                            <td>
		                                <!-- 회의실 이름 뿌리고 회의실 번호 값으로 넘김 -->
		                                <select name="rmNo" id="rmNo" required>
		                                    <option value="">회의실 이름 자리</option>
		                                    <option value="">Room A</option>
		                                </select>
		                            </td>
		                        </tr>
		                        <tr>
		                            <th>예약자</th>
		                            <td>예약 사원 이름 자리</td>
		                        </tr>
		                        <tr>
		                            <th>날짜</th>
		                            <td>
		                                <input type="date" name="bkDate" id="bkDate" required>
		                            </td>
		                        </tr>
		                        <tr>
		                            <th>시간</th>
		                            <td>
		                                <div id="bkTimeArea">
		                                    <select name="bkStart" id="bkStart" required>
		                                        <option value="">시작 시간</option>
		                                        <option value="">13:00</option>
		                                    </select>
		                                    <span>&nbsp;~&nbsp;</span>
		                                    <select name="bkEnd" id="bkEnd">
		                                        <option value="">종료 시간</option>
		                                        <option value="">14:00</option>
		                                    </select>
		                                </div>
		                            </td>
		                        </tr>
		                        <tr>
		                            <th colspan="2">회의 제목</th>
		                        </tr>
		                        <tr>
		                            <td colspan="2">
		                                <input type="text" name="bkTitle" id="bkTitle" placeholder="회의 제목 자리" required>
		                            </td>
		                        </tr>
		                    </table>
		                </div>
		                <!-- Modal footer -->
		                <div class="modal-footer">
		                    <button type="submit" class="btn btn-primary" style="margin-right:5px;">수정</button>
		                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
		                </div>
		            </form>
		        </div>
		    </div>
		</div>
		
		
		<!-- 페이징 처리 -->
		<div id="pagingArea">
		</div>
		
		<script>
		
		$(function(){
			selectBookList();
		})
		
		/* 날짜 비교용 함수 */
		function leadingZeros(n, digits) {
		    var zero = '';
		    n = n.toString();

		    if (n.length < digits) {
		        for (i = 0; i < digits - n.length; i++)
		            zero += '0';
		    }
		    return zero + n;
		}
		
		/* 내 예약 현황 조회용 ajax */
		function selectBookList(cpage) {
			$.ajax({
				url:"select.bk",
				type:"post",
				data:{
					cpage:cpage,
					empNo:${ loginUser.empNo }
				},
				success:function(result){
					console.log("내 예약 현황 조회용 ajax 통신 성공");
					console.log(result);
					
					let list = result.list;
					let pi = result.pi;
					
					let value = "";
					let pgValue = "";
					
					if(!list){	// 회의실 예약 이력이 없을 때
						value += "조회된 회의실 예약 내역이 없습니다.";
					
					}else {
						for(let i=0; i<list.length; i++){
							value += '<tr>'
								   +	'<td>' + (list.length - i) + '</td>'
								   +	'<td>' + list[i].room.rmName + '</td>'
								   +	'<td>' + list[i].bkTitle + '</td>'
								   +	'<td class="bookDate">' + list[i].bkDate + ' ' + list[i].bkStart + ' ~ ' + list[i].bkEnd + '</td>';
								   
								   /* 예약 일자와 오늘 날짜 비교 */
								   let endDate = list[i].bkDate + list[i].bkEnd;	// 예약 끝나는 날짜 + 시간 == 예약종료일시
								   let now = new Date();
								   
								   if(endDate){	
									   
									   now = leadingZeros(now.getFullYear(), 4) + '-' +
								    	     leadingZeros(now.getMonth() + 1, 2) + '-' +
								    	     leadingZeros(now.getDate(), 2);
									   
									   if(now > endDate){	// 오늘 > 예약종료일시 == 이용 후
										   value += '<td><button type="button" class="btn btn-secondary btn-sm" disabled>이용완료</button></td>'; 
									   }else {	// 이용 전
										   if(list[i].bkStatus == 'N') {	// bkStatus는 '예약취소상태'를 나타내므로 N이면 정상예약 중인 상태임
												  value += '<td><button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#updateBook">변경</button>'
												  	     + '<button type="button" class="btn btn-danger btn-sm" onclick="return userConfirm();">취소</button></td>';
										   }else { // 취소
											   value += '<td><button type="button" class="btn btn-warning btn-sm">취소완료</button></td>'; 
										   }
									   }
								   }
							value += '</tr>';
						}
					}
					
					/* ----- 페이징 처리 ----- */
					if(pi.currentPage != 1){
               			pgValue += "<button class='btn btn-sm btn-outline-primary' onclick='selectBookList("+ (pi.currentPage - 1) + ")'>&lt;</button>"	
               		}
               		
               		for(let p=pi.startPage; p<=pi.endPage; p++) { 
       		   			if(p == pi.currentPage) { 
       				   			pgValue += "<button class='btn btn-sm btn-outline-primary' disabled>"  + p  + "</button>"
       				   	}else {
       				   			pgValue += "<button class='btn btn-sm btn-outline-primary' onclick='selectBookList("+ p +")'>" + p + "</button>"
       		           	} 
       		         }     
                
       		         if(pi.currentPage != pi.maxPage) {
       		        	  pgValue += "<button class='btn btn-sm btn-outline-primary' onclick='selectBookList("  + (pi.currentPage + 1) + ")'>&gt;</button>"
       		         }
       		         
					$("#bookList").html(value);
					$("#pagingArea").html(pgValue);
					
				},
				error:function(){
					console.log("내 예약 현황 조회용 ajax 통신 실패");
				}
			})
		}
		
		</script>
		


</body>
</html>