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
            #inchargeEmp li{
                display:inline;
                list-style: none;
                margin-right:10px;
                font-size:12px;
            }
            #inchargeEmp a{
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
            <div class="ztitle-area">
                <h1 style="font-weight:bolder;">프로젝트 업무 등록</h1>
                <hr>
            </div>
            <form action="insertd.pr" method="post" class="inner-area" enctype="multipart/form-data" class="inner-area">
        		<input type="hidden" name="projNo" value="${pb.projNo}">
				<input type="hidden" name="pboardWriter" value="${loginUser.empNo}">
        		<input type="hidden" name="writerName" value="${loginUser.empName}">
        		<input type="hidden" name="refType" value="업무">
        		        		                            
                <span class="title">업무 제목</span> <br><br>
                <input type="text" name="title" class="form-control" required>
                <br>
                <div class="setting-left">
	                <span class="title">상태</span><br>
					<select name="progress" class="form-select">
						<option selected>준비</option>
						<option >진행</option>
						<option >지연</option>
						<option >완료</option>
					</select>
                </div>
                <div class="setting-right">
	                <span class="title">담당자</span><br>
	                <button type="button" class="btn btn-sm btn-primary" id="search-emp" style="width:100%;">담당자 검색</button> <!-- 주소록 띄우는 버튼 -->
					<%-- 이 영역은 조직도로 띄울것임 --%>
                </div>
                <br style="clear:both;"><br>
                
				<script>
	        		// 조직도 팝업 띄우는 함수
	        		$("#search-emp").click(function(){
	        			$("#submit-btn").attr("disabled", true);
	        			$("#inchargeEmp").remove();
	        			window.name = "parentWindow"
	        			let childWindow; // 자식창
	        			childWindow = window.open("addressPcharge.ad","childWindow", "height=700, width=1200, resizable=no, scrollbars=no");  
	        		})
	        		
	        		// 조직도에서부터 empICNo을 ,로 연결한 문자열 받아오는 함수
                	function sendMeData(data){
                		console.log(data);
                		$("#search-emp").after(data);
                		$("#submit-btn").attr("disabled", false);
                	}
                	
                </script>
                
                <div class="setting-left">
                    <span class="title" style="margin-bottom:20px;">캘린더 등록</span><div style="height:5px;"></div>
	                <input type="radio" name="calendarYN" value="Y" id="Y">
	                <label for="Y">업무 일정을 캘린더에 등록</label> <br>
	                <input type="radio" name="calendarYN" value="N" id="N" checked>
	                <label for="N">업무 일정을 캘린더에 등록 안함</label>
                </div>
                <br style="clear:both;"><br><br>
                <div class="content">
                    <span class="title">업무 내용</span><br><br>
                    <textarea name="content" class="form-control" rows="10" style="height:400px; width:100%; overflow:auto; resize:none; requried"></textarea>
                </div>
                <br><br>
                <div class="setting-left">
                    <span class="title">시작일</span>
                    <input type="date" name="startDate" class="form-control" required><br>

                    <span class="title">파일 첨부</span>
                    <input type="file" name="upfile" class="form-control">
                </div>
                <div class="setting-right">
                    <span class="title">마감일</span>
                    <input type="date" name="endDate" class="form-control" required><br>
                    
                </div>
                <br style="clear:both;"><br><hr>
                <div class="submit-area" align="right">
                    <button class="btn btn-secondary" onclick="javascript:history.back();">이전</button>
                    <button class="btn btn-success" id="submit-btn" disabled>등록</button>
                </div>
            </form>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
