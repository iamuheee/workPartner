<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
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

        th,
        td {
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

        .titleSection th,
        td {
            border-bottom: 0.5px solid #878787;
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

        input,
        select,
        textarea {
            border: 0.5px solid #878787;
        }
        input[type=text] {
	width: 95%;
	margin: auto;
	margin-left:10px;
	height: 100%;
	border: 0;
	font-size: 16px;
	background-color: #ffffff48 !important;
	padding: auto;
}
    </style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>
<!-- onload="window.resizeTo(620,800)" -->
<body style="width: 800px; font-family: 'Noto Sans KR', sans-serif;">
<c:if test="${ not empty alertSignMsg }">
		<script>
			alert("${alertSignMsg}");
		</script>
		<c:remove var="alertSignMsg" scope="session" />
	</c:if>
	<form action="" method="post" name="insertForm" id="insertForm" enctype="multipart/form-data"> 
	<input type="hidden" name="dpFinal" value="${ t.dpFinal }">
		
	<section class="mainTitle">
		<c:choose>
			<c:when test="${ t.dpFinal == '임시저장'}">
				<a class="insertBtn" onclick="insertCheck()">다시 기안하기</a>
				<a class="insertBtn" onclick="deleteCheck()">삭제하기</a>
				<a class="insertBtn" id="btn-modal" onclick="openAddressWindow()">결재선 추가</a>
			</c:when>
			<c:when test="${ t.dpFinal == '반려됨' }">
				<a class="insertBtn" onclick="insertCheck()">다시 기안하기</a>
				<a class="insertBtn" onclick="deleteCheck()">삭제하기</a>
				<a class="insertBtn" id="btn-modal" onclick="openAddressWindow()">결재선 추가</a>
			</c:when>
			<c:otherwise>
				<a class="insertBtn" onclick="insertCheck()">기안하기</a>
				<a class="insertBtn" onclick="deleteCheck()">삭제하기</a>
			</c:otherwise>
		</c:choose>
		<hr>
	</section>
<!-- 	<script>
		function saveCheck() {
			if (confirm("임시저장하시겠습니까?") == true) { //확인
				if('${paperName}' == '연차'){
					document.insertForm.action = "updateVa.si";
				}else if('${paperName}' == '외근'){
					document.insertForm.action = "updateOt.si";
				}else if('${paperName}' == '업무협조'){
					document.insertForm.action = "updateCo.si";
				}else {
					document.insertForm.action = "updateRe.si";
				}
				document.insertForm.submit();
			} else { //취소
				return false;
			}
		}
	</script> -->
	<script>
		function insertCheck() {
				console.log('${t.dpFinal}');
			if (confirm("기안하시겠습니까?") == true) { //확인
				if('${ t.dpFinal}' != "임시저장" && '${ t.dpFinal}' != "반려됨"){
					if('${ t.dpCategory }' == '연차'){
						document.insertForm.action = "updateSi.si?dpNo=" + ${t.dpNo} + "&ct=연차"
					}else if('${ t.dpCategory }' == '외근'){
						document.insertForm.action = "updateSi.si?dpNo=" + ${t.dpNo} + "&ct=외근";
					}else if('${ t.dpCategory }' == '업무협조'){
						document.insertForm.action = "updateSi.si?dpNo=" + ${t.dpNo} + "&ct=업무협조";
					}else {
						document.insertForm.action = "updateSi.si?dpNo=" + ${t.dpNo} + "&ct=퇴직원";
					}
				}else if('${ t.dpFinal}' == '반려됨'){
					if('${ t.dpCategory }'  == '연차'){
						document.insertForm.action = "insertReVa.si";
					}else if('${ t.dpCategory }'  == '외근'){
						document.insertForm.action = "insertReOw.si";
					}else if('${ t.dpCategory }'  == '업무협조'){
						document.insertForm.action = "insertReCo.si";
					}else {
						document.insertForm.action = "insertReRe.si";
					}
				}else{
					if('${ t.dpCategory }'  == '연차'){
						document.insertForm.action = "updateRsi.si?dpNo=" + ${t.dpNo} + "&ct=연차";
					}else if('${ t.dpCategory }'  == '외근'){
						document.insertForm.action = "updateRsi.si?dpNo=" + ${t.dpNo} + "&ct=외근";
					}else if('${ t.dpCategory }'  == '업무협조'){
						document.insertForm.action = "updateRsi.si?dpNo=" + ${t.dpNo} + "&ct=업무협조";
					}else {
						document.insertForm.action = "updateRsi.si?dpNo=" + ${t.dpNo} + "&ct=퇴직원";
					}
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
				<span>${ t.dpCategory }</span> 신청서 - <span
					style="font-weight: lighter;">${ t.empName }(${ t.signEmpDept})</span>
			</h2>
            <hr>
        </div>
    </section>
    <section class="signSelect">
        <div>
            <h3>결재선</h3>
            <table align="center" style="border:0;" id="adminList">
	         	<c:choose>
	         		<c:when test="${ t.dpFinal == '임시저장'}">
	         				
	         		</c:when>
	         		<c:when test="${ t.dpFinal == '반려됨'}">
	         				
	         		</c:when>
	         		<c:otherwise>
	            		<tr>
			            	<c:forEach var="s" items="${ selectSignList }">
								<td style="border:0.5px solid #878787; background: #f1f1f1;">
									결재선
								 </td>
								<td style="border:0.5px solid #878787">
								   ${ s.signEmpName }
								</td>
		            		</c:forEach>
						</tr>
		            </c:otherwise>
           		</c:choose>
            </table>
        </div>
    </section>
    <hr style="margin-top: 10px;">
    <section class="publicPaper">
        <div>
            <table align="center">
                <tr class="titleSection">
                    <th style="border-bottom:0.5px solid #878787;">제목</th>
                    <td align="left" style="border-bottom:0.5px solid #878787;">
                    <input type="text" name="dpTitle" style="margin-left:10px;" value="${ t.dpTitle }"></td>
                </tr>
                <tr style="border-top:0.5px solid #878787;">
                    <th>첨부파일</th>
                    <td align="left" style="vertical-align:middle; padding:0;">
                          <input type="file" id="upfile" name="reupfile" style="margin-left:10px">
                       	 <c:if test="${ not empty t.dpOrigin }">
                       	 	<span style="margin-top: 15px;">현재 업로드된 파일 - </span> 
                       		<a style="margin-left:10px" href="${ t.dpChange }" download="${ t.dpOrigin }">${ t.dpOrigin }</a>
                       		<input type="hidden" name="dpOrigin" value="${ t.dpOrigin }">
                          	<input type="hidden" name="dpChange" value="${ t.dpChange }">
                       	</c:if>
                    </td>
                </tr>
            </table>
        </div>
    </section>
    <script>
		var chartPopup;
		function openAddressWindow() {
			chartPopup = window.open(
					"${pageContext.request.contextPath}/addressAdmin.si",
					"addressWindow", "height=700, width=1100");
		}

		/* 자식창으로부터 전달된 정보  */
		function sendMeData(data) {
			//console.log(data);
			$("#adminList").append(data);
		}
	</script> 
</body>
</html>