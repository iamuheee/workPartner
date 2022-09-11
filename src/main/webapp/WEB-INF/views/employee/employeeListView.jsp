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
	    /* border:1px solid blue;  */
	    width:100%;
	    height:100vh;	/* 스크롤 안 생기게 하려면 100%로 수정 */
   	    margin:auto;
	    padding:10px;
	    position:relative;
	}
	
	#empListArea {
		width:100%;
		/* border:1px solid red; */
	}
	
	#empList {
	    width:100%;
	}
	
	#insertEmp input{
	    width:100px;
	}
	
	#insertEmp select {
	    width: 50px;
	}
	
	#insertEmp input, select {
	    height:25px;
	    border: 1px solid #b7b9cc;
	}
	
	#searchArea #condition, #keyword {
	    border:1px solid #b7b9cc;
	}
	
	#searchArea {
	    display: flex;
	    justify-content: flex-end;
	    margin-bottom:20px;
	}
	
	#pagingArea {
	    width: fit-content;
	    margin: auto;
	    margin-top:30px;
	}
	
	.page-link {
	    color:#0442AF;
	}
	
	.empIdArea {
	    cursor: pointer;
	}
	
	.modal-body #empInfo {
	    margin:auto;
	}
	
	#empInfo {
	    width:100%;
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
	    height:40px;
	    padding-left:10px;
	    border:1px solid #b7b9cc;
	}
	
	#empInfo select {
	    width: 200px;
	    height:40px;
	    border:1px solid #b7b9cc;
	    padding-left:10px;
	}
		
	#profileImg{
	    width:180px;
	    height:180px;
	    border:1px solid #b7b9cc;
	    border-radius: 50%;
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
	        <h3>사용자 조회 · 수정</h3>
	    </div>
	    <hr>
	    <!-- 검색 영역 -->
	    <form id="searchForm" action="직원검색요청을받아줄url" method="get">
	        <div id="searchArea">
	            <select id="condition" name="condition" style="margin-right:10px;height:30px;">
	                <option value="empNo">사번</option>
	                <option value="empName">이름</option>
	                <option value="empId">아이디</option>
	            </select>
	            <input type="text" id="keyword" name="keyword" style="height:30px;margin-right:3px">
	            <button type="submit" class="btn btn-primary btn-sm"><i class="fa-solid fa-magnifying-glass"></i></button>
	        </div>
	    </form>
	    <!-- 사용자(구성원) 계정 및 정보 목록 -->
	    <div id="empListArea">
	        <table id="empList" class="table table-hover">
	            <thead>
	                <tr>
	                    <th scope="col">사번</th>
	                    <th scope="col">이름<span style="color:red;">&nbsp;*</span></th>
	                    <th scope="col">아이디<span style="color:red;">&nbsp;*</span></th>
	                    <th scope="col">비밀번호<span style="color:red;">&nbsp;*</span></th>
	                    <th scope="col">사내전화</th>
	                    <th scope="col">휴대전화</th>
	                    <th scope="col">부서</th>
	                    <th scope="col">직위</th>
	                    <th scope="col">재직상태</th>
	                    <th scope="col">계정상태</th>
	                    <th scope="col">계정관리</th>
	                </tr>
	            </thead>
	            <tbody>
	                <tr id="insertEmp">
	                    <td align="center">
	                        -
	                    </td>
	                    <th>
	                        <input type="text" id="empName" name="empName" required placeholder="이름">
	                    </th>
	                    <td>
	                        <input type="text" id="empId" name="empId" required placeholder="아이디">
	                    </td>
	                    <td>
	                        <input type="password" id="empPwd" name="empPwd" required placeholder="비밀번호">
	                    </td>
	                    <td>
	                        <input type="phone" id="empExtension" name="empExtension">
	                    </td>
	                    <td>
	                        <input type="phone" id="empPhone" name="empPhone">
	                    </td>
	                    <td>
	                        <select name="depCd" class="depCd" style="margin-right:20px; width:70px" required>
	                            <option value="1">인사부</option>
                                <option value="2">영업부</option>
                                <option value="3">마케팅부</option>
                                <option value="4">IT개발부</option>
                                <option value="5">재무회계부</option>
	                        </select>
	                    </td>
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
	                    <td>
	                        <select name="empStatus" id="empStatus" required>
	                            <option value="Y">재직</option>
	                            <option value="N">퇴사</option>
	                        </select>
	                    </td>
	                    <td>
	                        <button type="submit" class="btn btn-primary btn-sm" style="margin-right:5px;" onclick="신규사용자추가">저장</button>
	                    </td>
	                    <td>
	                        <button type="reset" class="btn btn-secondary btn-sm">취소</button>
	                    </td>
	                </tr>
	                <tr>
	                    <td>2201003</td>
	                    <td>유재석</td>
	                    <td>
	                        <a data-toggle="modal" data-target="#updateEmp" class="empIdArea">jsyu</a>
	                    </td>
	                    <td>****</td>
	                    <td>1234-1234</td>
	                    <td>010-1234-1234</td>
	                    <td>영업부</td>
	                    <td>부장</td>
	                    <td>재직</td>
	                    <td>정상</td>
	                    <td></td>
	                </tr>
	                <tr>
	                    <td>2201002</td>
	                    <td>이지은</td>
	                    <td>jelee</td>
	                    <td>****</td>
	                    <td>1234-1234</td>
	                    <td>010-1234-1234</td>
	                    <td>인사부</td>
	                    <td>사원</td>
	                    <td>퇴사</td>
	                    <td>휴면</td>
	                    <td><button type="button" class="btn btn-warning btn-sm" onclick="계정상태변경">복구</td>
	                </tr>
	                <tr>
	                    <td>2201001</td>
	                    <td>박명수</td>
	                    <td>mspark</td>
	                    <td>****</td>
	                    <td>1234-1234</td>
	                    <td>010-1234-1234</td>
	                    <td>영업부</td>
	                    <td>인턴</td>
	                    <td>퇴사</td>
	                    <td>정상</td>
	                    <td><button type="button" class="btn btn-danger btn-sm" onclick="계정상태변경">정지</td>
	                </tr>
	                
	              </tbody>
	        </table>
	    </div>

        <!-- 페이징 처리 -->
        <div id="pagingArea">
            <nav aria-label="Page navigation example">
                <ul class="pagination">
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Previous">
                    <span aria-hidden="true">‹</span>
                    </a>
                </li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Next">
                    <span aria-hidden="true">›</span>
                    </a>
                </li>
                </ul>
            </nav>
        </div>
	</div>


