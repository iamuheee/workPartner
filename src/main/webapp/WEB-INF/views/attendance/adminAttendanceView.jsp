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
			           <td class="alignCenter">${status4 + status6 + status7}</td>
			       </tr>
			   </table>
			</div>
			<div style="clear:both"></div>
		</div>
		
		<br><br><br>
		
		<div style="width:80%">
			<form action="adminAtt.att" method="get" id="myForm" style="float:right">
	
				<input type="date" name="date1" id="date1">
		        &nbsp~&nbsp	
		        <input type="date" name="date2" id="date2">
		        
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
                				<td colspan="10">조회된 근태현황이 없습니다.</td>
                			</tr>
                		</c:when>
                		<c:otherwise>
							<c:forEach var="a" items="${list}">
								<tr>
			                        <td>${a.empNo}</td>
			                        <td>${a.depName}</td>
			                        <td>${a.posName}</td>
			                        <td>${a.empName}</td>
			                        <td>${a.dt}</td>
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
	                <a class="page-link" href="adminAtt.att?cpage=${ pi.currentPage - 1 }&date1=${date1}&date2=${date2}&condition=${condition}&keyword=${keyword}" aria-label="Previous">
	                  <span aria-hidden="true">&laquo;</span>
	                </a>
	              </li>
	              <c:forEach var="no" begin="${ pi.startPage }" end="${ pi.endPage }" step="1">
		              <li class="page-item"><a class="page-link" href="adminAtt.att?cpage=${ no }&date1=${date1}&date2=${date2}&condition=${condition}&keyword=${keyword}">${ no }</a></li>
				  </c:forEach>
	              <li class="page-item">
	                <a class="page-link" href="adminAtt.att?cpage=${ pi.currentPage + 1 }&date1=${date1}&date2=${date2}&condition=${condition}&keyword=${keyword}" aria-label="Next">
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
		
		// date1 오늘날짜 이후 선택 불가 //
			var now_utc = Date.now() // 지금 날짜를 밀리초로
			// getTimezoneOffset()은 현재 시간과의 차이를 분 단위로 반환
			var timeOff = new Date().getTimezoneOffset()*60000; // 분단위를 밀리초로 변환
			// new Date(now_utc-timeOff).toISOString()은 '2022-05-11T18:09:38.134Z'를 반환
			var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
			document.getElementById("date1").setAttribute("max", today);
			
		 // date2 오늘날짜 이후 선택 불가 //

			document.getElementById("date2").setAttribute("max", today);
			
		 // date1 선택시 date2는 date1 ~ 오늘날짜까지 선택가능
			document.getElementById('date1').onblur = function(){
			    var val = this.value;
			    document.getElementById("date2").setAttribute("min", val);
			}
		// 셀렉트박스 고정 
    		$(function(){
    			$("#condition").val(${condition}).prop("selected", true);
    			//$("option[value=${condition}]").attr("selected", true);
    			
    			/* $("#date1").val(${date1});
    			
    			document.getElementById("date2").setAttribute("value", ${date2}); */
    		})
    	</script>
		
	</script>
</body>
</html>