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

th, td {
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

.titleSection th, td {
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

input, select, textarea {
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

.otworkPaper span {
	margin-left: 5px;
}
</style>
</head>
<body style="width: 800px; font-family: 'Noto Sans KR', sans-serif;" >
  <jsp:include page="../sign/selectTitle.jsp"/>
    <br>
    <section>
        <div style="margin: auto; margin-top: 10px; width: 800px;">
            <table class="otworkPaper" style="border:0.5px solid rgba(143, 143, 143, 0.547)" align="center">
                <tr>
                    <td class="tableTitle" width="100">발신부서</td>
                    <td width="280" align="left"><span>영업부</span></td>
                    <td class="tableTitle" width="100">수신부서</td>
                    <td width="280" align="left" style="border-right:0;">
                        <span>마케팅</span>
                    </td>
                </tr>
                <tr>
                    <td class="tableTitle">요청자</td>
                    <td align="left"><span>김종군</span></td>
                    <td class="tableTitle">요청일</td>
                    <td align="left" style="border-right:0;"><span>2022-02-01</span></td>
                </tr>
                <tr>
                    <td class="tableTitle" style="border-bottom: 0;">요청내용</td>
                    <td colspan="3" style="border-bottom: 0; border-right:0;" align="left">
                        <div style="margin-left: 5px;">
                            <p>여기는 요청내용이 나타나는 공간입니다.여기는 요청내용이 나타나는 공간입니다.여기는 요청내용이 나타나는 공간입니다.여기는 요청내용이 나타나는 공간입니다.여기는 요청내용이 나타나는 공간입니다.여기는 요청내용이 나타나는 공간입니다.여기는 요청내용이 나타나는 공간입니다.여기는 요청내용이 나타나는 공간입니다.여기는 요청내용이 나타나는 공간입니다.여기는 요청내용이 나타나는 공간입니다.여기는 요청내용이 나타나는 공간입니다.여기는 요청내용이 나타나는 공간입니다.여기는 요청내용이 나타나는 공간입니다.여기는 요청내용이 나타나는 공간입니다.여기는 요청내용이 나타나는 공간입니다.여기는 요청내용이 나타나는 공간입니다.여기는 요청내용이 나타나는 공간입니다.여기는 요청내용이 나타나는 공간입니다.여기는 요청내용이 나타나는 공간입니다.여기는 요청내용이 나타나는 공간입니다.여기는 요청내용이 나타나는 공간입니다.여기는 요청내용이 나타나는 공간입니다.여기는 요청내용이 나타나는 공간입니다.여기는 요청내용이 나타나는 공간입니다.여기는 요청내용이 나타나는 공간입니다.</p>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </section>

</body>
</html>