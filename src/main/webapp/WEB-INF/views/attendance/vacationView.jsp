<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .alignCenter{text-align: Center; font-size: larger; color:blue}
    .alignLeft{text-align: left;}
    .div1{
        display:block;
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
		    <h3>휴가관리</h3>
		</div>
	
	<div style="width:80%"><hr></div>
	
	<div class="div1" style="float:left">
      <table style="height: 150px; width:400px;">
	     <tr>
	         <th class="alignLeft" colspan="3">
	             <span style="font-size:20px">잔여연차조회</span>
	           </th>
	       </tr>
	       <tr>
	           <th class="alignCenter" style="color:black; font-weight:normal">총 연차</th>
	           <th class="alignCenter" style="color:black; font-weight:normal">사용 연차</th>
	           <th class="alignCenter" style="color:black; font-weight:normal">남은 연차</th>
	       </tr>
	       <tr>
	           <td class="alignCenter">8</td>
	           <td class="alignCenter">32</td>
	           <td class="alignCenter">0</td>
	       </tr>
	   </table>
	</div>
	
	<br><br><br><br><br><br><br><br><br>
	
	<!-- 테이블 -->
	    <div class="ntMain" style="width:80%">
	        
	        <h4>휴가생성내역</h4>
	        
	        <div style="width:100%"><hr style="height:1.2px"></div>
	        
	        <table class="table table-hover" style="text-align:center">
	            <thead>
	                <tr>                            
	                    <th>생성일</th>
	                    <th>사용기간</th>
	                    <th>생성일수</th>
	                    <th>내용</th>
	                </tr>
	            </thead>
	            <tbody>
	                <tr>
	                    <td>2022-01-01</td>
	                    <td>2022-12-31</td>
	                    <td>15</td>
	                    <td>연차</td>
	                </tr>                 
	
	            </tbody>    
	            
	        </table>
	
	    </div>
	    
	    <br>
	 
	    <!-- 테이블 -->
	    <div class="ntMain" style="width:80%">
	        
	        <h4>휴가사용내역</h4>
	        
	        <div style="width:100%"><hr style="height:1.2px"></div>
	        
	        <table class="table table-hover" style="text-align:center">
	            <thead>
	                <tr>                            
	                    <th>신청일</th>
	                    <th>종류</th>
	                    <th>휴가일</th>
	                    <th>사용일수</th>
	                    <th>진행상황</th>
	                </tr>
	            </thead>
	            <tbody>
	                <tr>
	                    <td>2022-01-01</td>
	                    <td>연차</td>
	                    <td>2022-08-01 ~ 2022-08-02</td>
	                    <td>2</td>
	                    <td>조정중</td>
	                </tr>
					<tr>
	                    <td>2022-01-01</td>
	                    <td>연차</td>
	                    <td>2022-08-01 ~ 2022-08-02</td>
	                    <td>2</td>
	                    <td>조정중</td>
	                </tr>
	                <tr>
	                    <td>2022-01-01</td>
	                    <td>연차</td>
	                    <td>2022-08-01 ~ 2022-08-02</td>
	                    <td>2</td>
	                    <td>조정중</td>
	                </tr>
	                <tr>
	                    <td>2022-01-01</td>
	                    <td>연차</td>
	                    <td>2022-08-01 ~ 2022-08-02</td>
	                    <td>2</td>
	                    <td>조정중</td>
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