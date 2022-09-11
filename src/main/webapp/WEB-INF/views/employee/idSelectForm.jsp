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


<!-- Google Noto Sans Kr 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">


<style>

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
    #selectIdBtn {
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
                                    <h2 class="text-center font-weight-bold my-4">아이디를 잊으셨나요?</h2>
                                    <h6 align="center">등록하신 외부 이메일로 아이디가 발송됩니다.</h6>
                                </div>
                                <div class="card-body">
                                    <form method="post" id="selectIdForm">
                                        <div class="form-floating mb-3">
                                            <input class="form-control" id="inputEmpName type="text" placeholder="이름" name="empName" />
                                            <label for="inputEmpName">이름</label>
                                        </div>
                                        <div class="form-floating mb-3">
                                            <input class="form-control" id="inputEmpNo" type="text" placeholder="사번" name="empNo" />
                                            <label for="inputEmpNo">사번</label>
                                        </div>
                                        <!-- 이메일 일치 여부 확인 필요 -->
                                        <div class="form-floating mb-3">
                                            <input class="form-control" id="inputEmail" type="email" placeholder="이메일" name="empEmail" />
                                            <label for="inputEmail">Email</label>
                                            <label id="checkResult" style="font-size: 0.8em; display:none;"></label>
                                        </div>
                                        <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                            <a class="btn btn-primary" id="selectIdBtn" href="아이디찾기url">아이디 찾기</a>
                                        </div>
                                        <hr style="margin-top:20px;">
                                        <div class="d-flex align-items-center justify-content-center mt-4 mb-0" id="findIdPwd">
                                            <a class="medium" href="loginForm.em"><i class="fas fa-caret-left"></i>&nbsp;이전으로</a>
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

    <!-- 이메일 유효성 검사 -->
    <!--
    <script>
        $(function(){
            // 이메일 입력하는 input 요소 객체
            const $inputEmail = $("#selectIdForm input[name=empEmail]");
            
            $inputEmail.keyup(function(){
                
                //console.log($inputEmail.val());
                if($inputEmail.val() ) {	// 유효한 이메일 형식을 갖췄을 경우 ==> 이때만 ajax 요청해서 중복체크 되도록 함
                    
                    $.ajax({
                        
                    })
                    
                }else {	유효한 이메일이 아닐 경우 ==> 버튼 비활성화
                    $("#checkResult").hide();
                    $("#selectIdBtn").attr("disabled", true);
                }
            })
        })
    </script>
    -->

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
</body>
</html>