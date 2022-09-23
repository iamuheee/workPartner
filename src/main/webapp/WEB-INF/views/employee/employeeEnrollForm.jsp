<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#mypage-outer {
        /* border:1px solid blue; */
        width:100%;
        padding:10px;
        margin:auto;
        position:relative;
    }

	#mypage-body{
		width:95%;
		margin:auto;
		margin-top:25px;
	}

	#table-area{
		box-shadow: 2px 2px 14px 0 rgb(0 0 0 / 8%);
		border:1px solid rgba(0,0,0,.125);
		padding:15px 20px 25px 20px;
	}

	#createBtn{
		margin-top: 20px;
	}
	
    #empInfo {
        width: 100%;
    }
   
    #empInfo th{
        height: 70px;
        width: 15%;
        font-size:16px;
    }

    #empInfo td {
        width: 35%;
    }

    #empInfo input {
        width:300px;
    }

    #empInfo select {
        width: 200px;
    }

    #empInfo input, select {
        height:40px;
        border:1px solid #b7b9cc;
        padding-left:10px;
    }

    #profileImg{
        width:200px;
        height:200px;
        border:1px solid #b7b9cc;
        border-radius: 50%;
        cursor: pointer;
    }

    #profile-box {
        width:200px;
        display: flex;
        flex-direction: column;
    }
    
    #empPwd::placeholder {
    	font-size:14px;
    	font-weight:900;
    }

</style>
</head>
<body>

	<jsp:include page="../common/menubar.jsp" />
	
	<!-- input date 타입에 적용할 날짜 포맷 (입사일) -->
	<% request.setAttribute("dateType", "yyyy-MM-dd"); %>
	
	<div id="mypage-outer">
	    <!-- 상단 메뉴 제목 영역 -->
	    <div id="mypage-header">
	        <h3>사용자 등록</h3>
	    </div>
	    <hr>
	    
	    <!-- 내 정보 관리 영역 -->
	    <div id="mypage-body">
	        <form action="insert.em" method="post" id="enrollForm" enctype="multipart/form-data">
			<div id="createEmp">
				<div id="table-area">
					<table id="empInfo">
						<tr>
							<th width="150px">이름<span style="color:red;">&nbsp;*</span></th>
							<td width="300px">
								<input type="text" id="empName" name="empName" required>
							</td>
							<th width="150px">프로필 사진</th>
							<td rowspan="4">
								<div id="profile-box">
									<img id="profileImg" src="resources/profile_images/defaultProfile.png" onclick="choosefile();"><br>
									<button type="button" class="btn btn-primary" onclick="choosefile();">프로필 사진 등록</button>
									<input type="file" name="upfile" id="upfile" onchange="loadImg(this);" style="display:none;">
								</div>
								
								<!-- 첨부한 프로필 이미지 화면에 띄우기 -->
								<script>
									function choosefile() {
										$("input[name=upfile]").click();
									}
									
									function loadImg(inputFile) {
										console.log(inputFile);
										if(inputFile.files.length == 1) {	// 파일이 선택된 경우
											const reader = new FileReader();
											reader.readAsDataURL(inputFile.files[0]);
											reader.onload = function(e) {
												$("#profileImg").attr("src", e.target.result);
											}
										}else {	// 파일 선택을 취소한 경우 ==> 기본 이미지가 뜨게 
											$("#profileImg").attr("src", "resources/profile_images/defaultProfile.png");
										}
									}
																		
								</script>
							</td>
						</tr>
						<tr>
							<th>아이디<span style="color:red;">&nbsp;*</span></th>
							<td>
								<input type="text" id="empId" name="empId" required><br>
								<label id="checkResult" style="font-size:0.8em; display:none;"></label>
							</td>
						</tr>
						<tr>
							<th>비밀번호<span style="color:red;">&nbsp;*</span></th>
							<td>
								<!-- 아이디와 동일하게 설정 (placeholder로 지시하거나 아이디와 동일하게 입력되도록 하기) -->
								<input type="password" id="empPwd" name="empPwd" placeholder="초기 비밀번호는 아이디와 동일하게 설정하세요." required>
							</td>
						</tr>
						<tr>
							<th>이메일<span style="color:red;">&nbsp;*</span></th>
							<td>
								<input type="email" id="empEmail" name="empEmail" readonly required>
							</td>
						</tr>
						<tr>
							<th>부서</th>
							<td>
								<select name="depCd" id="depCd" style="margin-right:20px" required>
									<!-- ajax로 처리할 부분 -->
								
