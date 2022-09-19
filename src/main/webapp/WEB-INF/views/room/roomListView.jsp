<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
    #roomList-outer {
        /* border:1px solid blue; */
        width:100%;
        height:100%;
        padding:10px;
        margin:auto;
        position:relative;
    }

    #roomEnroll {
        width:95%;
        margin:auto;
        text-align: right;
    }

    #roomListArea {
        width:100%;
        height:100vh;
        margin:auto;
        display:flex;
        flex-wrap:wrap;
        //justify-content:space-between;
        
    }

    .roomCard{
        width:31%;
        height:350px;
        border:1px solid #f1f1f1;
        margin:10px;
        box-shadow: rgba(0, 0, 0, 0.1) 0px 20px 25px -5px, rgba(0, 0, 0, 0.04) 0px 10px 10px -5px;
		margin-bottom:20px;
    }
    
    .roomCard:hover {
        transform: scale(1.05);
        transition: all 0.3s;
    }

    .roomThumbnail {
        border:1px solid #f1f1f1;
        align-items: center;
		width:90%;
        height:230px;
    }

    .roomDetail { 
        font-size:16px;
        /* border:1px solid red; */
        height:auto;
        margin:auto;
        margin-top:20px;
        width:90%;
    }

    .roomUpdate {
        width:90%;
        /* border:1px solid red; */
        margin:auto;
        margin-top:20px;
        text-align:right;
    }
    
    .updateRoomBt{
    	margin:5px;
    }
    

</style>

