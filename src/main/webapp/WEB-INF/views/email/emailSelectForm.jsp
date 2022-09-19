<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->

<!-- summerNote -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/summerNote/summernote-lite.css">
<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/emailCss/email2.css">

</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
    <div style="height: 30px;"></div>

    <div class="ntOuter">
        <br>       
        
        <!--  받는 사람 이메일이 없을 경우 submit안되게끔  -->
        <form action="insertWrite.ma" method="post" enctype="multipart/form-data" onsubmit="return submitCheck();">
		
            <button type="submit" class="btn btn-sm btn-primary" >보내기</button>
            <button type="button" class="btn btn-sm btn-secondary" onclick="history.back();">이전</button>   
            
            <input type="hidden" name="mailSender" value="${loginUser.empEmail }">     
            <input type="hidden" name="mailSenderName" value="${loginUser.empName }">     
            
            <br><hr>
            <div align="center">
	            <table id="emailTable">
	                <tr>
	                    <td class="fontsize13" width="30px">제목 </td>
	                    <td colspan="3"><input type="text" name="mailTitle" placeholder="제목을 입력해주세요" maxlength="20" style="width: 500px;" required></td>
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
	                               
									<!-- 전달된 이메일  -->
	                                <tr>                                  
	                                	<td><span>${ email }</span></td>
	                                	<td><input type="hidden" name="mailRecipient" value="${ email }"></td>
	                               		<td><span class="removeMail">x</span></td>
	                                </tr>
	
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
	                        	
	                        	<!-- 첨부파일 input이 올 자리 -->                      
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
						
	                	// 첨부파일의 X클릭시 삭제 
	                    $(function(){                       
	                       $(document).on("click", ".deleteFile", function(){
	                            $(this).parent().parent().remove();
	                       })
	                    });    
	                    // 첨부파일 갯수 제한                            
	                    function inputFileCount(){
	                        let countFile = $("#dataFileDiv input").length;
	
	                        if(countFile < 3){
	                            inputFile();
	                        }else{
	                            alert("첨부파일은 3개 이하만 가능합니다.");
	                        }
	                    }
						// input파일 추가
	                    function inputFile(){
	                        let elFile = '<tr>'                                 
	                                   +    '<td><input type="file" id="upfile" name="upfile"></td>'
	                                   +    '<td><button type="button"  class="btn btn-sm btn-secondary deleteFile">X</button></td>'
	                                   + '</tr>';
	
	                        $("#dataFileDiv").append(elFile);                           
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