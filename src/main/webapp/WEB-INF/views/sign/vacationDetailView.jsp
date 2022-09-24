<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
        <div style="margin:auto; margin-top: 10px; width: 768.5px; border:0.5px solid #878787;" >
            <table style="margin-left:10px; border:0; border-spacing: 10px;" align="center">
                <tr align="left">
                    <th width="70" style="border:0">
                        근태명
                    </th>
                    <td width="540" style="border:0">
                    	<c:choose>
	                    		<c:when test="${ v.vaCategory == '연차' }">
                        			<select name="vaCategory" id="selectVacation" style="height:30px; border-radius: 4px;" disabled>
	                            	<option value="연차" selected>연차</option>
	                                </select>
                    			</c:when>
                    			<c:otherwise>
                    				<select name="vaCategory" id="selectVacation" style="height:30px; border-radius: 4px;" disabled>
	                            	<option value="반차" selected>반차</option>
                           			</select>
	                        		<select name="halfVa" id="halfVa" style="height:30px; border-radius: 4px;" disabled>
		                        		<c:choose>
				                       		<c:when test="${v.vaStartTime eq '09:00'}">
				                            	<option value="오전">오전</option>
				                            </c:when>
				                            <c:otherwise>
					                            <option value="오후">오후</option>
				                            </c:otherwise>
				                        </c:choose>
		                        	</select>
                    			</c:otherwise>
                       	</c:choose>
                    </td>
                </tr>
                <tr align="left">
                    <th style="border:0">
                        시작일시
                    </th>
                    <td style="border:0">
                    	<c:choose>
                    		<c:when test="${v.vaCategory == '연차' }">
	                       		<input type="date" id="currentDate" name="vaStart" value="${ v.vaStart }" style="height:30px; border-radius: 4px; text-align: center;" readonly>
	                       	</c:when>
	                        <c:otherwise>
		                       	<input type="date" id="currentDate" name="vaStart" style="height:30px; border-radius: 4px; text-align: center;" value="${ v.vaStart }" readonly>
	                        	<input type="time" name="vaStart" style="height:30px; border-radius: 4px; text-align: center;" id="startTime" value="${v.vaStartTime }"readonly>
	                        </c:otherwise>
                       </c:choose>
                    </td>
                </tr>
                <tr align="left">
                    <th style="border:0">
                        종료일시
                    </th>
                    <td style="border:0">
                    	<c:choose>
                    		<c:when test="${v.vaCategory == '연차' }">
	                       	 	<input type="date" id="currentDate2" name="vaEnd" style="height:30px; border-radius: 4px; text-align: center;" value="${v.vaEnd }" readonly>
	                        </c:when>
	                        <c:otherwise>
	                       		<input type="date" id="currentDate2" name="vaEnd" style="height:30px; border-radius: 4px; text-align: center;" value="${v.vaEnd }" readonly>
                       			<input type="time" name="vaEnd" style="height:30px; border-radius: 4px; text-align: center;" id="endTime" value="${v.vaEndTime }" readonly>
	                        </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
                <tr align="left">
                    <th style="border:0; vertical-align: top;">
                        사유
                    </th>
                    <td style="border:0">
                        <textarea name="vaContent" cols="30" rows="10" style=" border-radius: 4px; width: 650px; resize: none;" readonly>${ v.vaContent }</textarea>
                    </td>
                </tr>
            </table>
        </div>
        
    </section>
    <script>
        document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);
        document.getElementById('currentDate2').value = new Date().toISOString().substring(0, 10);;
    </script>
	</section>
	</form>


</body>
</html>