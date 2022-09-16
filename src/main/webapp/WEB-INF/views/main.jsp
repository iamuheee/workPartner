<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 템플릿-->
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="resources/css/template.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>

<!-- 구글 아이콘 -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<!-- 부트스트랩 4.6 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- 
<!-- Google Noto Sans Kr 폰트
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
-->

<!-- Google Raleway Sans 폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Raleway:wght@600&display=swap" rel="stylesheet">

<style>

 .card-header>h1 {
 	font-family:'Raleway';
 } 
 
/*  * {
	font-family: 'Noto Sans KR', sans-serif;
} */

 #layoutAuthentication {
     background-color: #f1f1f1;
 }

 .btn-primary {
     background-color: #0442AF;
 }

 .card-header {
     background-color: #0442AF;
     color:#fff;
 }
 .col-lg-5 {
     width:500px;
 }
 #loginBtn {
     width:100%;
     height:50px;
     margin:auto;
     font-size: 20px;
     display: flex;
     align-items: center;
     justify-content: center;
 }

 #findIdPwd a {
     text-decoration: none;
     color:black;
 }

</style>
</head>
<body class="bg-primary">
    
    <div id="layoutAuthentication">
        <div id="layoutAuthentication_content">
            <main>
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-5">
                            <div class="card shadow-lg border-0 rounded-lg mt-5">
                                <div class="card-header">
                                	<h5 class="text-center font-weight-light my-4">언택트 시대, 당신의 강력한 업무 파트너</h5>
                                	<h1 class="text-center font-weight-light my-4">Work Partner!</h1></div>
                                <div class="card-body">
                                    <form action="login.em" method="post" id="loginForm">
                                        <div class="form-floating mb-3">
                                            <input class="form-control" id="inputId" type="text" placeholder="ID" name="empId" required />
                                            <label for="inputId">ID</label>
                                        </div>
                                        <div class="form-floating mb-3">
                                            <input class="form-control" id="inputPassword" type="password" placeholder="Password" name="empPwd" required />
                                            <label for="inputPassword">Password</label>
                                        </div>
                                        <div class="form-check mb-3">
                                            <input class="form-check-input" id="inputRememberLogin" type="checkbox" value="" />
                                            <label class="form-check-label" for="inputRememberLogin">로그인 상태 유지</label>
                                        </div>
                                        <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                        	<button type="submit" class="btn btn-primary" id="loginBtn">Login</button>
                                        </div>
                                        <hr style="margin-top:20px;">
                                        <div class="d-flex align-items-center justify-content-center mt-4 mb-0" id="findIdPwd">
                                            <a class="medium" href="idSelectForm.em">아이디 찾기</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                                            <a class="medium" href="pwdUpdateForm.em">임시 비밀번호 발급</a>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>
</body>

</html>