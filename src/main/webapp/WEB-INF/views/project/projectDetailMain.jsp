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
            table a{
                text-decoration: none;
                color:black;
                font-size: small;
            }
            .title{
                font-size: larger;
                font-weight: bolder;
            }
            .inner-area{
                padding:10px;
            }
            .left{
                width:40%;
                height:150px;
                float: left;
            }
            .right{
                float:right;
                width:59%;
                height:150px;
            }
            .pmenu-item{
                float:left;
                list-style: none;
                padding-left: 0px;
                margin-left:30px;
                padding-bottom: 15px;
                font-weight: bold;
            }
            .content>p{
                padding:20px;
                white-space:pre-line;
            }
            .btn-area button{
                width:50px;
                height:20px;
                font-size: 10px;
                line-height: 10px;
                background-color: lightgray;
            }
            .card-comment{
                width:100%;
                background-color: lightgray;
                border-bottom-left-radius: 5px;
                border-bottom-right-radius: 5px;
            }
            ul{
                list-style: none;
            }
            .description{
            	color:gray;
            	font-size:small;
            }
            .pmenu-item>span{
            	cursor:pointer;
            }
        </style>
    
    </head>
    <body>
    
    	<jsp:include page="../common/menubar.jsp" />
    
        <br><br><br>
        <div class="container">
            <jsp:include page="projectDetailMenubar.jsp"/>

            <div class="left card shadow-sm border-1 rounded-lg">
                <div class="card-body">
                    <div class="title-area">
                        <span class="title">전체 진행도</span>
                        &nbsp;&nbsp;&nbsp;
                        <span class="title">이번주 진행도</span>
                    </div>
                    <div class="inner-area">
                        <table>
                            <tr>
                                <td rowspan="2" style="padding-right:30px;">
                                    <span class="title" style="font-size:xxx-large">01</span> <span class="title">%</span>
                                </td>
                                <td style="padding-right:50px;">
                                    <span class="title">준비</span>
                                    <span class="description"> 25건의 업무</span>
                                </td>
                                <td>
                                    <span class="title">진행</span>
                                    <span class="description"> 13건의 업무</span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span class="title">완료</span>
                                   <span class="description"> 26건의 업무</span>
                                </td>
                                <td>
                                    <span class="title">지연</span>
                                    <span class="description"> 32건의 업무</span>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <div class="right card shadow-sm border-1 rounded-lg">
                <div class="card-body"  style="overflow: auto;">
                    <div class="title-area">
                        <span class="title">팀원 연락망</span>
                    </div>
                    <div class="inner-area">
                        <!-- project_mem list의 홀수번째만 -->
                        <ul style="width:50%; float:left;">
	                        <c:forEach var="m" items="${p.mlist}" step="2">
	                            <li style="margin-bottom:10px;">
	                                <img src="" style="width:30px;height:30px;border-radius:50%;">
	                                <span>${m.memName}</span>
	                                <span style="color:gray; font-size:small">${m.memRole}</span>&nbsp;&nbsp;
	                                <i class="fa fa-envelope" aria-hidden="true"></i>&nbsp;
	                            </li>
	                        </c:forEach>
                        </ul>
                        <!-- project_mem list의 짝수번째만 -->
                        <ul style="width:48%; float:left;">
                        	<c:forEach var="m" items="${p.mlist}" begin="1" step="2" >
	                            <li style="margin-bottom:10px;">
	                                <img src="" style="width:30px;height:30px">
	                                <span>${m.memName}</span>
	                                <span style="color:gray; font-size:small">${m.memRole}</span>&nbsp;&nbsp;
	                                <i class="fa fa-envelope" aria-hidden="true"></i>&nbsp;
	                            </li>
                        	</c:forEach>
                        </ul>
                    </div>
                </div>
            </div>	
            
            
            <div style="clear:both;"></div><br><br><br>
            <span class="title">전체 게시글</span><br><br>


            <!-- =================== 여기부터 업무 게시글 ======================== -->

            <div class="card shadow-sm border-1 rounded-lg">
                <div class="card-title">
                    <div class="left" style="width:8%; height:50px;">
                        <span class="title" style="line-height:70px; padding:20px;">업무</span>
                    </div>
                    <div class="right" style="width:92%; height:50px;">
                        <table width="100%">
                            <tr>
                                <td width="90%" style="padding-top:15px;">
                                    <span style="font-weight:bold;">장지미</span><br>
                                    <span style="font-size:small; color:gray;">2022-07-25</span>
                                </td>
                                <td width="5%"><a href="">수정</a></td>
                                <td width="5%"><a href="">삭제</a></td>
                            </tr>
                        </table>
                    </div>
                </div>
                <hr>
                <div class="card-description">
                    <table width="30%;" style="float:left; margin-right:50px; margin-left: 30px;">
                        <tr>
                            <th>담당자</th>
                            <td>김개똥</td>
                        </tr>
                        <tr>
                            <th>시작일시</th>
                            <td>2022-08-17</td>
                            <th>종료일시</th>
                            <td>2022-08-31</td>
                        </tr>
                    </table>
                    <table width="30%" class="btn-area" style="float:left;">
                        <tr>
                            <th>상태</th>
                            <td><button class="btn btn-sm">준비</button></td>
                            <td><button class="btn btn-sm">진행</button></td>
                            <td><button class="btn btn-sm">지연</button></td>
                            <td><button class="btn btn-sm">완료</button></td>
                        </tr>
                        <tr>
                            <th>우선순위</th>
                            <td><button class="btn btn-sm">긴급</button></td>
                            <td><button class="btn btn-sm">중요</button></td>
                            <td><button class="btn btn-sm">보통</button></td>
                            <td><button class="btn btn-sm">낮음</button></td>
                        </tr>
                    </table>
                </div>
                <hr>
                <div class="card-body">
                    <h3 class="title">글 제목 영역</h3>
                    <div class="content">
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed egestas nunc nec fermentum interdum. Fusce fermentum, nisl ut egestas efficitur, tellus leo finibus augue, vel fringilla enim metus at diam. Proin luctus molestie molestie. Aenean scelerisque massa vitae iaculis ultrices. Cras pharetra posuere odio ac mattis. Nullam in tristique erat. Curabitur ac libero gravida, auctor enim id, congue tortor. Duis tempus faucibus augue sed finibus. Fusce ac rhoncus lectus, quis suscipit nulla. Mauris lorem sem, rutrum ac rutrum eu, maximus quis sem. Fusce finibus porta arcu sit amet condimentum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.
Duis scelerisque suscipit urna, vel rutrum sem placerat non. Quisque elit diam, mattis eget tincidunt vitae, pretium eu lorem. Morbi vel nulla quis libero lacinia fringilla et quis massa. Morbi dignissim massa a condimentum lobortis. Donec non quam maximus, laoreet urna ut, efficitur lacus. Phasellus cursus fermentum imperdiet. In non lorem ac sapien sagittis accumsan at a nisl. In bibendum lectus non luctus posuere. Fusce aliquet dolor id gravida euismod. Praesent vitae facilisis mi. Duis aliquam ultrices dolor, sed sodales ipsum lacinia sed. Donec vel volutpat nulla.
                        </p>
                    </div>
                </div>
                <div class="info-area" align="right">
                    <i class="fa fa-bookmark" aria-hidden="true"></i> &nbsp; 
                    <i class="fa fa-bookmark-o" aria-hidden="true"></i> &nbsp; 
                    <a style="margin-right:30px;">댓글 (<span>1</span>)</a>
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
                    <div class="write-comment">
                            <textarea name="" class="form-control" style="width:90%; height:80px; margin:20px; float:left; resize:none"></textarea>
                            <button class="btn btn-sm btn-secondary" style="float:left; height:80px; width:5%; margin-top:20px;">댓글<br>작성</button>
                    </div>
                </div>
            </div>

            <br><br>

            <!-- =================== 여기부터 회의 게시글 ======================== -->

            <div class="card shadow-sm border-1 rounded-lg">
                <div class="card-title">
                    <div class="left" style="width:8%; height:50px;">
                        <span class="title" style="line-height:70px; padding:20px;">회의</span>
                    </div>
                    <div class="right" style="width:92%; height:50px;">
                        <table width="100%">
                            <tr>
                                <td width="90%" style="padding-top:15px;">
                                    <span style="font-weight:bold;">장지미</span><br>
                                    <span style="font-size:small; color:gray;">2022-07-25</span>
                                </td>
                                <td width="5%"><a href="">수정</a></td>
                                <td width="5%"><a href="">삭제</a></td>
                            </tr>
                        </table>
                    </div>
                </div>
                <hr>
                <div class="card-description">
                    <table width="50%;" style="float:left; margin-right:50px; margin-left: 30px;">
                        <tr>
                            <th>담당자</th>
                            <td>김개똥</td>
                            <th>회의 장소</th>
                            <td>소회의실2</td>
                        </tr>
                        <tr>
                            <th>시작일시</th>
                            <td>2022-08-17 14:00</td>
                            <th>종료일시</th>
                            <td>2022-08-31 16:00</td>
                        </tr>
                    </table>
                </div>
                <hr>
                <div class="card-body">
                    <h3 class="title">회의 글 제목 영역</h3>
                    <div class="content">
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed egestas nunc nec fermentum interdum. Fusce fermentum, nisl ut egestas efficitur, tellus leo finibus augue, vel fringilla enim metus at diam. Proin luctus molestie molestie. Aenean scelerisque massa vitae iaculis ultrices. Cras pharetra posuere odio ac mattis. Nullam in tristique erat. Curabitur ac libero gravida, auctor enim id, congue tortor. Duis tempus faucibus augue sed finibus. Fusce ac rhoncus lectus, quis suscipit nulla. Mauris lorem sem, rutrum ac rutrum eu, maximus quis sem. Fusce finibus porta arcu sit amet condimentum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.
                            Duis scelerisque suscipit urna, vel rutrum sem placerat non. Quisque elit diam, mattis eget tincidunt vitae, pretium eu lorem. Morbi vel nulla quis libero lacinia fringilla et quis massa. Morbi dignissim massa a condimentum lobortis. Donec non quam maximus, laoreet urna ut, efficitur lacus. Phasellus cursus fermentum imperdiet. In non lorem ac sapien sagittis accumsan at a nisl. In bibendum lectus non luctus posuere. Fusce aliquet dolor id gravida euismod. Praesent vitae facilisis mi. Duis aliquam ultrices dolor, sed sodales ipsum lacinia sed. Donec vel volutpat nulla.
                        </p>
                        <div class="attendance btn-area" align="center">
                            <br><a>참석 확인 현황</a><br>
                            <button class="btn btn-sm">장지미</button>
                            <button class="btn btn-sm">장지파</button>
                            <button class="btn btn-sm">장지솔</button>
                            <button class="btn btn-sm">강보람</button>
                        </div>
                        <br>
                        <div class="confirm-att" align="center">
                            <button class="btn btn-success">참석</button>
                            <button class="btn btn-danger">불참</button>
                        </div>
                        <br><br>
                    </div>
                </div>
                <div class="info-area" align="right">
                    <i class="fa fa-bookmark" aria-hidden="true"></i> &nbsp; 
                    <i class="fa fa-bookmark-o" aria-hidden="true"></i> &nbsp; 
                    <a style="margin-right:30px;">댓글 (<span>1</span>)</a>
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
                    <div class="write-comment" action="" method="post">
                        <input type="hidden" name="comRefBno" value="글번호">
                        <input type="hidden" name="comType" value="2">
                        <textarea name="comContent" class="form-control" style="width:90%; height:80px; margin:20px; float:left; resize:none"></textarea>
                        <button class="btn btn-sm btn-secondary" onclick="insertComment();" style="float:left; height:80px; width:5%; margin-top:20px;">댓글<br>작성</button>
                    </div>
                </div>
            </div>
            <br><br>

            <script>
                function insertComment(){
                    // 댓글 작성하고 댓글 리스트 새로 불러오는 ajax
                    $.ajax({
                        url:"",
                        data:{
                            comRefBno:$("input[name=comRefBno]").val(),
                            comType:$("input[name=comType]").val(),
                            comContent:$("input[name=conContent]").val()
                        },
                        success:function(){

                        },
                        error:function(){
                            
                        }
                    })
                }
            </script>
        </div>

        <br><br><br><br><br><br><br><br><br><br>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
