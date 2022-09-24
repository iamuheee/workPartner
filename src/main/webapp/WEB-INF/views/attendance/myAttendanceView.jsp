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
						<span style="font-weight: normal;">${ list[0].workWeek }</span>
					</th>
				</tr>
				<tr>
					<th>총 근무한 시간</th>
					<th>남은 시간</th>
					<th>연장 근무 시간</th>
				</tr>
				<tr>
					<td class="alignCenter">${list2[0].weekWorkHours}시간</td>
					<td class="alignCenter">${list2[0].x}시간</td>
					<td class="alignCenter">${ list2[0].weekPlusWorkHours }시간</td>
				</tr>
			</table>
			</div>
			
			<div class="div1" style="float:left; width:45%">
				<table style="height: 150px; width:100%; text-align: center;">
					<tr>
						<th class="alignLeft" colspan="3">
							&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp이번달&nbsp&nbsp
							<span style="font-weight: normal;">${ list[0].workMonth }</span>
						</th>
					</tr>
					<tr>
						<th>총 근무한 시간</th>
						<th>남은 시간</th>
						<th>연장 근무 시간</th>
					</tr>
					<tr>
						<td class="alignCenter">${list2[0].monthWorkHours}시간</td>
						<td class="alignCenter">${list2[0].y}시간</td>
						<td class="alignCenter">${ list2[0].monthPlusWorkHours }시간</td>
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
	    <form action="my.att" method="get">
	    	
	        <span class="span1">기간조회&nbsp&nbsp&nbsp</span>
	        
	      	<input type="hidden" name="id" value="${ loginUser.empNo }">
			 
	        <input type="date" id="date1" name="date1">
	        &nbsp~&nbsp	
	        <input type="date" id="date2" name="date2">
	        <br><br>
	
	        <span class="span1">근무상태&nbsp&nbsp</span>
	        <input type="checkbox" name="check" value="정상" id="1">정상 &nbsp
	        <input type="checkbox" name="check" value="지각" id="2">지각 &nbsp
	        <input type="checkbox" name="check" value="결근" id="3">결근 &nbsp
	        <input type="checkbox" name="check" value="조퇴" id="4">조퇴 &nbsp
	        <input type="checkbox" name="check" value="연차" id="5">연차 
	
	        &nbsp&nbsp
	        <button type="submit" class="btn btn-sm btn-secondary btnSize" style="height:30px; width:60px; font-size:17px; line-height:10px ">조 회</button>
	    </form>
	
	    <br><br>
	    <!-- 테이블 -->
	    <div class="ntMain" style="width:80%">
	        <span class="span1">조회결과 <span style="font-size:x-large; font-weight: 400;">${pi.listCount}</span><span style="font-weight:600; font-size: medium;">건</span></span>
	
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
	                <c:choose>
                		<c:when test="${empty list}">
                			<tr>
                				<td colspan="10">조회된 근무이력이 없습니다.</td>
                			</tr>
                		</c:when>
                		<c:otherwise>
							<c:forEach var="a" items="${list}">
								<tr>
			                        <td>${a.dt}</td>
			                        <td>${a.status}</td>
			                        <td>${a.attCmt}</td>
			                        <td>${a.attQt}</td>
			                        <td>${a.workhours}</td>
			                        <td>${a.attTime}</td>        
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
	                <a class="page-link" href="my.att?cpage=${ pi.currentPage - 1 }&id=${ loginUser.empNo }&date1=${date1}&date2=${date2}<c:forEach var="a" items="${array}">&check=${a}</c:forEach>" aria-label="Previous">
	                  <span aria-hidden="true">&laquo;</span>
	                </a>
	              </li>
	              <c:forEach var="no" begin="${ pi.startPage }" end="${ pi.endPage }" step="1">
		              <li class="page-item"><a class="page-link" href="my.att?cpage=${ no }&id=${ loginUser.empNo }&date1=${date1}&date2=${date2}<c:forEach var="a" items="${array}">&check=${a}</c:forEach>">${ no }</a></li>
				  </c:forEach>
	              <li class="page-item">
	                <a class="page-link" href="my.att?cpage=${ pi.currentPage + 1 }&id=${ loginUser.empNo }&date1=${date1}&date2=${date2}<c:forEach var="a" items="${array}">&check=${a}</c:forEach>" aria-label="Next">
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
		 

			
			$(function(){
				var arr=[];
				
				<c:forEach var="a" items="${array}">
					arr.push("${a}") 
				</c:forEach>
				
				if(arr.indexOf("정상") >= 0)  {
					$("input:checkbox[id='1']").prop("checked", true);
				}
				
				if(arr.indexOf("지각") >= 0)  {
					$("input:checkbox[id='2']").prop("checked", true);
				}
				
				if(arr.indexOf("결근") >= 0)  {
					$("input:checkbox[id='3']").prop("checked", true);
				}
				
				if(arr.indexOf("조퇴") >= 0)  {
					$("input:checkbox[id='4']").prop("checked", true);
				}
				
				if(arr.indexOf("연차") >= 0)  {
					$("input:checkbox[id='5']").prop("checked", true);
				}
				
				$("#date1").val("${date1}");
    			$("#date2").val("${date2}");
				
			});		
				
			  
			
			

			
	</script>
	
	
</body>
</html>