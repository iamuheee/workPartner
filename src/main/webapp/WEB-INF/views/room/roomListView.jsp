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
       width:100%;
	   margin:auto;
       text-align: left;
	   padding-left:10px;
	   margin-bottom:10px;
    }

    #roomListArea {
		width:100%;
        margin:auto;
		display:flex;
        flex-wrap:wrap;
                
    }

	.btns{
		/* border:1px solid black; */
		width:fit-content;
	}

    .roomCard{
        width:31%;
        height:fit-content;
        border:1px solid lightgray;
		border-radius: 8px;
        margin:10px;
		padding-bottom:15px;
		display: flex;		
		justify-content: center;
    }

	.rmName {
		border-bottom: 1px solid lightgray;
	}
    
    .roomCard:hover {
        transform: scale(1.05);
        transition: all 0.3s;
    }

    .roomThumbnail {
        border:1px solid #f1f1f1;
        align-items: center;
		width:100%;
        height:230px;
		padding:0;
		margin-top:10px;
    }

    .roomDetail { 
        font-size:16px;
        height:auto;
        width:90%;
		margin-top:20px;
		padding:0px;
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
    
     #updateRoomTb {
		height:auto;
    } 

	#updateRoomTb td img{
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

	.deleteRoom {
		background-color: #fff;
		color:#dc3545 !important;
	}

	#mdRmname{
		height:40px;
		width:200px;
		border:1px solid lightgray;
		border-radius: 4px;
		padding-left:10px;
	}

	#mdEquip span {
		margin-right:10px;
	}

	#mdEquip span *{
		margin-right:5px;
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
				
				let value = "";
				
				if(!list) {
					value += "등록된 회의실이 없습니다.";
					
				}else {
					
					for(let i=0; i<list.length; i++) {
						
						value += '<div class="roomCard">'                                
							   + '<table class="roomDetail">'
							   + 	'<tr>'
							   +		'<th colspan="2" class="rmName"><h4>' + list[i].rmName+ '</h4></th>'
							   +		'<td width=100px class="rmName" align="right">'
							   +		'<div class="btns">'
							   +			'<button type="button" class="btn deleteRoom" onclick="return userConfirm(' + list[i].rmNo + ');"><i class="fas fa-trash-alt"></i></button>'
							   +		'</div>'
							   +		'</td>'
							   + 	'</tr>'
							   + 	'<tr>'
							   + 		'<td colspan="3" align="center" class="roomCoverImg" onclick="modalOpen(' + list[i].rmNo + ');">'
							   +				'<img src="' + list[i].file.filePath + '" class="roomThumbnail" class="roomCoverImg" >'
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
				success:function(result){
					console.log("개별 회의실 조회용 ajax 통신 성공");
					console.log(result);
					
					let room = result.r;
					let file = result.f;
					let using = result.u;
					let equip = result.e;
					let count = result.counts;
					
					$("input[name=rmNo]").val(room[0].rmNo);
										
					$("input[name=rmName]").val(room[0].rmName);
					
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

					var usingRate = 0;
					if(count.usingCount != 0 && count.totalCount != 0){
						usingRate = ((count.usingCount / count.totalCount) * 100).toFixed(1);
					}
	
					$("#mdUsing").text( usingRate +'% (총 ' + count.totalCount + '건 중 ' + count.usingCount + '건)');
					
					////////////////// 질문
					
					// 전체 장비(equip에 있는 것들)에 대해 checkbox를 만듦
					// 그 중에 사용중인 장비(using에도 있는 값들)엔 checked 속성을 부여한다.
					
					for(let i=0; i<equip.length; i++){
						
						var el = '<span><label><input type="checkbox" style="width:14px;height:14px;" name="eqNo" value="' + equip[i].eqNo +'">' 
				   	   	   	   + equip[i].eqName + '</label></span>';
		   	   	   	   
				   	 	//$("#mdEquip").html(el);
				   	 	$("#mdEquip").append(el);
					}
					
					for(let j=0; j<using.length; j++){
			   	   		
						$("#mdEquip input[value=" + using[j].eqNo + "]").attr("checked", true);
			   	   	}
										
				},
				error:function(){
					console.log("개별 회의실 조회용 ajax 통신 실패");
				}
			})
			
		}
		
		/* 모달창 열기 */
		function modalOpen(rmNo){
			$("#updateRoomMd").modal('show');
			selectRoom(rmNo);
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
			
			$("#updateRoomMd").modal('hide');
			
		}
		
		/* 모달창 배경 클릭 시 끄기 닫기 */
		$(function(){
			$('#updateRoomMd').modal({backdrop: 'static', keyboard: false}) ;
		})
		
		function userConfirm(rmNo) {
            if(confirm('회의실 삭제 시 복구할 수 없습니다.\n회의실을 삭제하시겠습니까?')) {
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
		    <form action="update.ro" method="post">
		      <div class="modal-content">
		    	<input type="hidden" name="rmNo">
		      
		        <!-- Modal Header -->
		        <div class="modal-header">
		          <h4 class="modal-title"><i class="fas fa-wrench"></i>&nbsp;회의실 조회 · 변경</h4>
		          <button type="button" class="close"  onclick="modalClose();">&times;</button>
		        </div>
		        
		        <!-- Modal body -->
		        
		        <div class="modal-body">
		          <!-- 테이블 자리 -->
				  <table id="updateRoomTb">
					<tr>
						<th width="250px" height="60px">회의실명</th>
						<td colspan="2" id="mdRmName"><input type="text" name="rmName" id="mdRmname"></td>
					</tr>
					<tr>
						<th rowspan="2">회의실 이미지</th>
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
						<th height="40px">최근 한달간 사용률</th>
						<td colspan="2" id="mdUsing"></td>
					</tr>
					<tr>
						<th>회의장비</th>
						<td colspan="2" id="mdEquip"></td>
					</tr>		
				  </table>
		        </div>
		        
		        <!-- Modal footer -->
		        <div class="modal-footer">
				  <button type="submit" class="btn btn-primary" onclick="return checkEquip();">수정</button>
		          <button type="button" class="btn btn-secondary" onclick="modalClose();">취소</button>
		        </div>
		      </div>
		      </form>
		    </div>
		  </div>
		  
		  <script>
		  	function checkEquip(){
		  		if( !$("input[name=eqNo]").is(":checked") ){	// 아무 회의장비도 선택되지 않았을 경우 방지
					alert("회의 장비를 선택해 주세요.");
					return false;
		  		}else {
		  			return true;
		  		}
		  	}
		  </script>

</body>
</html>