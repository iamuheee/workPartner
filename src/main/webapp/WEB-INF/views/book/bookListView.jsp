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
    	border:none;
    	font-size:18px;
    	color:#000;
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
		                <th scope="col" width="10%">No.</th>
		                <th scope="col" width="15%">회의실</th>
		                <th scope="col" width="25%">회의명</th>
		                <th scope="col" width="25%">예약일정</th>
		                <th scope="col" width="25%">상태</th>
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
		                <button type="button" class="close" onclick="closeModal();">&times;</button> 
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
		                    <button type="button" class="btn btn-secondary" onclick="closeModal();">취소</button>
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
								   +	'<td>' + list[i].rmName + '</td>'
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
												  value += '<td><button type="button" class="btn btn-primary btn-sm" onclick="openModal(' + list[i].bkNo + ');">일정변경</button>'
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
		
		/* 모달창 오픈 */
		function openModal(bkNo) {
			$("#updateBookMd").modal('show');
			
			selectBook(bkNo);	// 예약 조회

		}
		
		/* 모달창 닫기 */
		function closeModal(){
			// 각 모달창 오픈 시 새로운 정보 조회할 것이므로 따로 비워주지 않아도 됨
			$("#updateBookMd").modal('hide');
		}
		
		/* 회의실 날짜 제한용 ajax */
		/* 실행 후에 조회 */
		function checkTime() {	// 모달 창 여는 버튼 누를 때 실행할 함수
			
			// 오늘 날짜 받기
			var now_utc = Date.now()	// 지금 날짜를 밀리초로
			var timeOff = new Date().getTimezoneOffset()*60000; // 분단위를 밀리초로 변환
			var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
			//console.log(today);
			
			$("input[name=bkDate]").attr("min", today);	// 오늘 날짜부터만 선택하게 함

			
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
					
					var bkDate = $('input[name=bkDate]').val();
					
					value += '<tr>'
					   	   +	'<th>회의실</th>'
					   	   +	'<td><button class="btn btn-warning" disabled>'+ b.rmName +'</td>'
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
                           +	'<td><input type="number" name="bkPerson" id="bkPerson" min="1" class="bkInfoTd" required value="'+ b.bkPerson + '">&nbsp;명'
                		   + '</tr>'
                		   + '<tr>'
                		   + 	'<th colspan="2">회의 제목</th>'
                		   + '</tr>'
                		   + '<tr>'
                		   +	'<td colspan="2" style="height:60px;">'
                		   + 	'<input type="text" name="bkTitle" id="bkTitle" value="' + b.bkTitle + '" class="bkInfoTd" required>'
                		   +	'<input type="hidden" name="bkNo" id="bkNo" value="' + b.bkNo + '">'	// 예약번호(bkNo)를 숨겨서 함께 보냄
                		   +	'</td>'
                		   + '</tr>';
                		   
                		   $("#bookInfo").html(value);
							
                		   checkTime();
                		   
                		   
                		   $(document).on("change", "input[name=bkDate]", function(){
                			   var bkDate = $('input[name=bkDate]').val();
                			   var rmNo = b.rmNo;
                			   
                			   selectTime(rmNo, bkDate);
                			   
                		   })
                		   
                		   $(document).on("change", "select[name=bkStart]", function(){
                			   var bkDate = $('input[name=bkDate]').val();
                			   var rmNo = b.rmNo;
                			   
                			   selectTime(rmNo, bkDate);
                			   
                		   })
                		   
                		   $(document).on("change", "select[name=bkEnd]", function(){
                			   var bkDate = $('input[name=bkDate]').val();
                			   var rmNo = b.rmNo;
                			   
                			   selectTime(rmNo, bkDate);
                			   
                		   })
               				 
					
				},
				error:function(){
					console.log("회의실 예약 상세조회용 ajax 통신 실패");
				}
			})
		}
			
		/* 예약 시간 제한 */
		function selectTime(rmNo, bkDate){
	 		
			// 해당 날짜에 예약되어 있는 bkStart, bkEnd를 조회해 와서
			// 선택된 bkStart, bkEnd와 비교한 후 같으면 disabled 속성을 추가한다.
			
			// 조회에 넘길 값 : 선택된 rmNo, bkDate
			
			// 조회 후 비교할 값 
			var bkStart = $('select[name="bkStart"] option:selected').val();
			var bkEnd = $('select[name="bkEnd"] option:selected').val();
			
			console.log(rmNo, bkDate);
			
				$.ajax({
					url:"selectTime.bk",
					type:"post",
					data:{
						rmNo:rmNo,
						bkDate:bkDate
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