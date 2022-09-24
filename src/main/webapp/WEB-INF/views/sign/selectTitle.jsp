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
    </style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>
<!-- onload="window.resizeTo(620,800)" -->
<body style="width: 800px; font-family: 'Noto Sans KR', sans-serif;">

<form action="" method="post" name="updateForm" id="updateForm" 
		enctype="multipart/form-data"> 
		
	<section class="mainTitle">
			<a class="insertBtn" onclick="updateCheck();">기안서 재작성</a>
            <a class="insertBtn" onclick="deleteCheck()">삭제하기</a>
            <c:forEach var="s" items="${ selectSignList }">
           		<c:set var="i" value="${ i + 1 }"/>
				<input type="hidden" id="dpNo" name="signList[${ i - 1 }].dpNo" value="${ t.dpNo }">
				<input type="hidden" name="signList[${ i - 1  }].siSeq" value="${ i }"><input type="hidden" name="signList[${ i - 1 }].siAsign" value="${ fn:length(selectSignList) }">
			    <input type="hidden" id="signEmpNo" name="signList[${ i - 1 }].signEmpNo" value="${ selectSignList[i - 1].signEmpNo }" >
           	</c:forEach>
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
				<span>${ t.dpCategory }</span> 신청서 - <span
					style="font-weight: lighter;">${ t.empName }(${ t.signEmpDept})</span>
			</h3>
            <hr>
        </div>
    </section>
    <section class="signSelect">
        <div>
            <h3>결재선</h3>
            <table align="center" style="border:0;">
            		<tr>
            			<c:choose>
            				<c:when test="${empty selectSignList }">
            					<td style="border:0.5px solid #878787; background: #f1f1f1;">
									결재선
								 </td>
								<td style="border:0.5px solid #878787">
								   
								</td>
								<td style="border:0.5px solid #878787; background: #f1f1f1;">
									결재선
								 </td>
								<td style="border:0.5px solid #878787">
								   
								</td>
								<td style="border:0.5px solid #878787; background: #f1f1f1;">
									결재선
								 </td>
								<td style="border:0.5px solid #878787">
								  
								</td>
            				</c:when>
            				<c:otherwise>
				            	<c:forEach var="s" items="${ selectSignList }">
								<td style="border:0.5px solid #878787; background: #f1f1f1;">
									결재선
								 </td>
								<td style="border:0.5px solid #878787">
								   ${ s.signEmpName }
								</td>
				            	</c:forEach>
				            </c:otherwise>
            			</c:choose>
					</tr>
            </table>
        </div>
    </section>
    <hr style="margin-top: 10px;">
    <section class="publicPaper">
        <div>
            <table align="center">
                <tr class="titleSection">
                    <th style="border-bottom:0.5px solid #878787;">제목</th>
                    <td align="left" style="border-bottom:0.5px solid #878787;"><span
                            style="margin-left:10px;">${ t.dpTitle }</span></td>
                </tr>
                <tr style="border-top:0.5px solid #878787;">
                    <th>첨부파일</th>
                    <td align="left">
	                    <c:choose>
	                   		<c:when test="${ empty t.dpOrigin }">
	                   			<span style="margin-left:10px">첨부파일이 없습니다.</span>
	                       	</c:when>
	                       	<c:otherwise>
	                       		<a style="margin-left:10px" href="${ t.dpChange }" download="${ t.dpOrigin }">${ t.dpOrigin }</a>
	                       	</c:otherwise>
	                    </c:choose>
                    </td>
                </tr>
            </table>
        </div>
    </section>
</body>
</html>