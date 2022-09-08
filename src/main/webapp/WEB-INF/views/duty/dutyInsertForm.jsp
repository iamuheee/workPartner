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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <style>
        .title{
            font-size: larger;
            font-weight: bolder;
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
       		border:none;
       		border-radius:5px;
       		width:50px;
       		height:20px;
            line-height: 10px;
            background-color: lightgray;
            font-size: 12px;
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
    </style>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>
<body>
	
	<jsp:include page="../common/menubar.jsp" />

    <br><br><br>
    <div class="container">
        <div class="title-area">
            <h1 style="font-weight:bolder;">개인 업무 등록</h1>
            <hr>
        </div>
        <form action="" method="post" class="inner-area">
            <span class="title">업무 제목</span> <br><br>
            <!-- 아래의 input:text의 value에 기존 제목 넣기 -->
            <input type="text" name="projTitle" class="form-control">
            <br><br>
            <div class="setting-left">
                <span class="title">상태</span>
                <div class="button-area" style="margin-top:10px;">
                    <button class="btn-imp">요청</button>
                    <button class="btn-imp">진행</button>
                    <button class="btn-imp">지연</button>
                    <button class="btn-imp">완료</button>
                    <input type="hidden" name="importance" value="">
                </div>
            </div>
            <div class="setting-right">
                <span class="title">우선 순위</span><br>
                <div class="button-area" style="margin-top:10px;">
                    <button class="btn-imp">긴급</button>
                    <button class="btn-imp">중요</button>
                    <button class="btn-imp">보통</button>
                    <button class="btn-imp">낮음</button>
                    <input type="hidden" name="importance" value="">
                </div>
            </div>
            <br style="clear:both;"><br>
            <div class="setting-left">
                <span class="title">담당자</span><br>
                <input type="text" name="" class="form-control" placeholder="이름입력">
                <ul class="list-mem">
                    <li>
                        <span>김개똥</span>
                        <a href="">x</a>
                    </li>
                </ul>
            </div>
            <div class="setting-right">
                <span class="title" style="margin-bottom:20px;">캘린더 등록</span><div style="height:5px;"></div>
                <label for="addCal">이 업무를 캘린더에 추가합니다</label> <input type="checkbox" name="" id="addCal">
            </div>
            <br style="clear:both;"><br>
            <div class="content">
                <span class="title">업무 내용</span><br><br>
                <textarea name="" class="form-control" rows="10" style="height:400px; width:100%; overflow:auto; resize:none;"></textarea>
            </div>
            <br><br>
            <div class="setting-left">
                <span class="title">시작일</span>
                <input type="date" name="" class="form-control"><br>

                <span class="title">파일 첨부</span>
                <input type="file" name="" class="form-control">
            </div>
            <div class="setting-right">
                <span class="title">마감일</span>
                <input type="date" name="" class="form-control"><br>
                
            </div>
            <br style="clear:both;"><br><hr>
            <div class="submit-area" align="right">
                <button class="btn btn-secondary">이전</button>
                <button class="btn btn-success">등록</button>
            </div>
        </form>
    </div>

    <script>
            // 프로젝트 진행 상황에 따라 색깔이 바뀌도록하는 함수
            $(document).on("click", ".btn-imp", function(){
                switch( $(this).text() ){
                    case '긴급' : $(this).css("background-color", "red"); 
                                  $(this).text("ㅋㅋㅋ");
                                  $(this).siblings("input").val(1); break;
                    case '중요' : $(this).css("background-color", "orange");
                                  $(this).text("뷁") 
                                  $(this).siblings("input").val(2); break;
                    case "보통" : $(this).css("background-color", "green"); 
                                  $(this).siblings("input").val(3); break;
                    case "낮음" : $(this).css("background-color", "gray"); 
                                  $(this).siblings("input").val(4); break;
                }

            })


            // $(".btn-imp").click(function(){
            //     console.log("zzzㅋㅋㅋ");
            // })
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
</body>
</html>
