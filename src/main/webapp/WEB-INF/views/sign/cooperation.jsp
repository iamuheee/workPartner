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

        /* -----------------모달----------------------- */

        #modal {
            z-index: 1550;
        }

        #modal.modal-overlay {
            width: 100%;
            height: 100%;
            position: absolute;
            left: 0;
            top: 0;
            display: none;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            background: rgba(95, 95, 95, 0.666);
            box-shadow: 0 8px 32px 0 rgba(61, 61, 61, 0.37);
            backdrop-filter: blur(1.5px);
            -webkit-backdrop-filter: blur(1.5px);
            border-radius: 10px;
            border: 0.5px solid rgba(255, 255, 255, 0.18);
        }

        #modal .modal-window {
            background: rgba(255, 255, 255);
            box-shadow: 0 8px 32px 0 rgba(34, 34, 34, 0.37);
            backdrop-filter: blur(13.5px);
            -webkit-backdrop-filter: blur(13.5px);
            border-radius: 10px;
            border: 0.5px solid rgba(255, 255, 255, 0.18);
            width: 600px;
            height: 500px;
            position: relative;
            top: 0;
        }

        #modal .modaltitle {
            display: inline-block;
            color: rgb(7, 7, 7);
            border-bottom: 0.5px solid #8787874d;
            padding-bottom: 10px;
            margin-top: 15px;

            width: 100%;
        }

        #modal .modaltitle h2 {
            display: inline;
            padding: 20px;
        }

        #modal .modalcontent {
            margin-top: 20px;
            padding: 0px 10px;
            text-shadow: 0.5px 0.5px 2px gray;
            color: rgb(0, 0, 0);
        }

        #modal .modaltitle>hr {
            margin-top: 15px;
            margin-bottom: 0;
            padding: 0;
        }

        .material-symbols-outlined {
            font-variation-settings:
                'FILL' 0,
                'wght' 600,
                'GRAD' 0,
                'opsz' 48;
            float: right;
            color: rgb(143, 143, 143);
            margin-right: 20px;
        }

        .close-area:hover {
            cursor: pointer;
            color: rgb(100, 100, 100);
            font-weight: 600;
        }

        .searchEmp {
            display: flex;
            width: 50%;
            height: 500px;
            border-right: 0.5px solid #8787874d;
            margin-top: 0;
        }
        .selectEmp{
            flex-direction: column;
            width: 50%;
        }
        .material-symbols-outlined {
            font-variation-settings:
                'FILL' 0,
                'wght' 400,
                'GRAD' 0,
                'opsz' 48
        }

        .modalSearch {
            position: relative;
            height: 30px;
            width: 95%;
            margin-left: 15px;
            margin-top: 15px;
        }

        .searchBtn {
            position: absolute;
            left: 135px;
            top: 80px;
            background-color: white;
            border: none;
        }

        .searchBtn:hover {
            cursor: pointer;
            color: black;
        }
    </style>
</head>
<body style="width: 800px; font-family: 'Noto Sans KR', sans-serif;" >
	<jsp:include page="../sign/insertTitle.jsp"/>
	
	<br>
    <section>
        <div style="margin: auto; margin-top: 10px; width: 800px;">
            <table class="otworkPaper" style="border:0.5px solid rgba(143, 143, 143, 0.547)" align="center">
                <tr>
                    <td class="tableTitle" width="100">발신부서</td>
                    <td width="280" align="right"><input type="text" readonly value="내 부서"></td>
                    <td class="tableTitle" width="100">수신부서</td>
                    <td width="280" align="right" style="border-right:0;">
                        <input type="text">
                    </td>
                </tr>
                <tr>
                    <td class="tableTitle">요청자</td>
                    <td align="right"><input type="text" ></td>
                    <td class="tableTitle">요청일</td>
                    <td align="right" style="border-right:0;"><input type="text"></td>
                </tr>
                <tr>
                    <td class="tableTitle" style="border-bottom: 0;">요청내용</td>
                    <td colspan="3" style="border-bottom: 0; border-right:0;">
                        <textarea name="" id="" cols="53" rows="10"
                            style="resize: none; height:95%; width: 96%; margin-top: 3px; border: 0; font-size: 16px;"></textarea>
                    </td>
                </tr>
            </table>
        </div>
    </section>
    	</section>
	</form>
	</form>
</body>
</html>