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
                <h1 style="font-weight:bolder;">프로젝트 관리</h1>
                <hr>
            </div>
            <div class="project-menubar">
                <ul class="group-pmenu" style="color:black;">
                    <li class="pmenu-item"><a href="manage.pr">프로젝트 관리</a></li>
                    <li class="pmenu-item"><a href="">멤버 관리</a></li>
                </ul>
                <hr style="clear:both;">
            </div>
            <form action="update.pr" method="post" class="inner-area">
            	<input type="hidden" name="projNo" value="${p.projNo}" /> 
            
                <span class="title">프로젝트 제목</span> <br><br>
                <!-- 아래의 input:text의 value에 기존 제목 넣기 -->
                <input type="text" name="projTitle" class="form-control" value="${p.projTitle}" required>
                <br><hr><br>
                <div class="setting-left">
                    <span class="title">시작일</span>
                    <input type="date" name="startDate" class="form-control" value="${p.startDate}" required>
                    <br>
                    <span class="title">진행 상태</span><br>
                    <select name="progress" class="form-control" required>
                    	<option >준비</option>
                    	<option >진행</option>
                    	<option >지연</option>
                    	<option >완료</option>
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
			    			// escape("문자열") : 해당 문자열을 16진수로 반환, 아스키코드는 0x??의 4자리로 표현됨 (한글 등은 4자리 초과)
			    			totalByte += 2;
			    		}else{
			    			totalByte++;
		    			}
			    		
						if(totalByte > 50){
			    			alert("최대 글자수를 초과하였습니다. 다시 입력해주세요.");
			    			// 마지막 글자 삭제해주기
							$(this).val().substring( 0, $(this).val().length - 1 );					
						}	    			
		    		}
		    	})
            </script>
                
                <div class="setting-right">
                    <span class="title">마감일</span>
                    <input type="date" name="endDate" class="form-control" value="${p.endDate}" required>
                </div>
                <br style="clear:both;"><br><hr>
                <div class="submit-area" align="right">
                    <a href="javascript:history.back()" class="btn btn-secondary">이전 페이지로</a>
                    <button class="btn btn-primary">수정사항 반영</button>
                </div>
            </form>
            
            <div class="inner-area" align="right">
            	<button class="btn btn-danger" id="delete-project">이 프로젝트 삭제</button>
            </div>
            
        </div>

        <script>
        	// 프로젝트 삭제
        	$("#delete-project").click(function(){
        		if( confirm("정말 삭제하시겠습니까?") ){
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
        					console.log("프로젝트 삭제 AJAX 통신 실패");
        				}
        			})
        		}else{
        			alert("잘 생각하셨습니다...");
        		}
        	})
        
	    	// 시작일 날짜로 오늘 이전 날짜 불가능하도록 만들기
	    	let year = new Date().getFullYear();
	    	let month = ('0' + (new Date().getMonth() + 1)).slice(-2);
	    	let date = ('0' + new Date().getDate()).slice(-2);
	   		$("input[name=startDate]").attr("min", year + '-' + month + '-' + date );
	   		$("input[name=endDate]").attr("min", year + '-' + month + '-' + date );
	   		
	    	// 마감일 날짜로 시작일 이전 날짜 불가능하도록 만들기
	    	$("input[name=startDate]").change(function(){
	    		$("input[name=endDate]").attr("min", $(this).val());
	    	})
        </script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
