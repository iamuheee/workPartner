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
                    <div class="content-area">
                        <p id="content" style="white-space:pre-line; padding-left:20px;padding-right:20px;padding-bottom:50px;">
                            ${d.content}
                        </p>
                    </div>
                    <div class="content-file" align="center">
                        <a href="${ f.filePath }">${f.fileOriginName}</a>
                    </div>
                </div>
                <div class="card-comment">
                    <div class="read-comment">
                        <table width="100%" id="comment-table" style="border-collapse: collapse">
                        	
                        </table>
                    </div>
                    <form class="write-comment" id="commentForm" >
                        <input type="hidden" name="empNo" value="${loginUser.empNo}">
                        <input type="hidden" name="empName" value="${loginUser.empName}">
                        <input type="hidden" name="comType" value="1">
                        <input type="hidden" name="comRefBno" value="${d.dutyNo}">
                        <input type="file" name="upfile" class="hidden-info">
                        <textarea name="comContent" class="form-control" style="width:90%; height:80px; margin:10px; float:left; resize:none"></textarea>
                        <button type="button" class="btn btn-sm btn-success" onclick="insertFile()" style="float:left; height:80px; width:3%; margin-top:10px; margin-right:5px;">
                            <i class="fa fa-paperclip" aria-hidden="true"></i>
                        </button>
                        <button type="button" class="btn btn-sm btn-secondary" onclick="insertComment()" style="float:left; height:80px; width:3%; margin-top:10px;">확인</button>
                        <br style="clear:both;">
                        <a id="fileName" style="padding:20px; color:gray;"></a>
                    </form>
                </div>
            </div>
            <br><br>
		</div>

        <script>
        	
        	/////////////////////////////
        	// 댓글 조회 관련 function //
        	/////////////////////////////
        	
        	// 페이지가 로드되자마자 댓글 리스트를 조회하는 함수
        	$(function(){
        		selectCommentList();
        	})
        	
        	// 댓글 조회 함수 (AJAX)
        	function selectCommentList(){
        		html = "";
        		
        		$.ajax({
        			url:"select.co",
        			data:{
        				comType:"1",
        				comRefBno:${d.dutyNo}
        			},
        			success:function(clist){
        				if(clist.length == 0){
        					// 조회되는 댓글이 없는 경우
        					html += '<th style="padding:30px;text-align:center"><span>아직 작성된 댓글이 없습니다.</span></th>';
        				}else{
        					// 조회되는 댓글이 있는 경우
	        				for(let i=0; i<clist.length; i++){
	        					html += '<tr>'
	        						  + 	'<th width="8%" style="padding-left:20px;">' + clist[i].empName + '</th>'
	        						  + 	'<td width="77%;" style="padding:10px; white-space:pre-line;">' + clist[i].comContent + '</td>'
									  +		'<td width="10%;" style="color:gray;font-size:small;">' + clist[i].comCreateDate + '</td>'
								  	  +		'<td><a width="5%" href="delete.co?dno=' + ${d.dutyNo} + '&cno=' + clist[i].comNo + '">삭제</a></td>'
	        						  + '</tr>';
	        						  // 첨부파일이 있는 경우에만 한 행 추가하여 파일 다운로드 받을 수 있도록 함
								if(clist[i].file != null){ 
									console.log(clist[i].file);
									html += '<tr><td/><td colspan="4" style="padding-left:15px;font-size:small;color:gray;">└ 댓글 첨부파일 : <a href="' + clist[i].file.filePath + '">' + clist[i].file.fileOriginName + '</a></td><tr>';
								}
	        				}
        				}
        				// 위의 문자열 html을 테이블에 넣어주자
        				$("#comment-table").html(html);
        			},
        			error:function(){
        				console.log("댓글 조회 AJAX 통신 실패");
        			}
        		})
        	}
        	
        									
        	/////////////////////////////
        	// 댓글 작성 관련 function //
        	/////////////////////////////
        	
        	// 댓글 작성에 파일 첨부하는 기능
            function insertFile(){
                $("input[name=upfile]").click();
            }
        	
            $("input[name=upfile]").change(function(){
                $("#fileName").html( $(this)[0].files[0].name + "파일 첨부됨");
            })
            
            // 댓글 작성하는 기능
            function insertComment(){
            	console.log("함수 호출됨 ㅎ ")
           		// trim() : 문자열에서 좌우 공백을 제거하는 함수 => 만약 "   "일 때에는 요청하지 않도록! (유효성 검사)
            	if( $("textarea[name=comContent]").val().trim().length > 0 ){
            		// ajax로 form을 전송하기 위해 formData 객체를 선언, 생성
            		let formData = new FormData($("#commentForm")[0]);
            		
            		console.log(formData);
            		
            		$.ajax({
            			url:"insert.co",
            			data:formData,
            			contentType:false,
            			processData:false,
            			type:"POST",
            			success:function(alertMsg){
            				// INSERT 요청처리 후에는, 성공/실패 메시지 보낸 후 새롭게 댓글 리스트를 조회
            				alert(alertMsg);
            				selectCommentList();
            				$("textarea[name=comContent]").val("");
            			},
            			error:function(){
            				console.log("댓글 작성 AJAX 통신 실패");
            			}
            		})
            	}
            }
            
            
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
