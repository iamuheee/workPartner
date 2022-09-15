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
        #list-mem li{
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
                <span style="padding: 10px;">담당자는 최대 3명까지 설정할 수 있습니다.</span>
                <button type="button" class="btn btn-sm btn-primary" id="search-emp">담당자 검색</button> <!-- 주소록 띄우는 버튼 -->
                <input type="hidden" id="identifier" value="duty"> 
                <input type="hidden" name="empIC" value="2,3,4,">
                
                <ul id="list-mem">
                <!-- 
                반복문 돌려서 동적으로 업무 담당자 ArrayList를 Duty의 한 필드로 넣기
               	(dutyNo은 어차피 SEQ_DNO.CURRVAL로 채우면 되니까 여기서 필요 X)
					<li>
						<span>사원이름</span>
                        <button type="button" class="delete-emp">x</button>
		                <input type="hidden" name="empIC[i].empNo" value="자식창에서 받은 empNo값"> 
		                <input type="hidden" name="empIC[o].empName" value="자식창에서 받은 empName값">
					</li>               		
                -->
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
                <textarea name="content" id="summernote" class="form-control" rows="10" required style="height:400px; width:100%; overflow:auto; resize:none;"></textarea>
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
    
    <!-- summerNote 관련 script-->
	<script>
	    $(document).ready(function() {
	        //여기 아래 부분
	        $('#summernote').summernote({
	            height: 400px,                 // 에디터 높이
	            focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
	            lang: "utf-8",					// 한글 설정
	            placeholder: '내용을 입력해주세요',	//placeholder 설정                   
	            toolbar: [
	                    // 글꼴 설정
	                    ['fontname', ['fontname']],
	                    // 글자 크기 설정
	                    ['fontsize', ['fontsize']],
	                    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
	                    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
	                    // 글자색
	                    ['color', ['forecolor','color']],
	                    // 표만들기
	                    ['table', ['table']],
	                    // 글머리 기호, 번호매기기, 문단정렬
	                    ['para', ['ul', 'ol', 'paragraph']],
	                    // 줄간격
	                    ['height', ['height']]
	                ],
	                // 추가한 글꼴
	                fontNames: ['맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
	                // 추가한 폰트사이즈
	                fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36']
	        });               
	        
	    });
	</script>
    
    
    <script>

    	// 시작일 날짜로 오늘 이전 날짜 불가능하도록 만들기
    	let year = new Date().getFullYear();
    	let month = ('0' + (new Date().getMonth() + 1)).slice(-2);
    	let date = ('0' + new Date().getDate()).slice(-2);
   		$("input[name=startDate]").attr("min", year + '-' + month + '-' + date );
    	
   		
    	// 마감일 날짜로 시작일 이전 날짜 불가능하도록 만드는 이벤트
    	$("input[name=startDate]").change(function(){
    		$("input[name=endDate]").attr("min", $(this).val());
    	})
    	
    	
    	// TB_DUTY의 TITLE 컬럼의 자료형은 VARCHAR2(500BYTE)임 -> 제목 란에 500BYTE 초과하게 적으면 막아줘야 함
    	$("input[name=title]").keyup(function(){
    		let totalByte = 0;
    		for( let i=0; i< $(this).val().length; i++ ){
	    		if( escape($(this).val().charAt(i)) > 4 ){ 
	    			// escape("문자열") : 해당 문자열을 16진수로 반환, 아스키코드는 0x??의 4자리로 표현됨 (한글 등은 4자리 초과)
	    			totalByte += 2;
	    		}else{
	    			totalByte++;
    			}
	    		
				if(totalByte > 1000){
	    			alert("최대 글자수를 초과하였습니다. 다시 입력해주세요.");
	    			// 마지막 글자 삭제해주기
					$(this).val().substring( 0, $(this).val().length - 1 );					
				}	    			
    		}
    	})
    	
    	
    	// #submit-btn 클릭시 발생하는 이벤트
    	$("#submit-btn").click(function(){
    		let $empIC = $("input[name=empIC]").val();
    		$empIC = $empIC.substr(0, $empIC.length - 1); // substr(시작인덱스, 개수)
    		$("form").submit();
    	})
    	
    	
		// 조직도 팝업 띄우는 함수
		$("#search-emp").click(function(){
			window.name = "parentWindow"
			let childWindow; // 자식창
			childWindow = window.open("addressAdmin.ad","childWindow", "height=700, width=1100, resizable=no, scrollbars=no");  
		})
	   	
		// 담당자 이름 옆 x 버튼 클릭이벤트 발생시 해당 li요소 삭제
		$(".delete-emp").click(function(){
			$(this).parent("li").remove();
	   	})

    </script>
    	
   	
   	<script>
		// 조직도 팝업에서 담당자에 대한 정보 넘겨받고, 반복문 돌려 li요소로 담당자들을 출력하는 함수 ( html(문자열) 이용 )
		let liEl = ""; // for문 돌려가며 li요소 추가할 것임 (에이작스 석세스펑션처럼)
		
		   	
   	</script>
	    	
	    	
	    	

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
</body>
</html>
