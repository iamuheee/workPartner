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
		    <h3>근태 조정 내역</h3>
		</div>
		
		<div style="width:80%"><hr></div>
		

	    
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
	                    <th>부서명</th>
	                    <th>사원명</th>
	                    <th>제목</th>
	                    <th>진행상황</th>
	                    <th><th>
	                </tr>
	            </thead>
	            <tbody>
	               <c:choose>
                		<c:when test="${empty list}">
                			<tr>
                				<td colspan="7">조회된 출퇴근시간 조정내역 없습니다.</td>
                			</tr>
                		</c:when>
                		<c:otherwise>
							<c:forEach var="a" items="${list}">
								<tr>
			                        <td class="no">${a.a}</td>
			                        <td>${a.b}</td>
			                        <td>${a.c}</td>
			                        <td class="name">${a.d}</td>
			                        <td>${a.e}</td>
			                        <td>${a.f}</td>
			                        <td>
			                        	<c:if test="${ a.f == '조정중' }">
			                        	<button class="btn btn-sm btn-primary" id="button1">승인</button> / 
	                    				<button class="btn btn-sm btn-warning" id="button2">반려</button>
			                      		 </c:if>
			                        </td>        
			                    </tr>
							</c:forEach>
                		</c:otherwise>                    
                    </c:choose>     

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
	                    <th>부서명</th>
	                    <th>사원명</th>
	                    <th>제목</th>
	                    <th>진행상황</th>
	                    <th><th>
	                </tr>
	            </thead>
	            <tbody>
	                 
	                <c:choose>
                		<c:when test="${empty list2}">
                			<tr>
                				<td colspan="7">조회된 근무시간조정내역 없습니다.</td>
                			</tr>
                		</c:when>
                		<c:otherwise>
							<c:forEach var="a" items="${list2}">
								<tr>
			                        <td class="no1">${a.a}</td>
			                        <td>${a.b}</td>
			                        <td>${a.c}</td>
			                        <td>${a.d}</td>
			                        <td>${a.e}</td>
			                        <td>${a.f}</td>
			                        <td>
			                        	<c:if test="${ a.f == '조정중' }">
			                        	<button class="btn btn-sm btn-primary" id="button3">승인</button> / 
	                    				<button class="btn btn-sm btn-warning" id="button4">반려</button>
			                       		 </c:if>
			                        </td>        
			                    </tr>
							</c:forEach>
                		</c:otherwise>                    
                    </c:choose>     

	            </tbody>
	        
	
	        </table>
	
	    </div>

	
	
	</div>
	
	<br><br><br><br><br><br><br><br><br>
	
	<script>
	
		$(function(){
			
			$("#button1").on('click', function(){
				
				var a = $(this).parent().siblings(".no").text();
				var b = $(this).parent().siblings(".name").text();
				
				$.ajax({	
	    			url:"agreeModify.att",
	    			data:{"aatNo":a, "empName":b},
	    			success:function(){
	    				
	    				console.log("근태수정신청 ajax 통신 성공");
	    				
	    			},
	    			error:function(){
	    				console.log("근태수정신청 ajax 통신 실패");
	    			}
				
	    		
			})
			
			})
		})
	</script>
	
	
</body>
</html>