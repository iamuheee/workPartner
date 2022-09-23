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
		    <h3>전사원휴가현황</h3>
		</div>
		
		<div style="width:80%"><hr></div>
		
		<br><br>
		<div style="width:80%">
			<form action="adminVacation.att" method="get" id="myForm" style="float:right">
		        
				&nbsp	
				
				<c:if test="${ !empty list2 }">
					<select name="condition" id="condition" form="myForm">
						<option value="0">모든부서</option>
						<c:forEach var="c" items="${ list2 }">
							<option value="${ c.depCd }">${ c.depName }</option>
						</c:forEach>
					</select>
				</c:if>
				&nbsp	
	
				<input type="text" placeholder="사원명/사번 검색" name="keyword" value="${ keyword }" style="text-align:center;">
				<button type="submit" class="btn btn-sm btn-secondary btnSize" style="height:28px; width:60px; font-size:17px; line-height:10px">조회</button>
			</form>
		</div>
		
	    <!-- 테이블 -->
	    <div class="ntMain" style="width:80%">
	        <span class="span1">조회결과 <span style="font-size:x-large; font-weight: 400;">${pi.listCount}</span><span style="font-weight:600; font-size: medium;">건</span></span>
	
	        <br><br>
	        <table class="table table-hover" style="text-align:center">
	            <thead>
	                <tr>                            
	                    <th>사번</th>
	                    <th>부서</th>
	                    <th>직위</th>
	                    <th>이름</th>
	                    <th>발생연차</th>
	                    <th>사용연차</th>
						<th>잔여연차</th>
						<th>입사일</th>
						<th>근무연수</th>			
	                </tr>
	            </thead>
	            <tbody>
	            
	                <c:choose>
                		<c:when test="${empty list}">
                			<tr>
                				<td colspan="10">조회된 휴가가 없습니다.</td>
                			</tr>
                		</c:when>
                		<c:otherwise>
							<c:forEach var="a" items="${list}">
								<tr>
			                        <td>${a.a}</td>
			                        <td>${a.b}</td>
			                        <td>${a.c}</td>
			                        <td>${a.d}</td>
			                        <td>${a.e}</td>
			                        <td>${a.f}</td>
			                        <td>${a.g}</td>
			                        <td>${a.h}</td>
			                        <td>${a.i}</td>
			                                 
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
	                <a class="page-link" href="adminVacation.att?cpage=${ pi.currentPage - 1 }&condition=${condition}&keyword=${keyword}" aria-label="Previous">
	                  <span aria-hidden="true">&laquo;</span>
	                </a>
	              </li>
	              <c:forEach var="no" begin="${ pi.startPage }" end="${ pi.endPage }" step="1">
		              <li class="page-item"><a class="page-link" href="adminVacation.att?cpage=${ no }&condition=${condition}&keyword=${keyword}">${ no }</a></li>
				  </c:forEach>
	              <li class="page-item">
	                <a class="page-link" href="adminVacation.att?cpage=${ pi.currentPage + 1 }&condition=${condition}&keyword=${keyword}" aria-label="Next">
	                  <span aria-hidden="true">&raquo;</span>
	                </a>
	              </li>
	            </ul>
	          </nav>     
	    </div>
		
	</div>
	
	<br><br><br><br><br><br><br><br><br>
	
	<script>
	// 페이징 관련 스크립트 //
	
	// 1) pi.currentPage == 1인 경우, Previous 버튼 비활성화
	if( ${pi.currentPage} == 1 ){
		$("a[aria-label='Previous']").removeAttr("href");
	}
	
	// 2) pi.currentPage == pi.endPage인 경우, Next 버튼 비활성화
	if( ${pi.currentPage} == ${pi.maxPage} ){
		$("a[aria-label='Next']").removeAttr("href");
	}
	
	// 셀렉트박스 고정 
	$(function(){
		$("#condition").val(${condition}).prop("selected", true);
	})	
	</script>
	
	
</body>
</html>