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
            .title{
                font-size: larger;
                font-weight: bolder;
            }
            .inner-area{
                padding:100px;
                padding-top:10px;
            }
            .btn-area button{
                width:50px;
                height:20px;
                font-size: 10px;
                line-height: 10px;
                background-color: lightgray;
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
            .hidden-info{
                display:none;
            }
            .card-comment{
                width:100%;
                background-color: lightgray;
                border-bottom-left-radius: 5px;
                border-bottom-right-radius: 5px;
            }
        </style>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    </head>
    <body>
    	
    	<jsp:include page="../common/menubar.jsp" />
    	
        <br><br><br>
        <div class="container">
            <div class="title-area">
                <h1 style="font-weight:bolder;">개인 업무 상세 조회</h1>
                <hr>
            </div>

            <!-- =================== 여기부터 업무 게시글 ======================== -->
            <div class="card shadow-sm border-1 rounded-lg">
                <div class="card-title">
                    <div class="right" class="writer-info" style="height:50px;">
                        <form action="" method="post" class="edit-form">
                            <input type="hidden" name="dutyNo" value="${DB의 board_no}">
                            <input type="hidden" name="progress" value="DB의progress값">
                            <input type="hidden" name="importrance" value="${DB의importance값}">
                            <table width="100%">
                                <tr>
                                    <td width="90%" style="padding-left:35px;padding-top:5px;">
                                        <span style="font-size:small; color:gray;">담당자</span>
                                        <span style="font-size:small; color:gray;">박혜진</span>
                                        <h4 style="font-weight:bold;">민진손 vs 희영노 팔씨름 대회 개최</h4>
                                    </td>

                                    <td width="5%"><a onclick="$('.edit-form').click();">수정</a></td>
                                    <td width="5%"><a class="delete-board" onclick="deleteBoard();">삭제</a></td>
                                </tr>
                            </table>
                        </form>
                    </div>

                    <script>
                        // 수정 버튼을 누르면 해당 게시글의 정보를 담아 수정 페이지로 이동하는 함수
                        // (필요할까?)
                        function submitEdit(){
                            // 수정을 위해 필요한 게시글 정보 : 게시글의 번호뿐
                        }

                        // 삭제 버튼 > 삭제 확인을 누르면 해당 게시글이 삭제되도록하는 ajax
                        function deleteBoard(){
                            if( window.confirm("정말 삭제하시겠습니까?") ){
                                $.ajax({
                                    url:"매핑값",
                                    data:{
                                        boardNo:$(this).parent().siblings("input[name=boardNo]").val()
                                    },
                                    success:function(){
                                        // Controller - Service - Dao - DB 순서로 가서 해당 게시글 번호의 게시글 삭제 후
                                        // 다시 돌아와서 reload 해주어야 함
                                    },
                                    error:function(){
                                        console.log("ajax 통신 실패 : 업무 게시글 삭제")
                                    }
                                })
                            }
                        }
                    </script>

                </div>
                <hr>
                <div class="card-description">
                    <table width="30%;" style="float:left; margin-right:50px; margin-left: 30px;">
                        <tr>
                            <th>업무번호</th>
                            <td>253</td>
                        </tr>
                        <tr>
                            <th>시작일시</th>
                            <td>2022-08-17</td>
                            <th>종료일시</th>
                            <td>2022-08-31</td>
                        </tr>
                    </table>
                    <table width="30%" class="btn-area" style="float:left;">
                        <tr class="tr-progress">
                            <th>상태</th>
                            <td><button class="btn btn-sm">준비</button></td>
                            <td><button class="btn btn-sm">진행</button></td>
                            <td><button class="btn btn-sm">지연</button></td>
                            <td><button class="btn btn-sm">완료</button></td>
                            <td class="hidden-info progress">ddd</td>
                        </tr>
                        <tr class="tr-importance">
                            <th>우선순위</th>
                            <td><button class="btn btn-sm">긴급</button></td>
                            <td><button class="btn btn-sm">중요</button></td>
                            <td><button class="btn btn-sm">보통</button></td>
                            <td><button class="btn btn-sm">낮음</button></td>
                            <td class="hidden-info importance"><span></span></td>
                        </tr>
                    </table>
                </div>

                <script>
                    // 게시글의 상태, 우선 순위에 따라 색깔 보여지도록
                    $(function(){
                        $(".tr-progress").each(function(){
                            switch( $(this).children(".progress").text() ){
                                case 1 : $(this).children().eq(0).css("background-color", "skyblue");
                                case 2 : $(this).children().eq(1).css("background-color", "lightgreen");
                                case 3 : $(this).children().eq(2).css("background-color", "yellow");
                                case 4 : $(this).children().eq(3).css("background-color", "violet");
                            }
                        })
                        $(".tr-importance").each(function(){
                            switch( $(this).children(".importance").text() ){
                                case 1 : $(this).children().eq(0).css("background-color", "red");
                                case 2 : $(this).children().eq(1).css("background-color", "orange");
                                case 3 : $(this).children().eq(2).css("background-color", "lightgreen");
                                case 4 : $(this).children().eq(3).css("background-color", "gray").color("color", "white");
                            }
                        })
                    })
                </script>
                
                <hr>
                <div class="card-body">
                    <div class="content">
                        <p>
                            업무 내용
                        </p>
                    </div>
                    <div class="content-file" align="center">
                        첨부파일 있다면 여기에 파일이 뜸
                        <input type="file" class="form-control hidden-info" name="" class="hidden-info">
                    </div>
                </div>
                <div class="card-comment">
                    <div class="read-comment">
                        <table width="100%;">
                            <tr width="100%" height="10px;">
                                <th width="8%" style="padding-left:20px;">이름</th>
                                <td width="72%;" style="padding:20px; white-space:pre-line;">Lorem ipsum dolor sit amet, consectetur adipiscing vitae</td>
                                <td width="10%;" style="color:gray;">2022-09-02</td>
                                <td><a width="5%" href="">수정</a></td>
                                <td><a width="5%" href="">삭제</a></td>
                            </tr>
                            <tr width="100%" height="10px;">
                                <th width="8%" style="padding-left:20px;">이름</th>
                                <td width="72%;" style="padding:20px; white-space:pre-line;">Lorem ipsum dolor sit amet, consectetur adipiscing vitae</td>
                                <td width="10%;" style="color:gray;">2022-09-02</td>
                                <td><a width="5%" href="">수정</a></td>
                                <td><a width="5%" href="">삭제</a></td>
                            </tr>
                        </table>
                    </div>
                    <form class="write-comment" action="" method="post"  enctype="multipart/form-data">
                        <input type="hidden" name="empNo" value="${작성자사번}">
                        <input type="hidden" name="comRefBno" value="${글번호}">
                        <input type="file" name="commentAtt" class="hidden-info">
                        <textarea name="comContent" class="form-control" style="width:90%; height:80px; margin:10px; float:left; resize:none"></textarea>
                        <button class="btn btn-sm btn-success" onclick="insertFile();" style="float:left; height:80px; width:3%; margin-top:10px; margin-right:5px;">
                            <i class="fa fa-paperclip" aria-hidden="true"></i>
                        </button>
                        <button class="btn btn-sm btn-secondary" onclick="insertComment();" style="float:left; height:80px; width:3%; margin-top:10px;">확인</button>
                        <br style="clear:both;">
                        <a id="fileName" style="padding:20px; color:gray;"></a>
                    </form>
                </div>
            </div>
            <br><br>
		</div>

        <script>
            function insertFile(){
                $("input[name=commentAtt]").click();
            }
            $("input[name=commentAtt]").change(function(){
                $("#fileName").html( $(this)[0].files[0].name + "파일 업로드됨");
            })
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
