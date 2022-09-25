<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.alignCenter{text-align: left; font-size: larger; color:blue}
    .alignLeft{text-align: left;}
    .div1{
        display:inline-block;
        box-shadow :  1px 1px 1px 1px rgb(212, 211, 211);
        margin-right: 5%;
	}
    .ntPasing{
	    grid-area: footer;
	    place-items: center;
	    display: grid;
	    margin-right:15%
	}
</style>
</head>
<body>
	
	<jsp:include page="../common/menubar.jsp" />
	
	<div style="height:2%"></div>
	
	<div id="outer" style="width:96%">
		<!-- 상단 메뉴 제목 영역 -->
		<div id="header">
		    <h3>근태 이력</h3>
		</div>
		
		<div style="width:80%"><hr></div>
		
		<!-- <form action="">
	        <span class="span1">기간조회&nbsp&nbsp&nbsp</span>
	        <input type="date" name="date1">
	        &nbsp~&nbsp	
	        <input type="date" name="date2">
	        <br><br>
	
	        <span class="span1">근무상태&nbsp&nbsp</span>
	        <input type="checkbox" name="check">출퇴근시간변경 &nbsp
	        <input type="checkbox" name="check">근무시간변경 &nbsp
	        <input type="checkbox" name="check">연장근무신청 &nbsp
	
	        &nbsp&nbsp
	        <button type="submit" class="btn btn-sm btn-secondary btnSize" style="height:30px; width:60px; font-size:17px; line-height:10px ">조 회</button>
	    </form> -->
	    <br><br>
	   <h4>출퇴근시간변경</h4>
	    <br>
	    <!-- 테이블 -->
	    <div class="ntMain" style="width:80%">
	        <table class="table table-hover" style="text-align:center">
	            <thead>
	                <tr>     
	                	<th>문서번호</th>                       
	                    <th>조정일</th>
	                    <th>제목</th>
	                    <th>진행상황</th>
	                    <th><th>
	                </tr>
	            </thead>
	            <tbody>
	                <tr>
	                	<td>101</td>
	                    <td>2022-07-31</td>
	                    <td>출퇴근 시간 변경</td>
	                    <td>조정중</td>
	                    <td>
	                    	<button class="btn btn-sm btn-warning" >취소</button>
	                    <td>
	                </tr>

	            </tbody>
	        
	
	        </table>
	        
	        <br><br><br>
	        
	    <h4>근무시간변경</h4>
		<br>
	         <table class="table table-hover" style="text-align:center">
	             <thead>
	                <tr>     
	                	<th>문서번호</th>                       
	                    <th>조정일</th>
	                    <th>제목</th>
	                    <th>진행상황</th>
	                    <th><th>
	                </tr>
	            </thead>
	            <tbody>
	                <tr>
	                	<td>101</td>
	                    <td>2022-07-31</td>
	                    <td>근무시간 변경</td>
	                    <td>조정중</td>
	                    <td>
	                    	<button class="btn btn-sm btn-warning" >취소</button>
	                    <td>
	                </tr>

	            </tbody>
	        
	
	        </table>
	
	    </div>

	
	
	</div>
	
	
	
	
	
	</div>
	
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	
	
</body>
</html>