</head>
<body>

	<jsp:include page="../common/menubar.jsp" />

	<div id="roomList-outer">
	    <!-- 상단 메뉴 제목 영역 -->
	    <div id="roomList-header">
	        <h3>회의실 관리</h3>
	    </div>
	    <hr>
	
	    <!-- 회의실 등록 영역 -->
	    <div id="roomEnroll">
	        <button class="btn btn-primary" onclick="location.href='enrollForm.ro';" type=button><i class="fa-solid fa-plus"></i> 회의실 등록</button>
	    </div>
	
	    <div id="roomListArea">
				
	    </div>
	</div>
	
	<script>
	
	$(function(){
		selectRoomList();	// 회의실 목록 조회
	})
	
	/* 회의실 목록 조회용 ajax */
	function selectRoomList(){
		$.ajax({
			url:"selectList.ro",
			type:"post",
			success:function(list){
				console.log("회의실 목록 조회용 ajax 통신 성공");
				//console.log(list);
				
 				arr = new Array("#0F52FC","#D11E35", "#1A7742", "#FEB50D", "#191C1F");
				
				let value = "";
				
				if(!list) {
					value += "등록된 회의실이 없습니다.";
					
				}else {
					
					for(let i=0; i<list.length; i++) {
						
						value += '<div class="roomCard">'                                
							   + '<table class="roomDetail">'
							   + 	'<tr>'
							   +		'<th colspan="2" class="rmN"><h3 style="color:' + arr[i] + ';">' + list[i].rmName+ '</h3></th>'
							   + 	'</tr>'
							   + 	'<tr>'
							   + 		'<td align="center">'
							   +				'<img src="' + list[i].file.filePath + '" class="roomThumbnail">'
							   +		'</td>'
							   + 	'</tr>'
							   + 	'<tr>'
							   +		'<td align="right">'
							   +			'<button type="button" class="btn btn-primary btn-sm updateRoomBt" data-toggle="modal" data-target="#updateRoomMd" onclick="selectRoom(' + list[i].rmNo + ');"><i class="fa-solid fa-eraser"></i></button>'
							   +			'<button type="button" class="btn btn-danger btn-sm" onclick="return userConfirm(' + list[i].rmNo + ');"><i class="fas fa-trash-alt"></i></button>'
							   +		'</td>'
							   + 	'</tr>'
							   + '</table>'
							   + '</div>';
					}
				}
				
				$("#roomListArea").html(value);
				
			},
			error:function(){
				console.log("회의실 목록 조회용 ajax 통신 실패");
				
			}
		})
	}
		
		/* 개별 회의실 조회용 ajax */
		function selectRoom(rmNo) {
			
			$.ajax({
				url:"select.ro",
				data:{
					rmNo:rmNo
				},
				success:function(r){
					console.log("개별 회의실 조회용 ajax 통신 성공");
					console.log(r);
					
					let value = "";
					
 					value += '<tr>'
						   +	'<th width="200px;">회의실명</th>'
						   +	'<td><input type="text" id="rmName" name="rmName" placeholder="' + r.rmName +'" required></td>'
						   + '</tr>'
						   + '<tr>'
						   + 	'<th>회의실 이미지</th>'
						   +	'<td>슬라이드 이미지 자리</td>'
						   + '</tr>'
						   + '<tr>'
						   + 	'<th>수용인원</th>'
						   +	'<td><input type="number" id="rmPerson" name="rmPerson" min="1" placeholder="' + r.rmPerson + '"required></td>'
						   + '</tr>'
						   + '<tr>'
						   +	'<th>회의장비</th>'
						   +	'<td>';
						   
						   // equips의 길이 어떻게 구함?
								   
						   for(let i=0; i<Object.keys(Object.keys(r.equips)).length; i++){
					value +=	   r[i].equips[i].eqName + '<br>';	
						   }
					
					value +=  	'</td>'
						   +	'<td>'
						   + '</tr>'
						   + '</tr>'
						   + '<tr>'
						   + 	'<th>상태</th>'
						   + 	'<td>';
						   
						   if(!cr) {
					value += '사용 가능';	   
						   }else {
					value += '사용 불가';		   
						   }	   
					value += 	'</td>'	   
						   + '</tr>'
						   + '<tr>'
						   + 	'<th>이용 불가 시간</th>'
						   + 	'<td>'
						   +	'<input type="datetime-local" id="crStart" name="crStart"> ~ ' 
						   +	'<input type="datetime-local" id="crEnd" name="crEnd">'
						   +	'<input type="text" placeholder="이용 불가 사유" required>'
						   +	'<button type="button" class="btn btn-primary btn-sm"><i class="fa-solid fa-plus"></i></button>'
						   +	'<br>'
						   +	'<input type="datetime-local" id="crStart" name="crStart"> ~'
						   +	'<input type="datetime-local" id="crEnd" name="crEnd">'
						   +	'<input type="text" placeholder="이용 불가 사유" required>'
						   +	'<button type="button" class="btn btn-danger btn-sm"><i class="fa-solid fa-xmark"></i></button>'
						   +	'</td>'
						   + '</tr>';
						   
					$("#updateRoomTb").html(value);   
					
				},
				error:function(){
					console.log("개별 회의실 조회용 ajax 통신 실패");
				}
			})
			
		}
		
		function userConfirm(rmNo) {
            if(confirm('회의실 삭제 시, 모든 예약 기록이 삭제되며 복구할 수 없습니다.\n회의실을 삭제하시겠습니까?')) {
            	deleteRoom(rmNo);
            	
            }else {
                return false;
            }
        }
        
        /* 회의실 삭제용 ajax */
        function deleteRoom(rmNo){
    		$.ajax({
    			url:"delete.ro",
    			data:{
    				rmNo:rmNo
    			},
    			success:function(result) {
    				console.log("회의실 삭제용 ajax 통신 성공");
    				if(result == "success") {
    					selectRoomList();
    				}
    			},
    			error:function(){
    				console.log("회의실 삭제용 ajax 통신 실패");
    			}
    		})	
    	}
	
	</script>
	
	<!-- 회의실 수정 모달 -->
		  <!-- The Modal -->
		  <div class="modal fade" id="updateRoomMd">
		    <div class="modal-dialog modal-lg">
		      <div class="modal-content">
		      
		        <!-- Modal Header -->
		        <div class="modal-header">
		          <h4 class="modal-title">회의실 변경</h4>
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		        </div>
		        
		        <!-- Modal body -->
		        <div class="modal-body">
		          <!-- 테이블 자리 -->
				  <table id="updateRoomTb">
					<!-- <tr>
						<th width="200px;">회의실명</th>
						<td><input type="text" id="rmName" name="rmName" placeholder="현재 회의실명" required></td>
					</tr>
					<tr>
						<th>회의실 이미지</th>
						<td>슬라이드 이미지 자리</td>
					</tr>
					<tr>
						<th>수용인원</th>
						<td><input type="number" id="rmPerson" name="rmPerson" min="1" required></td>
					</tr>
					<tr>
						<th>회의장비</th>
						<td>ajax로 뿌림</td>
					</tr>
					<tr>
						<th>상태</th>
						<td>사용가능 | 사용불가</td>
					</tr>
					<tr>
						<th>이용 불가 시간</th>
						<td><input type="datetime-local" id="crStart" name="crStart"> ~ 
							<input type="datetime-local" id="crEnd" name="crEnd">
							<input type="text" placeholder="이용 불가 사유" required>
							<button type="button" class="btn btn-primary btn-sm"><i class="fa-solid fa-plus"></i></button>
							<br>
							<input type="datetime-local" id="crStart" name="crStart"> ~ 
							<input type="datetime-local" id="crEnd" name="crEnd">
							<input type="text" placeholder="이용 불가 사유" required>
							<button type="button" class="btn btn-danger btn-sm"><i class="fa-solid fa-xmark"></i></button>
						</td>
					</tr> -->					
				  </table>
		        </div>
		        
		        <!-- Modal footer -->
		        <div class="modal-footer">
		          <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				  <button type="button" class="btn btn-primary">저장</button>
		        </div>
		      </div>
		    </div>
		  </div>

</body>
</html>