<!-- 아이디 클릭 시 뜨는 모달 ==> 사용자 정보 수정 -->
    <div class="modal fade" id="updateEmp">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">사용자 정보 - 사용자 이름</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button> 
                </div>

                <form action="사용자정보수정요청받아주는url" method="post">
                    <!-- Modal Body -->
                    <div class="modal-body">
                        <table id="empInfo">
                            <tr>
                                <th width="150px">이름</th>
                                <td width="300px">이름 자리</td>
                                <th width="150px">프로필 사진</th>
                                <td rowspan="3">
                                    <div id="profile-box">
                                        <img id="profileImg" src="${pageContext.request.contextPath}/resources/profile_images/defaultProfile.png" onclick="$('#profileImgFile').click();"><br>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>사번</th>
                                <td>사번 자리</td>
                            </tr>
                            <tr>
                                <th>아이디</th>
                                <td>아이디 자리</td>
                            </tr>
                            <tr>
                                <th>이메일</th>
                                <td>이메일 자리</td>
                                <th>재직 상태</th>
                                <td>
                                    <select name="empStatus" id="empStatus" required>
                                        <option value="Y">재직</option>
                                        <option value="N">퇴사</option>
                                    </select>
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
                                <td>입사일 자리</td>
                                <th>퇴사일</th>
                                <td>
                                    <input type="date" name="empRetiredate" required>
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
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary" style="margin-right:5px;">수정</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>