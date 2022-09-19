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
<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/emailCss/email2.css">
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
    <div style="height: 30px;"></div>

    <div class="ntOuter">
        <br>       
        
        <form onsubmit="return submitCheck();" action="insertForward.ma" enctype="multipart/form-data" method="post">

            <button type="submit" class="btn btn-sm btn-primary">보내기</button>
            <button type="button" class="btn btn-sm btn-secondary" onclick="history.back();">이전</button>         
            
             <input type="hidden" name="mailSender" value="${loginUser.empEmail }">     
            <input type="hidden" name="mailSenderName" value="${loginUser.empName }"> 
            
            <br><hr>
            <div align="center">
	            <table id="emailTable">
	                <tr>
	                    <td class="fontsize13" width="30px">제목 </td>
	                    <td colspan="3"><input type="text" name="mailTitle" placeholder="제목을 입력해주세요" maxlength="20" style="width: 500px;" required value="FW: ${ m.mailTitle }"></td>
	                </tr>
	                <tr>
	                    <td class="fontsize13">중요</td>
	                    <td width="30px">
	                        <input type="checkbox" name="mailImportant" value="I" id="mailImportant">                       
	                    </td>
	                    <td class="fontsize13" width="20px">기밀</td>
	                    <td>
	                       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="checkbox" name="mailSecurity" value="S" id="mailSecurity">                       
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
	                        <button type="button" class="material-symbols-outlined btn btn-sm btn-secondary" style="margin: 0;" onclick="openAddressTo();">
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
	                                +       '<td><input type="hidden" name="mailRecipient" value="'+  receiveEmail  +'"></td>'
	                                +       '<td><span class="removeMail">x</span></td>'
	                                + '</tr>';
	
	
	                        $("#recipientTB").append(el);                                                   
	                        $("#receiveSearch").val("");
	                        searchEmail.attr("placeholder", "");                   
	                      
	                    }
	                    
	                   // 받는 사람 이메일이 없을 경우 submit 실행 안되게끔
	                   function submitCheck(){
	                	   let count = $("#recipientTB tr").length;
	                      
	                       if(count > 0){
	                           return true;
	                       }else{
	                    	    alert("받는사람 이메일을 입력해주세요");
	                            return false;
	                       }
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
	                        <button type="button" class="material-symbols-outlined btn btn-sm btn-secondary" style="margin: 0;" onclick="openAddressCC();">
	                            lan
	                        </button>                       
	                    </td>                    
	                </tr>
	                <tr>
	                    <td colspan="4">
	                        <div style="border: 1px solid  #e0e3e6; min-height: 60px;" id="mailCC">
	                           
	                            <table id="mailCC">                                
	                               <!-- 
	                               	
	                               		참조 이메일 올 자리
	                               		
	                                -->   
	                            </table>  
	                        </div>
	                    </td>
	                </tr>        
	                
	                <script>
	                    
	                	// 전역변수 
	                	let searchCCEmail = $("#ccSearch");
						
	                	// X클릭시 실행할 내용(이미 있는 함수라 삭제)
	                   /*  $(function(){
	                        $(document).on("click", ".removeMail", function(){                                                 
	                            $(this).parent().parent().remove();     
	                        })
	                    }) */
						
	                    // 참조메일형식 검사
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
	                                +       '<td><input type="hidden" name="mailCC" value="'+  CCEmail  +'"></td>'
	                                +       '<td><span class="removeMail">x</span></td>'
	                                + '</tr>';
	
	
	                        $("#mailCC").append(el);                                                   
	                        $("#ccSearch").val("");
	                        searchCCEmail.attr("placeholder", "");                        
	                     
	                    }    
	                                      
	                </script>
	
	
	                <!-- 
	
	                    첨부파일  -- 전달하기할때는 첨부파일도 같이 전해져서 와야함!!
	
	                 -->
	                 <tr>
	                    <td colspan="2" width="90px">
	                        <button id="btn-upload" type="button" class="btn btn-sm btn-secondary">파일 추가</button>
	                        <input id="upfile" name="upfile"  multiple="multiple" type="file" style="display:none;">
	                    </td>
	                    <td colspan="2"><span style="font-size:10px; color: gray;">※첨부파일은 최대 3개까지 등록이 가능합니다.</span></td>
	                </tr>
	                <tr>
	                    <td colspan="4">
	                    
	                    	<!-- 파일목록이 올 자리  -->
	                        <div  style="border: 1px solid  #e0e3e6; height: 100px;">    
	                            <!-- 
	                            
	                            	전달된 파일들 
	                            	=> 이미 db에 저장된 애들이므로 따로 또 해당  파일을 저장할 필요없고
	                            	  Tb_file에 필요한 정보들만 보내서 지금 보내는 mailNo는 메일 전송시 생기는 currval로, 그 외 파일경로등은 이미 전달받은 정보를 insert해주면 됨!
	                            	  
	                            	=> 1개의 메일에 여러개의 file객체를 전송하는 방법
	                            	 (1) Mail vo객체에 private ArrayList<File> fileList 로 컬럼을 만들어준다
	                            	 (2) name에 인덱스를 이유해서 name= fileList[0].fileOrigiName 이런식으로 배열[인덱스].필드명     
	                            	 (3) form submit하면 Controller에는 그냥 파라미터로 Mail m 으로 세팅해주면 됨 => Mail객체에 fileList에 File객체가 차곡차곡 쌓여있음
	                            	 
	                            	=> 향상된 for문 varStatus="status"  => status.index / status.count 속성 이용 
	                            -->
	                            <c:if test="${ not empty list }">
	                            	
                            		<c:forEach var="f" items="${ list }" varStatus="status">
	                            		 <!--  
	                            		 	향상된 for문 순차적으로 접근하는 요소의 상태값을 보관하는 요소 => count속성, index속성이 있음 
	                            		 	class=filebox는 document.querySelectorAll('.filebox').length; => 현재 사용자가 보여질 선택한 첨부파일 갯수
	                            		 	똑같이 filebox로 class를 줌으로서 첨부파일 갯수가 3개 초과 안하도록
	                            		 	=> 2개가 전달되었다면
	                            		 	=> 다만 실제 input name="upfile"  multiple="multiple" type="file" 로 담긴 file은 [0]이다. 전달된얘들은 input type="hidden"일뿐 실제 파일받는거X => 기존에 저장된 파일을 보여줄뿐
	                            		  -->
	                            		 <div id="forwordFile${status.index}" class="filebox forword">
				                           	<span class="name">${ f.fileOriginName }</span>
				                           	<a class="delete" onclick="deleteFile2('${status.index}');"><i class="far fa-minus-square"></i></a>
				                           	<input type="hidden" name="fileList[${status.index}].fileOriginName" value="${ f.fileOriginName }">                                   
				                           	<input type="hidden" name="fileList[${status.index}].fileChangeName" value="${ f.fileChangeName }">                                   
				                           	<input type="hidden" name="fileList[${status.index}].filePath" value="${ f.filePath}">                                   
				                         </div>           			
                            		</c:forEach>	                            	
                            	 </c:if>  
                            	 
                            	 <div class="file-list" id="file-list">
                            	  <!-- 새로 추가한 파일이 올 자리  -->
                            	 
                            	 </div>
	                            
	                            
	                            
	                        </div>
	                    </td>    
	                </tr>  	               
	                
	                <script>
						                    
	                    
	                 	// ---------------- 첨부 파일 ---------------------
	                 	$(document).ready(function(){
		                    // input file 파일 첨부시 addFile 함수 실행
		                        $("#upfile").on("change", addFile);
		                  }); 
		            
			            /**
			             * 첨부파일로직 : button클릭시 upfile클릭			             
			             */
			            $(function () {
			                $('#btn-upload').click(function (e) {
			                    e.preventDefault();
			                    $('#upfile').click();
			                });
			            });

	                    var fileNo = 0; // 첨부파일 번호
	                    var filesArr = new Array(); // 다중 첨부파일 들어갈 파일 배열

	                    /* 첨부파일 추가 */
	                    function addFile() {
	                       
	                       // 안내문 삭제
	                       //$(".fileMsg").remove();
	                       
	                       var maxFileCnt = 3; // 첨부파일 최대 개수
	                       var attFileCnt = document.querySelectorAll('.filebox').length; // 기존 추가된 첨부파일 개수
	                       var remainFileCnt = maxFileCnt - attFileCnt; // 추가로 첨부가능한 개수
	                       var files = $('#upfile')[0].files; // 현재 선택된 첨부파일 리스트 FileList

	                       // 첨부파일 개수 확인
	                       if (files.length > remainFileCnt) {
	                          alert("첨부파일은 최대 " + maxFileCnt + "개 까지 첨부 가능합니다.");
	                          
	                          fileDataTransfer();
	                       }else{
	                          // 파일 배열에 담기
	                          let currFileArr = Array.from(files); // FileList => Array로 변환
	                          filesArr = filesArr.concat(currFileArr); // 추가한 fileList에 또 추가할 수 있도록 설정
	                          
	                          fileDataTransfer();
	                           
	                       }
	                       //console.log(filesArr);
	                       renderingFileDiv(); // 추가 및 삭제할 때 마다 호출해서 index번호 초기화 => 지금 file-list에 담긴 파일들을 배열로 돌려가면서 i를 재정비하는거
	                       
	                    }
	                    
	                    /* 첨부파일 목록 html */
	                    function renderingFileDiv(){
	                       
	                       let htmlData = '';
	                       for(let i=0; i<filesArr.length; i++){
	                          // i => 삭제할 파일 인덱스 번호가 될것 (deleteFile호출시 )
	                          
	                          // 목록 추가
	                          htmlData += '<div id="file' + i + '" class="filebox">';
	                          htmlData += '   <span class="name">'+ filesArr[i].name + '</span>';
	                          htmlData += '   <a class="delete" onclick="deleteFile('+ i + 
	                                   ');"><i class="far fa-minus-square"></i></a>';
	                          htmlData += '</div>';
	                       }
	                       
	                       $(".file-list").html(htmlData); // change가 발생할 때마다 목록 초기화한 뒤 넣어짐

	                    }

	                    /* 첨부파일 삭제 */
	                    function deleteFile(fileNo) { // 매개변수 : 첨부된 파일 번호(fileNo, i)
	                    
	                       //console.log(fileNo);
	                       
	                       // class="fileMsg"에 있는 문구 삭제
	                       document.querySelector("#file" + fileNo).remove();
	                       
	                        filesArr.splice(fileNo, 1);   // 해당되는 index의 파일을 배열에서 제거(1 : 한개만 삭제하겠다 라는 의미)
	                       	
	                        // fileArr에 있는 파일배열을 dataTransfer을 통해 input multifile형식에 맞게 담아준다.
	                        fileDataTransfer();

	                        // 파일 index 번호 초기화
	                        renderingFileDiv();
	                    }
	                    
	                    
	                    /* 첨부파일 담는 배열 */
	                    function fileDataTransfer(){
	                       
	                       const dataTransfer = new DataTransfer();

	                        filesArr.forEach(function(file){ 
	                        //남은 배열을 dataTransfer로 처리(Array -> FileList)
	                           dataTransfer.items.add(file); 
	                        });
	                        
	                        $('#upfile')[0].files = dataTransfer.files;   //제거 처리된 FileList를 돌려줌
	                    }
	                   
	                    /* 전달된 첨부파일 삭제  */
	                    function deleteFile2(fileNo){	                    	
	                    	document.querySelector("#forwordFile" + fileNo).remove();
	                    }
	                    
	                   
	
	                </script>
	                
					<!-- 서명여부 및 서명 선택 -->
	                <tr>
	                    <td colspan="4" align="end" id="sigArea">
	                        
	                    </td>
	                </tr>
	
	                <tr>
	                    <td colspan="4">
	                        
	                        <!-- 메일내용 -->
	                        <textarea id="summernote" name="mailContent" id="mailContent" required>
	                        
	                        	
	                        </textarea>
	                        
	                        
	                    </td>
	                </tr>
	                           
	            </table>
	
	            <br>                  
			</div>
        </form>		
		
        <!-- summerNote 관련 script-->      
        <script src="${pageContext.request.contextPath}/resources/js/summerNote/summernote-lite.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/summerNote/lang/summernote-ko-KR.js"></script>
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
        </script>
          


        <script>
        <!-- 이메일 주소록 관련 (자식창 open 및 data 받기)  -->
            var newWindow;
            function openAddressTo(){
                newWindow = window.open("${pageContext.request.contextPath}/addressEmail.ad","addressWindow", "height=700, width=1100");                
            }

            function sendData(data){
                
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
                newWindow2 = window.open("${pageContext.request.contextPath}/addressEmailCC.ad","addressWindow", "height=700, width=1100");
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
            
            $(function(){
            	// 등록 된 서명리스트
            	sigChoice();
            	
            	// 서명선택때마다 summert note textarea에 해당 서명내용입력되게끔
            	$(document).on("change", "#sigChoice", function(){            		
            		selectSigChoice($(this).val());
            	}); 
            });
            
            // 등록된 서명리스트
            function sigChoice(){           	
            	
            	$.ajax({
            		url:"sigList.ma",
            		data:{
            			empNo:${loginUser.empNo}            			
            		},
            		success:function(result){
            			            			
            			let list = result.list;
            			let emp = result.emp;
            			let selectValue = ""; // select-option으로 보여질 value값
            			let sigText = "";
            			
            			// 서명 사용 설정한 경우에만 option이 보이게끔
            			if(emp.empSigUse == 'Y'){
            				
            				  selectValue   += '<select id="sigChoice" >'
            								+	'<option value="sigNo">서명안함</option>';
                			
                			for(let i=0; i<list.length; i++){
                				selectValue +=  '<option value="'+list[i].sigNo+'"';
                				
                					// 기본설정된 서명이 selected + textarea에 떠있게끔
	                				if(list[i].sigBasic == 'Y'){
	                					selectValue += 'selected';
	                					
	                					sigText +=  '<div style="font-size: 11px; color:#525252;" id="sigContent">'
	                							 +		"<br><br><br><br><br><br> <hr style='width:90%'>"
			   					                 +       '<b>이름 </b>'+ list[i].sigName+' <br>'
			   					                 +       '<b>부서 </b>'+ list[i].sigDepartment+'&nbsp; <b> 직급</b>  '+ list[i].sigPosition+' <br>';
			   					        if(list[i].sigAddress != null){
			   					        	sigText +=   '<b>회사주소 </b> '+ list[i].sigAddress+' <br>';
			   					        }
				   					    if(list[i].sigExtension != null){
				   					        sigText +=   '<b>사내번호 </b>'+ list[i].sigExtension+'<br>';
				   					    } 
				   					 	if(list[i].sigTel != null){
				   					        sigText +=   '<b>Tel </b>'+ list[i].sigTel+'<br>';
				   					    } 			   					 
				   					 	if(list[i].sigEmail != null){
				   					        sigText +=   '<b>Email </b>'+ list[i].sigEmail+'<br>';
				   					    }          		   					                 
			   					                
				   					 	sigText  +=   '</div>';                					
	                				}
                				
                				selectValue +=   '>서명' + list[i].rnum + '</option>';
                			}
                				selectValue	+= '</select> ';
                				
                				sigText 	+=  '<div style="height:100px"></div>' 
                							 +	'<div style="font-size: 10px; color:#525252;">'                            
				                             +		 '-------------------Original Message ------------------- <br>'
				                             +  	 'From:" ${m.mailSenderName} " <br>'
				                             +  	 'To: ${loginUser.empEmail } <br>'
				                             +  	 'CC: ${m.mailCC}  <br>'
				                             +  	 'Subject:${ m.mailTitle } <br>'
				                             +  	 '<br>'
					                         +  	 '<small>${ m.mailContent }</small>'		                            
				                             +	'</div>'; 
            				
                			// select-option	
	            			$("#sigArea").html(selectValue); 
                			$(".note-editable").html(sigText);
                			
            			}		                       
            			
            		},
            		error:function(){
            			console.log("메일쓰기 서명리스트 조회용  ajax실패");
            		}
            	})
            }
            
            // 서명 고를때마다 메일내용에 해당 서명으로 바꿔주기
            function selectSigChoice(sigNo){
            	$.ajax({
            		url:"sigList.ma",
            		data:{
            			empNo:${loginUser.empNo}            			
            		},
            		success:function(result){
            			let list = result.list;
            			let sigText = "";
            			
            			for(let j=0; j<list.length; j++){
            				if(list[j].sigNo == sigNo){
                				sigText +=       "<br><br><br><br><br><br> <hr style='width:90%'>"
                						 +		 '<b>이름 </b>'+ list[j].sigName+' <br>'
    					                 +       '<b>부서 </b>'+ list[j].sigDepartment+' <b>직급</b> '+ list[j].sigPosition+' <br>';
    					        if(list[j].sigAddress != null){
    					        	sigText +=   '<b>회사주소 </b> '+ list[j].sigAddress+' <br>';
    					        }
	      					    if(list[j].sigExtension != null){
	      					        sigText +=   '<b>사내번호 </b>'+ list[j].sigExtension+'<br>';
	      					    } 
	      					 	if(list[j].sigTel != null){
	      					        sigText +=   '<b>Tel </b>'+ list[j].sigTel+'<br>';
	      					    } 			   					 
	      					 	if(list[j].sigEmail != null){
	      					        sigText +=   '<b>Email </b>'+ list[j].sigEmail+'<br>';
	      					    }          		   		
            				}			                 
            				console.log(list[j].sigAddress);
            			};
            			
            			$("#sigContent").html(sigText);
            		},
            		error:function(){
            			console.log("text로 선택한 서명보이기용 ajax실패");
            		}
            		
            	})	
            } 
            
        </script>



        


    </div>

    <div style="height: 30px;"></div>

</body>
</html>