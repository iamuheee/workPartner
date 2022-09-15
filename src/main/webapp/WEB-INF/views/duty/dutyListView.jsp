<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
     <meta charset="utf-8" />
     <meta http-equiv="X-UA-Compatible" content="IE=edge" />
     <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
     <meta name="description" content="" />
     <meta name="author" content="" />
     <title>WorkPartner!</title>
     <link href="css/styles.css" rel="stylesheet" />
     <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>

     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
     <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
     <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

     <style>
     	.cate-title{
     		font-weight:bolder;
     	}
	 	table tr,td{
	 		padding-top:10px;
	 		text-align:center;
	 	}
		.filter{
		    font-size: small;
		    color: gray;
		}
		.btn{
		   height:25px; line-height: 15px;
		}
		.page-link *{
			color:gray;
			text-decoration:none;
		}
		.paging{
			margin-top:20px;
			float:right;
		}
     </style>
 
</head>
<body class="sb-nav-fixed">
   	<jsp:include page="../common/menubar.jsp" />
    
    <div id="content">
        <main>
            <div class="container-fluid px-4">
                <h2 class="mt-4 cate-title">개인 업무 <span style="font-size:18px;color:gray;">(${ dlist.size() })</span></h2>
                
                <form action="" align="right" class="filter">
                    <input type="checkbox" name="exceptDone" id="exceptDone" class=".form-check-inline">
                    <label for="exceptDone">완료 업무 제외</label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    
                    <span>우선순위별 조회</span>
                    <select name="filter" class="filter">
                        <option>전체보기</option>
                        <option value="1">긴급</option>
                        <option value="2">중요</option>
                        <option value="3">지연</option>
                        <option value="4">진행</option>
                    </select>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    
                    <input type="text" name="keyword" id="search" class="mb-3" style="border:1px solid lightgray;"placeholder="업무명으로 검색">
                    <button class="btn btn-sm btn-secondary" style="margin-bottom:3px;">검색</button>
                </form>
                
                
                <div class="filter">
                    <button class="btn btn-sm filter">전체 업무</button> 
                    <button class="btn btn-sm filter">내 등록 업무</button> 
                    <button class="btn btn-sm filter">내 담당 업무</button>
                </div>
				
				<hr style="height:0.1px; background-color:black"><br>
				
                <table class="table-hover"  align="center" style="width:1200px;">
                    <thead>
                        <tr>
                            <th width="10%">업무번호</th>
                            <th width="40%">업무명</th>
                            <th width="10%">우선순위</th>
                            <th width="10%">진행상태</th>
                            <th width="10%">시작일</th>
                            <th width="10%">마감일</th>
                            <th width="10%">등록일</th>
                        </tr>
                    </thead>
                	<c:choose>
                		<c:when  test="${ not empty dlist }">
                		<c:forEach var="d" items="${ dlist }">
		                    <tbody>
		                        <tr class="each-duty">
		                            <td class="dutyNo">${ d.dutyNo }</td>
		                            <td>${ d.title }</td>
		                            <td><span class="imp">${ d.importance }</span></td>
		                            <td><span class="prog">${ d.progress }</span></td>
		                            <%-- yyyy-MM-dd 형태로 오라클에 저장되었는데, 이게 숫자로 자동형변환돼서 사칙연산 되어버림.. --%>
		                            <td>${ d.startDate }</td>
		                            <td>${ d.endDate }</td>
		                            <td><fmt:formatDate value="${d.enrollDate}" pattern="yyyy-MM-dd"/></td>
		                        </tr>
		                    </tbody>
                		</c:forEach>
                		</c:when>
                		<c:otherwise>
                			<tbody>
                				<tr>
                					<td colspan="7">등록된 업무가 없습니다.</td>
                				</tr>
                			</tbody>
                		</c:otherwise>
                	</c:choose>
                </table>
				
				<br><br>
				
				<!-- 페이징 -->
				<div class="paging">
			    	<ul class="pagination">
						<li class="page-item">
					        <a class="page-link" href="list.du?cpage=${ pi.currentPage - 1 }" aria-label="Previous">
				          		<span aria-hidden="true">&laquo;</span>
					        </a>
						</li>
							<c:forEach var="no" begin="${ pi.startPage }" end="${ pi.endPage }" step="1">
								<li class="page-item"><a class="page-link" href="list.du?cpage=${ no }"><span>${ no }</span></a></li>
							</c:forEach>
						<li class="page-item">
							<a class="page-link" href="list.du?cpage=${ pi.currentPage - 1 }" aria-label="Next">
		  						<span aria-hidden="true">&raquo;</span>
							</a>
						</li>
				    </ul>
				</div>
				<div style="height:100px;"></div>
            </div>
        </main>
    </div>
    
    
    <script>
	    
    // tbody의 tr 클릭하면 해당 업무번호의 detail.du?no=XX으로 이동
    $(".each-duty").click(function(){
    	location.href = "detail.du?no=" + $(this).children(".dutyNo").text();
    })
    
    // 페이징 관련 스크립트
    // 1) pi.currentPage == 1인 경우, Previous 버튼 비활성화
    if( ${pi.currentPage} == 1 ){
    	$("a[aria-label='Previous']").removeAttr("href");
    }
    
    // 2) pi.currentPage == pi.endPage인 경우, Next 버튼 비활성화
    if( ${pi.currentPage} == ${pi.endPage} ){
    	$("a[aria-label='Next']").removeAttr("href");
    }
    
    
    </script>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" cossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
    <script src="js/datatables-simple-demo.js"></script>
</body>
</html>