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
            width:40%;
        }
        .setting-right{
            float:left;
            margin-left:150px;
            width:40%;
            word-break: break-all;
        }
        .btn-imp{
       		border:none;
       		border-radius:5px;
       		width:50px;
       		height:20px;
            line-height: 10px;
            background-color: lightgray;
            font-size: 12px;
        }
        #empICList li{
            display:inline;
            list-style: none;
            margin-right:10px;
            font-size:12px;
        }
        .delete-emp{
        	background-color:white;
        	border:none;
            color:red;
            padding-left:5px;
        }
        .hidden-info{
        	display:none;
        }
        #search-emp{
        	width:100%;
        }
    </style>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	
	<jsp:include page="../common/menubar.jsp" />

    <br><br><br>
    <div class="container">
        <div class="title-area">
            <h1 style="font-weight:bolder;">개인 업무 등록</h1>
            <hr>
        </div>
        <form action="insert.du" method="post" enctype="multipart/form-data" class="inner-area">
        	<input type="hidden" name="empNo" value="${ loginUser.empNo }">
        	<input type="hidden" name="empName" value="${loginUser.empName}">            
            <span class="title">업무 제목</span> <br><br>
            <input type="text" name="title" class="form-control" required>
            <br><br>
            
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
                <span class="title">우선 순위</span><br>
				<select name="importance" class="form-select">
					<option >긴급</option>
					<option >중요</option>
					<option selected>보통</option>
					<option >낮음</option>
				</select>
            </div>
            
            <br style="clear:both;"><br>
            
            <div class="setting-left" id="duty-incharge">
                <span class="title">담당자</span><br>
                <span style="padding: 10px;">담당자는 최대 3명까지 설정할 수 있습니다.</span>
                <button type="button" class="btn btn-sm btn-primary" id="search-emp">담당자 검색</button> <!-- 주소록 띄우는 버튼 -->
                
                <script>
	        		// 조직도 팝업 띄우는 함수
	        		$("#search-emp").click(function(){
	        			$("#empIC").remove();
	        			window.name = "parentWindow"
	        			let childWindow; // 자식창
	        			childWindow = window.open("addressDuty.ad","childWindow", "height=700, width=1100, resizable=no, scrollbars=no");  
	        		})
	        		
	        		// 조직도에서부터 empICNo을 ,로 연결한 문자열 받아오는 함수
                	function sendMeData(data){
                		console.log(data);
                		$("#search-emp").after(data);
                		$("#submit-btn").attr("disabled", false);
                	}
                	
                </script>
                
            </div>
            
            <div class="setting-right">
                <span class="title" style="margin-bottom:20px;">캘린더 등록</span><div style="height:5px;"></div>
                <input type="radio" name="calendarYN" value="Y" id="Y">
                <label for="Y">업무 일정을 캘린더에 등록</label> <br>
                <input type="radio" name="calendarYN" value="N" id="N" checked>
                <label for="N">업무 일정을 캘린더에 등록 안함</label> 
            </div>
            
            <br style="clear:both;"><br>
            
            <div class="content">
                <span class="title">업무 내용</span><br><br>
                <textarea name="content" id="summernote" required style="height:400px; width:100%; overflow:auto; resize:none;"></textarea>
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
                <input type="reset" class="btn btn-secondary" value="초기화" />
                <button class="btn btn-primary" id="submit-btn" disabled>등록</button>
            </div>
            
        </form>
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
    	
    	
    	// TB_DUTY의 TITLE 컬럼의 자료형은 VARCHAR2(500BYTE)임 -> 제목 란에 500BYTE 초과하게 적으면 막아주기
    	$("input[name=title]").keyup(function(){
    		let totalByte = 0;
    		for( let i=0; i< $(this).val().length; i++ ){
	    		if( escape($(this).val().charAt(i)) > 4 ){ 
	    			// escape("문자열") : 해당 문자열을 16진수로 반환, 아스키코드는 0x??의 4자리로 표현됨 (한글 등은 4자리 초과)
	    			totalByte += 2;
	    		}else{
	    			totalByte++;
    			}
	    		
				if(totalByte > 500){
	    			alert("최대 글자수를 초과하였습니다. 다시 입력해주세요.");
	    			// 마지막 글자 삭제해주기
					$(this).val().substring( 0, $(this).val().length - 1 );					
				}	    			
    		}
    	})
    </script>
    	
   	

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
</body>
</html>
