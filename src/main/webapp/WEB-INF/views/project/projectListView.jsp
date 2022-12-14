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
            .accept{
            	width:48%;
            	height:20px;
            	font-size:5px;
            	font-weight:bolder;
            }
        </style>
    
    </head>
    <body>
    
		<jsp:include page="../common/menubar.jsp" />
    	
        <br><br><br>
        <div class="container" style="width:100%;">
        	<div class="card shadow-sm border-1 rounded-lg" style="float:left; width:73%;">
        		<div class="card-body">
		            <div class="title-area">
		                <h1 style="font-weight:bolder;">???????????? ????????????</h1>
		                <br>
		            </div>
		            <div class="inner-area">
	            	<c:choose>
	            		<c:when test="${ not empty plist }">
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
		                </c:when>
		                <c:otherwise><span>?????? ???????????? ??????????????? ????????????.</span></c:otherwise>
	                </c:choose>
		            </div>
		            <br><br><br>
		            <div class="title-area">
		                <h1 style="font-weight:bolder;">????????? ????????????</h1>
		                <br>
						<c:choose>
							<c:when test="${empty dplist}"><span>?????? ????????? ??????????????? ????????????.</span></c:when>
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
            </div>
            
			<div class="card shadow-sm border-1 rounded-lg" style="float:right; width:25%; height:500px">
				<div class="card-body">
	                <div class="title-area">
	                    <span class="title">?????? ???????????? ??????</span>
	                    <br><br>
	                </div>
	                <div class="inner-area">
	                   	<c:forEach var="i" items="${ilist}">
		                    <div class="invitation" style="margin-bottom:5px;">
		                        <span style="font-weight:bold; line-height: 30px;">${i.projTitle}</span>
		                        <span style="font-size:10px;padding:0px">${i.memRole}</span><br>
	                        	<input type="hidden" id="projNo" value="${i.projNo}">
	                            <button class="btn btn-sm btn-primary accept" value="??????" style="line-height:10px;">??????</button>
	                            <button class="btn btn-sm btn-secondary accept" value="??????" style="line-height:10px;">??????</button>
		                    </div>
						</c:forEach>
	                </div>
	                
	                <script>
	                	$(".accept").click(function(){
	                		$.ajax({
	                			url:"yesno.pr",
	                			data:{
	                				projNo:$(this).siblings("#projNo").val(),
	                				memNo:${loginUser.empNo},
	                				answer:$(this).val()
	                			},
	                			success:function(result){
	                				alert(result);
	                				location.reload();
	                			},
	                			error:function(){
	                				console.log("??????????????????");
	                			}
	                		})
	                	})
	                </script>
            	</div>
            </div>
               <br><br><br>
            
            
        </div>

        <script>
            $(function(){
	            // ???????????? ?????? ?????? (????????????) ?????? ??? ?????? ??????????????? ?????? ???????????? ?????? ??????
	            // ???, ?????? ????????? ????????? ??????????????? ????????? ????????? ????????? ?????? ??????
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
								alert("?????? ????????? ????????????.");
							}
						},
						error:function(){
							console.log("?????? ???????????? AJAX ?????? ??????");
						}
					})
				})            
            	
				// ?????? ????????? ???????????? ?????? ??????????????? ????????????????????? ??????
            	$(document).on("click", ".card-inner", function(){
            		let form = $(this).siblings("form");
            		form.attr("action", "proom.pr");
            		form.submit();
            	})
            })

            // ???????????? ?????? ????????? ?????? ????????? ?????????????????? ??????
            $(function(){
                $(".project-card").each(function(){
                	console.log("?????????")
                    switch( $(this).children(".progress").val() ){
                        case '??????' : $(this).css("border-left", "10px solid gold"); break;
                        case '??????' : $(this).css("border-left", "10px solid green"); break;
                        case '??????' : $(this).css("border-left", "10px solid orchid"); break;
                        case '??????' : $(this).css("border-left", "10px solid lightgray"); break;
                    }
                })
            })
        </script>
        
        
        

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
