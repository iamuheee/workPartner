<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

     /* 그리드영역 */
     .neContainer{
         margin: 30px;
         display: grid;
         grid-gap: 5px;
         height: 90vh;         
         grid-template-columns: 1fr 1fr;
         grid-template-rows: 40px 1fr 40px;
         grid-template-areas: 'menu1_1 menu1_2'                              
                              'main main'
                              'footer footer';    
        color: rgb(43, 42, 42);  
        font-size: 13px;
     }

    .neContainer div{
         /* border: 1px solid  black;         */
     } 

    .neMenu1_1{ grid-area: menu1_1; }

    .neMenu1_2{ grid-area: menu1_2; }    
              
    .neMain{grid-area: main;}

    .nePasing{
        grid-area: footer;
        place-items: center;
        display: grid;
    }

    .ntOuter1{
        margin: auto;
        /* margin-top: 10%; */
        padding: 40px;         
        align-items: center;         
        width: 80%; 
        height: 100%;
        color: rgb(43, 42, 42); 
    }

    .ntOuter2{
        /* margin: auto; */
        /* margin-top: 10%; */
        padding: 40px;         
        /* align-items: center; */
        box-shadow :  2px 3px 5px 2px rgb(212, 211, 211);;
        border-radius: 10px;
        width: 100%; 
        height: 100%;
        /* color: rgb(43, 42, 42);  */
    }

    
    .ntOuter input{        
        border: 1px solid #ced4da;
        border-radius: 0.25rem;     
        height: 30px;
        
     }
    .fontsize13{font-size: 13px;}
    .fontsize15{font-size: 15px;}

    #profileImg{
         width:50px;
         height:50px;
         border:1px solid lightgray;
         border-radius: 50%;               
     }

     .borderStyle{
        width: 60%;
        padding: 20px;                
        border:1px solid  rgb(212, 211, 211);
        border-radius: 7px;   
        margin-bottom: 15px;  
          
     }

     .noteText{
        resize:none;
        width:100%;         
     }
     
     .ntOuter1 select{        
        border: 1px solid #ced4da;
        border-radius: 0.25rem;      
        /* margin: 5px;          */
        height: 30px;
               
     }
     
     .ntOuter1 input{        
        border: 1px solid #ced4da;
        border-radius: 0.25rem;     
        height: 30px;
        
     }
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>

    <div class="ntOuter1">
        
        <div class="neContainer">
            <div class="neMenu1_1">
                <button type="button" class="btn btn-sm btn-primary">받은 쪽지함</button>
                <button type="button" class="btn btn-sm btn-secondary">보낸 쪽지함</button>
                &nbsp;&nbsp;&nbsp;
                <span style="font-size: 12px; color:rgb(117, 116, 116) ;"> 받은 쪽지는 [자세히 보기] 클릭 시 안읽음 상태가 해지됩니다. </span>
            </div>
            <div class="neMenu1_2" align="end">
                <button type="button" class="btn btn-sm btn-warning"  data-toggle="modal" data-target="#sendFirstNote">쪽지보내기</button>
            </div>
            <div class="neMain">
                <div class="ntOuter2"  align="center">
                    
                  <!-- 받은 쪽지 리스트 영역 -->    
                  <!-- <div class="borderStyle">
                        <table>
                            <tr> 
                                <td style="color: red;">●</td>          
                                <td colspan="2" rowspan="2"><img id="profileImg" src="${pageContext.request.contextPath}/resources/profile_images/defaultProfile.png"></td>                        
                                <td colspan="2" class="fontsize15">인사부 김인사님의 쪽지</td>
                                <td width="150px">2022.05.02 AM10:30</td>                    
                                <td><img src="${pageContext.request.contextPath}/resources/images/fileDelete.png" style="width:15px; height:auto; vertical-align: middle; cursor: pointer;"/></td>
                            </tr>
                            <tr>
                                <td rowspan="2"></td>
                                <td>종류 : 회의</td>
                                <td>상태 : <span style="color: red;">긴급</span></td>
                                <td colspan="2"><button class="btn btn-sm btn-secondary" data-toggle="modal" data-target="#detailNote">자세히보기</button></td>
                            </tr>
                            <tr>                      
                                <td colspan="6" width="800px">
                                    오늘 회의 중요 일정안내
                                </td>                        
                            </tr>
                        </table> 
                  </div>

                  <div class="borderStyle">
                        <table>
                            <tr> 
                                <td style="color: red;">●</td>          
                                <td colspan="2" rowspan="2"><img id="profileImg" src="${pageContext.request.contextPath}/resources/profile_images/defaultProfile.png"></td>                        
                                <td colspan="2" class="fontsize15">인사부 김인사님의 쪽지</td>
                                <td width="150px">2022.05.02 AM10:30</td>                    
                                <td><img src="${pageContext.request.contextPath}/resources/images/fileDelete.png" style="width:15px; height:auto; vertical-align: middle; cursor: pointer;"/></td>
                            </tr>
                            <tr>
                                <td rowspan="2"></td>
                                <td>종류 : 회의</td>
                                <td>상태 : <span style="color: red;">긴급</span></td>
                                <td colspan="2"><button class="btn btn-sm btn-secondary" data-toggle="modal" data-target="#detailNote">자세히보기</button></td>
                            </tr>
                            <tr>                      
                                <td colspan="6" width="800px">
                                   협력사 컴플레인
                                </td>                        
                            </tr>
                        </table> 
                    </div>

                    <div class="borderStyle">
                        <table>
                            <tr> 
                                <td style="color: rgb(209, 208, 208);">●</td>          
                                <td colspan="2" rowspan="2"><img id="profileImg" src="${pageContext.request.contextPath}/resources/profile_images/defaultProfile.png"></td>                        
                                <td colspan="2" class="fontsize15">인사부 김인사님의 쪽지</td>
                                <td width="150px">2022.05.02 AM10:30</td>                    
                                <td><img src="${pageContext.request.contextPath}/resources/images/fileDelete.png" style="width:15px; height:auto; vertical-align: middle; cursor: pointer;"/></td>
                            </tr>
                            <tr>
                                <td rowspan="2"></td>
                                <td>종류 : 회의</td>
                                <td>상태 : <span>답장불필요</span></td>
                                <td colspan="2"><button class="btn btn-sm btn-secondary" data-toggle="modal" data-target="#detailNote">자세히보기</button></td>
                            </tr>
                            <tr>                      
                                <td colspan="6" width="800px">
                                    오늘 점심메뉴
                                </td>                        
                            </tr>
                        </table> 
                    </div> -->

                    
                <!-- 보낸 쪽지 리스트 영역 -->                   
                <div class="borderStyle">
                    <table>
                        <tr>
                            <td style="color: red;">●</td>
                            <td colspan="2" style="font-size: 15px;"><b>아침조회관련</b></td>                            
                            <td>인사부 김인사</td>
                            <td>2022.05.02 AM10:30</td>
                            <td>
                                <img src="${pageContext.request.contextPath}/resources/images/fileDelete.png" style="width:15px; height:auto; vertical-align: middle; cursor: pointer;" onclick=""/>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>종류 : 회의</td>
                            <td>상태 : <span style="color: red;">긴급</span></td>
                            <td  colspan="3"></td>                            
                        </tr>
                        <tr>
                            <td colspan="6" width="800px"><textarea class="form-control noteText" cols="30" rows="3"  maxlength="99" style="background-color: white;" readonly>기능구현언제하지</textarea></td>                          
                        </tr>
                    </table> 
                </div>

                <div class="borderStyle">
                    <table>
                        <tr>
                            <td style="color: red;">●</td>
                            <td colspan="2"  style="font-size: 15px;"><b>아침조회관련</b></td>                            
                            <td>인사부 김인사</td>
                            <td>2022.05.02 AM10:30</td>
                            <td>
                                <img src="${pageContext.request.contextPath}/resources/images/fileDelete.png" style="width:15px; height:auto; vertical-align: middle; cursor: pointer;" onclick=""/>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>종류 : 회의</td>
                            <td>상태 : <span style="color: red;">긴급</span></td>
                            <td  colspan="3"></td>                            
                        </tr>
                        <tr>
                            <td colspan="6" width="800px"><textarea class="form-control noteText" cols="30" rows="3"  maxlength="99" style="background-color: white;" readonly>이제 그만 화면구현하고싶어</textarea></td>                          
                        </tr>
                    </table> 
                </div>
                

                

                
                    
                   
    
                </div>

                
            </div>

            <!-- 무한 스크롤..  -->
            <div class="nePasing">
                            
                <!-- <nav aria-label="Page navigation example" class="pasingCenter">
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
                </nav>   -->

            </div>
         
           
    
        </div>



        <!-- 받은쪽지자세히보기 Modal -->
        <div class="modal fade" id="detailNote" tabindex="-1" aria-labelledby="detailNoteModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content" align="center">   
                    <div class="modal-header">
                        <h5 class="modal-title" id="detailNoteModalLabel">쪽지내용</h5>                       
                    </div>                 
                    <div class="modal-body">
                        <table>
                            <tr>
                                <th>제목</th>
                                <td><b>오늘 회의!!</b></td>
                            </tr>
                            <tr>
                                <th>보낸사람</th>
                                <td>인사부 김개똥</td>
                            </tr>
                            <tr>
                                <th>종류</th>
                                <td>회의</td>
                            </tr>
                            <tr>
                                <th>상태</th>
                                <td style="color: red;">긴급</td>
                            </tr>
                            <tr>
                                <td colspan="2" width="800px">
                                    <textarea class="form-control noteText"cols="15" rows="8"  style="background-color: white;" readonly>오늘 회의에 이사님 참석하신다고 합니다 ㅎㅎ 미리 준비하세요!!</textarea>
                                </td>
                            </tr>
                        </table>    
                        <br>
                        <button type="button" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#sendNote">답장하기</button>
                        <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">취소</button>
                    </div>
                    <div class="modal-footer">
                        <!-- form input hidden으로 번호 넘기고 controller에서  -->
                       
                    </div>
                   
                </div>
            </div>
        </div>

        <!-- 쪽지답장하기 Modal -->
        <div class="modal fade" id="sendNote" tabindex="-1" aria-labelledby="sendNoteModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content" align="center">   
                    <div class="modal-header">
                        <h5 class="modal-title" id="sendNoteModalLabel">쪽지 보내기</h5>                       
                    </div>                 
                    <div class="modal-body">
                        <form action="">
                            <input type="hidden" name="empSendNo" value="">
                            <input type="hidden" name="empReceiveNo" value="">
                            <table>
                                <tr>
                                    <th>제목</th>
                                    <td><input type="text" name="noticeTitle"></td>
                                </tr>
                                <tr>
                                    <th>받는사람</th>
                                    <td>인사부 김개똥</td>
                                </tr>
                                <tr>
                                    <th>종류</th>
                                    <td>
                                        <select name="noteCategory">
                                            <option>회의</option>
                                            <option>업무</option>
                                            <option>행사</option>
                                            <option>기타</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>상태</th>
                                    <td>
                                        <select name="noteRequest">
                                            <option>긴급</option>
                                            <option>답장필요</option>
                                            <option>답장불필요</option>                                       
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" width="800px">
                                        <textarea class="form-control noteText" cols="15" rows="8"  maxlength="99" style="background-color: white;"></textarea>
                                    </td>
                                </tr>
                            </table>        
                            <br>
                            <button type="button" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#sendNote">보내기</button>
                            <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">취소</button>
                        </form>           
                    </div>
                    <div class="modal-footer">                       
                        
                    </div>
                   
                </div>
            </div>
        </div>

          <!-- 쪽지답장하기 Modal -->
          <div class="modal fade" id="sendFirstNote" tabindex="-1" aria-labelledby="sendFirstNoteModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content" align="center">   
                    <div class="modal-header">
                        <h5 class="modal-title" id="sendNoteModalLabel">쪽지 보내기</h5>                       
                    </div>                 
                    <div class="modal-body">
                        <form action="">
                            <input type="hidden" name="empSendNo" value="">
                            <input type="hidden" name="empReceiveNo" value="">
                            <table>
                                <tr>
                                    <th>제목</th>
                                    <td colspan="2"><input type="text" name="noticeTitle"></td>
                                </tr>
                                <tr>
                                    <th>받는사람</th>
                                    <td>
                                        <input type="text">
                                    </td>
                                    <td>
                                        <a class="material-symbols-outlined btn btn-sm btn-secondary" href="">
                                            lan
                                        </a>
                                    </td>
                                </tr>
                                <tr>
                                    <th>종류</th>
                                    <td colspan="2">
                                        <select name="noteCategory">
                                            <option>회의</option>
                                            <option>업무</option>
                                            <option>행사</option>
                                            <option>기타</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>상태</th>
                                    <td colspan="2">
                                        <select name="noteRequest">
                                            <option>긴급</option>
                                            <option>답장필요</option>
                                            <option>답장불필요</option>                                       
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3" >
                                        <textarea class="form-control noteText" cols="15" rows="8"  maxlength="99" style="background-color: white;"></textarea>
                                    </td>
                                </tr>
                            </table>        
                            <br>
                            <button type="button" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#sendNote">보내기</button>
                            <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">취소</button>
                        </form>           
                    </div>
                    
                    <div class="modal-footer">                       
                        
                    </div>
                   
                </div>
            </div>
        </div>



    </div>
</body>
</html>