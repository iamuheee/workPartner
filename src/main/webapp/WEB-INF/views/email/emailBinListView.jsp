<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css  -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/emailCss/email1.css">
</head>
<body>
	<jsp:include page="../common/menubar.jsp"></jsp:include>

    <div style="height: 20px;"></div>

    <div class="ntOuter">

        <div class="ntContainer">
           
            <div class="ntMenu1">            
                <span style="font-size: 18px;"><b>휴지통</b></span>
            </div>
                
            <!-- 검색 및 필터링-->
            <div class="ntMenu2">
               
                <table>
                    <tr>
                        <td>
                            <select name="searchCategory">
                                <option id="mailSender">보낸사람</option>
                                <option id="mailTitle">제목</option>
                                <option id="mailContent">내용</option>
                            </select>
                        </td>
                        <td>
                            <input type="text" placeholder="내용을 입력해주세요" maxlength="20" name="keyword">
                        </td>       
                        <td> &nbsp; 기간: &nbsp;</td>                 
                        <td>
                            <select name="filter">
                                <option name="periodTotal">전체기간</option>
                                <option name="sixMonths">6개월</option>
                                <option name="oneMonth">1개월</option>
                                <option name="oneWeek">1주일</option>
                            </select>
                        </td>
                        <td>
                            <select name="orderEmail">
                                <option name="createDsec">최신순</option>
                                <option name="createAsc">받은일자순</option>                    
                            </select>
                        </td>
                        <td>
                            <button type="button" class="btn btn-sm btn-secondary btnSize" onclick="">검색</button>
                        </td>
                    </tr>

                </table>       
               
            </div>
            

            <div class="ntMenu3">

                &nbsp;&nbsp; <input type="checkbox" name="" id="cbx_chkAll" onclick=""> &nbsp;&nbsp;
               
                <button type="button" class="btn btn-sm btn-danger">영구삭제</button>                

                <button type="button" class="btn btn-sm btn-primary">복원</button>
               
            </div>
    
            <!-- 테이블 -->
            <div class="ntMain">
                <!-- 중요메일함 버튼 클릭하면 class 효과를 달리주고 =>  db에 star부분 y,n처리 -->
                <table class="table" id="emailTable">
                   <thead>
                        <tr>
                            <th width="20px"></th>
                            <th  width="10px"></th>
                            <th  width="10px"></th>
                            <th  width="10px"></th>
                            <th  width="60px">번호</th>
                            <th>보낸사람</th>
                            <th>제목</th>
                            <th>날짜</th>
                        </tr>
                   </thead>
                   
                   <tbody>
                        <tr>
                            <td><input type="checkbox" name="chk"></td>                  
                            <td>
                                <span class="material-symbols-outlined starYellow">
                                 grade
                                </span>
                            </td>
                            <td>
                                <span class="material-symbols-outlined emailNotRead">
                                    mail
                                </span>
                            </td>
                            <td>
                                <span class="material-symbols-outlined">
                                    attach_file
                                </span>
                            </td>
                            <td class="no">20</td>
                            <td>강나람</td>
                            <td class="emailTitle"><span class="borderStyle">기밀</span> 15주년 창립감사인사 <span style="color:red">!</span></td>
                            <td>2021.08.21</td>
                        </tr>

                        <tr>
                            <td><input type="checkbox" name="chk"></td>                  
                            <td>
                                <span class="material-symbols-outlined starYellow">
                                 grade
                                </span></td>
                            <td>
                                <span class="material-symbols-outlined">
                                    mail
                                </span>
                            </td>
                            <td>
                                <span class="material-symbols-outlined">
                                    attach_file
                                </span>
                            </td>
                            <td class="no">19</td>
                            <td>강나람</td>
                            <td class="emailTitle"><span class="borderStyle">기밀</span> 15주년 창립감사인사 </td>
                            <td>2021.08.21</td>
                        </tr>

                        <tr>
                            <td><input type="checkbox" name="chk"></td>                  
                            <td>
                                <span class="material-symbols-outlined">
                                 grade
                                </span></td>
                            <td>
                                <span class="material-symbols-outlined">
                                    mail
                                </span>
                            </td>
                            <td>
                                
                            </td>
                            <td class="no">18</td>
                            <td>강나람</td>
                            <td class="emailTitle"> 15주년 창립감사인사</td>
                            <td>2021.08.21</td>
                        </tr>
                   </tbody>
                   

                </table>

                <script>
            
                    $(function(){
                        $(".emailTitle").click(function(){
                            location.href = 'detail.em?no=' + $(this).siblings(".no").text();
                                                            // 해당 emailTitle의 동위요소  중 클래스가 no인
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

    <script>
        $(document).ready(function() {
            $("#cbx_chkAll").click(function() {
                if($("#cbx_chkAll").is(":checked")) $("input[name=chk]").prop("checked", true);
                else $("input[name=chk]").prop("checked", false);
            });

            $("input[name=chk]").click(function() {
                var total = $("input[name=chk]").length;
                var checked = $("input[name=chk]:checked").length;

                if(total != checked) $("#cbx_chkAll").prop("checked", false);
                else $("#cbx_chkAll").prop("checked", true); 
            });
        }); 
    </script>

</body>
</html>