<!-- 									<option value="1">인사부</option>
									<option value="2">영업부</option>
									<option value="3">마케팅부</option>
									<option value="4">IT개발부</option>
									<option value="5">재무회계부</option> -->
								</select>
							</td>
							<th>직위</th>
							<td>
								<select name="posCd" id="posCd" required>
									<!-- ajax로 처리할 부분 -->
									
									<!-- <option value="1">대표</option> -->
									<!-- <option value="2">부장</option>
									<option value="3">과장</option>
									<option value="4">대리</option>
									<option value="5">사원</option>
									<option value="5">인턴</option> -->
									
								</select>
							</td>
						</tr>
						<tr>
							<th>입사일<span style="color:red;">&nbsp;*</span></th>
							<td>
								<input type="date" name="empEnrollDate" required>
							</td>
							<th>재직 상태</th>
							<td>
								재직
							</td>
						</tr>
						<tr>
							<th>내선번호</th>
							<td>
								<input type="phone" id="empExtension" name="empExtension">                                            
							</td>
							<th>휴대전화</th>
							<td>
								<input type="phone" id="empPhone" name="empPhone">
							</td>
						</tr>
					</table>
				</div>
				<div id="createBtn">
					<button type="submit" class="btn btn-primary" style="margin-right:5px;" disabled>저장</button>
					<button type="button" class="btn btn-secondary" onclick="location.href='javascript:history.back();'">취소</button>
				</div> <!-- button 영역 div 끝 -->
			</div>
	        </form>
	    </div>
	    

	    <script>

	    	$(function(){
			    <!-- 아이디 입력 시 이메일 주소 자동완성 -->
	    		$("#empId").keyup(function(){
	    			var id = $("#empId").val();
	    			var email = id + '@workpartner.com';
	    			
	    			$("#empEmail").val(email);
	    		});
	    		
	    		selectDepAndPos();	// 부서, 직위 조회용
	    		
	    	})
	    
	    <!-- 아이디 중복확인 -->
	    	$(function(){
	    		const $idInput = $("#enrollForm input[name=empId]");
	    		
	    		$idInput.keyup(function(){
	    			// console.log($idInput.val());
	    			
	    			// 아이디가 영문자+숫자만으로 입력되었는지 확인
	    			let regExp = /^[A-Za-z0-9]+$/;
	    			
	    			if(regExp.test( $idInput.val() )) {	// 제대로 입력한 경우 ==> 중복확인
	    				$.ajax({
	    					url:"idCheck.em",
	    					data:{checkId:$idInput.val()},
	    					success:function(result){
	    						console.log(result);
	    						
	    						if(result == "NNNNN"){
	    							$("#checkResult").show();
	    							$("#checkResult").css("color", "red").text("사용 중인 아이디입니다.");
	    							$("#enrollForm :submit").attr("disabled", true);
	    							
	    						}else {
	    							$("#checkResult").show();
	    							$("#checkResult").css("color", "green", "bold").text("사용 가능한 아이디입니다.");
	    							$("#enrollForm :submit").removeAttr("disabled");
	    						}
	    					},error:function(){
	    						console.log("id 중복 체크용 ajax 통신 실패")
	    					}
	    				})
	    				
	    			}else {	// 영문자+숫자 외 다른 문자를 입력한 경우
	    				$("#checkResult").show();
	    				$("#checkResult").css("color", "blue").text("영문, 숫자만 사용 가능합니다.");
	    				$("#enrollForm :submit").attr("disabled", true);
	    			}
	    		})
	    	})
	    	
	    	/* 부서, 직위 select option 값용 목록 조회 ajax */
	    	// 가져온 값에 대해서 append를 쓰면 된다.
	    	function selectDepAndPos(){
	    		$.ajax({
	    			url:"select.em",
	    			success:function(result){
	    				console.log("부서, 직위 조회용 ajax 통신 성공");
	    				
	    				let dep = result.d;
	    				let pos = result.p;
	    				console.log(dep);
	    				console.log(pos);
	    				
	    				for(let i=0; i<dep.length; i++) {
	    					$("#depCd").append('<option value="' + dep[i].departmentCode + '">' + dep[i].departmentName + '</option>');
	    				}
	    				
	    				for(let i=0; i<pos.length; i++){	// posCd = 1 == 대표, 대표로는 등록되지 않게 하기 위해 1부터 시작 ==> 일단 그냥 활성화
	    					$("#posCd").append('<option value="' + pos[i].position + '">' + pos[i].positionName + '</option>');
	    				}
	    				
	    				$("#posCd option[value='1']").attr('disabled', true);
	    				$("#posCd option[value='2']").attr('selected', true);
	    				
	    			},
	    			error:function(){
	    				console.log("부서, 직위 조회용 ajax 통신 실패");
	    			}
	    		})
	    	}

	    </script>
	    
	   
	</div>

</body>
</html>