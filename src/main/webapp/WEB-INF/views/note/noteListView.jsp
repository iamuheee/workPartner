<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/note.css">
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
                    <div class="borderStyle">
                        <table>
                            <tr> 
                                <td style="color: red;">●</td>          
                                <td colspan="2" rowspan="2"><img id="profileImg" src=""></td>                        
                                <td colspan="2" class="fontsize15">인사부 김인사님의 쪽지</td>
                                <td width="150px">2022.05.02 AM10:30</td>                    
                                <td><sapn class="deleteNote">X</sapn></td>
                            </tr>
                            <tr>
                                <td rowspan="2"></td>
                                <td>종류 : 회의</td>
                                <td>상태 : <span style="color: red;">긴급</span></td>
                                <td colspan="2">
                                    <button class="btn btn-sm btn-light detailNoteOpen">
                                        <span class="material-symbols-outlined blueColor">
                                             zoom_in
                                        </span>
                                    </button>
                                </td>
                            </tr> 

                            <!-- 쪽지 자세히 보기 -->
                            <tr>                      
                                <td colspan="6" width="800px">
                                협력사 컴플레인
                                </td>                        
                            </tr>
                            <tr class="displayNone">                      
                                <td colspan="6" width="800px" class="detailNoteText">
                                    <textarea class="borderStyle2" style="height:100px; resize: none;">잘되게해주세욥</textarea>
                                </td>       
                                <td><button type="button" style="height: 102px;" class="material-symbols-outlined btn btn-primary" data-toggle="modal" data-target="#sendNote">
                                        chat
                                    </button>
                                </td>                 
                            </tr>                                
                        </table> 
                    </div>

                    <div class="borderStyle">
                            <table>
                                <tr> 
                                    <td style="color: red;">●</td>          
                                    <td colspan="2" rowspan="2"><img id="profileImg" ></td>                        
                                    <td colspan="2" class="fontsize15">인사부 김인사님의 쪽지</td>
                                    <td width="150px">2022.05.02 AM10:30</td>                    
                                    <td><sapn class="deleteNote">X</sapn></td>
                                </tr>
                                <tr>
                                    <td rowspan="2"></td>
                                    <td>종류 : 회의</td>
                                    <td>상태 : <span style="color: red;">긴급</span></td>
                                    <td colspan="2">
                                        <button class="btn btn-sm btn-light detailNoteOpen">
                                            <span class="material-symbols-outlined blueColor">
                                                 zoom_in
                                            </span>
                                        </button>
                                    </td>
                                </tr> 

                                <!-- 쪽지 자세히 보기 -->
                                <tr>                      
                                    <td colspan="6" width="800px">
                                    협력사 컴플레인
                                    </td>                        
                                </tr>
                                <tr class="displayNone">                      
                                    <td colspan="6" width="800px" class="detailNoteText">
                                        <textarea class="borderStyle2" style="height:100px; resize: none;">잘되게해주세욥</textarea>
                                    </td>       
                                    <td><button type="button" style="height: 102px;" class="material-symbols-outlined btn btn-primary" data-toggle="modal" data-target="#sendNote">
                                            chat
                                        </button>
                                    </td>                 
                                </tr>                                
                            </table> 
                        </div>

                        <script>
                            $(function(){
                                $(document).on("click", ".detailNoteOpen", function(){
                                    const $dEl = $(this).parent().parent().next().next();

                                    console.log($dEl.html());
                                    if($dEl.css("display")!= "none"){
                                       $dEl.addClass("displayNone");
                                    }else{
                                        $dEl.removeClass("displayNone");
                                    }
                                })
                            })
                        </script> 

                        
                    <!-- 보낸 쪽지 리스트 영역 -->                   
                    <!-- <div class="borderStyle">
                        <table>
                            <tr>
                                <td style="color: red;">●</td>
                                <td colspan="2" style="font-size: 15px;"><b>아침조회관련</b></td>                            
                                <td>인사부 김인사</td>
                                <td>2022.05.02 AM10:30</td>
                                <td>
                                    <sapn class="deleteNote">X</sapn>
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
                                <td colspan="2" style="font-size: 15px;"><b>아침조회관련</b></td>                            
                                <td>인사부 김인사</td>
                                <td>2022.05.02 AM10:30</td>
                                
                                <td>
                                    <sapn class="deleteNote">X</sapn>
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
                    </div> -->

                    
                    <!-- 보낸 쪽지함 삭제시키기 -->
                    <script>
                        $(function(){
                            $(document).on("click", ".deleteNote", function(){
                                // 1. 이건 아직 db에 insert되기전엔 가능하지만 이건 html상 지워질뿐 db값 변경하진 못함
                                // $(this).parent().parent().parent().parent().parent().remove();
                                
                                // 2. url재요청.....얘도 위와 마찬가지... 삭제  
                                // hidden으로 감춘 쪽지번호넘기기 => 타고올라가서 옆에 input hidden요소선택되게끔
                                //location.href = "list.no"

                                // 결국엔 얘도 ajax로 처리해야하는거 
                                // =>1.  버튼 누르면 onlick으로 함수실행해서 ajax로 선택된 쪽지가 n으로 되도록 update한후  2. 다시 전체뿌려주는 ajax힘수호출(ajax로)
                            })
                        })
                    </script>
                   
    
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

          <!-- 쪽지보내기 Modal -->
          <div class="modal fade" id="sendFirstNote" tabindex="-1" aria-labelledby="sendFirstNoteModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content" align="center">   
                    <div class="modal-header">
                        <h5 class="modal-title" id="sendNoteModalLabel">쪽지 보내기</h5>                       
                    </div>                 
                    <div class="modal-body">
                        <form action="">
                            <!-- <input type="hidden" name="empSendNo" value=""> -->
                            <!-- <input type="hidden" name="empReceiveNo" value=""> -->
                            <table>
                                <tr>
                                    <th>제목</th>
                                    <td colspan="2"><input type="text" name="noticeTitle"></td>
                                </tr>
                                <tr>
                                    <th>받는사람</th>
                                    <td>
                                        <input id="empName" name="empName" type="text">    
                                        <input id="empNo" type="hidden" name="empNo" value="">                                    
                                    </td>                                    
                                    <td>
                                        <button type="button" class="material-symbols-outlined btn btn-sm btn-secondary" onclick="openNoteAdWindow();">
                                            lan
                                        </button>
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
                            <button type="submit" class="btn btn-sm btn-primary">보내기</button>
                            <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">취소</button>
                        </form>           
                    </div>
                    
                    <div class="modal-footer">     
                        
                                                
                    </div>
                   
                </div>

                <script>
                    var noteNewWindow;
                    function openNoteAdWindow(){
                        noteNewWindow = window.open("${pageContext.request.contextPath}/addresssNote.ad", "", "height=700, width=1000");
                    }
                  
                </script>
            </div>
        </div>



    </div>
</body>
</html>