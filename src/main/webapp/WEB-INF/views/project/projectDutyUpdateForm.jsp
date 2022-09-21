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
                <h1 style="font-weight:bolder;">프로젝트 업무 수정</h1>
                <hr>
            </div>
            <form action="updated.pr" method="post" class="inner-area" enctype="multipart/form-data" class="inner-area">
        		<input type="hidden" name="projNo" value="${pb.projNo}">
        		<input type="hidden" name="pboardNo" value="${pb.pboardNo}">
				<input type="hidden" name="pboardWriter" value="${loginUser.empNo}">
        		<input type="hidden" name="writerName" value="${loginUser.empName}">
        		<input type="hidden" name="refType" value="업무">
        		        		                            
                <span class="title">업무 제목</span> <br><br>
                <input type="text" name="title" value="${pb.title}" class="form-control" required>
                <br>
                <div class="setting-left">
	                <span class="title">상태</span><br>
					<select name="progress" class="form-select">
						<option >준비</option>
						<option >진행</option>
						<option >지연</option>
						<option >완료</option>
					</select>
                </div>
                
				<script>
	            	$(function(){
	            		$("select[name=progress]>option").each(function(){
		            		if( $(this).text() == "${pb.pduty.progress}" ){
		            			$(this).attr("selected", true);
		            		}
	            		})
	            	})
				</script>
                
                <div class="setting-right">
	                <span class="title">담당자</span><br>
	                <button type="button" class="btn btn-sm btn-primary" id="search-emp" style="width:100%;">담당자 검색</button> <!-- 주소록 띄우는 버튼 -->
						<div id="inchargeEmp">
							<input type="hidden" name="incharge" value="${pb.pduty.incharge}">
							<input type="hidden" name="inchargeName" value="${pb.pduty.inchargeName}">
							<span>현재 담당자 : </span>
							<span>${pb.pduty.inchargeName}</span>
		                </div>
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
	        		
	        		// 조직도에서부터 문자열 받아오는 함수
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
                
				<script>
	           		if( ${pb.pduty.calendarYN} == 'Y' ){
	           			$("#Y").attr("checked", true);
	           		}else{
	           			$("#N").attr("checked", true);
	           		}
				</script>
                
                <br style="clear:both;"><br><br>
                <div class="content">
                    <span class="title">업무 내용</span><br><br>
                    <textarea name="content" class="form-control" rows="10" style="height:400px; width:100%; overflow:auto; resize:none;">${pb.content}</textarea>
                </div>
                <br><br>
                <div class="setting-left">
                    <span class="title">시작일</span>
                    <input type="date" name="startDate" value="${pb.pduty.startDate}" class="form-control" required><br>

                    <span class="title">파일 첨부</span>
                    <input type="file" name="upfile" class="form-control">
					<c:if test="${not empty pb.file}">
	            		<span>기존 파일 : </span>
		            	<a href="${pb.file.filePath}">${pb.file.fileOriginName}</a>
		            	<input type="hidden" name="fileOriginName" value="${ pb.file.fileOriginName }">
		                <input type="hidden" name="filePath" value="${ pb.file.filePath }">
		                <input type="hidden" name="refNo" value="${pb.file.refNo}">
	            	</c:if>
                </div>
                <div class="setting-right">
                    <span class="title">마감일</span>
                    <input type="date" name="endDate" value="${pb.pduty.endDate}" class="form-control" required><br>
                </div>
                
                <script>
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
	            	
          	    	// TB_DUTY의 TITLE 컬럼의 자료형은 VARCHAR2(50BYTE)임 -> 제목 란에 500BYTE 초과하게 적으면 막아주기
			    	$("input[name=title]").keyup(function(){
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
                
                <br style="clear:both;"><br><hr>
                <div class="submit-area" align="right">
                    <button class="btn btn-secondary" onclick="javascript:history.back();">이전</button>
                    <button class="btn btn-success" id="submit-btn" >등록</button>
                </div>
            </form>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
