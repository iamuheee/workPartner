<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .ntOuter{
        margin: auto;
        padding: 20px;         
        align-items: center;
        box-shadow :  2px 3px 5px 2px rgb(212, 211, 211);;
        border-radius: 10px;
        width: 80%; 
        height: 85%;
    }

    /* 그리드영역 */
    .ntContainer{
         margin: 30px;
         display: grid;
         grid-gap: 10px;
         height: 90vh;         
         grid-template-columns: 1fr 1fr;
         grid-template-rows: 40px 40px 0.85fr 40px;
         grid-template-areas: 'menu1_1 menu1_2'
                              'menu2_1 menu2_2'
                              'main main'
                              'footer footer';    
        color: rgb(43, 42, 42);  
        font-size: 13px;
     }
     .ntContainer div{
         /* border: 1px solid  black;         */
     } 

    .ntMenu1_1{ grid-area: menu1_1; }

    .ntMenu1_2{ grid-area: menu1_2; }
     
     .ntMenu2_1{ grid-area: menu2_1;}

     .ntMenu2_2{ grid-area: menu2_2;}
          
     .ntMain{grid-area: main;}

     .ntPasing{
        grid-area: footer;
        place-items: center;
        display: grid;
    }

     #adminSetting:hover{
        cursor: pointer;        
     }

     .ntContainer select{        
        border: 1px solid #ced4da;
        border-radius: 0.25rem;      
        /* margin: 5px;          */
        height: 30px;
               
     }
     
     .ntContainer input{        
        border: 1px solid #ced4da;
        border-radius: 0.25rem;     
        height: 30px;
        
     }
       

    .inline{display: inline;}
    
    #noticeTable>tbody:hover{cursor: pointer;}
     
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>

    <div style="height: 20px;"></div>

    <div class="ntOuter">

        <div class="ntContainer">

            <!-- 관리자 설정 / 새 게시글 -->
            <div class="ntMenu1_1">            
                <span id="adminSetting" class="material-symbols-outlined" data-toggle="modal" data-target="#noticeAdmin">
                    settings
                </span>     
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

         <!-- 내연락처 편집 Modal -->
        <div class="modal fade" id="noticeAdmin" tabindex="-1" aria-labelledby="noticeAdminModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">               
                    <div class="modal-body">   
                        <h6><b>공지사항 설정</b></h6> 
                        <br>

                        <form action="">                            
                            <table>
                                <tr>
                                    <td width="90px" style="font-size: 13px;">추가 관리자</td>
                                    <td>
                                        <div name="addressWrap" class="inline">                                                                           
                                            <input type="text" placeholder="이름, 부서를 입력하세요" name="keyword">
                                        </div>
                                    </td>
                                    <td>
                                        <a class="material-symbols-outlined btn btn-sm btn-secondary" href="">
                                            lan
                                        </a>
                                    </td>
                                </tr>
                            </table>
                            <br>
                            <div align="center">
                                <button type="submit" class="btn btn-sm btn-primary">수정</button>
                                <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">취소</button>
                            </div>
                            <br>
                        </form>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
   
</body>
</html>