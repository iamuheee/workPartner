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
            border-right: 1px solid rgba(143, 143, 143, 0.547);
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

      
	</style>
</head>
<body style="width: 800px; font-family: 'Noto Sans KR', sans-serif;" >
	<jsp:include page="../sign/insertTitle.jsp"/>
	
	 <br>
    <section>
        <div style="margin: auto; margin-top: 10px; width: 800px;">
            <table class="otworkPaper" style="border:1px solid rgba(143, 143, 143, 0.547)" align="center">
                <tr>
                    <td class="tableTitle" width="100">퇴직자</td>
                    <td width="280" align="right"><input type="text" name="resMem" value="${ loginUser.empName }" readonly></td>
                    <td class="tableTitle" width="100">부서</td>
                    <td width="280" align="right" style="border-right:0;">
                        <input type="text" value="${ loginUser.depCd }" readonly name="resDept">
                    </td>
                </tr>
                <tr>
                    <td class="tableTitle">퇴직예정일자</td>
                    <td align="left"><input style="margin-left:10px;" type="date" name="resRedate" id="resRedate"></td>
                    <td class="tableTitle">업무인수자</td>
                    <td align="right" style="border-right:0;"><input type="text" name="resNextMem"></td>
                </tr>
                <tr>
                    <td class="tableTitle">외부메일주소</td>
                    <td align="right" >
                        <input type="text" name="resEmail">
                    </td>
                    <td class="tableTitle">면담자</td>
                    <td style="border-right:0;" align="right"><input type="text" name="resTaMem"></td>
                </tr>
                <tr>
                    <td class="tableTitle">은행명</td>
                    <td align="right"><input type="text" name="resBank"></td>
                    <td class="tableTitle">계좌번호</td>
                    <td style="border-right:0;" align="right"><input type="text" name="resAccount"></td>
                </tr>
                <tr>
                    <td class="tableTitle" style="border-bottom: 0;">퇴직사유</td>
                    <td colspan="3" style="border-bottom: 0; border-right:0;">
                        <textarea name="resContent" cols="53" rows="10" style="resize: none; height:95%; width: 96%; margin-top: 3px; border: 0; font-size: 16px;"></textarea>
                    </td>
                </tr>
            </table>
        </div>
    </section>

    <script>
        document.getElementById('resRedate').value = new Date().toISOString().substring(0, 10);
    </script>
	</form>
	
</body>
</html>