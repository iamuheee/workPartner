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
            .pmenu-item{
                float:left;
                list-style: none;
                padding-left: 0px;
                margin-left:30px;
                padding-bottom: 15px;
                font-weight: bold;
            }
            .inner-area{
                padding:100px;
                padding-top:10px;
                padding-bottom:50px;
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
                line-height: 10px;
                background-color: lightgray;
                font-size: 15px;
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
                <h1 style="font-weight:bolder;">???????????? ??????</h1>
                <hr>
            </div>
            <div class="project-menubar">
                <ul class="group-pmenu" style="color:black;">
                    <li class="pmenu-item"><a href="manage.pr">???????????? ??????</a></li>
                    <li class="pmenu-item"><a href="member.pr?projNo=${p.projNo}">?????? ??????</a></li>
                </ul>
                <hr style="clear:both;">
            </div>
            <form action="update.pr" method="post" class="inner-area">
            	<input type="hidden" name="projNo" value="${p.projNo}" /> 
            
                <span class="title">???????????? ??????</span> <br><br>
                <!-- ????????? input:text??? value??? ?????? ?????? ?????? -->
                <input type="text" name="projTitle" class="form-control" value="${p.projTitle}" required>
                <br><hr><br>
                <div class="setting-left">
                    <span class="title">?????????</span>
                    <input type="date" name="startDate" class="form-control" value="${p.startDate}" required>
                    <br>
                    <span class="title">?????? ??????</span><br>
                    <select name="progress" class="form-control" required>
                    	<option >??????</option>
                    	<option >??????</option>
                    	<option >??????</option>
                    	<option >??????</option>
                    </select>
                </div>
                
				<script>
            	$(function(){
            		$("select[name=progress]>option").each(function(){
	            		if( $(this).text() == "${p.progress}" ){
	            			$(this).attr("selected", true);
	            		}
            		})
            	})
            	
            	$("input[name=projTitle]").keyup(function(){
		    		let totalByte = 0;
		    		for( let i=0; i< $(this).val().length; i++ ){
			    		if( escape($(this).val().charAt(i)) > 4 ){ 
			    			// escape("?????????") : ?????? ???????????? 16????????? ??????, ?????????????????? 0x????? 4????????? ????????? (?????? ?????? 4?????? ??????)
			    			totalByte += 2;
			    		}else{
			    			totalByte++;
		    			}
			    		
						if(totalByte > 50){
			    			alert("?????? ???????????? ?????????????????????. ?????? ??????????????????.");
			    			// ????????? ?????? ???????????????
							$(this).val().substring( 0, $(this).val().length - 1 );					
						}	    			
		    		}
		    	})
            </script>
                
                <div class="setting-right">
                    <span class="title">?????????</span>
                    <input type="date" name="endDate" class="form-control" value="${p.endDate}" required>
                </div>
                <br style="clear:both;"><br><hr>
                <div class="submit-area" align="right">
                    <a href="javascript:history.back()" class="btn btn-secondary">?????? ????????????</a>
                    <button class="btn btn-primary">???????????? ??????</button>
                </div>
            </form>
            
            <div class="inner-area" align="right">
            	<button class="btn btn-danger" id="delete-project">??? ???????????? ??????</button>
            </div>
            
        </div>

        <script>
        	// ???????????? ??????
        	$("#delete-project").click(function(){
        		if( confirm("?????? ?????????????????????????") ){
        			$.ajax({
        				url:"delete.pr",
        				data:{
        					projNo : ${p.projNo}
        				},
        				success:function(result){
        					alert(result);
        					location.href="list.pr";
        				},
        				error:function(){
        					console.log("???????????? ?????? AJAX ?????? ??????");
        				}
        			})
        		}else{
        			alert("??? ?????????????????????...");
        		}
        	})
        
	    	// ????????? ????????? ?????? ?????? ?????? ?????????????????? ?????????
	    	let year = new Date().getFullYear();
	    	let month = ('0' + (new Date().getMonth() + 1)).slice(-2);
	    	let date = ('0' + new Date().getDate()).slice(-2);
	   		$("input[name=startDate]").attr("min", year + '-' + month + '-' + date );
	   		$("input[name=endDate]").attr("min", year + '-' + month + '-' + date );
	   		
	    	// ????????? ????????? ????????? ?????? ?????? ?????????????????? ?????????
	    	$("input[name=startDate]").change(function(){
	    		$("input[name=endDate]").attr("min", $(this).val());
	    	})
        </script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
