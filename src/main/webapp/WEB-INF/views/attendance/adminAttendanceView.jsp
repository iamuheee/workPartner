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
			           <td class="alignCenter">${status1}</td>
			           <td class="alignCenter">${status2}</td>
			           <td class="alignCenter">${status3}</td>
			           <td class="alignCenter">${status5}</td>
			           <td class="alignCenter">${status4}</td>
			       </tr>
			   </table>
			</div>
			<div style="clear:both"></div>
		</div>
		
		<br><br><br>
		
		<div style="width:80%">
			<form action="adminAtt.att" method="post" id="myForm" style="float:right">
	
				<input type="date" name="date1">
		        &nbsp~&nbsp	
		        <input type="date" name="date2">
		        
				&nbsp	
				
				<c:if test="${ !empty list2 }">
					<select name="condition" form="myForm">
						<option value="0">모든부서</option>
						<c:forEach var="c" items="${ list2 }">
							<option value="${ c.depCd }">${ c.depName }</option>
						</c:forEach>
					</select>
				</c:if>
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
	               <c:choose>
                		<c:when test="${empty list}">
                			<tr>
                				<td colspan="10">현재 게시글이 없습니다.</td>
                			</tr>
                		</c:when>
                		<c:otherwise>
							<c:forEach var="a" items="${list}">
								<tr>
			                        <td>${a.empNo}</td>
			                        <td>${a.depName}</td>
			                        <td>${a.posName}</td>
			                        <td>${a.empName}</td>
			                        <td>${a.attDate}</td>
			                        <td>${a.attCmt}</td>
			                        <td>${a.attQt}</td>
			                        <td>${a.attTime}</td>
			                        <td>${a.workhours}</td>
			                        <td>${a.status}</td>         
			                    </tr>
							</c:forEach>
                		</c:otherwise>                    
                    </c:choose>      
	
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
	
	<script>
		console.log("${list}");
		console.log("${condition}")
		
	</script>
</body>
</html>