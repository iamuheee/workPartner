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

<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- 부트스트랩 4.6 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>



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
   
   .result{
   	display:flex;
   	justify-content:center;
   	font-size:18px;
   	margin-top:20px;
   	margin-bottom:20px;
   	
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
                                    <h2 class="text-center my-4">아이디를 잊으셨나요?</h2>
                                </div>
                                <div class="card-body">
	                                <div class="form-floating mb-3">
	                                    <input class="form-control" id="inputEmpName type="text" placeholder="이름" name="empName" />
	                                    <label for="inputEmpName">이름</label>
	                                </div>
	                                <div class="form-floating mb-3">
	                                    <input class="form-control" id="inputEmpNo" type="text" placeholder="사번" name="empNo" />
	                                    <label for="inputEmpNo">사번</label>
	                                </div>
	                                <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
	                                    <a class="btn btn-primary" id="selectIdBtn" onclick="findId();">아이디 찾기</a>
	                                </div>
	                                <hr style="margin-top:20px;">
	                                <div class="d-flex align-items-center justify-content-center mt-4 mb-0" id="findIdPwd">
	                                    <a class="medium" href="loginForm.em"><i class="fas fa-caret-left"></i>&nbsp;이전으로</a>
	                                </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>

	<div class="modal fade" id="findIdMd" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog .modal-sm">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title"><i class="fas fa-search"></i>&nbsp;아이디 찾기</h5>
	        <button type="button" class="close" aria-label="Close">
	          <span aria-hidden="true" onclick="closeMd();">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <div class="result">
	        <!-- ajax로 받는 부분 -->
	        </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" onclick="closeMd();">확인</button>
	      </div>
	    </div>
	  </div>
	</div>
	
    <script>
    
     function findId(){
   	 	$("#findIdMd").modal('show');
   	 	
   	 	if( $("input[name=empName]").val().trim().length != 0 && $("input[name=empNo]").val().trim().length != 0) {	// 제대로 임력됐을 때만 실행
   	 	
	    	$.ajax({
	    		url:"findId.em",
	    		type:"post",
	    		data:{
	    			empName:$('input[name=empName]').val(),
	    			empNo:$('input[name=empNo]').val()
	    		},
	    		success:function(e) {
	    			console.log("아이디 찾기용 ajax 통신 성공");
	    			console.log(e);
	    			
	    			if(!e) {	// 실패
	    				$(".result").html("일치하는 회원 정보가 없습니다.");
	    			}else {
	    				$(".result").html(e.empName + "님의 아이디는<font color='#3568c3'>&nbsp;" + e.empId + "</font>&nbsp;입니다.");
	   				}
	    			
	    		},
	    		error:function(){
	    			console.log("아이디 찾기용 ajax 통신 실패");
	    		}
	    		
	    	})
	    	
   	 	}else{
   	 		$(".result").html("이름과 사번을 입력해 주세요.");
   	 	}
    } 
     
     function closeMd(){
    	 $("#findIdMd").modal('hide');
     }
    
    </script>
		    

</body>
</html>