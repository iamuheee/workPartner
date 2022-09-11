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
        height:100%;
        padding:10px;
        margin:auto;
        position:relative;
    }

    #empInfo {
        width: 100%;
    }
    
    #empInfo * {
        /* border: 1px solid red; */
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

</style>
</head>
<body>

	<jsp:include page="../common/menubar.jsp" />
	
	<div id="mypage-outer">
	    <!-- 상단 메뉴 제목 영역 -->
	    <div id="mypage-header">
	        <h3>사용자 등록</h3>
	    </div>
	    <hr>
	    <!-- 내 정보 관리 영역 -->
	    <div id="mypage-body">
	        <form action="사용자등록요청받을서버" method="post" id="insertForm">
	           <table id="empInfo">
	                <tr>
	                    <th width="150px">이름<span style="color:red;">&nbsp;*</span></th>
	                    <td width="300px">
	                        <input type="text" id="empName" name="empName" required>
	                    </td>
	                    <th width="150px">프로필 사진</th>
	                    <td rowspan="4">
	                        <div id="profile-box">
	                            <img id="profileImg" src="${pageContext.request.contextPath}/resources/profile_images/defaultProfile.png" onclick="$('#profileImgFile').click();"><br>
	                            <button type="button" class="btn btn-primary" onclick="$('#profileImgFile').click();">프로필 사진 등록</button>
	                            <input type="file" id="profileImgFile" name="empProfile" style="display:none;">
	                        </div>
	                    </td>
	                </tr>
	                <tr>
	                    <th>아이디<span style="color:red;">&nbsp;*</span></th>
	                    <td>
	                        <input type="text" id="empId" name="empId" required>
	                    </td>
	                </tr>
	                <tr>
	                    <th>비밀번호<span style="color:red;">&nbsp;*</span></th>
	                    <td>
	                        <!-- 아이디와 동일하게 설정 (placeholder로 지시하거나 아이디와 동일하게 입력되도록 하기) -->
	                        <input type="password" id="empPwd" name="empPwd" required>
	                    </td>
	                </tr>
	                <tr>
	                    <th>이메일<span style="color:red;">&nbsp;*</span></th>
	                    <td>
	                        <input type="email" id="empEmail" name="empEmail" value="아이디@workpartner.com" readonly required>
	                    </td>
	                </tr>
	                <tr>
	                    <th>부서</th>
	                    <td>
	                        <select name="depCd" class="depCd" style="margin-right:20px" required>
	                            <option value="1">인사부</option>
                                <option value="2">영업부</option>
                                <option value="3">마케팅부</option>
                                <option value="4">IT개발부</option>
                                <option value="5">재무회계부</option>
	                        </select>
	                    </td>
	                    <th>직위</th>
	                    <td>
	                        <select name="posCd" id="posCd" required>
	                            <!-- <option value="1">대표</option> -->
                                <option value="2">부장</option>
                                <option value="3">과장</option>
                                <option value="4">대리</option>
                                <option value="5">사원</option>
                                <option value="5">인턴</option>
	                        </select>
	                    </td>
	                </tr>
	                <tr>
	                    <th>입사일</th>
	                    <td>
	                        <input type="date" name="empEnrolldate" required>
	                    </td>
	                    <th>재직 상태</th>
	                    <td>
	                        <select name="empStatus" id="empStatus" required>
	                            <option value="Y">재직</option>
	                            <option value="N">퇴사</option>
	                        </select>
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
	                <tr>
	                    <th colspan="4" style="height:100px">
	                        <button type="submit" class="btn btn-primary" style="margin-right:5px;">저장</button>
	                        <button type="button" class="btn btn-secondary" onclick="location.href='javascript:history.back();'">취소</button>
	                    </th>
	                </tr>
	            </table>
	        </form>
	    </div>
	</div>

</body>
</html>