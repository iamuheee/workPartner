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
/*         border:1px solid blue; */
        width:100%;
        height:100%;
        padding:10px;
        margin:auto;
        position:relative;
        
    }

    /*
    #mypage-body * {
        /* border:1px solid pink; 
        width:90%;
        margin:auto;
        font-size:16px;
    }
    */

    #myInfo-top, #myInfo-mid, #myInfo-bottom {
        width:90%;
        margin:auto;
        font-size:16px;
        margin-bottom: 30px;
    }

    #myInfo-top {
        display:flex;
        justify-content: space-between;
    }

    #basicInfoArea {
        width:80%;
    }

    #basicInfo{
        width:100%;
        height:auto;
    }

    #basicInfo * {
        padding:10px;
    }

    #profileArea {
        width:300px;
        margin-right:40px;
        height:auto;
        padding:7px;
        display:flex;
        justify-content: center;
        align-items: center;
    }

    #profileImg{
        width:200px;
        height:200px;
        border:1px solid lightgray;
        border-radius: 50%;
    }

    #updateInfoBtn {
        width:100%;
        display: flex;
    }

    #updateInfoBtn * {
        width:60px;
        margin-right: 10px;
    }

    .updateImg:hover {
        filter:brightness(0.5);
        transition: .35s;
        cursor: pointer;
    }

    #changePwd table {
        height:150px;
    }

    #changePwd table input {
        width:250px;
        height:40px;
        border:1px solid #b7b9cc;
        padding-left:10px;
    }

    #basicInfoArea, #profileArea, #workInfoArea, #contactInfoArea {
        border-radius: 8px;
        box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px;
    }

    .tableTitle {
        height:30px;
        font-size:16px;
        font-weight: bold;
        background-color:#f1f1f1;
        border-top-left-radius: 8px;
        border-top-right-radius: 8px;
    }

    #basicInfo th {
        width:20%;
        height:50px;
    }

    #basicInfo *, #workInfo *, #contactInfo * {
        padding-left:10px;
    }

    #workInfo, #contactInfo {
        table-layout: auto;
        width:100%;
        height:165px;
        table-layout: fixed;
    }
    
    #workInfo th, #contactInfo th{
        height:50px;
    }

    #contactInfo input {
        width: 200px;
        height:40px;
        border:1px solid #b7b9cc;
    }
    
</style>
</head>
<body>

	<jsp:include page="../common/menubar.jsp" />
	
	<div id="mypage-outer">
	
	    <!-- 상단 메뉴 제목 영역 -->
	    <div id="mypage-header">
	        <h3>내 정보 관리</h3>
	    </div>
	    <hr>
	
	    <!-- 내 정보 관리 영역 -->
	    <div id="mypage-body">
	        <div id="myInfo-top">
	            <!-- 프로필 사진 -->
	            <div id="profileArea" align="center">
	                <!-- 프로필 이미지 변경 -->
	                <div class="updateImg">
	                    <img id="profileImg" src="<c:out value='${ loginUser.empProfile }' default='resources/profile_images/defaultProfile.png'/>" onclick="$('#profileImgFile').click();">
	                    <input type="file" id="profileImgFile" style="display:none;">
	                </div>
	                <br>
	            </div>
	
	            <!-- 기본 정보 -->
	            <div id="basicInfoArea">
	                <table id="basicInfo">
	                    <tr>
	                        <td colspan="2" class="tableTitle">기본 정보</td>
	                    <tr>
	                        <th width="30%">이름</th>
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
	                    <tr>
	                        <th>비밀번호</th>
	                        <td>
	                            <button type="button" id="changePwdBtn" class="btn btn-primary" data-toggle="modal" data-target="#changePwd" style="width:35%">
	                            비밀번호 변경
	                            </button>
	                        </td>
	                    </tr>
	                </table>
	            </div>
	
	            <!-- 비밀번호 변경 버튼 클릭 시 뜨는 모달 -->
	            <div class="modal fade" id="changePwd">
	                <div class="modal-dialog">
	                    <div class="modal-content">
	                        <!-- Modal Header -->
	                        <div class="modal-header">
	                            <h4 class="modal-title"><span class="material-symbols-outlined">key</span>&nbsp;비밀번호 변경</h4>
	                            <button type="button" class="close" data-dismiss="modal">&times;</button> 
	                        </div>
	
	                        <form action="비밀번호변경요청받아주는서버" method="post">
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
	                                            <input type="password" id="checkPwd" name="checkPwd">
	                                        </td>
	                                    </tr>
	                                </table>
	                            </div>
	                            
	                            <!-- Modal footer -->
	                            <div class="modal-footer">
	                                <button type="submit" class="btn btn-primary">변경</button>
	                                <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
	                            </div>
	                        </form>
	                    </div>
	                </div>
	            </div>
	        </div>
	
	        <!-- 인사정보 영역 -->
	        <div id="myInfo-mid">
	            <div id="workInfoArea">
	                <table id="workInfo">
	                    <tr>
	                        <td colspan="4" class="tableTitle">인사 정보</td>
	                    <tr>
	                        <th>부서</th>
	                        <td>${ loginUser.depCd }</td>
	                        <th>직위</th>
	                        <td>${ loginUser.posCd }</td>
	                    </tr>
	                    <tr>
	                        <th>입사일</th>
	                        <td>${ loginUser.empEnrollDate }</td>
	                        <th>최종 부서 이동일</th>
	                        <td></td>
	                    </tr>
	                </table>
	            </div>
	        </div>
	
	        <!-- 연락처 정보 영역 -->
	        <div id="myInfo-bottom">
	            <form action="개인정보변경요청받아주는서버" method="post">
	                <div>
	                    <div id="contactInfoArea">
	                        <table id="contactInfo">
	                            <tr>
	                                <td colspan="4" class="tableTitle">연락처 정보</td>
	                            </tr>
	                            <tr>
	                                <th>이메일</th>
	                                <td>${ loginUser.empEmail }</td>
	                                <th>외부 이메일</th>
	                                <td>
	                                    <input type="email" class="updateInfo" name="empEmail" placeholder="${ loginUser.empExEmail }" required>
	                                </td>
	                            </tr>
	                            <tr>
	                                <th style="width:100px">내선번호</th>
	                                <td>
	                                    <input type="phone" class="updateInfo " name="empPhone" placeholder="${ loginUser.empExtension }" required>
	                                </td>
	                                <th>전화번호</th>
	                                <td>
	                                    <input type="phone" class="updateInfo" name="empExtension" placeholder="${ loginUser.empPhone }" required>
	                                </td>
	                            </tr>
	                        </table>
	                        </div>
	                        <br>
	                        <!-- 저장 버튼 -->
	                    <div id="updateInfoBtn">
	                        <button type="submit" class="btn btn-primary">저장</button>
	                        <button type="button" class="btn btn-secondary" onclick="location.href='javascript:history.back();'">취소</button>
	                    </div>
	                </div>
	            </form>
	        </div>
	    </div>
	</div>

</body>
</html>