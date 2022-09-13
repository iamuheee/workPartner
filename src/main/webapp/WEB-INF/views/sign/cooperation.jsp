<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
</body>
</html>