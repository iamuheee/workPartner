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

	<div style="height:0%"></div>
	
	<div id="outer" style="width:96%">
		<!-- 상단 메뉴 제목 영역 -->
		<div id="header">
		    <h3>내 근태 현황</h3>
		</div>
		
	<div style="width:80%"><hr></div>
	
	<div style="width:80%">
		<div style="width:100%; float:middle;" >
			<div class="div1" style="float:left; width:45%">
			<table style="height: 150px; width:100%; text-align: center;">
				<tr>
					<th class="alignLeft" colspan="3">
						&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp이번주&nbsp&nbsp 
						<span style="font-weight: normal;">08.01 ~ 08.05</span>
					</th>
				</tr>
				<tr>
					<th>총 근무한 시간</th>
					<th>남은 시간</th>
					<th>연장 근무 시간</th>
				</tr>
				<tr>
					<td class="alignCenter">8시간</td>
					<td class="alignCenter">32시간</td>
					<td class="alignCenter">0시간</td>
				</tr>
			</table>
			</div>
			
			<div class="div1" style="float:left; width:45%">
				<table style="height: 150px; width:100%; text-align: center;">
					<tr>
						<th class="alignLeft" colspan="3">
							&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp이번달&nbsp&nbsp
							<span style="font-weight: normal;">2022.08</span>
						</th>
					</tr>
					<tr>
						<th>총 근무한 시간</th>
						<th>남은 시간</th>
						<th>연장 근무 시간</th>
					</tr>
					<tr>
						<td class="alignCenter">8시간</td>
						<td class="alignCenter">32시간</td>
						<td class="alignCenter">0시간</td>
					</tr>
				</table>
			</div>
		</div>
		
	</div>
	<div style="clear:both"></div>	

	<br><br><br>
	
	    <h3>출퇴근조회</h3>
	   	<div style="width:80%"><hr></div>
	    <br>
	    <form action="">
	        <span class="span1">기간조회&nbsp&nbsp&nbsp</span>
	        <input type="date" name="date1">
	        &nbsp~&nbsp	
	        <input type="date" name="date2">
	        <br><br>
	
	        <span class="span1">근무상태&nbsp&nbsp</span>
	        <input type="checkbox" name="check">정상 &nbsp
	        <input type="checkbox" name="check">지각 &nbsp
	        <input type="checkbox" name="check">결근 &nbsp
	        <input type="checkbox" name="check">조퇴 &nbsp
	        <input type="checkbox" name="check">연차 
	
	        &nbsp&nbsp
	        <button type="submit" class="btn btn-sm btn-secondary btnSize" style="height:30px; width:60px; font-size:17px; line-height:10px ">조 회</button>
	    </form>
	
	    <br><br>
	    <!-- 테이블 -->
	    <div class="ntMain" style="width:80%">
	        <span class="span1">조회결과 <span style="font-size:x-large; font-weight: 400;">27</span><span style="font-weight:600; font-size: medium;">건</span></span>
	
	        <br><br>
	        <table class="table table-hover" style="text-align:center">
	            <thead>
	                <tr>                            
	                    <th>날짜</th>
	                    <th>근무상태</th>
	                    <th>출근시간</th>
	                    <th>퇴근시간</th>
	                    <th>근무시간</td>
	                    <th>연장근무시간</td>
	                </tr>
	            </thead>
	            <tbody>
	                <tr>
	                    <td>2022-07-31</td>
	                    <td>정상</td>
	                    <td>08:55:52</td>
	                    <td>17:55:55</td>
	                    <td>8시간</td>
	                    <td>0시간</td>
	                </tr>
	                <tr>
	                    <td>2022-07-30</td>
	                    <td>결근</td>
	                    <td>-</td>
	                    <td>-</td>
	                    <td>-</td>
	                    <td>-</td>
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
</body>
</html>