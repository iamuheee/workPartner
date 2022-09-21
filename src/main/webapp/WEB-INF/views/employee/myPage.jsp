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

	#mypage-body {
		/* border:1px solid red; */
		width:95%;
		margin:auto;
		margin-top:35px;
		display: flex;
		flex-direction: row;
		justify-content: space-between;
	}

	#mypage-body {
		/* border:1px solid grey; */
	}

	#mypage-left{
		/* border:1px solid lightgrey; */
		width:26%;
		height:auto;
		box-shadow: 1px 1px 16px 0 rgb(0 0 0 / 16%);
		padding:20px 10px 0 10px;
	}

	#mypage-right{
		/* border: 1px solid red; */
		width:70%;
		height:70vh;
	}

	#profileTb{
		width:100%;
	}

	#profileImg{
        width:210px;
        height:210px;
        border:1px solid lightgray;
        border-radius: 50%;
    }

	#profileImg:hover {
        filter:brightness(0.5);
        transition: .35s;
        cursor: pointer;
    }

	.table-area{	/* 테이블들을 감싸는 div */
		width:90%;
		height:auto;
		border-radius: 12px;
		padding:5px 17px 16px 17px;
		box-shadow: 2px 2px 14px 0 rgb(0 0 0 / 8%);
		/* background-color: lightpink; */
	}

	.btn-area{
		width:90%;
		padding-top:20px;
		display: flex;
		justify-content: right;
	}

	.infoTb{
		width:100%;
		border-radius: 8px;
		
	}

	.infoTb * {
		/* border:1px solid black; */
		padding:7px;
		font-size: 16px;
	}

	.infoTb input {
        width: 400px;
        height:35px;
        border:1px solid rgba(0,0,0,.125);
		border-radius: 8px;
    }

	.modal-body input{
		width:250px;
		height:35px;
		border:1px solid rgba(0,0,0,.125);
		border-radius: 8px;
		padding-left:10px;
	}

	#lastModify {
		font-size:13px;
		color:gray;
	}
	
	#checkResult {
		font-size:14px;
	}

