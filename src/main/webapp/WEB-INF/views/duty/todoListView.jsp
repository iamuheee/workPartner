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
        a{
            text-decoration: none;
            color:black;
            font-size: small;
        }
        .filter{
            font-size: small;
            color: gray;
        }
        .title{
            font-size: larger;
            font-weight: bolder;
        }
        .inner-area{
            padding:10px;
        }
        .btn-area button{
            width:50px;
            height:20px;
            font-size: 10px;
            line-height: 10px;
            background-color: lightgray;
        }
        .todo-cate{
            display:inline-block;
            float:left;
            margin-left:20px; margin-right:20px;
            margin-top:10px; margin-bottom: 10px;
            width:280px;
            height:400px;
            border:1px solid lightgray;
            border-radius: 5px;
            background-color: #F1F2f1;
            overflow:auto;
        }
        .todo-cate-1st{
            float:left; 
            display:block;
        }
        .todo-list{
            margin:auto;
            margin-top:5px; 
            margin-bottom:5px;
            height:50px; 
            width:95%; 
            border:1px solid gray; 
            background-color:white;
            border-radius:5px;
        }
        .modal-body .filter{
            font-weight:bold;
        }
    </style>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<body>
    <br><br><br>
    <div class="container">
        <div class="title-area">
            <h1 style="font-weight:bolder;">To Do List</h1>
        </div>
        <hr>
        <div align="center">
            <span class="filter">
                할 일을 체크리스트로 작성할 수 있는 공간입니다. <br>
                To Do 항복은 한 번 삭제하면 복구할 수 없으니 신중히 삭제하세요.
            </span>
        </div>
        <hr>
        
        <!-- =================== 여기부터 To Do ======================== -->
        <div class="todo-wrap">
            <div class="add-todo" align="right" style="margin:10px;">
                <a class="filter" data-bs-toggle="modal" data-bs-target="#insertCategoryModal">
                    새로운 To Do 카테고리 <i class="fa fa-plus" aria-hidden="true"></i>
                </a>
            </div>
            <div class="todo-cate todo-cate-1st shadow-sm inner-area">
                <!-- 첫번째 todo-category에만 todo-category-1st 클래스 부여 -->
                <div class="todo-title">
                    <span class="title todo-cate-title">텔레토비</span>
                    <a>(4)</a>
                    <span class="filter" style="float:right"  data-bs-toggle="modal" data-bs-target="#insertTodoModal">
                        새로운 ToDo<i class="fa fa-plus" aria-hidden="true"></i>
                    </span>
                </div>
                <div class="todo-list">
                    <span class="hidden-info"></span>
                    <label><input type="checkbox" name="" class="todo" style="margin-left:10px;"> 보라돌이 뚜까패기</label><br>
                    <span class="filter" style="margin-left:30px;">~2022-10-10</span>
                    <div style="float:right; margin-right:5px;">
                        <a onclick="deleteTodo( $(this).parent().siblings().eq(0).text() );">삭제</a>
                    </div>
                </div>
                <div class="todo-list">
                    <span class="hidden-info"></span>
                    <label><input type="checkbox" name="" class="todo" style="margin-left:10px;"> 보라돌이 뚜까패기</label><br>
                    <span class="filter" style="margin-left:30px;">2022-10-10까지</span>
                    <div style="float:right; margin-right:5px;">
                        <a onclick="deleteTodo( $(this).parent().siblings().eq(0).text() );">삭제</a>
                    </div>
                </div>
            </div>
        </div>
        <br><br>
    </div>


    <script>
        // DB의 TB_TODO_CATE의 COLOR 컬럼값에 따라 카테고리의 색 변경되도록 하는 함수
        // $(function(){
        //     $(".todo-cate-title").each(function(){
        //         var color = "";
        //         for(var i; i<TB_TODO_CATE의 컬럼수; i++){
        //             color = "i번째 행의 COLOR 컬럼값 (#XXXXXX)";
        //             $(this).css("color", color);
        //         }
        //     })
        // })

        // To Do의 체크리스트 선택/해제시 취소선 나타남/사라짐 효과 적용하는 함수
        $(".todo").click(function(){
            $(this).attr("checked", true) ? $(this).parent("label").css("text-decoration", "line-through") : $(this).parent("label").css("text-decoration", "none") ;
        })

        // 선택버튼 클릭시 해당 요소 삭제하는 함수
        function deleteTodo(no){
            window.confirm("정말?");
            // if( confirm("정말로 삭제하시겠습니까?") ){
            //     $.ajax({
            //         url:"",
            //         date:{
            //             // 전달할 값 : 해당 ToDo의 번호
            //             todoNo:no
            //         },
            //         success:function(){
            //             alert("성공적으로 삭제했습니다.");
            //             location.reload();
            //         },error:function(){

            //         }
            //     })
            // }
        }
    </script>


    <!-- Modal : Insert a New Category -->
    <div class="modal fade" id="insertCategoryModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">To Do 카테고리 추가</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="" method="post" class="modal-body" id="submitCate">
                    <input type="hidden" name="empNo" value="로그인유저의사번" required>
                    <span class="filter">카테고리 이름</span><br>
                    <input type="text" name="" id="" class="form-control col-md-4" required>
                    <br><br>
                    <span class="filter">카테고리 컬러</span><br>
                    <input type="color" name="">
                    <br><br>
                </form>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" >닫기</button>
                    <button type="button" class="btn btn-success" onclick="submitCate();" >확인</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        function submitCate(){
            $("#submitCate").submit();
            location.reload();
            // $("#insertCategoryModal").attr("data-bs-dismiss", "modal");
        }
    </script>


    <!-- Modal : Insert a New To Do -->
    <div class="modal fade" id="insertTodoModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">To Do 추가</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="" method="post" class="modal-body">
                    <span class="title">카테고리</span><br>
                    <span>현재 카테고리명</span>
                    <br><br>
                    <span class="title">등록할 To do</span><br>
                    <input type="text" class="form-control">
                    <br><br>
                </form>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                    <button type="button" class="btn btn-success" onclick="submitTodo();">확인</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        function submitTodo(){
            $("#submitTodo").submit();
            location.reload();
            // $("#insertTodoModal").attr("data-bs-dismiss", "modal");
        }
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
</body>
</html>
