<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/summerNote/summernote-lite.css">

<style>
    .ntOuter{
        margin: auto;
        padding: 15px;         
        align-items: center;
        box-shadow :  2px 3px 5px 2px rgb(212, 211, 211);
        border-radius: 10px;
        width: 70%; 
        height: 95%;
        color: rgb(43, 42, 42); 
    }
    .ntOuter input{        
        border: 1px solid #ced4da;
        border-radius: 0.25rem;     
        height: 30px;        
     }
     
    .fontsize13{font-size: 13px;}
    .inline{display: inline;}
    .inlineBlock{display: inline-block;}
    .blueColor{background-color: rgb(229, 243, 255);}
    .redColor{background-color: rgb(250, 226, 226);}
    .removeMail{cursor: pointer;}
    .removeFile{cursor: pointer;}

    input[type=file]::file-selector-button {
        /* width: 50px; */
        height: 30px;
        background: rgb(245, 241, 241);
        border: 1px solid rgb(245, 241, 241);
        /* border-radius: 10px; */
        cursor: pointer;      
    }
    input[type=file]::file-selector-button:hover{
        background-color: rgb(212, 211, 211);
        cursor: pointer;
    }
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
    <div style="height: 30px;"></div>

    <div class="ntOuter">
        <br>       
        
        <form name="" id="" action="" enctype="multipart/form-data">

            <button type="submit" class="btn btn-sm btn-primary">보내기</button>
            <button type="button" class="btn btn-sm btn-secondary" onclick="history.back();">이전</button>         
            <br><hr>
            <table id="emailTable">
                <tr>
                    <td class="fontsize13" width="30px">제목 </td>
                    <td colspan="3"><input type="text" placeholder="제목을 입력해주세요" maxlength="20" style="width: 500px;" required></td>
                </tr>
                <tr>
                    <td class="fontsize13">중요</td>
                    <td width="30px">
                        <input type="checkbox" name="" value="I" id="">                       
                    </td>
                    <td class="fontsize13" width="20px">기밀</td>
                    <td>
                       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="checkbox" name="" value="" id="">                       
                    </td>
                </tr>   

                <!-- 
                        
                    받는사람 

                 -->               
                <tr>
                    <td width="60px" class="fontsize13" width="30px">받는사람 </td>
                    <td><input type="email" id="receiveSearch" placeholder="" maxlength="33" style="width: 250px;"></td>                    
                    <td ><button type="button" class="btn btn-sm btn-secondary" onclick="emailCheck();">+</button></td>
                    <td>                        
                        <button type="button" class="material-symbols-outlined btn btn-sm btn-secondary" onclick="openAddressTo();">
                            lan
                        </button>                       
                    </td>
                   
                </tr>
                <tr>
                    <td colspan="4">
                        <div style="border: 1px solid  #e0e3e6; min-height: 60px;">                            
                          <table id="recipientTB">
                               <!-- 

                                    받는사람 이메일이 올 자리
                                -->

                            </table>                                  
                        </div>
                    </td>
                </tr>
                <script>
                    let searchEmail = $("#receiveSearch");

                    $(function(){
                        $(document).on("click", ".removeMail", function(){ // x클릭시 실행할 내용
                            // 현재 클릭이벤트가 발생한 x의 부모요소들 중에 tr 태그인 요소만 선택 => remove();                            
                            $(this).parent().parent().remove();     
                        })
                    })

                    // 이메일형식검사
                    function emailCheck(){
                       
                        let regExp = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/
                        
                        if(regExp.test(searchEmail.val())){                           
                            emailCount();            
                        }else{                        
                            searchEmail.val("");
                            searchEmail.attr("placeholder", "잘못된 이메일형식입니다.");  
                        }
                       
                    }

                    // 이메일 갯수
                    function emailCount(){
                        let count = $("#recipientTB tr").length;
                        let total = 3;
                        if(count < total){
                            emailRecipientInput(); 
                            //console.log(count);
                        }else{
                            searchEmail.val("");
                            searchEmail.attr("placeholder", "총 3개까지만 가능합니다.");
                        }
                    }
            
                    // 이메일 input
                    function emailRecipientInput(){            
                       
                        const receiveEmail =  $("#receiveSearch").val();       
                                                
                        let el  = "<tr>"                                   
                                +       "<td><span>"+ receiveEmail  + "</span></td>"
                                +       '<td><input type="hidden" name="emailRecipient" value="'+  receiveEmail  +'"></td>'
                                +       '<td><span class="removeMail">x</span></td>'
                                + '</tr>';


                        $("#recipientTB").append(el);                                                   
                        $("#receiveSearch").val("");
                        searchEmail.attr("placeholder", "");                   
                      
                    }
                   
                </script>

                 <!-- 
                        
                    참조

                 -->   
                <tr>
                    <td class="fontsize13" width="30px">참조 </td>
                    <td><input type="email" placeholder="" maxlength="33" style="width: 250px;" id="ccSearch"></td>
                    <td ><button type="button" class="btn btn-sm btn-secondary" onclick="emailCheck2();">+</button></td>
                    <td>                    
                        <button type="button" class="material-symbols-outlined btn btn-sm btn-secondary" onclick="openAddressCC();">
                            lan
                        </button>                       
                    </td>                    
                </tr>
                <tr>
                    <td colspan="4">
                        <div style="border: 1px solid  #e0e3e6; min-height: 60px;" id="mailCC">
                           
                            <table id="mailCC">
                                
                                <tr>                                   
                                    <td><span>wwlaalcjstk@naver.com</span></td>
                                    <td><input type="hidden" name="emailCC" value="wwlaalcjstk@naver.com"></td>
                                    <td><span class="removeMail" style="cursor: pointer;">x</span></td>
                                </tr>
                                

                            </table>  
                        </div>
                    </td>
                </tr>        
                
                <script>
                    let searchCCEmail = $("#ccSearch");

                    $(function(){
                        $(document).on("click", ".removeMail", function(){ // x클릭시 실행할 내용
                            // 현재 클릭이벤트가 발생한 x의 부모요소들 중에 tr 태그인 요소만 선택 => remove();                            
                            $(this).parent().parent().remove();     
                        })
                    })

                    function emailCheck2(){
                       
                        let regExp = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/
                        
                        if(regExp.test(searchCCEmail.val())){                           
                            emailCount2();           
                        }else{                        
                            searchCCEmail.val("");
                            searchCCEmail.attr("placeholder", "잘못된 이메일형식입니다.");  
                        }
                       
                    }

                    function emailCount2(){
                        let ccCount = $("#mailCC tr").length;

                        if(ccCount < 3){
                            emailCCInput(); 
                        }else{
                            $("#ccSearch").val("");
                            searchCCEmail.attr("placeholder", "총 3개까지 가능합니다.");
                        }
                    }
            
                    function emailCCInput(){
            
                       
                        const CCEmail =  $("#ccSearch").val();
        
                        
                        let el  = "<tr>"                                   
                                +       "<td><span>"+ CCEmail  + "</span></td>"
                                +       '<td><input type="hidden" name="emailCC" value="'+  CCEmail  +'"></td>'
                                +       '<td><span class="removeMail">x</span></td>'
                                + '</tr>';


                        $("#mailCC").append(el);                                                   
                        $("#ccSearch").val("");
                        searchCCEmail.attr("placeholder", "");                        
                     
                    }    
                                      
                </script>


                <!-- 

                    첨부파일

                 -->
                <tr>
                    <td colspan="2" width="90px">
                        <button id="btn-upload" type="button" class="btn btn-sm btn-secondary" onclick="inputFileCount();">파일 추가</button>                        
                    </td>
                    <td colspan="2" align="end"> <span style="font-size:10px; color: gray;">※첨부파일은 최대 3개까지 등록이 가능합니다.</span></td>
                </tr>
                <tr>
                    <td colspan="4">
                        <div style="border: 1px solid  #e0e3e6; height: 100px;">                            
                            <table id="dataFileDiv">                                
                                <tr>                                 
                                    <td><input type="file" id="upfile" name="upfile"></td>
                                    <td><button type="button"  class="btn btn-sm btn-secondary deleteFile">X</button></td>
                                </tr>

                            </table> 
                        </div>
                    </td>    
                </tr>    
                <script>

                    $(function(){                       
                       $(document).on("click", ".deleteFile", function(){
                            $(this).parent().parent().remove();
                       })
                    });    
                                                
                    function inputFileCount(){
                        let countFile = $("#dataFileDiv input").length;

                        if(countFile < 3){
                            inputFile();
                        }else{
                            alert("첨부파일은 3개 이하만 가능합니다.");
                        }
                    }

                    function inputFile(){
                        let elFile = '<tr>'                                 
                                   +    '<td><input type="file" id="upfile" name="upfile"></td>'
                                   +    '<td><button type="button"  class="btn btn-sm btn-secondary deleteFile">X</button></td>'
                                   + '</tr>';

                        $("#dataFileDiv").append(elFile);                           
                    }
                   

                </script>
                

                <tr>
                    <td colspan="4" align="end">
                        <select name="" id="">
                            <option value="">서명안함</option>
                            <option value="">서명1</option>
                            <option value="">서명2</option>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td colspan="4">
                        <script src="${pageContext.request.contextPath}/resources/js/summerNote/lang/summernote-ko-KR.js"></script>
                        <script src="${pageContext.request.contextPath}/resources/js/summerNote/summernote-lite.js"></script>
                        <textarea id="summernote" name="editordata" required></textarea>
                    </td>
                </tr>
                           
            </table>

            <br>                  

        </form>

        <!-- summerNote 관련 script-->
        <script>
            $(document).ready(function() {
                //여기 아래 부분
                $('#summernote').summernote({
                    height: 500,                 // 에디터 높이
                    minHeight: 300,             // 최소 높이
                    maxHeight: 500,             // 최대 높이
                    focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
                    lang: "ko-KR",					// 한글 설정
                    placeholder: '내용을 입력해주세요',	//placeholder 설정                   
                    toolbar: [
                            // 글꼴 설정
                            ['fontname', ['fontname']],
                            // 글자 크기 설정
                            ['fontsize', ['fontsize']],
                            // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
                            ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
                            // 글자색
                            ['color', ['forecolor','color']],
                            // 표만들기
                            ['table', ['table']],
                            // 글머리 기호, 번호매기기, 문단정렬
                            ['para', ['ul', 'ol', 'paragraph']],
                            // 줄간격
                            ['height', ['height']],
                            // 그림첨부, 링크만들기, 동영상첨부
                            ['insert',['picture','link','video']],
                            // 코드보기, 확대해서보기, 도움말
                            ['view', ['codeview','fullscreen', 'help']]
                        ],
                        // 추가한 글꼴
                        fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
                        // 추가한 폰트사이즈
                        fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
                });               
                
            });
           
            // function nt_addFile(){
            //     $("#nt_file").append("<br>" + "<input type='file' name='upfile'  style='display:none;'/>");
               
            // }     
  
        </script>
          


        <!-- 이메일 주소록 관련   -->
        <script>
            var newWindow;
            function openAddressTo(){
                newWindow = window.open("${pageContext.request.contextPath}/addressEmail.ad","addressWindow", "height=700, width=1000");                
            }

            function sendData(data){
                //console.log(data);
                let count2 = $("#recipientTB tr").length;

                if(count2 < 3){
                    $("#recipientTB").append(data); 
                }else{
                    alert("3명까지만 가능합니다.");                    
                    searchCCEmail.attr("placeholder", "총 3개까지 가능합니다.");
                }                       
               
            }

            
            function openAddressCC(){
                var newWindow2;
                newWindow2 = window.open("${pageContext.request.contextPath}/addressEmailCC","addressWindow", "height=700, width=1000");
            }

            function sendDataCC(data){
                let ccCount2 = $("#mailCC tr").length;

                if(ccCount2 < 3){
                    $("#mailCC").append(data); 
                }else{
                    alert("3명까지만 가능합니다.");                    
                    searchCCEmail.attr("placeholder", "총 3개까지 가능합니다.");
                }              
               
            }
            
        </script>



        


    </div>

    <div style="height: 30px;"></div>

</body>
</html>