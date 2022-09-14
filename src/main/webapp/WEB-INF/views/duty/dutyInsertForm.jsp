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
        .list-mem li{
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
            
            <span class="title">업무 제목</span> <br><br>
            <input type="text" name="title" class="form-control" required>
            <br><br>
            
            <div class="setting-left">
                <span class="title">상태</span><br>
				<select name="progress" class="form-select">
					<option value="1" selected>준비</option>
					<option value="2">진행</option>
					<option value="3">지연</option>
					<option value="4">완료</option>
				</select>
            </div>
            
            <div class="setting-right">
                <span class="title">우선 순위</span><br>
				<select name="importance" class="form-select">
					<option value="1">긴급</option>
					<option value="2">중요</option>
					<option value="3" selected>보통</option>
					<option value="4">낮음</option>
				</select>
            </div>
            
            <br style="clear:both;"><br>
            
            <div class="setting-left">
                <span class="title">담당자</span><br>
                <button type="button" class="btn btn-sm btn-primary" id="search-emp">담당자 검색</button> <!-- 주소록 띄우는 버튼 -->
                <input type="hidden" name="empIC" value="2,3,4,">
                <!-- 주소록 만들어봐야 알지만 -->
                <!-- 담당자의 사번을 ,로 이어서 Controller에 넘기기 => IN(?,?,?)으로 담당자 조회할 수 있도록 -->
                <!-- 아래의 li요소들은 동적 요소로 for문 돌려 만들어야 할듯../??  -->
                <ul class="list-mem">
                    <li>
                        <span>김개똥</span>
                        <button type="button" class="delete-emp">x</button>
                    </li>
                    <li>
                        <span>김소똥</span>
                        <button type="button" class="delete-emp">x</button>
                    </li>
                </ul>
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
                <textarea name="content" class="form-control" rows="10" required style="height:400px; width:100%; overflow:auto; resize:none;"></textarea>
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
                <button class="btn btn-primary" id="submit-btn">등록</button>
            </div>
        </form>
    </div>
    
    
    <script>
    	$(function(){
	    	// 담당자 이름 옆 x 버튼 클릭시 발생하는 이벤트
	    	// => 왜 안돼? 선언적 함수로 다시 써보기 혹시모르니까...
	    	$(".delete-emp").click(function(){
	    		$(this).parent("li").remove();
	    	})    
    	
	    	// 시작일 날짜로 오늘 이전 날짜 불가능하도록 만들기
	    	let year = new Date().getFullYear();
	    	let month = ('0' + (new Date().getMonth() + 1)).slice(-2);
	    	let date = ('0' + new Date().getDate()).slice(-2);
    		$("input[name=startDate]").attr("min", year + '-' + month + '-' + date );
	    	
	    	// 마감일 날짜로 시작일 이전 날짜 불가능하도록 만드는 이벤트
	    	$("input[name=startDate]").change(function(){
	    		$("input[name=endDate]").attr("min", $(this).val());
	    	})
	    	
	    	// #submit-btn 클릭시 발생하는 이벤트
	    	$("#submit-btn").click(function(){
	    		let $empIC = $("input[name=empIC]").val();
	    		$empIC = $empIC.substr(0, $empIC.length - 1); // substr(시작인덱스, 개수)
	    		console.log($empIC);
	    		$("form").submit();
	    	})
	    	
    	})
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
</body>
</html>
