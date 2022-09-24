<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#roomEnroll-outer {
        /* border:1px solid blue; */
        width:100%;
        height:100%;
        padding:10px;
        margin:auto;
        position:relative;
    }
	
	#enroll-body{
		width:95%;
		margin:auto;
	}

	#enrollArea{
		box-shadow: 2px 2px 14px 0 rgb(0 0 0 / 8%);
		border:1px solid rgba(0,0,0,.125);
		padding:15px 20px 25px 20px;
	}
	
	#createBtn{
		margin-top: 20px;
	}

    #roomEnroll {
        width:95%;
        height:600px;
        margin:auto;
    }

    #roomEnroll * {
        /* border:1px solid red; */
    }

    #roomEnroll th {
        font-size:16px;
    }

    #roomEnroll * {
        padding-top:7px;
        padding-bottom:7px;
    }
    #rmName {
        width:150px;
    }

    #rmName, #rmPerson {
        padding-left:10px;
    }
    
    .equipBtn {
    	margin-right:10px;
    }

	.roomImg {
		cursor:pointer;
	}
	
	#equipList span {
		margin-right:10px;
	}
	
	#equipList span *{
		margin-right:5px;
	}
	
</style>
</head>
<body>

	<jsp:include page="../common/menubar.jsp" />
	
	<div id="roomEnroll-outer">
	    <!-- 상단 메뉴 제목 영역 -->
	    <div id="roomEnroll-header">
	        <h3>회의실 등록</h3>
	    </div>
	    <hr>
	    <!-- 사용자에게 입력받아야 하는 것 : 첨부파일, 제목, 수용인원, 회의 장비-->
		<div id="enroll-body">
			<form id="enroll-room" action="insert.ro" method="post" enctype="multipart/form-data">
				<div id="enrollArea">
	            <table id="roomEnroll">
	                <tr>
	                    <th width="20%">회의실 이름</th>
	                    <td colspan="3">
	                        <input type="text" id="rmName" name="rmName" style="width:240px;height:40px;border:1px solid #b7b9cc"required>
	                    </td>
	                </tr>
	                <tr>
	                    <th>회의실 대표 이미지</th>
	                    <td colspan="3">
	                        <img class="roomImg" id="titleImg" width="240" height="180" onclick="choosefile(1);">
	                    </td>
	                </tr>
	                <tr align="left">
	                    <th>회의실 상세 이미지</th>
	                    <td width="250"><img class="roomImg" id="contentImg1" width="240" height="180" onclick="choosefile(2);"></td>
	                    <td width="250"><img class="roomImg" id="contentImg2" width="240" height="180" onclick="choosefile(3);"></td>
	                    <td><img class="roomImg" id="contentImg3" width="240" height="180" onclick="choosefile(4);"></td>
	                </tr>
	                <tr>
	                    <th>수용인원</th>
	                    <td colspan="3">
	                        <input type="number" id="rmPerson" name="rmPerson" min="1" style="width:60px;height:30px;border:1px solid #b7b9cc" required > 명
	                    </td>
	                </tr>
	                <tr>
	                    <th>회의장비</th>
	                    <td colspan="3" id="equipList">
							<!-- ajax로 회의장비들을 받아서 뿌림 -->
	                    </td>
	                </tr>

	            </table>
			    <div id="file-area" style="display:none">
			    	<input type="file" name="upfile" id="file1" onchange="loadImg(this, 1);" required>
					<input type="file" name="upfile" id="file2" onchange="loadImg(this, 2);">
					<input type="file" name="upfile" id="file3" onchange="loadImg(this, 3);">
					<input type="file" name="upfile" id="file4" onchange="loadImg(this, 4);">
			    </div>
			    
			    <script>
			    
			    /* 회의실 사진 화면에 뿌리기 */
				function choosefile(num) {
					$("#file" + num).click();
			    }

				function loadImg(inputFile, num){
					if(inputFile.files.length == 1) {   // 파일 선택된 경우 ==> 파일 읽어들여서 미리보기
						const reader = new FileReader();
						reader.readAsDataURL(inputFile.files[0]);
						reader.onload = function(e) { 
							switch(num) {
								case 1: $("#titleImg").attr("src", e.target.result); break;
								case 2: $("#contentImg1").attr("src", e.target.result); break;
								case 3: $("#contentImg2").attr("src", e.target.result); break;
								case 4: $("#contentImg3").attr("src", e.target.result); break;
							}
						}
					}else { // 파일 취소된 경우 ==> 미리보기 된 것도 사라지게
						switch(num) {
								case 1: $("#titleImg").attr("src", null); break;
								case 2: $("#contentImg1").attr("src", null); break;
								case 3: $("#contentImg2").attr("src", null); break;
								case 4: $("#contentImg3").attr("src", null); break;
						}
					}
				}
			    
			    </script>
			</div>
			<div id="createBtn">
				<button type="submit" class="btn btn-primary" style="margin-right:5px;" onclick="return checkImg();">저장</button>
				<button type="button" class="btn btn-secondary" onclick="location.href='javascript:history.back();'">취소</button>
			</div>
			</form>
		</div>
		
		<script>
		function checkImg(){
			if(!$("#file1").val()) {
				alert("회의실 대표 이미지를 선택해 주세요.");
				return false;
			}else if( !$("input[name=eqNo]").is(":checked") ){
				alert("회의 장비를 선택해 주세요.");
				return false;
			}
			else {
				return true;
			}
		}
		
		</script>
	    
	    <!-- 장비 추가 버튼 클릭 시 뜨는 모달 ==> TB_EQUIP에 INSERT -->
	    <div class="modal fade" id="insertEq">
	        <div class="modal-dialog modal-sm">
	            <div class="modal-content">
	                <!-- Modal Header -->
	                <div class="modal-header">
	                    <h4 class="modal-title">장비 추가</h4>
	                    <button type="button" class="close" data-dismiss="modal">&times;</button> 
	                </div>
	
	                <!-- <form action="insertEq.ro" method="post"> -->
	                    <!-- Modal Body -->
	                    <div class="modal-body">
	                        <table id="empInfo">
	                            <tr>
	                                <th width="150px">장비명</th>
	                                <td width="300px">
	                                    <input type="text" id="modalEqName" name="eqName">
	                                </td>
	                            </tr>
	                        </table>
	                    </div>
	                    <!-- Modal footer -->
	                    <div class="modal-footer">
	                        <button type="button" class="btn btn-primary" style="margin-right:5px;" onclick="insertEquip();" data-dismiss="modal">추가</button>
	                        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	                    </div>
	                <!-- </form> -->
	            </div>
	        </div>
	    </div>
	</div>
	
	<script>
	
	$(function(){
		
		selectEquipList();	// 회의 장비 조회 ajax
		
	})

	
	
	/* 회의 장비 조회용 ajax */
	function selectEquipList() {
		
		$.ajax({
			url:"selectEqList.ro",
			success:function(eq){
				console.log("장비 조회용 ajax 통신 성공");
				//console.log(eq);
				
				var value = "";
				
				// 조회된 장비만큼 input button 만들어서 값을 뿌려줌 (반복문)
				// name = eqNo가 되어야 함 ==> 나중에 form 제출할 때 같이 넘길 값
				
				if(eq) {	// eq != null
					
					for(var i=0; i<eq.length; i++){
						value += '<span><label><input type="checkbox" style="width:14px;height:14px;" name="eqNo" value="' + eq[i].eqNo +'">' 
						   	   + eq[i].eqName + '</label></span>'; 
					}
				}
				
				value += '<br><button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#insertEq">+ 장비 추가</button>';
				$("#equipList").html(value);
				
			},
			error:function(){
				console.log("장비 조회용 ajax 통신 실패");
			}
		})
				
		
	}
		
	/* 회의 장비 추가용 ajax */
	function insertEquip(){
		
		if( $("#modalEqName").val().trim().length != 0 ) {	// 유효한 장비 이름이 들어왔을 때만 실행
			
			$.ajax({
				url:"insertEq.ro",
				data:{
					eqName:$("#modalEqName").val()
				},
				success:function(result){
					console.log("장비 추가용 ajax 통신 성공");
					if(result == "success") {
						//console.log(result);
												
						// 회의 장비 조회 ajax 실행해야 함
						selectEquipList();
						$("#modalEqName").val("");
					}
				},
				error:function(){
					console.log("장비 추가용 ajax 통신 실패");
				}
			})
			
		}else {
			alert("장비명을 입력해 주세요.");
		}
	}
	
	
	
	
	</script>

</body>
</html>