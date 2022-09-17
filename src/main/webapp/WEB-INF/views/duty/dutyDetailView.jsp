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
            a{
                text-decoration: none;
                color:black;
                font-size: small;
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
            </div>

            <!-- =================== 여기부터 업무 게시글 ======================== -->
            <div class="card shadow-sm border-1 rounded-lg">
                <div class="card-title">
                    <div class="right" class="writer-info" style="height:50px;">
                        <form action="" method="post" class="edit-form">
                            <input type="hidden" name="dutyNo" value="${d.dutyNo}">
                            <table width="100%">
                                <tr>
                                    <td width="85%" style="padding-left:35px;padding-top:10px;">
                                        <span style="font-size:small; color:gray;">[담당자]</span>
                                        <span style="font-size:small; color:gray;">
                                        	<c:forEach var="e" items="${d.empIC}">
                                        		<span>${e.empICName} </span>
                                        	</c:forEach>
                                        </span>
                                        <h4 style="font-weight:bold;">${ d.title }</h4>
                                    </td>
                                    <td width="5%"><a href="list.du">목록</a></td>
                                    <td width="5%"><a href="update.du?no=${d.dutyNo}">수정</a></td>
                                    <td width="5%"><a class="delete-board" onclick="deleteBoard();">삭제</a></td>
                                </tr>
                            </table>
                        </form>
                    </div>

                    <script>
                        // 삭제 버튼 > 삭제 확인을 누르면 해당 게시글이 삭제되도록하는 함수
                        // AJAX 필요 없음 (목록으로 돌아가면 됨)
                        function deleteBoard(){
                            if( window.confirm("정말 삭제하시겠습니까?") ){
                                $.post({
                                    url:"delete.du",
                                    data:{
                                        boardNo:${d.dutyNo}
                                    }
                                })
                            }
                        }
                    </script>
                </div>
                <hr style="height:0.1px;">
                <div class="card-description">
                    <table width="30%;" style="float:left; margin-right:100px; margin-left:40px;">
                        <tr>
                            <th>업무번호</th>
                            <td>${ d.dutyNo }</td>
                        </tr>
                        <tr>
                            <th>시작일시</th>
                            <td>${ d.startDate }</td>
                            <th>종료일시</th>
                            <td>${ d.endDate }</td>
                        </tr>
                    </table>
                    <table width="30%" class="btn-area" style="float:left;">
                        <tr class="tr-importance">
                            <th>우선순위</th>
                            <td><button class="btn btn-sm">긴급</button></td>
                            <td><button class="btn btn-sm">중요</button></td>
                            <td><button class="btn btn-sm">보통</button></td>
                            <td><button class="btn btn-sm">낮음</button></td>
                        </tr>
                        <tr class="tr-progress">
                            <th>진행상태</th>
                            <td><button class="btn btn-sm">준비</button></td>
                            <td><button class="btn btn-sm">진행</button></td>
                            <td><button class="btn btn-sm">지연</button></td>
                            <td><button class="btn btn-sm">완료</button></td>
                        </tr>
                    </table>
                </div>

                <script>
                    // 게시글의 상태, 우선 순위에 따라 색깔 보여지도록
                    $(function(){
                        $(".tr-progress").each(function(){
                            switch( "${d.progress}" ){
                                case '준비' : $(this).children("td").eq(0).children().css("background-color", "lightgreen"); break;
                                case '진행' : $(this).children("td").eq(1).children().css("background-color", "skyblue"); break;
                                case '지연' : $(this).children("td").eq(2).children().css("background-color", "yellow"); break;
                                case '완료' : $(this).children("td").eq(3).children().css("background-color", "violet"); break;
                            }
                        })
                        $(".tr-importance").each(function(){
                            switch( "${d.importance}" ){
                                case '긴급' : $(this).children("td").eq(0).children().css("background-color", "red"); break;
                                case '중요' : $(this).children("td").eq(1).children().css("background-color", "orange"); break;
                                case '보통' : $(this).children("td").eq(2).children().css("background-color", "lightgreen"); break;
                                case '낮음' : $(this).children("td").eq(3).children().css("background-color", "gray").color("color", "white"); break;
                            }
                        })
                    })
                </script>
                
                <hr>
                <div class="card-body">
                    <div class="content">
                        <p style="white-space:pre-line; padding-left:20px;padding-right:20px;padding-bottom:50px;">
                            ${d.content}
                        </p>
                    </div>
                    <div class="content-file" align="center">
                        <a  download="${f.fileOriginName}" href="${ f.filePath }"></a>
                    </div>
                </div>
                <div class="card-comment">
                    <div class="read-comment">
                        <table width="100%;">
                        	<c:choose>
                        		<c:when test="${ not empty clist }">
                        			<c:forEach var="c" items="${clist}">
			                            <tr width="100%" height="10px;">
			                                <th width="8%" style="padding-left:20px;">${c.empName}</th>
			                                <td width="72%;" style="padding:10px; white-space:pre-line;">${c.comContent}</td>
			                                <td width="10%;" style="color:gray;">${c.comCreateDate}</td>
			                                <td><a width="5%" href="update.co?no=${c.comNo}">수정</a></td>
			                                <td><a width="5%" href="update.co?no=${c.comNo}">삭제</a></td>
			                            </tr>
                        			</c:forEach>
                        		</c:when>
                        		<c:otherwise>
                        			<div style="padding:30px;" align="center"><span>아직 작성된 댓글이 없습니다.</span></div>
                        		</c:otherwise>
                        	</c:choose>
                        </table>
                    </div>
                    <form class="write-comment" action="upload.fi" method="post"  enctype="multipart/form-data">
                        <input type="hidden" name="empNo" value="${loginUser.empNo}">
                        <input type="hidden" name="comRefBno" value="${d.dutyNo}">
                        <input type="file" name="upfile" class="hidden-info">
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
                $("input[name=upfile]").click();
            }
            $("input[name=upfile]").change(function(){
                $("#fileName").html( $(this)[0].files[0].name + "파일 첨부됨");
            })
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
