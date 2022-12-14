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
                height:615px;
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
                            <span class="title">???????????? ????????????</span>
                            <a href="" style="float:right; ">????????? +</a>
                            <hr>
                        </div>
                        <div class="inner-area">
			            	<c:forEach var="p" end="4" items="${ plist }">
				                <div class="project-card" >
				                    <input type="hidden" class="progress" value="${p.progress}">
				                    <form id="projectForm"> <input type="hidden" name="projNo" value="${p.projNo}"> </form>
				                    <button class="manageProj" class="manage" style="margin-left:65%; border:none;background-color:transparent; width:50px; height:30px;">
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
                        <script>
	                        $(function(){
	                            $(".project-card").each(function(){
	                                switch( $(this).children(".progress").val() ){
	                                    case '??????' : $(this).css("border-left", "10px solid gold"); break;
	                                    case '??????' : $(this).css("border-left", "10px solid green"); break;
	                                    case '??????' : $(this).css("border-left", "10px solid orchid"); break;
	                                    case '??????' : $(this).css("border-left", "10px solid lightgray"); break;
	                                }
	                            })
	                        })
	                        
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
              
						</script>
                    </div>
                </div>

                <br>                
                <div class="left-bottom card shadow-sm border-1 rounded-lg">
                    <div class="card-body">
                        <div class="title-area">
                            <span class="title">?????? ?????????</span>
                            <a href="" style="float:right; ">????????? +</a>
                            <hr>
                        </div>
                        <div class="inner-area">
                            <span>?????? ????????? ?????? <br><br><br><br><br><br><br><br><br><br></span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="right card shadow-sm border-1 rounded-lg"><div class="card-body">
                <div class="title-area">
                    <span class="title">?????? ???????????? ??????</span>
                    <a href="" style="float:right; ">????????? +</a>
                    <hr>
                </div>
                <div class="inner-area">
                   	<c:forEach var="i" items="${ilist}">
	                    <div class="invitation">
	                        <span style="font-weight:bold; line-height: 30px;">${i.projTitle}</span>
	                        <span style="font-size:10px;">${i.memRole}</span>
	                        <div class="btn-area" align="right" style="float:right">
	                        	<input type="hidden" id="projNo" value="${i.projNo}">
	                            <button class="btn btn-sm btn-primary accept" value="??????">??????</button>
	                            <button class="btn btn-sm btn-secondary accept" value="??????">??????</button>
	                        </div>
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
                				location.href();
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
