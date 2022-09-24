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

.pagination {
	font-size: 12px;
	margin-top: 10px;
	margin-right: auto;
	margin-left: auto;
	width: 280px;
}

#layoutSidenav_content {
	font-family: 'Noto Sans KR', sans-serif;
}
/* .mainOuter{
	margin-top:0 !important;
} */
.dpTitle{
			text-decoration-line: none;
			color: #212529;
		}
</style>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />

	<c:choose>
		<c:when test="${ flag == 'otherSign' }">
			<div class="container-fluid px-4" style="margin-top: 30px;">
				<div style="margin-bottom: 50px; line-height: 10px;">
					<ol class="breadcrumb mb-4" style="font-size: 18px; width: 100%;">
						<li>결재함 >&nbsp</a></li>
						<li><b>타부서 결재하기</b></li>
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
						</select> <span style="font-size: 14px; float: left; margin-left: 15px;">부서명
							: </span> <select>
							<option value="" hidden>부서선택</option>
							<option value="">인사부</option>
							<option value="">영업부</option>
							<option value="">개발부</option>
							<option value="">총무부</option>
							<option value="">마케팅부</option>
							<option value="">재무회계부</option>
						</select> <input type="text"
							style="width: 15%; box-shadow: 0px 0px 2px #878787; border: none;"
							align="right">
						<button
							style="width: 60px; padding: 0; border: none; background: #87878740; box-shadow: 0px 0px 2px #878787;">검색</button>
					</div>

					<table class="endSignList" width="100%">

						<tr align="center">
							<th class="endNum" width="8%">문서번호</th>
							<th class="endNum" width="8%">서식</th>
							<th class="endCreate" width="8%">요청부서</th>
							<th class="endCreate" width="8%">첨부파일</th>
							<th class="endTitle" width="20%">제목</th>
							<th width="10%">기안자</th>
							<th width="10%">기안일</th>
							<th width="14%">현재결재자</th>
							<th width="14%">최종결재자</th>
						</tr>
						<c:choose>
	                		<c:when test="${empty othSignList }">
	                			<tr>
	                				<td colspan="9" align="center">현재 게시글이 없습니다.</td>
	                			</tr>
	                		</c:when>
	                		<c:otherwise>
	                			<c:forEach var="o" items="${ othSignList }">
				                    <tr align="center">
				                   	    <td>${ o.dpNo }</td>
				                        <td>${ o.dpCategory }</td>
				                        <td>${ o.signDeptName }</td>
				                        <td>
					                        <c:if test="${ not empty o.dpOrigin }">
					                       		<span class="material-icons" style="vertical-align:middle; font-size:17px; color:#878787;">
												attachment
												</span>
					                        </c:if>
				                        </td>
				                        <c:choose>
					                        <c:when test="${empty o.dpTitle }">
					                        	<td><a href="" class="dpTitle">제목없음</a></td>
					                        </c:when>
					                        <c:otherwise>
					                        	<td><a href="" class="dpTitle">${ o.dpTitle }</a></td>
					                        </c:otherwise>
				                        </c:choose>
				                        <td>${ o.empName}(${o.signDeptName})</td>
				                        <td>${ o.dpCreate }</td>
				                        <td>${ loginUser.empName }(${ loginUser.depCd }) </td>
				                        <td>${ o.signEmpName }(${ o.signEmpDept })</td>
				                    </tr>
			                    </c:forEach>
	                		</c:otherwise>
	                   </c:choose>
					
					</table>
					<c:if test="${not empty othSignList }">
                        <div id="pagingArea">
			                <ul class="pagination">
			                	<c:choose>
			                		<c:when test="${ pi.currentPage eq 1 }">
			                    		<li class="page-item disabled"><a class="page-link">이전</a></li>
			                    	</c:when>
			                    	<c:otherwise>
			                    		<li class="page-item"><a class="page-link" href="othSi.si?empNo=${ loginUser.empNo }&cpage=${ pi.currentPage-1 }">이전</a></li>
			                    	</c:otherwise>
			                    </c:choose>
			                    
			                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
			                  	  <li class="page-item"><a class="page-link" href="othSi.si?empNo=${ loginUser.empNo }&cpage=${ p }">${ p }</a></li>
			                    </c:forEach>
			                    
			                    <c:choose>
			                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
				                	    <li class="page-item disabled"><a class="page-link">다음</a></li>
				                	</c:when>
				                	<c:otherwise>
				                    	<li class="page-item"><a class="page-link" href="othSi.si?empNo=${ loginUser.empNo }&cpage=${ pi.currentPage+1 }">다음</a></li>
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
						<li>결재함 >&nbsp</a></li>
						<li><b>타부서 결재완료</b></li>
					</ol>
					<hr>
				</div>

				<div>
					<div class="searchbar" style="width: 100%;" align="right">
						<span style="font-size: 16px; float: left;">서식명 : </span> <select>
							<option value="">전체</option>
							<option value="">연차</option>
							<option value="">업무협조</option>
							<option value="">외근</option>
							<option value="">퇴직원</option>
						</select> <span style="font-size: 16px; float: left; margin-left: 15px;">부서명
							: </span> <select>
							<option value="" hidden>부서선택</option>
							<option value="">인사부</option>
							<option value="">영업부</option>
							<option value="">개발부</option>
							<option value="">총무부</option>
							<option value="">마케팅부</option>
							<option value="">재무회계부</option>
						</select> <input type="text"
							style="width: 15%; box-shadow: 0px 0px 2px #878787; border: none;"
							align="right">
						<button
							style="width: 60px; padding: 0; border: none; background: #87878740; box-shadow: 0px 0px 2px #878787;">검색</button>
					</div>

					<table class="endSignList" width="100%">

						<tr align="center">
							<th class="endNum" width="10%">문서번호</th>
							<th class="endNum" width="10%">서식</th>
							<th class="endCreate" width="10%">요청부서</th>
							<th class="endCreate" width="10%">첨부파일</th>
							<th class="endTitle" width="20%">제목</th>
							<th width="13%">기안자</th>
							<th width="12%">나의 결재일</th>
							<th width="15%">최종결재자</th>
						</tr>

						<c:choose>
	                		<c:when test="${empty endOthSignList }">
	                			<tr>
	                				<td colspan="8" align="center">현재 게시글이 없습니다.</td>
	                			</tr>
	                		</c:when>
	                		<c:otherwise>
	                			<c:forEach var="e" items="${ endOthSignList }">
				                    <tr align="center">
				                   	    <td>${ e.dpNo }</td>
				                        <td>${ e.dpCategory }</td>
				                        <td>${ e.signDeptName }</td>
				                        <td>
					                        <c:if test="${ not empty e.dpOrigin }">
					                       		<span class="material-icons" style="vertical-align:middle; font-size:17px; color:#878787;">
												attachment
												</span>
					                        </c:if>
				                        </td>
				                        <c:choose>
					                        <c:when test="${empty e.dpTitle }">
					                        	<td><a href="" class="dpTitle">제목없음</a></td>
					                        </c:when>
					                        <c:otherwise>
					                        	<td><a href="" class="dpTitle">${ e.dpTitle }</a></td>
					                        </c:otherwise>
				                        </c:choose>
				                        <td>${ e.empName}(${e.signDeptName})</td>
				                        <td>${ e.dpCreate }</td>
				                        <td>${ e.signEmpName }(${ e.signEmpDept })</td>
				                    </tr>
			                    </c:forEach>
	                		</c:otherwise>
	                   </c:choose>
					
					</table>
					<c:if test="${not empty endOthSignList }">
                        <div id="pagingArea">
			                <ul class="pagination">
			                	<c:choose>
			                		<c:when test="${ pi.currentPage eq 1 }">
			                    		<li class="page-item disabled"><a class="page-link">이전</a></li>
			                    	</c:when>
			                    	<c:otherwise>
			                    		<li class="page-item"><a class="page-link" href="othSi.si?empNo=${ loginUser.empNo }&cpage=${ pi.currentPage-1 }">이전</a></li>
			                    	</c:otherwise>
			                    </c:choose>
			                    
			                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
			                  	  <li class="page-item"><a class="page-link" href="othSi.si?empNo=${ loginUser.empNo }&cpage=${ p }">${ p }</a></li>
			                    </c:forEach>
			                    
			                    <c:choose>
			                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
				                	    <li class="page-item disabled"><a class="page-link">다음</a></li>
				                	</c:when>
				                	<c:otherwise>
				                    	<li class="page-item"><a class="page-link" href="othSi.si?empNo=${ loginUser.empNo }&cpage=${ pi.currentPage+1 }">다음</a></li>
				                	</c:otherwise>    
			                    </c:choose>
			                </ul>
		            	</div>
	                </c:if>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
	<script>   
		$(document).ready(function(){
			$(".dpTitle").click(function(){
              			vacation = window.open("detailMy.si?no=" + $(this).parents().parents().children().eq(0).text() + "&ct=" + $(this).parents().parents().children().eq(1).text(), "btn", "width=815, height=800");
              			console.log($(this).parent().siblings(".a").val("input[type=hidden]"));
	            	vacation.moveTo(560,120);
	            	vacation.focus();
			})
		})
    </script> 
	</main>
	</div>
	</div>
</body>
</html>