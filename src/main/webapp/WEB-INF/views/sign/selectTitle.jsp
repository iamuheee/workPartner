<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
            border-right: 0.5px solid rgba(143, 143, 143, 0.547);
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
            margin-left: 10px;
            line-height: 10px;
        }

        table {
            font-size: 16px;
            border-spacing: 0px;
            border: 0.5px solid rgba(143, 143, 143, 0.547);
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
            border-right: 0.5px solid rgba(143, 143, 143, 0.547);
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
            width: 150px;
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
            border-bottom: 0.5px solid rgba(143, 143, 143, 0.547);
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
            border: 0.5px solid rgba(143, 143, 143, 0.547)
        }
    </style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>
<!-- onload="window.resizeTo(620,800)" -->
<body style="width: 800px; font-family: 'Noto Sans KR', sans-serif;">

<form action="" method="post" name="updateForm" id="updateForm" 
		enctype="multipart/form-data"> 
	<input type="hidden" name="dpCategory" value="${ paperName }">
		
	<section class="mainTitle">
			<a class="insertBtn" onclick="updateCheck();">기안서 재작성</a>
            <a class="insertBtn" onclick="deleteCheck()">삭제하기</a>
		<hr>
	</section>
    <script>
		function deleteCheck() {
			if (confirm("정말 삭제하시겠습니까?") == true) { //확인
				
				if('${paperName}' == '연차'){
					document.updateForm.action = "deleteVa.si";
				}else if('${paperName}' == '외근'){
					document.updateForm.action = "deleteOw.si";
				}else if('${paperName}' == '업무협조'){
					document.updateForm.action = "deleteCo.si";
				}else {
					document.updateForm.action = "deleteRe.si";
				}
				document.updateForm.submit();
			} else { //취소
				return false;
			}
		}
	</script>
	<script>
		function updateCheck() {
			if (confirm("수정하시겠습니까?") == true) { //확인
				
				if('${paperName}' == '연차'){
					document.updateForm.action = "updateVa.si";
				}else if('${paperName}' == '외근'){
					document.updateForm.action = "updateOw.si";
				}else if('${paperName}' == '업무협조'){
					document.updateForm.action = "updateCo.si";
				}else {
					document.updateForm.action = "updateRe.si";
				}
				document.updateForm.submit();

			} else { //취소
				return false;
			}
		}
	</script>
    <section>
        <div>
        	<h3 class="dtpaperName">
				<span>${ paperName }</span> 신청서 - <span
					style="font-weight: lighter;"><input type="hidden" name="empNo" value="${ loginUser.empNo }">${ loginUser.empName }(${ loginUser.depCd })</span>
			</h3>
            <hr>
        </div>
    </section>
    <section class="signSelect">
        <div>
            <h3>결재선</h3>
            <table align="center">
            	<c:forEach var="s" items="${ signList }">
            		<tr>
						<td width="80px" style="border:0.5px solid #878787; background: #f1f1f1;">
							결재
						 </td>
						<td width="80px" style="border:0.5px solid #878787">
						   ${ s.signEmpNo }
						</td>
					</tr>
            	</c:forEach>
            </table>
        </div>
    </section>
    <hr style="margin-top: 10px;">
    <section class="publicPaper">
        <div>
            <table align="center">
                <tr class="titleSection">
                    <th style="border-bottom:0.5px solid rgba(143, 143, 143, 0.547);">제목</th>
                    <td align="left" style="border-bottom:0.5px solid rgba(143, 143, 143, 0.547);"><span
                            style="margin-left:10px;">${ v.dpTitle }</span></td>
                </tr>
                <tr style="border-top:0.5px solid rgba(143, 143, 143, 0.547);">
                    <th>첨부파일</th>
                    <td align="left">
	                    <c:choose>
	                   		<c:when test="${ empty v.origin }">
	                   			첨부파일이 없습니다.
	                       	</c:when>
	                       	<c:otherwise>
	                       		<a href="${ v.change }" download="${ v.origin }">${ v.origin }</a>
	                       	</c:otherwise>
	                    </c:choose>
                    </td>
                </tr>
            </table>
        </div>
    </section>
</body>
</html>