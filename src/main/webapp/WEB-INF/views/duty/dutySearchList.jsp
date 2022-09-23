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
	 	tr,td{
	 		text-align:center;
	 		padding-bottom:5px;
	 	}
	 	td{
	 		padding-top:10px;
	 		font-size:14px;
	 	}
		.filter{
		    font-size: small;
		    color: gray;
		}
		.back-to-list:hover{cursor:pointer;text-decoration:none;}
		button.filter{
			font-weight:bold;
			height:20px;
			line-height:10px;
			border-radius:0px;
			border-right:1px solid gray;
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
                
                <br>
                
				<hr style="height:0.1px; background-color:black">
				
                <table class="table-hover" id="duty-table" style="width:100%;">
                    <thead>
                        <tr>
                            <th width="5%">No</th>
                            <th width="40">업무명</th>
                            <th width="5%">중요도</th>
                            <th width="5%">상태</th>
                            <th width="10%">작성자</th>
                            <th width="15%">담당자</th>
                            <th width="10%">시작일</th>
                            <th width="10%">마감일</th>
                        </tr>
                    </thead>
                	<c:choose>
                		<c:when  test="${ not empty dlist }">
	                    <tbody id="original-tbody">
                		<c:forEach var="d" items="${ dlist }">
		                        <tr class="each-duty original-tr">
		                            <td class="dutyNo">${ d.dutyNo }</td>
		                            <td>${ d.title }</td>
		                            <td><span class="imp">${ d.importance }</span></td>
		                            <td><span class="prog">${ d.progress }</span></td>
		                            <td>${ d.empName }</td>
		                            <td>
		                            	${ d.empIC[0].empICName } <c:if test="${ d.empIC.size() > 1 }"> 외 ${ d.empIC.size() - 1 }명</c:if>
		                            </td>
		                            <td>${ d.startDate }</td>
		                            <td>${ d.endDate }</td>
		                        </tr>
                		</c:forEach>
	                    </tbody>
                		</c:when>
                		<c:otherwise>
                			<tbody>
                				<tr>
                					<td colspan="8">검색 조건과 일치하는 업무가 없습니다.</td>
                				</tr>
                			</tbody>
                		</c:otherwise>
                	</c:choose>
                </table>
				
				<br><br>
				
				<div id="back-to-list" align="center">
					<a class="filter back-to-list" href="list.du">개인 업무 전체 리스트로 이동</a>
				</div>
				
                <br><br>
				
				<!-- 페이징 -->
				<div class="paging">
			    	<ul class="pagination">
						<li class="page-item">
					        <a class="page-link" href="search.du?cpage=${ pi.currentPage - 1 }" aria-label="Previous">
				          		<span aria-hidden="true">&laquo;</span>
					        </a>
						</li>
							<c:forEach var="no" begin="${ pi.startPage }" end="${ pi.endPage }" step="1">
								<li class="page-item"><a class="page-link" href="search.du?cpage=${ no }"><span>${ no }</span></a></li>
							</c:forEach>
						<li class="page-item">
							<a class="page-link" href="search.du?cpage=${ pi.currentPage + 1 }" aria-label="Next">
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
    	console.log( ${pi} );
    
		// tbody의 tr 클릭하면 해당 업무번호의 detail.du?no=XX으로 이동
		$(".each-duty").click(function(){
			location.href = "detail.du?no=" + $(this).children(".dutyNo").text();
		})
		
		
		///////////////////////////
		// 페이징 관련 스크립트 //

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