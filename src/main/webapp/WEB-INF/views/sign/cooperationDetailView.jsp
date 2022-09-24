<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
            width: 800px;
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
            text-align: center;
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
            vertical-align: middle;
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

        .publicPaper tr {
            text-align: center;
            width: 100%;
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


        input,
        select,
        textarea {
            border: 0.5px solid rgba(143, 143, 143, 0.547)
        }

        .otworkPaper input[type=text] {
            width: 97%;
            box-sizing: border-box;
            margin: auto;
            height: 100%;
            border: 0;
            font-size: 16px;
            vertical-align: middle;
            background-color: #ffffff48;
        }

        /* .otworkPaper input[type=date] {
            box-sizing: border-box;
            margin: auto;
            font-size: 16px;
            vertical-align: middle;
            height: 80%;
            margin-left: 5px;
            width: 35%;
        } */

        .otworkPaper td {
            height: 30px;
        }

        .tableTitle {
            background-color: #f1f1f1;
        }

        .otworkPaper select {
            height: 25px;
            font-size: 16px;
        }

        .otworkPaper input[type=datetime-local] {
            text-align: center;
            width: 40%;
            vertical-align: middle;
        }

    </style>
</head>
<body style="width: 800px; font-family: 'Noto Sans KR', sans-serif;" >
 <c:choose>
		<c:when test="${ loginUser.empNo eq t.empNo}">
			<jsp:include page="../sign/selectTitle.jsp"/>
		</c:when>
		<c:otherwise>
			<jsp:include page="../sign/signPaper.jsp"/>
		</c:otherwise>
	</c:choose>
	
	<br>
    <section>
        <div style="margin: auto; margin-top: 10px; width: 800px;">
            <table class="otworkPaper" style="border:0.5px solid rgba(143, 143, 143, 0.547)" align="center">
                <tr>
                    <td class="tableTitle" width="100">발신부서</td>
                    <td width="280" align="right"><input type="text" name="cpCallDept" readonly value="${ c.cpCallDept }"></td>
                    <td class="tableTitle" width="100">수신부서</td>
                    <td width="280" align="right" style="border-right:0;" >
                        <input type="text" name="cpDept" value="${ c.cpDept }" readonly>
                    </td>
                </tr>
                <tr>
                    <td class="tableTitle">요청자</td>
                    <td align="right"><input type="text" name="cpRequestor" value="${ c.cpRequestor }" readonly></td>
                    <td class="tableTitle">요청일</td>
                    <td align="right" style="border-right:0;"><input type="text" name="cpRequestday" value="${ c.cpRequestday }" readonly></td>
                </tr>
                <tr>
                    <td class="tableTitle" style="border-bottom: 0;">요청내용</td>
                    <td colspan="3" style="border-bottom: 0; border-right:0;">
                        <textarea name="cpContent" cols="53" rows="10" style="resize: none; height:95%; width: 96%; margin-top: 3px; border: 0; font-size: 16px;" readonly>${ c.cpContent }</textarea>
                    </td>
                </tr>
            </table>
        </div>
    </section>
	</form>
</body>
</html>