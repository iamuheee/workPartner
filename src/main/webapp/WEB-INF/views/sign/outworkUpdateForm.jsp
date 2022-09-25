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

th, td {
	vertical-align: middle;
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
	border: 1px solid rgba(143, 143, 143, 0.547)
}

span {
	margin-left: 5px
}

.otworkPaper input[type=text] {
	width: 97%;
	box-sizing: border-box;
	margin: auto;
	height: 100%;
	border: 0;
	font-size: 16px;
	background-color: #ffffff48;
	padding: auto;
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
	width: 28%;
	vertical-align: middle;
}
#startDate{
margin-left: 10px;
}
</style>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<script src="https://uicdn.toast.com/tui-tree/latest/tui-tree.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://uicdn.toast.com/tui-tree/latest/tui-tree.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- <script>
        $(document).ready(function () {
            $("#today").change(function () {
                console.log("gd");
                if ($("#today").is(":checked")) {
                    $("#startTime").attr("disabled", false);
                    $("#endTime").attr("disabled", false);
                    $("#currentDate2").attr("disabled", true);
                } else {
                    $("#startTime").attr("disabled", true);
                    $("#endTime").attr("disabled", true);
                    $("#currentDate2").attr("disabled", false);
                }
            });
        });
    </script> -->

</head>

<body style="width: 800px; font-family: 'Noto Sans KR', sans-serif;">
<jsp:include page="../sign/updateTitle.jsp"/>
	<br>
	<section>
		<div style="margin: auto; margin-top: 10px; width: 800px;">
			<table class="otworkPaper" style="border: 1px solid rgba(143, 143, 143, 0.547)" align="center">
				<tr>
					<td class="tableTitle" width="100">신청자</td>
					<td width="280" align="right"><input type="text" id="writeEmp"
						name="otCall" value="${ o.otCall }" readonly></td>
					<td class="tableTitle" width="100">담당자</td>
					<td width="280" align="right" style="border-right: 0;"><input
						type="text" name="otSupervisor" value="${ o.otSupervisor }" ></td>
				</tr>
				<tr>
					<td class="tableTitle">외근목적</td>
					<td align="right">
						<input type="text" name="otContent" value="${ o.otContent }" >
					</td>
					<td class="tableTitle">거래처</td>
					<td align="right" style="border-right: 0;">
						<input type="text"name="otCustomer" value="${ o.otCustomer }" >
					</td>
				</tr>
				<tr>
					<td class="tableTitle">교통수단</td>
					<td align="left">
					<script>
						$(document).ready(function(){
							$(".trans").val("${o.otTrans}").prop("selected", true)
						})
					</script>
						<select class="trans" name="otTrans" style="margin-left: 10px" >
							<option value="대중교통">대중교통</option>
							<option value="자차">자차</option>
							<option value="도보">도보</option>
						</select>
					</td>
					<td class="tableTitle">위치</td>
					<td style="border-right: 0;" align="right">
						<input type="text" name="otPlace" value="${ o.otPlace }">
						</td>
				</tr>
				<tr>
					<td class="tableTitle">시간</td>
					<td colspan="3" align="left" style="border-right: 0;">
					<input type="datetime-local" id="startDate" style="margin-left: 10px" name="otStartdate" value="${ o.otStartdate }"onchange="setMinValue()" > ~ 
					<input type="datetime-local" id="endDate" name="otEnddate" value="${ o.otEnddate }"onchange="setMinValue()" >
					</td>

				</tr>
				<tr>
					<td class="tableTitle" style="border-bottom: 0;">비고</td>
					<td colspan="3" style="border-bottom: 0; border-right: 0;"><textarea name="otNote" id="" cols="53" rows="10" style="resize: none; height: 95%; width: 96%; margin-top: 3px; border: 0; font-size: 16px;">${ o.otNote }</textarea>
					</td>
				</tr>
			</table>
		</div>
	</section>
	</form>
	<script>
		    let dateElement = document.getElementById('startDate');
	        let date = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().slice(0, -8);
	        dateElement.value = date;
	        dateElement.setAttribute("min", date);
	        
	        
	        let dateElement1 = document.getElementById('endDate');
	        let date1 = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().slice(0, -8);
	        dateElement1.value = date1;
	        dateElement1.setAttribute("min", date);
			
	        function setMinValue() {
	            if(dateElement.value < date) {
	                alert('현재 시간보다 이전의 날짜는 설정할 수 없습니다.');
	                dateElement.value = date;
	            }
	            if(dateElement1.value < date1) {
	                alert('현재 시간보다 이전의 날짜는 설정할 수 없습니다.');
	                dateElement.value = date1;
	            }
	        }
	        
	        document.getElementById('startDate').onblur = function(){
			    var val = this.value;
			    document.getElementById("endDate").setAttribute("min", val);
			}
	        
    </script>
</body>
</html>