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
	           <td class="alignCenter">${list[0].a}</td>
	           <td class="alignCenter">${list[0].b}</td>
	           <td class="alignCenter">${list[0].c}</td>
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
	                <c:choose>
                		<c:when test="${empty list2}">
                			<tr>
                				<td colspan="4">조회된 휴가생성내역이 없습니다.</td>
                			</tr>
                		</c:when>
                		<c:otherwise>
							<c:forEach var="a" items="${list2}">
								<tr>
			                        <td>${a.a}</td>
			                        <td>${a.b}</td>
			                        <td>${a.c}</td>
			                        <td>${a.d}</td> 
			                    </tr>
							</c:forEach>
                		</c:otherwise>                    
                    </c:choose>               
	
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
	                
	                <c:choose>
                		<c:when test="${empty list3}">
                			<tr>
                				<td colspan="5">조회된 휴가사용내역이 없습니다.</td>
                			</tr>
                		</c:when>
                		<c:otherwise>
							<c:forEach var="a" items="${list3}">
								<tr>
			                        <td>${a.a}</td>
			                        <td>${a.b}</td>
			                        <td>${a.c}</td>
			                        <td>${a.d}</td> 
			                        <td>${a.e}</td>  
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
	                <a class="page-link" href="myVacation.att?cpage=${ pi.currentPage - 1 }&empNo=${ loginUser.empNo }" aria-label="Previous">
	                  <span aria-hidden="true">&laquo;</span>
	                </a>
	              </li>
	              <c:forEach var="no" begin="${ pi.startPage }" end="${ pi.endPage }" step="1">
		              <li class="page-item"><a class="page-link" href="myVacation.att?cpage=${ no }&empNo=${ loginUser.empNo }">${ no }</a></li>
				  </c:forEach>
	              <li class="page-item">
	                <a class="page-link" href="myVacation.att?cpage=${ pi.currentPage + 1 }&empNo=${ loginUser.empNo }" aria-label="Next">
	                  <span aria-hidden="true">&raquo;</span>
	                </a>
	              </li>
	            </ul>
	          </nav>     
	    </div>
	    
	</div>
	
	<script>

		// 1) pi.currentPage == 1인 경우, Previous 버튼 비활성화
		if( ${pi.currentPage} == 1 ){
			$("a[aria-label='Previous']").removeAttr("href");
		}
		
		// 2) pi.currentPage == pi.endPage인 경우, Next 버튼 비활성화
		if( ${pi.currentPage} == ${pi.maxPage} ){
			$("a[aria-label='Next']").removeAttr("href");
		}
	</script>
</body>
</html>