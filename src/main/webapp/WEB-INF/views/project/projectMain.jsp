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
        <title>WorkPartner!</title>
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <script src="https://use.fontawesome.com/95b5cbecad.js"></script>

        <style>
            a{
                text-decoration: none;
            }
            .title{
                font-size: larger;
                font-weight: bolder;
            }
            .inner-area{
                padding:10px;
            }
            .project-card{
                display: inline-block;
                width: 150px;
                height: 100px;
                border: 1px solid lightgray;
                border-left: 10px solid blue;
                border-radius: 5px;
                margin-right:20px;
                padding-left:10px;

            }
            .project-title{
                font-size: 13px;
                font-weight: bold;
            }
            .left{
                width:70%;
                float: left;
            }
            .right{
                float:right;
                width:27%;
                height:500px;
            }
            .btn-area>button{
                width:50px;
                height:20px;
                font-size: 10px;
                line-height: 10px;
            }
        </style>
    
    </head>
    <body>
    	
    	<jsp:include page="../common/menubar.jsp" />
    	    
        <br><br><br>
        <div class="container">
            <div class="left">
                <div class="left-top card shadow-sm border-1 rounded-lg">
                    <div class="card-body">
                        <div class="title-area">
                            <span class="title">참여중인 프로젝트</span>
                            <a href="" style="float:right; ">더보기 +</a>
                            <hr>
                        </div>
                        <div class="inner-area">
                            <div class="project-card">
                                <br>
                                <span class="project-title">프로젝트명</span><br>
                                <input type="hidden" value="<%-- ${ 프로젝트 우선순위 } --%>" id="priority">
                                <i class="fa fa-sm fa-user"></i> <span style="font-size:12px;">(4)</span>
                            </div>
                            <div class="project-card">
                                <br>
                                <span class="project-title">프로젝트명</span><br>
                                <input type="hidden" value="<%-- ${ 프로젝트 우선순위 } --%>" id="priority">
                                <i class="fa fa-sm fa-user"></i> <span style="font-size:12px;">(4)</span>
                            </div>
                        </div>
                    </div>
                </div>

                <script>
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

                <br>                
                <div class="left-bottom card shadow-sm border-1 rounded-lg">
                    <div class="card-body">
                        <div class="title-area">
                            <span class="title">월간 캘린더</span>
                            <a href="" style="float:right; ">더보기 +</a>
                            <hr>
                        </div>
                        <div class="inner-area">
                            <span>달력 들어갈 자리 <br><br><br><br><br><br><br><br><br><br></span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="right card shadow-sm border-1 rounded-lg"><div class="card-body">
                <div class="title-area">
                    <span class="title">받은 프로젝트 초대</span>
                    <a href="" style="float:right; ">더보기 +</a>
                    <hr>
                </div>
                <div class="inner-area">
                    <div class="invitation">
                        <span style="font-weight:bold; line-height: 30px;">프로젝트명</span>
                        <span style="font-size:10px;">일반 멤버</span>
                        <div class="btn-area" align="right" style="float:right">
                            <button class="btn btn-sm btn-primary">수락</button>
                            <button class="btn btn-sm btn-secondary">거절</button>
                        </div>
                    </div>
                    <div class="invitation">
                        <span style="font-weight:bold; line-height: 30px;">프로젝트명</span>
                        <span style="font-size:10px;">관리자</span>
                        <div class="btn-area" align="right" style="float:right">
                            <button class="btn btn-sm btn-primary">수락</button>
                            <button class="btn btn-sm btn-secondary">거절</button>
                        </div>
                    </div>
                </div>
            </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
