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
                padding:10px;
            }
            .project-card{
                display: inline-block;
                width: 200px;
                height: 100px;
                border: 1px solid lightgray;
                border-radius: 5px;
                margin-right:40px;
                padding-left:20px;
                margin-bottom: 20px;
            }
            .project-title{
                font-size: 18px;
                font-weight: bold;
            }
            .card-inner:hover{
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
                <br>
            </div>
            <div class="inner-area">
            	<c:forEach var="p" items="${ plist }">
	                <div class="project-card" >
	                    <input type="hidden" class="progress" value="${p.progress}">
	                    <form id="projectForm"> <input type="hidden" name="projNo" value="${p.projNo}"> </form>
	                    <button class="manageProj" class="manage" style="margin-left:70%; border:none;background-color:white; width:50px; height:30px;">
	                        <i class="fa fa-cog" aria-hidden="true"></i>
	                    </button>
	                    <br>
	                    <div class="card-inner">
		                    <span class="project-title">${p.projTitle}</span><br>
		                    <input type="hidden" value="${p.progress}" id="priority">
		                    <i class="fa fa-sm fa-user"></i> <span style="font-size:12px;">(${p.mlist.size()})</span>
	                	</div>
	                </div>
                </c:forEach>
            </div>
            <br><hr><br><br>
            <div class="title-area">
                <h1 style="font-weight:bolder;">종료된 프로젝트</h1>
                <br>
				<c:choose>
					<c:when test="${empty dplist}"><span>아직 종료한 프로젝트가 없습니다.</span></c:when>
					<c:otherwise>
						<c:forEach var="d" items="${ dplist }">
			                <div class="project-card" >
			                    <input type="hidden" class="progress" value="${d.progress}">
			                    <form id="projectForm"> <input type="hidden" name="projNo" value="${d.projNo}"> </form>
			                    <button class="manageProj" class="manage" style="margin-left:70%; border:none;background-color:white; width:50px; height:30px;">
			                        <i class="fa fa-cog" aria-hidden="true"></i>
			                    </button>
			                    <br>
			                    <div class="card-inner">
				                    <span class="project-title">${d.projTitle}</span><br>
				                    <input type="hidden" value="${d.progress}" id="priority">
				                    <i class="fa fa-sm fa-user"></i> <span style="font-size:12px;">(${d.mlist.size()})</span>
			                	</div>
			                </div>
		                </c:forEach>
					</c:otherwise>
                </c:choose>
            </div>
        </div>

        <script>
            $(function(){
	            // 프로젝트 관리 버튼 (톱니바퀴) 클릭 시 해당 프로젝트의 관리 페이지로 가는 버튼
	            // 단, 해당 사원이 선택한 프로젝트의 관리자 이상이 아니면 접근 불가
				$(document).on("click", ".manageProj", function(){
					let form = $(this).siblings("form");
					$.ajax({
						url:"validate.pr",
						data:{
							empNo:${loginUser.empNo},
							projNo:$(this).siblings("form").children("input").val()
						},
						success:function(result){
							if(result == "Y"){
								form.attr("action", "manage.pr");
								form.submit();
							}else{
								alert("접근 권한이 없습니다.");
							}
						},
						error:function(){
							console.log("권한 체크하는 AJAX 통신 실패");
						}
					})
				})            
            	
				// 카드 영역을 클릭하면 해당 프로젝트의 업무공유방으로 이동
            	$(document).on("click", ".card-inner", function(){
            		let form = $(this).siblings("form");
            		form.attr("action", "proom.pr");
            		form.submit();
            	})
            })

            // 프로젝트 진행 상황에 따라 색깔이 바뀌도록하는 함수
            $(function(){
                $(".project-card").each(function(){
                	console.log("실행됨")
                    switch( $(this).children(".progress").val() ){
                        case '준비' : $(this).css("border-left", "10px solid gold"); break;
                        case '진행' : $(this).css("border-left", "10px solid green"); break;
                        case '지연' : $(this).css("border-left", "10px solid orchid"); break;
                        case '완료' : $(this).css("border-left", "10px solid lightgray"); break;
                    }
                })
            })
        </script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
