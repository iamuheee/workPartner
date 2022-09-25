<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style>


.insertBtn {
	font-size: 18px;
	color: black;
	font-weight: bold;
	margin-left: 10px;
	border-right: 0.5px solid #878787;
	padding-right: 15px;
}

.insertBtn:hover {
	color: gray;
	cursor: pointer;
}

.mainTitle {
	width: 100%;
	margin-top: 10px;
}

hr {
	opacity: 0.4;
	width: 100%;
}

h3 {
	margin: 0;
	margin-bottom: 10px;
	margin-left: 10px;
}

.dtpaperName {
	line-height: 10px;
}

table {
	font-size: 16px;
	border-spacing: 0px;
	border: 0.5px solid #878787;
}

tr {
	height: 30px;
}

a {
	color: blue
}

th {
	font-weight: 400;
}

th, td {
	
}

.signSelect tr {
	text-align: center;
	width: 100%;
}

.signSelect th {
	background-color: #f1f1f1;
	width: 101px;
}

.signSelect td {
	width: 125px;
	border: 0;
}

.publicPaper th {
	background-color: #f1f1f1;
	width: 100px;
}

.publicPaper td {
	width: 664px;
	border: 0;
}

.titleSection th, td {
	border-bottom: 0.5px solid solid #878787;
}

.plusVa {
	margin-left: 10px;
	font-size: 16px;
	height: 30px;
	border: none;
	box-shadow: 0px 0px 4px #878787;
}

.plusVa:hover {
	cursor: pointer;
	background-color: #8787874d;
}

.selectVa {
	margin: 10px;
	font-size: 16px;
}

.selectVa>span {
	margin-right: 10px;
}

input, select, textarea {
	border: 0.5px solid rgba(143, 143, 143, 0.547)
}

input[type=text] {
	width: 97%;
	box-sizing: border-box;
	margin: auto;
	height: 100%;
	border: 0;
	font-size: 16px;
	background-color: #ffffff48;
	padding: auto;
}

</style>



</head>
<body style="width: 800px; font-family: 'Noto Sans KR', sans-serif;">
	<c:if test="${ not empty alertSignMsg }">
		<script>
			alert("${alertSignMsg}");
		</script>
		<c:remove var="alertSignMsg" scope="session" />
	</c:if>
	<form action="" method="post" name="insertForm" id="insertForm" enctype="multipart/form-data"> 
		
	<section class="mainTitle">
			<a class="insertBtn" onclick="insertCheck();">기안하기</a>
			<a class="insertBtn" onclick="saveCheck()">임시저장</a>
		<a class="insertBtn" id="btn-modal" onclick="openAddressWindow();">결재선 추가</a>
		<hr>
	</section>
	<!-- 기안하기 폼 액션값 변경 폼.si 가면 반환값 paperName -->
	<script>
		function insertCheck() {
			 let count = $("#signList tr").length;
		        
		        if(count > 0){
					if (confirm("기안하시겠습니까?") == true) { //확인
						
						if('${paperName}' == '연차'){
							document.insertForm.action = "insertV.si";
						}else if('${paperName}' == '외근'){
							document.insertForm.action = "insertOw.si";
						}else if('${paperName}' == '업무협조'){
							document.insertForm.action = "insertCo.si";
						}else {
							document.insertForm.action = "insertRe.si";
						}
						document.insertForm.submit();
		
					} else { //취소
						return false;
					}
		        }else{
		     	    alert("결재선을 설정해주세요.");
		            return false;
		        }
		}
	</script>
	<!-- 임시저장 폼 액션값 변경 -->
	<script>
		function saveCheck() {
			if (confirm("임시저장하시겠습니까?") == true) { //확인
				
				if('${paperName}' == '연차'){
					document.insertForm.action = "saveVa.si";
				}else if('${paperName}' == '외근'){
					document.insertForm.action = "saveOt.si";
				}else if('${paperName}' == '업무협조'){
					document.insertForm.action = "saveCo.si";
				}else {
					document.insertForm.action = "saveRe.si";
				}
				document.insertForm.submit();
			} else { //취소
				return false;
			}
		}
	</script>
	
	<section>
		<div>
			<h2 class="dtpaperName">
				<span><input type="hidden" name="dpCategory" value="${ paperName }">${ paperName }</span> 신청서 - <span
					style="font-weight: lighter;"><input type="hidden" name="empNo" value="${ loginUser.empNo }">${ loginUser.empName }(${ loginUser.depCd })</span>
			</h2>
			<hr>
		</div>
	</section>
	<section class="signSelect">
		<div>
			<h3>결재선</h3>
			<table align="center" id="signList" style="width:300px!important;">
			
			</table>
		</div>
	</section>
	<hr style="margin-top: 10px;">
	<section class="publicPaper">
		<div>
			<table align="center">
				<tr class="titleSection" align="center">
					<th style="border-bottom: 0.5px solid rgba(143, 143, 143, 0.547);">제목</th>
					<td align="left"
						style="border-bottom: 0.5px solid rgba(143, 143, 143, 0.547);">
						<input type="text" style="margin-left: 10px; width: 95%;"
						name="dpTitle">
					</td>
				</tr>
				<tr style="border-top: 0.5px solid rgba(143, 143, 143, 0.547);"  align="center">
					<th>첨부파일</th>
					<td align="left"><input type="file" id="upfile" name="upfile" style="margin-left: 10px; border: 0;"></td>
				</tr>
			</table>
		</div>
	</section>
<script>
	$(function(){
	    $(document).on("click", ".removeMail", function(){ // x클릭시 실행할 내용
	        // 현재 클릭이벤트가 발생한 x의 부모요소들 중에 tr 태그인 요소만 선택 => remove();                            
	        $(this).parent().parent().remove();     
	    })
	})
        <!-- 이메일 주소록 관련 (자식창 open 및 data 받기)  -->
            var newWindow;
            function openAddressWindow(){
                newWindow = window.open("${pageContext.request.contextPath}/addressAdmin.si","addressWindow", "height=700, width=1100");                
            }

            function sendData(data){
                
                let count2 = $("#signList tr").length;
					
                /* if(count2 < 3){
                    $("#recipientTB").append(data); 
                }else{
                    alert("3명까지만 가능합니다.");                    
                    searchCCEmail.attr("placeholder", "총 3개까지 가능합니다.");
                }     */    
                if(count2 + data.length < 4){
                	 $("#signList").append(data); 
                }else{
                	alert("3명까지만 가능합니다.");  
                }
               
            }
            
        </script>

	<!-- <script>
	var newWindow;
    function openAddressTo(){
        newWindow = window.open("${pageContext.request.contextPath}/addressEmail.ad","addressWindow", "height=700, width=1100");                
    }

    function sendData(data){
        
        let count2 = $("#signList tr").length;
			
        /* if(count2 < 3){
            $("#recipientTB").append(data); 
        }else{
            alert("3명까지만 가능합니다.");                    
            searchCCEmail.attr("placeholder", "총 3개까지 가능합니다.");
        }     */    
        if(count2 + data.length < 4){
        	 $("#signList").append(data); 
        }else{
        	alert("3명까지만 가능합니다.");  
        }
       
    }
    function submitCheck(){
 	   let count = $("#recipientTB tr").length;
       
        if(count > 0){
            return true;
        }else{
     	    alert("받는사람 이메일을 입력해주세요");
             return false;
        }
    }
	</script>  -->
</body>
</html>