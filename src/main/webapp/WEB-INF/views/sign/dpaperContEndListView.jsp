<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

/* ............................ */
table th {
	border-top: 1px solid #878787;
	border-bottom: 1px solid #878787;
	height: 50x;
	font-size: 16px;
}

table td {
	border-bottom: 0.5px solid #878787;
	font-size: 14px;
}

table {
	margin-top: 10px;
}

.searchbar select {
	margin-left: 5px;
	float: left;
	border: none;
	box-shadow: 0px 0px 2px #878787;
	font-size: 14px;
}

.pagination{
            font-size:14px;
            margin-top:10px; 
            margin-right: auto; 
            margin-left:auto; 
            width:300px;

        }
#layoutSidenav_content {
	font-family: 'Noto Sans KR', sans-serif;
}
.dpTitle{
			text-decoration-line: none;
			color: #212529;
		}
/* .mainOuter{
	margin-top:0 !important;
} */
</style>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<c:choose>
		<c:when test="${ flag == 'continue' }">
			<div class="container-fluid px-4" style="margin-top: 30px;">
				<div style="margin-bottom: 50px; line-height: 10px;">
					<ol class="breadcrumb mb-4" style="font-size: 18px; width: 100%;">
						<li>기안서 >&nbsp</a></li>
						<li><b>진행중</b></li>
					</ol>
					<hr>
				</div>

				<div>
					<div class="searchbar" style="width: 100%;" align="right">
						<span style="font-size: 14px; float: left;">서식명 : </span> <select>
							<option value="">전체</option>
							<option value="">연차</option>
							<option value="">업무협조</option>
							<option value="">외근</option>
							<option value="">퇴직원</option>
						</select> <span style="font-size: 14px; float: left; margin-left: 15px;">작성일
							: </span> <select>
							<option value="">최근 1개월</option>
							<option value="">최근 3개월</option>
							<option value="">최근 6개월</option>
						</select> <input type="text"
							style="width: 15%; box-shadow: 0px 0px 2px #878787; border: none;"
							align="right">
						<button
							style="width: 60px; padding: 0; border: none; background: #87878740; box-shadow: 0px 0px 2px #878787;">검색</button>
					</div>

					<table class="endSignList" width="100%">

						<tr align="center">
							<th width="10%" >문서번호</th>
							<th class="endNum" width="10%">서식</th>
							<th class="endTitle" width="30%">제목</th>
							<th class="endCreate" width="10%">첨부파일</th>
							<th class="endCreate" width="15%">진행상태</th>
							<th width="15%">기안일</th>
							<th width="10%">최종결재자</th>
						</tr>
						<c:choose>
	                		<c:when test="${empty progressList }">
	                			<tr>
	                				<td colspan="7" align="center">현재 게시글이 없습니다.</td>
	                			</tr>
	                		</c:when>
	                		<c:otherwise>
	                			<c:forEach var="p" items="${ progressList }">
				                    <tr align="center">
				                   	    <td>${ p.dpNo }</td>
				                        <td>${ p.dpCategory }</td>
				                        <c:choose>
					                        <c:when test="${empty p.dpTitle }">
					                        	<td><a href="" class="dpTitle">제목없음</a></td>
					                        </c:when>
					                        <c:otherwise>
					                        	<td><a href="" class="dpTitle">${ p.dpTitle }</a></td>
					                        </c:otherwise>
				                        </c:choose>
				                        <td>
					                        <c:if test="${ not empty p.dpOrigin }">
					                       		<span class="material-icons" style="vertical-align:middle; font-size:17px; color:#878787;">
												attachment
												</span>
					                        </c:if>
				                        </td>
				                        <td>${ p.dpFinal } </td>
				                        <td>${ p.dpCreate }</td>
				                        <td>${ p.signEmpName }</td>
				                    </tr>
				                    <script>
										$(document).ready(function(){
											$(".dpTitle").click(function(){
					                    		if('${s.dpCategory}' == '연차'){
													$(".dpTitle").attr("href", "detailVa.si");
												}else if('${s.dpCategory}' == '외근'){
													$(".dpTitle").attr("href", "detailOtw.si");
												}else if('${s.dpCategory}' == '퇴직원'){
													$(".dpTitle").attr("href", "detailRes.si");
												}else{
													$(".dpTitle").attr("href", "detailCo.si");
												}
											})
										})
									</script>
			                    </c:forEach>
	                		</c:otherwise>
	                   </c:choose>
					
					</table>
					<c:if test="${not empty progressList }">
                        <div id="pagingArea">
			                <ul class="pagination">
			                	<c:choose>
			                		<c:when test="${ pi.currentPage eq 1 }">
			                    		<li class="page-item disabled"><a class="page-link">이전</a></li>
			                    	</c:when>
			                    	<c:otherwise>
			                    		<li class="page-item"><a class="page-link" href="contSi.si?empNo=${ loginUser.empNo }&fn=진행중&cpage=${ pi.currentPage-1 }">이전</a></li>
			                    	</c:otherwise>
			                    </c:choose>
			                    
			                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
			                  	  <li class="page-item"><a class="page-link" href="contSi.si?empNo=${ loginUser.empNo }&fn=진행중&cpage=${ p }">${ p }</a></li>
			                    </c:forEach>
			                    
			                    <c:choose>
			                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
				                	    <li class="page-item disabled"><a class="page-link">다음</a></li>
				                	</c:when>
				                	<c:otherwise>
				                    	<li class="page-item"><a class="page-link" href="contSi.si?empNo=${ loginUser.empNo }&fn=진행중&cpage=${ pi.currentPage+1 }">다음</a></li>
				                	</c:otherwise>    
			                    </c:choose>
			                </ul>
		            	</div>
	                </c:if>
				</div>
			</div>
		</c:when>

		<c:otherwise>
			<div class="container-fluid px-4" style="margin-top: 30px;">
				<div style="margin-bottom: 50px; line-height: 10px;">
					<ol class="breadcrumb mb-4" style="font-size: 18px; width: 100%;">
						<li>기안서 >&nbsp</a></li>
						<li><b>완료됨</b></li>

					</ol>
					<hr>
				</div>

				<div>
					<div class="searchbar" style="width: 100%;" align="right">
						<span style="font-size: 14px; float: left;">서식명 : </span> <select
							style="margin-left: 5px; float: left; width: 90px; text-align: center; border: none; box-shadow: 0px 0px 2px #878787;">
							<option value="">전체</option>
							<option value="">연차</option>
							<option value="">업무협조</option>
							<option value="">외근</option>
							<option value="">퇴직원</option>
						</select> <span style="font-size: 14px; float: left; margin-left: 15px;">작성일
							: </span> <select
							style="margin-left: 5px; float: left; width: 90px; text-align: center; border: none; box-shadow: 0px 0px 2px #878787;">
							<option value="">최근 1개월</option>
							<option value="">최근 3개월</option>
							<option value="">최근 6개월</option>
						</select> <input type="text"
							style="width: 15%; box-shadow: 0px 0px 2px #878787; border: none;"
							align="right">
						<button
							style="width: 60px; padding: 0; border: none; background: #87878740; box-shadow: 0px 0px 2px #878787;">검색</button>
					</div>

					<table class="endSignList" width="100%">

						<tr align="center">
							<th width="5%">문서번호</th>
							<th class="endNum" width="10%">서식</th>
							<th class="endTitle" width="30%">제목</th>
							<th width="10%">기안일</th>
							<th class="endCreate" width="10%">첨부파일</th>
							<th class="endCreate" width="10%">최종결재자</th>
							<th width="10%">결재일</th>
						</tr>
						<c:choose>
	                		<c:when test="${empty endSignList }">
	                			<tr>
	                				<td colspan="7" align="center">현재 게시글이 없습니다.</td>
	                			</tr>
	                		</c:when>
	                		<c:otherwise>
	                			<c:forEach var="p" items="${ progressList }">
				                    <tr align="center">
				                   	    <td>${ p.dpNo }</td>
				                        <td>${ p.dpCategory }</td>
				                        <c:choose>
					                        <c:when test="${empty p.dpTitle }">
					                        	<td><a href="" class="dpTitle">제목없음</a></td>
					                        </c:when>
					                        <c:otherwise>
					                        	<td><a href="" class="dpTitle">${ p.dpTitle }</a></td>
					                        </c:otherwise>
				                        </c:choose>
				                        <td>${ p.dpCreate }</td>
				                        <td>
					                        <c:if test="${ not empty p.dpOrigin }">
					                       		<span class="material-icons" style="vertical-align:middle; font-size:17px; color:#878787;">
												attachment
												</span>
					                        </c:if>
				                        </td>
				                        <td>${ p.signEmpName }</td>
				                        <td>${ p.lastSigndate } </td>
				                    </tr>
				                    <script>
										$(document).ready(function(){
											$(".dpTitle").click(function(){
					                    		if('${s.dpCategory}' == '연차'){
													$(".dpTitle").attr("href", "detailVa.si");
												}else if('${s.dpCategory}' == '외근'){
													$(".dpTitle").attr("href", "detailOtw.si");
												}else if('${s.dpCategory}' == '퇴직원'){
													$(".dpTitle").attr("href", "detailRes.si");
												}else{
													$(".dpTitle").attr("href", "detailCo.si");
												}
											})
										})
									</script>
			                    </c:forEach>
	                		</c:otherwise>
	                   </c:choose>
						
					</table>
					<c:if test="${not empty endSignList }">
                        <div id="pagingArea">
			                <ul class="pagination">
			                	<c:choose>
			                		<c:when test="${ pi.currentPage eq 1 }">
			                    		<li class="page-item disabled"><a class="page-link">이전</a></li>
			                    	</c:when>
			                    	<c:otherwise>
			                    		<li class="page-item"><a class="page-link" href="endSi.si?empNo=${ loginUser.empNo }&fn=결재완료&cpage=${ pi.currentPage-1 }">이전</a></li>
			                    	</c:otherwise>
			                    </c:choose>
			                    
			                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
			                  	  <li class="page-item"><a class="page-link" href="endSi.si?empNo=${ loginUser.empNo }&fn=결재완료&cpage=${ p }">${ p }</a></li>
			                    </c:forEach>
			                    
			                    <c:choose>
			                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
				                	    <li class="page-item disabled"><a class="page-link">다음</a></li>
				                	</c:when>
				                	<c:otherwise>
				                    	<li class="page-item"><a class="page-link" href="endSi.si?empNo=${ loginUser.empNo }&fn=결재완료&cpage=${ pi.currentPage+1 }">다음</a></li>
				                	</c:otherwise>    
			                    </c:choose>
			                </ul>
		            	</div>
	                </c:if> 
				</div>
			</div>
		</c:otherwise>
	</c:choose>
	</main>

	</div>
	</div>
</body>
</html>