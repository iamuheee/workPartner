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
            font-size: 18px;
        }

        table td {
            border-bottom: 0.5px solid #878787;
            font-size: 16px;
        }

        table {
            margin-top: 10px;

        }
        .searchbar select{
            margin-left:5px; 
            float: left;  
            border:none; 
            box-shadow: 0px 0px 2px #878787; 
            font-size: 14px;
        }
        .pagination{
            font-size:14px;
            margin-top:10px; 
            margin-right: auto; 
            margin-left:auto; 
            width:280px;

        }
        .endSignList a{
            padding: 1px;
        }
       /*  #layoutSidenav_content{
            font-family: 'Noto Sans KR', sans-serif;
        } */
       /*  .mainOuter{
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
	<jsp:include page="../common/menubar.jsp"/>
                <c:choose>
                    <c:when test="${ flag == 'save' }">
                        <div class="container-fluid px-4" style="margin-top: 30px;">
                            <div style="margin-bottom: 50px; line-height: 10px;">
                                <ol class="breadcrumb mb-4" style="font-size:18px; width: 100%;">
                                    <li>기안서 >&nbsp</a></li>
                                    <li><b>임시저장</b></li>
                                </ol>
                                <hr>
                            </div>

                            <div>
                                <div class="searchbar" style="width: 100%;" align="right">
                                    <span style="font-size: 14px; float: left;">서식명 : </span>
                                    <select
                                        style="margin-left:5px; float: left; width:90px; text-align:center; border:none; box-shadow: 0px 0px 2px #878787;">
                                        <option value="">전체</option>
                                        <option value="">연차</option>
                                        <option value="">업무협조</option>
                                        <option value="">외근</option>
                                        <option value="">퇴직원</option>
                                    </select>
                                    <span style="font-size: 14px; float: left; margin-left: 15px;">작성일 : </span>
                                    <select
                                        style="margin-left:5px; float: left; width:90px; text-align:center; border:none; box-shadow: 0px 0px 2px #878787;">
                                        <option value="">최근 1개월</option>
                                        <option value="">최근 3개월</option>
                                        <option value="">최근 6개월</option>
                                    </select>
                                    <input type="text"
                                        style="width: 15%; box-shadow: 0px 0px 2px #878787; border:none;"
                                        align="right">
                                    <button
                                        style="width:60px; height:26px; padding:0; border: none; background: #87878740; box-shadow: 0px 0px 2px #878787;">검색</button>
                                </div>



                                <table class="endSignList" width="100%">

                                    <tr align="center">
                                        <th width="5%"><input type="checkbox" style="scale: 1.3;"></th>
                                        <th class="endNum" width="10%">문서번호</th>
                                        <th class="endNum" width="10%">서식</th>
                                        <th class="endTitle" width="30%">제목</th>
                                        <th class="endCreate" width="15%">임시저장일</th>
                                        <th width="15%">첨부파일</th>
                                        <th width="15%">이어서 작성하기</th>
                                    </tr>

				
									<c:choose>
				                		<c:when test="${empty saveList }">
				                			<tr>
				                				<td colspan="6" align="center">현재 게시글이 없습니다.</td>
				                			</tr>
				                		</c:when>
				                		<c:otherwise>
				                			<c:forEach var="s" items="${ saveList }">
							                    <tr align="center">
							                   	    <td><input type="checkbox" style="scale: 1.3;"></td>
							                        <td class='a'>${ s.dpNo }</td>
							                        <td>${ s.dpCategory }</td>
							                        <c:choose>
								                        <c:when test="${empty s.dpTitle }">
								                        	<td><a href="" id="detailBtn" class="dpTitle">제목없음</a></td>
								                        </c:when>
								                        <c:otherwise>
								                        	<td><a href="" id="detailBtn" class="dpTitle">${ s.dpTitle }</a></td>
								                        </c:otherwise>
							                        </c:choose>
							                        <td>${ s.dpCreate }</td>
							                        <td>
								                        <c:if test="${ not empty s.dpOrigin }">
								                       		<span class="material-icons" style="vertical-align:middle; font-size:17px; color:#878787;">
															attachment
															</span>
								                        </c:if>
							                        </td>
                                       				<td><a href="" class="dpTitle">작성하기</a></td>
							                    </tr>
												<!-- <script>
													$(document).ready(function(){
														$("#detailBtn").click(function(){
															if('${s.dpCategory}')
														})
													}
											       	function showPopup(){
											        	if($)
											        vacation = window.open("vaEnroll.si", "btn", "width=805, height=800");
											        vacation.moveTo(560,120);
											        vacation.focus();
											        };
										    	</script> -->
						                    </c:forEach>
				                		</c:otherwise>
				                   </c:choose>
		 	                    
				                    
                                </table>

                                <c:if test="${not empty saveList }">
                                <div id="pagingArea">
                                <button style="float:left; margin-left:10px; margin-top: 10px; border:none; box-shadow:0px 0px 2px #878787; font-size: 14px;">삭제</button>
					                <ul class="pagination">
					                	<c:choose>
					                		<c:when test="${ pi.currentPage eq 1 }">
					                    		<li class="page-item disabled"><a class="page-link">이전</a></li>
					                    	</c:when>
					                    	<c:otherwise>
					                    		<li class="page-item"><a class="page-link" href="saveSi.si?empNo=${loginUser.empNo }&fn=임시저장&cpage=${ pi.currentPage-1 }">이전</a></li>
					                    	</c:otherwise>
					                    </c:choose>
					                    
					                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					                  	  <li class="page-item"><a class="page-link" href="saveSi.si?empNo=${loginUser.empNo }&fn=임시저장&cpage=${ p }">${ p }</a></li>
					                    </c:forEach>
					                    
					                    <c:choose>
					                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
						                	    <li class="page-item disabled"><a class="page-link">다음</a></li>
						                	</c:when>
						                	<c:otherwise>
						                    	<li class="page-item"><a class="page-link" href="saveSi.si?empNo=${loginUser.empNo }&fn=임시저장&cpage=${ pi.currentPage+1 }">다음</a></li>
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
                                <ol class="breadcrumb mb-4" style="font-size:18px; width: 100%;">
                                    <li>기안서 >&nbsp</a></li>
                                    <li><b>반려됨</b></li>
                                </ol>
                                <hr>
                            </div>

                            <div>
                                <div class="searchbar" style="width: 100%;" align="right">
                                    <span style="font-size: 14px; float: left;">서식명 : </span>
                                    <select
                                        style="margin-left:5px; float: left; width:90px; text-align:center; border:none; box-shadow: 0px 0px 2px #878787;">
                                        <option value="">전체</option>
                                        <option value="">연차</option>
                                        <option value="">업무협조</option>
                                        <option value="">외근</option>
                                        <option value="">퇴직원</option>
                                    </select>
                                    <span style="font-size: 14px; float: left; margin-left: 15px;">작성일 : </span>
                                    <select
                                        style="margin-left:5px; float: left; width:90px; text-align:center; border:none; box-shadow: 0px 0px 2px #878787;">
                                        <option value="">최근 1개월</option>
                                        <option value="">최근 3개월</option>
                                        <option value="">최근 6개월</option>
                                    </select>
                                    <input type="text"
                                        style="width: 15%; box-shadow: 0px 0px 2px #878787; border:none;"
                                        align="right">
                                    <button
                                        style="width:60px; padding:0; border: none; background: #87878740;box-shadow: 0px 0px 2px #878787;">검색</button>
                                </div>



                                <table class="endSignList" width="100%">

                                    <tr align="center">
                                        <th width="5%"><input type="checkbox" style="scale: 1.3;"></th>
                                        <th class="endNum" width="10%">문서번호</th>
                                        <th class="endNum" width="10%">서식</th>
                                        <th width="15%">첨부파일</th>
                                        <th class="endTitle" width="30%">제목</th>
                                        <th class="endCreate" width="15%">기안일</th>
                                        <th width="15%">재작성</th>
                                    </tr>
										<c:choose>
				                		<c:when test="${empty reSignList }">
				                			<tr>
				                				<td colspan="6" align="center">현재 게시글이 없습니다.</td>
				                			</tr>
				                		</c:when>
				                		<c:otherwise>
				                			<c:forEach var="r" items="${ reSignList }">
							                    <tr align="center">
							                   	    <td><input type="checkbox" style="scale: 1.3;"></td>
							                        <td>${ r.dpNo }</td>
							                        <td>${ r.dpCategory }</td>
							                        <td>
								                        <c:if test="${ not empty r.dpOrigin }">
								                       		<span class="material-icons" style="vertical-align:middle; font-size:17px; color:#878787;">
															attachment
															</span>
								                        </c:if>
							                        </td>
							                        <c:choose>
								                        <c:when test="${empty r.dpTitle }">
								                        	<td><a href="" id="detailBtn" class="dpTitle">제목없음</a></td>
								                        </c:when>
								                        <c:otherwise>
								                        	<td><a href="" id="detailBtn" class="dpTitle">${ r.dpTitle }</a></td>
								                        </c:otherwise>
							                        </c:choose>
							                        <td>${ r.dpCreate }</td>
                                       				<td><a href="" class="dpTitle">작성하기</a></td>
							                    </tr>
						                    </c:forEach>
				                		</c:otherwise>
				                   </c:choose>
                                </table>

                               	<c:if test="${ not empty reSignList }">
                                <div id="pagingArea">
                                <button style="float:left; margin-left:10px; margin-top: 10px; border:none; box-shadow:0px 0px 2px #878787; font-size: 14px;">삭제</button>
					                <ul class="pagination">
					                	<c:choose>
					                		<c:when test="${ pi.currentPage eq 1 }">
					                    		<li class="page-item disabled"><a class="page-link">이전</a></li>
					                    	</c:when>
					                    	<c:otherwise>
					                    		<li class="page-item"><a class="page-link" href="reSi.si?empNo=${loginUser.empNo }&fn=반려됨&cpage=${ pi.currentPage-1 }">이전</a></li>
					                    	</c:otherwise>
					                    </c:choose>
					                    
					                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					                  	  <li class="page-item"><a class="page-link" href="reSi.si?empNo=${loginUser.empNo }&fn=반려됨&cpage=${ p }">${ p }</a></li>
					                    </c:forEach>
					                    
					                    <c:choose>
					                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
						                	    <li class="page-item disabled"><a class="page-link">다음</a></li>
						                	</c:when>
						                	<c:otherwise>
						                    	<li class="page-item"><a class="page-link" href="reSi.si?empNo=${loginUser.empNo }&fn=반려됨&cpage=${ pi.currentPage+1 }">다음</a></li>
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
		                			vacation = window.open("detailMy.si?no=" + $(this).parents().parents().children().eq(1).text() + "&ct=" + $(this).parents().parents().children().eq(2).text(), "btn", "width=815, height=800");
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