</style>
</head>
<body>

	<jsp:include page="../common/menubar.jsp" />
	
	<div id="mypage-outer">
	
	    <!-- 상단 메뉴 제목 영역 -->
	    <div id="mypage-header">
	        <h3>마이페이지</h3>
	    </div>
	    <hr>
	
	    <!-- 내 정보 관리 영역 -->
	    <div id="mypage-body">
			<!-- 왼쪽 프로필 사진 + 연차 조회 영역 -->
			<div id="mypage-left">
				<table id="profileTb">
					<tr align="center" style="height:300px">
						<th>
							<img id="profileImg" src="<c:out value='${ loginUser.empProfile }' default='resources/profile_images/defaultProfile.png'/>" onclick="$('#profileImgFile').click();">
	                    	<input type="file" id="profileImgFile" style="display:none;">
						</th>
					</tr>
					<tr align="center">
						<th><h3>${ loginUser.empName }</h3></th>
					</tr>
					<tr align="center">
						<th><h5>${ loginUser.depCd } / ${ loginUser.posCd }</h5><br></th>
					</tr>
					<tr align="center">
						<th>
							<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#changePwd">비밀번호 변경</button>
						</th>
					</tr>
					<tr align="center">
						<td id="lastModify"><br>마지막 정보 수정일 : ${ loginUser.empModifyDate }</td>
					</tr>
				</table>
			</div> <!-- 왼쪽 영역 끝-->
			
			<!-- 오른쪽 정보 영역 -->
			<div id="mypage-right">
				<!-- 기본 정보 테이블 영역 -->
				<div class="table-area" style="border: 1px solid rgba(0,0,0,.125);">
					<table class="infoTb">
						<tr>
							<th colspan="2" style="border-bottom: 1px solid lightgrey;">기본 정보</th>
						</tr>
						<tr>
							<th style="width:20%;">이름</th>
							<td>${ loginUser.empName }</td>
						</tr>
						<tr>
							<th>사번</th>
							<td>${ loginUser.empNo }</td>
						</tr>
						<tr>
							<th>아이디</th>
							<td>${ loginUser.empId }</td>
						</tr>
					</table>
				</div><!-- 기본 정보 끝 -->
				<br>
				<div class="table-area" style="border: 1px solid rgba(0,0,0,.125);">
					<table class="infoTb">
						<tr>
							<th colspan="2" style="border-bottom:1px solid lightgrey;">인사 정보</th>
						</tr>
						<tr>
							<th style="width:20%;">부서</th>
							<td>${ loginUser.depCd }</td>
						</tr>
						<tr>
							<th>직위</th>
							<td>${ loginUser.posCd }</td>
						</tr>
						<tr>
							<th>입사일</th>
							<td>${ loginUser.empEnrollDate }</td>
						</tr>
					</table>
				</div><!-- 인사 정보 끝 -->
				<br>
				<form action="updateMy.em" method="post">
					<input type="hidden" name="empId" value="${ loginUser.empId }">	<!-- 로그인한 회원의 id를 숨겨서 같이 보내줌 -->
				<div class="table-area" style="border: 1px solid rgba(0,0,0,.125);">
					<table class="infoTb">
						<tr>
							<th colspan="2" style="border-bottom:1px solid lightgrey;">연락처 정보</th>
						</tr>
						<tr>
							<th style="width:20%;">이메일</th>
							<td>${ loginUser.empEmail }</td>
						</tr>
						<tr>
							<th>외부 이메일</th>
							<td>
								<c:choose>
									<c:when test="${ empty loginUser.empExEmail }">	<!-- 외부이메일을 입력하지 않은 경우 -->
										<input type="email" class="updateInfo" name="empExEmail" placeholder="반드시 입력해 주세요. ID/PWD 찾기에 사용됩니다." required>
									</c:when>
									<c:otherwise>
										<input type="email" class="updateInfo" name="empExEmail" value="${ loginUser.empExEmail }" required>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr>
							<th>내선번호</th>
							<td><input type="phone" class="updateInfo " name="empPhone" value="${ loginUser.empExtension }"></td>
						</tr>
						<tr>
							<th>휴대전화</th>
							<td><input type="phone" class="updateInfo" name="empExtension" value="${ loginUser.empPhone }"></td>
						</tr>
					</table>
				</div><!-- 연락처 정보 끝 -->
				<div class="btn-area">
					<div>
						<button type="submit" class="btn btn-primary">저장</button>
						<button type="button" class="btn btn-secondary" onclick="location.href='javascript:history.back();'">취소</button>
					</div>
				</div> <!-- 버튼 영역 끝 -->
				</form>
				
			</div> <!-- 오른쪽 영역 끝 -->
		</div>

		<!-- 비밀번호 변경 버튼 클릭 시 뜨는 모달 -->
		<div class="modal fade" id="changePwd">
			<div class="modal-dialog">
				<div class="modal-content">
					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title"><i class="fa-solid fa-unlock"></i>&nbsp;&nbsp;비밀번호 변경</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button> 
					</div>

					<form action="updatePwd.em" method="post">
					<input type="hidden" name="empId" value="${ loginUser.empId }">	<!-- 로그인한 회원의 id를 숨겨서 같이 보내줌 -->
						<!-- Modal Body -->
						<div class="modal-body">
							<table>
								<tr>
									<th width="150px">기존 비밀번호</th>
									<td>
										<input type="password" id="empPwd" name="empPwd">
									</td>
								</tr>
								<tr>
									<th>새 비밀번호</th>
									<td>
										<input type="password" id="updatePwd" name="updatePwd">
									</td>
								</tr>
								<tr>
									<th>비밀번호 확인</th>
									<td>
										<input type="password" id="checkPwd" name="checkPwd"><br>
										<span id="checkResult"></span>
									</td>
								</tr>
							</table>
						</div>
						
						<!-- Modal footer -->
						<div class="modal-footer">
							<button type="submit" class="btn btn-primary" id="updatePwdBtn">변경</button>
							<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

		<script>
		$(function(){
			$("#profileImgFile").change(function(){
				
				// AJAX로 파일을 넘기고자 할 경우 
				// 가상의 form 요소를 만들고, 파일을 담은 후에 전달해야 함
				// ==> 자바스크립트에서 객체로 제공함
				// ==> FormData 객체
				
				let formData = new FormData();
				
				let uploadFile = this.files[0]	// == 현재 선택된 파일 객체(사용자가 선택한 첨부파일)
				console.log(uploadFile);
				
				formData.append("uploadFile", uploadFile);	
				formData.append("empId", "${ loginUser.empId }");	
				formData.append("originalFile", "${ loginUser.empProfile }");	// 기존 프로필이 없으면 빈 문자열이 넘어감 (자스에서 문자열 취급하려면 반드시 "")
		
				$.ajax({
					url:"uploadProfile.em",
					data:formData,
					contentType:false,	// multipart/form-data로 전송하기 위해 작성해야 하는 구문 ==> 작성하지 않으면 파일이 제대로 넘어가지 않는다.
					processData:false,
					type:"POST",
					success:function(){
						console.log("프로필 이미지 변경용 ajax 통신 성공");
						location.reload(); 
					},
					error:function(){
						console.log("프로필 이미지 변경용 ajax 통신 실패");
					}
				})
				})
			})
			
			/* 변경할 비밀번호의 유효성 검사 */
			$(function(){
				const $pwdInput = $("#changePwd input[name=updatePwd]");	// 입력한 새 비밀번호 input 요소
				const $checkInput = $("#changePwd input[name=checkPwd]");	// 입력한 확인용 비밀번호 input 요소
				
				$checkInput.keyup(function(){	// 비밀번호 확인 input에 keyup 발생할 때 실행할 함수
					
					if($pwdInput.val() == $checkInput.val()){	// 두 값이 일치하면
						$("#checkResult").show();
						$("#checkResult").css("color", "blue").text("비밀번호가 일치합니다.");
						$("#updatePwdBtn").removeAttr("disabled");
						
					}else {	// 두 값이 일치하지 않으면
						$("#checkResult").show();
						$("#checkResult").css("color", "red").text("비밀번호가 일치하지 않습니다.");
						$("#updatePwdBtn").attr("disabled", true);
						
						if(!$checkInput.val()){
							$("#checkResult").hide();
						}
					}
				})
			})
			
			
		</script>
	
	

</body>
</html>