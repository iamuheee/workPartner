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
            .inner-area{
                padding:10px;
            }
            .project-card{
                display: inline-block;
                width: 200px;
                height: 100px;
                border: 1px solid lightgray;
                border-left: 10px solid blue;
                border-radius: 5px;
                margin-right:40px;
                padding-left:10px;
                margin-bottom: 20px;
            }
            .project-title{
                font-size: 15px;
                font-weight: bold;
            }
            .project-card:hover{
                cursor:pointer;
            }
        </style>
    
    </head>
    <body>
    
		<jsp:include page="../common/menubar.jsp" />
    	
        <br><br><br>
        <div class="container">
            <div class="title-area">
                <h1 style="font-weight:bolder;">참여중인 프로젝트</h1>
                <hr>
            </div>
            <div class="inner-area">
                <div class="project-card" onclick="updateProj(${프로젝트번호});">
                    <button onclick="매핑값" class="btn btn-sm" style="margin-left:80%;">
                        <i class="fa fa-cog" aria-hidden="true"></i>
                    </button>
                    <br>
                    <span class="project-title">프로젝트명</span><br>
                    <input type="hidden" value="${ 프로젝트 우선순위 }" id="priority">
                    <i class="fa fa-sm fa-user"></i> <span style="font-size:12px;">(4)</span>
                </div>
            </div>
        </div>

        <script>
            // 프로젝트 관리 버튼 (톱니바퀴) 클릭 시 해당 프로젝트의 관리 페이지로 가는 버튼
            function updateProj(projNo){
                // no라는 key-value쌍을 전달하면서 update.pr 라는 매핑값으로 요청 
                location.href = "update.pr?no=" + projNo;
            }

            // 프로젝트 진행 상황에 따라 색깔이 바뀌도록하는 함수
            $(function(){
                $(".project-card").each(function(){
                    switch( $(this).children("#priority").val() ){
                        case 1 : $(this).css("border-left", "10px solid red");
                        case 2 : $(this).css("border-left", "10px solid orange");
                        case 3 : $(this).css("border-left", "10px solid blue");
                        case 4 : $(this).css("border-left", "10px solid lightgray");
                    }
                })
            })
        </script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
