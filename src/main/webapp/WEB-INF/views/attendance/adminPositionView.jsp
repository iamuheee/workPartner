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
		    <h3>직위/직무 설정</h3>
		</div>
		
		<div style="width:80%"><hr></div>
		
		<div style="width:82%">
			<!-- 테이블 -->
		    <div class="div1" style="width:44%; height:600px; float: left;">
		  
		  		<br>
		  		<div style="height: 90%; width:90%">
					<button onclick="" class="btn btn-sm btn-primary" style="width:50px; height:30px; font-size:15px; float:right" >등록</button>

					<br><br>

					<table class="table table-hover" style="text-align:center">
						<thead>
							<tr>                            
								<th>직위코드</th>
								<th>직위명</th>			
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>001</td>
								<td>대표</td>
							</tr>
							<tr>
								<td>001</td>
								<td>대표</td>
							</tr>
							<tr>
								<td>001</td>
								<td>대표</td>
							</tr>
							<tr>
								<td>001</td>
								<td>대표</td>
							</tr>
							<tr>
								<td>001</td>
								<td>대표</td>
							</tr>
							<tr>
								<td>001</td>
								<td>대표</td>
							</tr>
							
						</tbody>
					
			
					</table>
				</div>
		    </div>
			
			<!-- 테이블 -->
		    <div class="div1" style="width:44%; height:600px; float:right;" >
		  
				<br>
				<div style="height: 90%; width:90%">
				  <button onclick="" class="btn btn-sm btn-primary" style="width:50px; height:30px; font-size:15px; float:right" >등록</button>

				  <br><br>

				  <table class="table table-hover" style="text-align:center">
					  <thead>
						  <tr>                            
							  <th>직무코드</th>
							  <th>직무명</th>			
						  </tr>
					  </thead>
					  <tbody>
						  <tr>
							  <td>101</td>
							  <td>인사</td>
						  </tr>
						  <tr>
							<td>101</td>
							<td>인사</td>
						</tr>
						<tr>
							<td>101</td>
							<td>인사</td>
						</tr>
						<tr>
							<td>101</td>
							<td>인사</td>
						</tr>
						<tr>
							<td>101</td>
							<td>인사</td>
						</tr>
						  
					  </tbody>
				  
		  
				  </table>
			  </div>
		  </div>
		</div>
		<div style="clear:both"></div>
	
	</div>	
	<br><br><br><br><br><br><br><br><br><br><br><br><br>
	
</body>
</html>