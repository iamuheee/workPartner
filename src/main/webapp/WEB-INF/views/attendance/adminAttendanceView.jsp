<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .alignCenter{text-align: center; font-size: larger; color:blue}
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
		    <h3>전사원 근태 현황</h3>
		</div>
		
		<div style="width:80%"><hr></div>
		
		<div style="width:80%">
			<div class="div1" style="float:middle; width:100%;">
		      <table style="height: 150px; width:100%;">
			       <tr style="text-align:center">
			           <th >정상</th>
			           <th>지각</th>
			           <th>결근</th>
			           <th>조퇴</th>
			           <th>휴가</th>
			       </tr>
			       <tr>
			           <td class="alignCenter">56</td>
			           <td class="alignCenter">7</td>
			           <td class="alignCenter">3</td>
			           <td class="alignCenter">4</td>
			           <td class="alignCenter">5</td>
			       </tr>
			   </table>
			</div>
			<div style="clear:both"></div>
		</div>
		
		<br><br><br>
		
		<div style="width:80%">
			<form action="" style="float:right">
	
				<input type="date" name="date1">
		        &nbsp~&nbsp	
		        <input type="date" name="date2">
		        
				&nbsp	
	
				<select name="">
					<option value="">인사부</option>
					<option value="">회계부</option>
					<option value="">영업부</option>
					<option value="">개발부</option>
				</select>
	
				&nbsp	
	
				<input type="text" placeholder="사원명/사번 검색" name="keyword">
				<button type="submit" class="btn btn-sm btn-secondary btnSize" style="height:28px; width:60px; font-size:17px; line-height:10px">조회</button>
			</form>
		</div>
		
	    <!-- 테이블 -->
	    <div class="ntMain" style="width:80%">
	        <span class="span1">조회결과 <span style="font-size:x-large; font-weight: 400;">27</span><span style="font-weight:600; font-size: medium;">건</span></span>
	
	        <br><br>
	        <table class="table table-hover" style="text-align:center">
	            <thead>
	                <tr>                            
	                    <th>사번</th>
	                    <th>부서</th>
	                    <th>직위</th>
	                    <th>이름</th>
	                    <th>근무일</th>
	                    <th>출근시간</th>
						<th>퇴근시간</th>
						<th>연장근무시간</th>
						<th>근무시간</th>
						<th>상태</th>			
	                </tr>
	            </thead>
	            <tbody>
	                <tr>
	                    <td>1</td>
	                    <td>인사부</td>
	                    <td>부장</td>
	                    <td>홍길동</td>
	                    <td>2022-09-01</td>
	                    <td>09:00:00</td>
						<td>18:00:00</td>
						<td>0시간</td>
						<td>8시간</td>
						<td>정상</td>
	                </tr>
					<tr>
	                    <td>1</td>
	                    <td>인사부</td>
	                    <td>부장</td>
	                    <td>홍길동</td>
	                    <td>2022-09-01</td>
	                    <td>09:00:00</td>
						<td>18:00:00</td>
						<td>0시간</td>
						<td>8시간</td>
						<td>정상</td>
	                </tr>
					<tr>
	                    <td>1</td>
	                    <td>인사부</td>
	                    <td>부장</td>
	                    <td>홍길동</td>
	                    <td>2022-09-01</td>
	                    <td>09:00:00</td>
						<td>18:00:00</td>
						<td>0시간</td>
						<td>8시간</td>
						<td>정상</td>
	                </tr>
					<tr>
	                    <td>1</td>
	                    <td>인사부</td>
	                    <td>부장</td>
	                    <td>홍길동</td>
	                    <td>2022-09-01</td>
	                    <td>09:00:00</td>
						<td>18:00:00</td>
						<td>0시간</td>
						<td>8시간</td>
						<td>정상</td>
	                </tr>
					<tr>
	                    <td>1</td>
	                    <td>인사부</td>
	                    <td>부장</td>
	                    <td>홍길동</td>
	                    <td>2022-09-01</td>
	                    <td>09:00:00</td>
						<td>18:00:00</td>
						<td>0시간</td>
						<td>8시간</td>
						<td>정상</td>
	                </tr>
					<tr>
	                    <td>1</td>
	                    <td>인사부</td>
	                    <td>부장</td>
	                    <td>홍길동</td>
	                    <td>2022-09-01</td>
	                    <td>09:00:00</td>
						<td>18:00:00</td>
						<td>0시간</td>
						<td>8시간</td>
						<td>정상</td>
	                </tr>
	                                 
	
	            </tbody>
	        
	
	        </table>
	
	    </div>
	
	
	
	    <!-- 페이징 -->
	    <div class="ntPasing">
	        <nav aria-label="Page navigation example" class="pasingCenter">
	            <ul class="pagination">
	              <li class="page-item">
	                <a class="page-link" href="#" aria-label="Previous">
	                  <span aria-hidden="true">&laquo;</span>
	                </a>
	              </li>
	              <li class="page-item"><a class="page-link" href="#">1</a></li>
	              <li class="page-item"><a class="page-link" href="#">2</a></li>
	              <li class="page-item"><a class="page-link" href="#">3</a></li>
	              <li class="page-item">
	                <a class="page-link" href="#" aria-label="Next">
	                  <span aria-hidden="true">&raquo;</span>
	                </a>
	              </li>
	            </ul>
	          </nav>     
	    </div>
		
	</div>
	
	<br><br><br><br><br><br><br><br><br>
</body>
</html>