<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WorkPartner!</title>

<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="resources/css/template.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>

<style>
     .inner-area{
         padding:10px;
     }
     .left{
         width:40%;
         height:150px;
         float: left;
     }
     .right{
         float:right;
         width:59%;
         height:150px;
     }
     .pmenu-item{
         float:left;
         list-style: none;
         padding-left: 0px;
         margin-left:30px;
         padding-bottom: 15px;
         font-weight: bold;
     }
     .content>p{
         padding:20px;
         white-space:pre-line;
     }
     .btn-area button{
         width:50px;
         height:20px;
         font-size: 10px;
         line-height: 10px;
         background-color: lightgray;
     }
     .card-comment{
         width:100%;
         background-color: lightgray;
         border-bottom-left-radius: 5px;
         border-bottom-right-radius: 5px;
     }
     ul{
         list-style: none;
     }
	.pmenu-item>span{
     	cursor:pointer;
     }
        .btn-primary{
       background-color: #0442AF;
       border-color:#0442AF;                
   }
   
   .btn-secondary{
   		background-color: rgb(226, 224, 224);
   		color: rgb(36, 35, 35);;
   		border-color: rgb(226, 224, 224);
   	 } 
   .btn-secondary:hover{
   			background-color: rgb(177, 175, 175) !important;
   			color: rgb(36, 35, 35)  !important;
   			border-color: rgb(177, 175, 175)  !important;
   }
	#inchargeEmp li, #memberEmp li{
		display:inline;
		list-style: none;
		font-size:12px;
	}
</style>

</head>
<body>
	<h1 style="font-weight:bolder;"><span>${p.projTitle}</span> 업무 공유방</h1>
    <hr>
            
    <form id="moveToURL" method="post">
		<input type="hidden" name="projNo" value="${p.projNo}">
		<input type="hidden" name="pboardWriter" value="${loginUser.empNo}">
	</form>
	<script>
		function moveToURL(url){
			$("#moveToURL").attr("action", url);
			$("#moveToURL").submit();
		}
	</script>
            
	<div class="project-menubar">
		<ul class="group-pmenu">
			<li class="pmenu-item"><span onclick="moveToURL('proom.pr')">홈</span></li>
			<li class="pmenu-item"><span onclick="moveToURL('duty.pr')">업무</span></li>
			<li class="pmenu-item"><span onclick="moveToURL('meet.pr')">회의</span></li>
		</ul>
		<div align="right">
			<button class="btn btn-sm btn-primary" onclick="moveToURL('newduty.pr')">새로운 업무 등록</button> 
			&nbsp;&nbsp;
			<button class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#newMeeting">새로운 회의 등록</button> 
	    </div>
	</div>
	
	<hr style="clear: both;"><br>	

	<!-- Modal -->
	<div class="modal fade" id="newMeeting" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel"><b>${p.projTitle} 회의 등록</b></h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<form action="insertm.pr" method="post" id="meeting-form">
					<input type="hidden" name="projNo" value="${p.projNo}">
					<input type="hidden" name="pboardWriter" value="${loginUser.empNo}">
					<div class="modal-body" style="margin:0px auto;">
							<span class="title">회의 제목</span>
							<input type="text" class="form-control" name="title" required><br>
							
							<span class="title">회의 내용</span>
							<textarea rows="3" class="form-control" name="content" style="resize:none" required></textarea><br><br>
							
							<div id="pmeet-incharge" style="width:55%; float:left;">
								<span class="title">회의 장소</span><br>
								<select name="meetingPlace">
									<option selected>Room A</option>
									<option>Room B</option>
									<option>Room C</option>
								</select>
								<br><br>
								<span class="title">회의 시작 시간</span><br>
                                <select name="startTime" required>
									<option value="09:00">09:00</option>
									<c:forEach var="i" begin="10" end="17">
										<option value="${ i }:00">${ i }:00</option>       
									</c:forEach>
								</select>
								<br><br>
								<span class="title">회의 담당자</span><br>
								<button type="button" class="btn btn-sm btn-primary search-incharge" style="width:65%">담당자 선택</button><br><br>
								
								<span class="title">캘린더에 추가 여부</span><br>
								<label><input type="radio" name="calendarYN" value="Y"> 추가 O</label>&nbsp; &nbsp; <label style="margin-top:3px;"><input type="radio" name="calendarYN" value="Y"> 추가 X</label>
							</div>
							
							<div id="pmeet-member" style="width:45%; float:left;">
								<span class="title">회의 날짜</span><br>
								<input type="date" name="meetingDate" required><br><br>
								<span class="title">회의 종료 시간</span><br>
								<select name="endTime" required>
									<option value="10:00">10:00</option>
									<c:forEach var="i" begin="11" end="18">
										<option value="${ i }:00">${ i }:00</option>       
									</c:forEach>
								</select><br><br>
								<span class="title">회의 참석자</span><br>
								<button type="button" class="btn btn-sm btn-primary search-member" style="width:80%">참석자 선택</button><br><br>
							</div>
					</div>
					<br style="clear:both"><br>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
						<button type="submit" class="btn btn-primary">등록</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<script>
		
		// 시작일 날짜로 오늘 이전 날짜 불가능하도록 만들기
		let year = new Date().getFullYear();
		let month = ('0' + (new Date().getMonth() + 1)).slice(-2);
		let date = ('0' + new Date().getDate()).slice(-2);
		$("input[name=meetingDate]").attr("min", year + '-' + month + '-' + date );
		
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
	    		
				if(totalByte > 50){
	    			alert("최대 글자수를 초과하였습니다. 다시 입력해주세요.");
	    			// 마지막 글자 삭제해주기
					$(this).val().substring( 0, $(this).val().length - 1 );					
				}	    			
    		}
    	})
	
		// 담당자 조직도 팝업 띄우는 함수
		$(".search-incharge").click(function(){
			$("#inchargeEmp").remove();
			window.name = "parentWindow"
			let childWindow; // 자식창
			childWindow = window.open("addressPcharge.ad","childWindow", "height=700, width=1200, resizable=no, scrollbars=no");  
		})
		
		//
		$(".search-member").click(function(){
			$("#meetingEmp").remove();
			window.name = "parentWindow"
			let childWindow; // 자식창
			childWindow = window.open("addressProjectMeeting.ad","childWindow", "height=700, width=1200, resizable=no, scrollbars=no");  
		})
	
		// 조직도에서부터 empICNo을 ,로 연결한 문자열 받아오는 함수
	   	function sendMeData(data){
	   		$(".search-incharge").after(data);
	   	}
		
		function sendMemberData(data){
			$(".search-member").after(data);
		}
	</script>
	
	
</body>
</html>