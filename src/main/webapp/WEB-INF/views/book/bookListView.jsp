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
		           <!-- ajax로 목록 받는 영역 -->
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
		
		<!-- 변경 버튼 클릭 시 뜨는 모달 ==> 예약 정보 수정 -->
		<div class="modal fade" id="updateBookMd">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <!-- Modal Header -->
		            <div class="modal-header">
		                <h4 class="modal-title"><i class="fas fa-sync"></i>&nbsp;&nbsp;회의실 일정 변경</h4>
		                <button type="button" class="close" data-dismiss="modal">&times;</button> 
		            </div>
						<form action="update.bk" method="post">		
		                <!-- Modal Body -->
		                <div class="modal-body">
		                    <table id="bookInfo">
		                       
		                    </table>
		                </div>
		                <!-- Modal footer -->
		                <div class="modal-footer">
		                    <button type="submit" class="btn btn-primary" id="insertBk" style="margin-right:5px;">저장</button>
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
				url:"selectList.bk",
				type:"post",
				data:{
					cpage:cpage,
					empNo:${ loginUser.empNo }
				},
				success:function(result){
					console.log("내 예약 현황 조회용 ajax 통신 성공");
					//console.log(result);
					
					let list = result.list;
					let pi = result.pi;
					
					let value = "";
					let pgValue = "";
					
					if(list.length == 0){	// 회의실 예약 이력이 없을 때
						value += "<table><tr align='center'><td colspan='5'>조회된 회의실 예약 내역이 없습니다.</td></tr></table>";
						
					}else {
						for(let i=0; i<list.length; i++){
							value += '<table id="bookInfo">'
								   + '<tr>'
								   +	'<td>' + (list.length - i) + '</td>'
								   +	'<td>' + list[i].room.rmName + '</td>'
								   +	'<td>' + list[i].bkTitle + '</td>'
								   +	'<td class="bookDate">' + list[i].bkDate + ' ' + list[i].bkStart + '~' + list[i].bkEnd + '</td>';
								   
								   /* 예약 일자와 오늘 날짜 비교 */
								   let endDate = list[i].bkDate + ' ' + list[i].bkEnd;	// 예약 끝나는 날짜 + 시간 == 예약종료일시
								   let now = new Date();
								   
								   if(endDate){	
									   
									   now = leadingZeros(now.getFullYear(), 4) + '-' +
								    	     leadingZeros(now.getMonth() + 1, 2) + '-' +
								    	     leadingZeros(now.getDate(), 2) + ' ' + 
								    	     leadingZeros(now.getHours(), 2) + ':' +
								    	     leadingZeros(now.getMinutes(), 2);
									   
									   //console.log(now);
									   //console.log(endDate);
									   
									   if(now > endDate){	// 오늘 > 예약종료일시 == 이용 후
										   value += '<td><button type="button" class="btn btn-secondary btn-sm" disabled>이용완료</button></td>'; 
									   }else {	// 이용 전
										   if(list[i].bkStatus == 'N') {	// bkStatus는 '예약취소상태'를 나타내므로 N이면 정상예약 중인 상태임
												  value += '<td><button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#updateBookMd" onclick="selectBook(' + list[i].bkNo + ');">일정변경</button>'
												  	     + '<button type="button" class="btn btn-danger btn-sm" onclick="userConfirm(' + list[i].bkNo + ');">예약취소</button></td>';
										   }else { // 취소
											   value += '<td><button type="button" class="btn btn-warning btn-sm" disabled>취소완료</button></td>'; 
										   }
									   }
								   }
							value += '</tr></table>';
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
					}
       		         
					$("#bookList").html(value);
					$("#pagingArea").html(pgValue);
					
				},
				error:function(){
					console.log("내 예약 현황 조회용 ajax 통신 실패");
				}
			})
		}
		
		/* 회의실 예약 상세조회용 ajax */
		// 조회해 와서 화면에 뿌려주는 용도
		// 변경 버튼 누를 때 실행됨
		function selectBook(bkNo){
						
			$.ajax({
				url:"select.bk",
				type:"post",
				data:{
					bkNo:bkNo
				},
				success:function(b){
					console.log("회의실 예약 상세조회용 ajax 통신 성공");
					//console.log(b);
					
					/* b에 담긴 값을 예약 변경용 모달창에 뿌려준다. */
					let value = "";
					
					value += '<tr>'
					   	   +	'<th>회의실</th>'
					   	   +	'<td><button class="btn btn-warning" disabled>'+ b.room.rmName +'</td>'
                    	   + '</tr>'
                    	   + '<tr>'
                    	   + 	'<th>날짜</th>'
                    	   +    '<td>'
                    	   +		'<input type="date" class="bkInfoTd" name="bkDate" id="bkDate" required value=' + b.bkDate + '>'
                    	   +	'</td>'
                    	   + '</tr>'
                    	   + '<tr>'
                    	   +	'<th>시간</th>'
                    	   +    '<td>'
                    	   +		'<div id="bkTimeArea">'
                    	   +			'<select name="bkStart" id="bkStart" class="bkInfoTd" required>'
                    	   
	                    	   for(let i=8; i<20; i++){
	                    		   if(i<=9){
	                    			   if('0'+i+':00' == b.bkStart){
	                    				   value += '<option value="0' + i + ':00" selected>0' + i + ':00</option>'; 
	                    			   }else {
	                    				   value += '<option value="0' + i + ':00">0' + i + ':00</option>'; 
	                    			   }
	                    		   }else {
	                    			   if(i+':00' == b.bkStart) {
	                    				   value += '<option value="' + i + ':00" selected>' + i + ':00</option>'; 
	                    			   }else {
	                    				   value += '<option value="' + i + ':00">' + i + ':00</option>';
	                    			   }
	                    			   
	                    		   }
	                       	   }

                    value +=		 	'</select>'
                           + 			'<span>&nbsp;&nbsp;~&nbsp;&nbsp;</span>'
                           +			'<select name="bkEnd" id="bkEnd" class="bkInfoTd" required>'
                           
			             	   for(let i=9; i<21; i++){
			            		   if(i==9){
			            			   if('0'+i+':00' == b.bkEnd){
			            				   value += '<option value="0' + i + ':00" selected>0' + i + ':00</option>'; 
			            			   }else {
			            				   value += '<option value="0' + i + ':00">0' + i + ':00</option>'; 
			            			   }
			            		   }else {
			            			   if(i+':00' == b.bkEnd) {
			            				   value += '<option value="' + i + ':00" selected>' + i + ':00</option>'; 
			            			   }else {
			            				   value += '<option value="' + i + ':00">' + i + ':00</option>';
			            			   }
			            		   }
			               	   }
                           	
                    value += 			'</select>'
                           +		'</div>'
                           +	'</td>'
                           + '</tr>'
                           + '<tr>'
                           +	'<th>참여 인원</th>'
                           +	'<td><input type="number" name="bkPerson" id="bkPerson" min="1" class="bkInfoTd" required placeholder="'+ b.bkPerson + '">&nbsp;명'
                		   + '</tr>'
                		   + '<tr>'
                		   + 	'<th colspan="2">회의 제목</th>'
                		   + '</tr>'
                		   + '<tr>'
                		   +	'<td colspan="2" style="height:60px;">'
                		   + 	'<input type="text" name="bkTitle" id="bkTitle" placeholder="' + b.bkTitle + '" class="bkInfoTd" required>'
                		   +	'<input type="hidden" name="bkNo" id="bkNo" value="' + b.bkNo + '">'	// 예약번호(bkNo)를 숨겨서 함께 보냄
                		   +	'</td>'
                		   + '</tr>';
                		   
                		   $("#bookInfo").html(value);
					
					
				},
				error:function(){
					console.log("회의실 예약 상세조회용 ajax 통신 실패");
				}
			})
		}
		
		/* 회의실 예약 취소 확인용 confirm */
		function userConfirm(bkNo){
			if(confirm("회의실 예약을 취소하시겠습니까?")) {
				deleteBook(bkNo);	// 확인 버튼을 누르면 ajax 실행
			}else{
				return false;
			}
		}
		
		/* 회의실 예약 취소용 ajax */
		function deleteBook(bkNo){
				$.ajax({
					url:"delete.bk",
					type:"post",
					data:{
						bkNo:bkNo
					},
					success:function(result){
						console.log("회의실 예약 취소용 ajax 통신 성공");
						//console.log(result);
						
						// 회의실 예약 목록 조회용 ajax 실행
						if(result == "success"){
							selectBookList();
						}
					},
					error:function(){
						console.log("회의실 예약 취소용 ajax 통신 실패");
					}
				})
				
				
			
		}
		
		</script>
		


</body>
</html>