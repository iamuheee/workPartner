<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Login - SB Admin</title>
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <script src="https://use.fontawesome.com/95b5cbecad.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

        <style>
            .title{
                font-size: larger;
                font-weight: bolder;
            }
            .pmenu-item{
                float:left;
                list-style: none;
                padding-left: 0px;
                margin-left:30px;
                padding-bottom: 15px;
                font-weight: bold;
            }
            .inner-area{
                padding:100px;
                padding-top:10px;
            }
            .setting-left{
                float:left;
                width:30%;
            }
            .setting-right{
                float:left;
                margin-left:150px;
                width:30%;
                word-break: break-all;
            }
            .btn-imp{
                line-height: 10px;
                background-color: lightgray;
                font-size: 15px;
            }
            ul{
                padding-left:10px;
            }
            .list-mem li{
                display:inline;
                list-style: none;
                margin-right:10px;
                font-size:12px;
            }
            .list-mem a{
                text-decoration: none;
                color:red;
                padding-left:5px;
            }
            .group-pmenu a{
                text-decoration: none;
                color:black;
            }
            .member{width:30%; float:left; text-align:center}
        </style>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    </head>
    <body>
    	
		<jsp:include page="../common/menubar.jsp" />
    	
        <br><br><br>
        <div class="container">
            <div class="title-area">
                <h1 style="font-weight:bolder;">프로젝트 생성</h1>
                <hr>
            </div>
			
            <form action="insert.pr" method="post" class="inner-area">
				<input type="hidden" name="empNo" value="${loginUser.empNo}">

                <span class="title">프로젝트 제목</span> <br><br>
                <input type="text" name="projTitle" class="form-control" required>
                <br><hr><br>
                
                <div class="setting-left">
                    <span class="title">시작일</span>
                    <input type="date" name="startDate" class="form-control" required>
                    <br>
                    <span class="title">진행 상태</span><br>
                    <select name="progress" class="form-control" required>
                    	<option value="준비" selected>준비</option>
                    	<option value="진행">진행</option>
                    	<option value="지연">지연</option>
                    	<option value="완료">완료</option>
                    </select>
                </div>
                <div class="setting-right">
                    <span class="title">마감일</span>
                    <input type="date" name="endDate" class="form-control" required>
                    <br>                
                </div>
                <br style="clear:both;"><br><hr>
                <div class="submit-area" align="right">
                    <button type="reset" class="btn btn-secondary">초기화</button>
                    <button type="submit" class="btn btn-success">등록</button>
                </div>
            </form>
        </div>
        
        <script>
	    	// 시작일 날짜로 오늘 이전 날짜 불가능하도록 만들기
	    	let year = new Date().getFullYear();
	    	let month = ('0' + (new Date().getMonth() + 1)).slice(-2);
	    	let date = ('0' + new Date().getDate()).slice(-2);
	   		$("input[name=startDate]").attr("min", year + '-' + month + '-' + date );
	   		$("input[name=endDate]").attr("min", year + '-' + month + '-' + date );
	   		
	    	// 마감일 날짜로 시작일 이전 날짜 불가능하도록 만들기
	    	$("input[name=startDate]").change(function(){
	    		$("input[name=endDate]").attr("min", $(this).val());
	    	})
    	
        </script>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
