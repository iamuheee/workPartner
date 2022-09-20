<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/noticeCss/notice1.css">
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>

    <div style="height: 20px;"></div>

    <div class="ntOuter">

        <div class="ntContainer">

            <!-- 관리자 설정 / 새 게시글 -->
            <div class="ntMenu1_1" style="margin-right:91%">            
                <a id="adminSetting" class="material-symbols-outlined" href="admin.nt">
                    settings
                </a>     
            </div>

            <div class="ntMenu1_2" align="end">
                <a class="btn btn-sm btn-primary" href="insertNtForm.nt">새 게시글</a>                  
            </div>
    
            <!-- 검색 및 필터링-->
            <div class="ntMenu2_1">
               <form action="">
                    <table>
                        <tr>
                            <td>
                                <select name="searchCategory">
                                    <option id="total">전체</option>
                                    <option id="title">제목</option>
                                    <option id="writer">작성자</option>
                                </select>
                            </td>
                            <td>
                                <input type="text" placeholder="내용을 입력해주세요" maxlength="20" name="keyword">
                            </td>
                            <td>
                                <button type="submit" class="btn btn-sm btn-secondary btnSize">검색</button>
                            </td>
                        </tr>
                    </table>       
               </form>
            </div>
            

            <div class="ntMenu2_2" align="end">

                <select name="filter" onchange="">
                    <option name="periodTotal">전체기간</option>
                    <option name="oneWeek">1주일</option>
                    <option name="oneMonth">1개월</option>
                    <option name="sixMonths">6개월</option>
                </select>

                <select name="orderNotice" onchange="">
                    <option name="createDsec">최신순</option>
                    <option name="countDsec">조회순</option>                    
                </select>

            </div>
    
            <!-- 테이블 -->
            <div class="ntMain">

                <table class="table table-hover" id="noticeTable">
                    <thead>
                        <tr>    
                            <th width="50px">번호</th>
                            <th width="20px"></th>
                            <th width="20px"></th>                        
                            <th>제목</th>
                            <th>작성자</th>
                            <th>등록일</th>
                            <th>조회수</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="no">10</td>
                            <td>
                                <span class="material-symbols-outlined" style="color: red;">
                                    campaign
                                </span>
                            </td>
                            <td>
                                <span class="material-symbols-outlined">
                                    attach_file
                                </span>
                            </td>
                            <td>인사발령문 <span style="color: red;">!</span></td>
                            <td>강나람</td>
                            <td>2022-08-20</td>
                            <td>45</td>
                        </tr>                    
                        <tr>
                            <td class="no">9</td>
                            <td>
                                <span class="material-symbols-outlined" style="color: red;">
                                    campaign
                                </span>
                            </td>
                            <td>
                               
                            </td>
                            <td>공지사항2</td>
                            <td>강나람</td>
                            <td>2022-08-20</td>
                            <td>15</td>
                        </tr>
                        <tr>
                            <td class="no">8</td>
                            <td>                                
                            </td>
                            <td>                                
                            </td>
                            <td>인사발령문 <span style="color: red;">!</span></td>
                            <td>강나람</td>
                            <td>2022-08-20</td>
                            <td>45</td>
                        </tr> 
                        <tr>
                            <td class="no">7</td>
                            <td>
                               
                            </td>
                            <td>
                               
                            </td>
                            <td>인사발령문 </td>
                            <td>강나람</td>
                            <td>2022-08-20</td>
                            <td>45</td>
                        </tr> 
                    </tbody>
                   

                </table>

                <script>
            
                    $(function(){
                        $("#noticeTable>tbody>tr").click(function(){
                            location.href = 'detail.nt?no=' + $(this).children(".no").text();
                                                            // 해당 tr요소의 자식요소 중 클래스가 no인
                        })        		
                    })            	
                    
                    </script>
    
            </div>
    
            <!-- 페이징 -->
            <div class="ntPasing">
                <nav aria-label="Page navigation example" class="pasingCenter">
                    <ul class="pagination">
                      <li class="page-item">
                        <a class="page-link" href="#" aria-label="Previous">
                          <span aria-hidden="true">&laquo;</span>
                        </a>
                      </li>
                      <li class="page-item"><a class="page-link" href="#">1</a></li>
                      <li class="page-item"><a class="page-link" href="#">2</a></li>
                      <li class="page-item"><a class="page-link" href="#">3</a></li>
                      <li class="page-item">
                        <a class="page-link" href="#" aria-label="Next">
                          <span aria-hidden="true">&raquo;</span>
                        </a>
                      </li>
                    </ul>
                  </nav>     
            </div>
    
        </div>

       
    </div>
   
</body>
</html>