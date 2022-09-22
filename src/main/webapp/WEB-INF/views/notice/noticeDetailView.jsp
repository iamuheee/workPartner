<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/noticeCss/notice1.css">
<!-- summerNote -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/summerNote/summernote-lite.css">   
<style>
table tr:hover{background-color:white;}
.displayNone{
   display: none;
}
</style>
</head>
<body>
    <jsp:include page="../common/menubar.jsp"/>

    <div style="height: 10px;"></div>
    <div  style="margin-left: 84%;">
    	
    	<!-- 글 작성자 이거나 인사부(기본관리자)이거나 -->
    	<c:choose>
    		<c:when test="${loginUser.empNo eq n.empNo or loginUser.empNtAdmin  eq 'A'}">
    			 <a class="btn btn-sm btn-primary" href="update.nt?no=${ n.noticeNo }">수정</a> 
        		 <button class="btn btn-sm btn-secondary" type="button" data-toggle="modal" data-target="#deleteNotice">삭제</button>	
    		</c:when>
    		<%-- <c:when test="${loginUser.empNtAdmin  eq 'A'}">
    			 <a class="btn btn-sm btn-primary" href="update.nt">수정</a> 
        		 <a class="btn btn-sm btn-secondary" data-toggle="modal" data-target="#deleteNotice">삭제</a>
    		</c:when> --%>
    	</c:choose>
    	
       
    </div>
    <br>
    <div class="ntOuter1">       
        <div class="paddingStyle">        

            <h6><b>${ n.noticeTitle }
             
	             <c:if test="${n.noticeImportant eq 'I' }">
	             	<span style="color: red;">!</span>
	             </c:if>
             
             </b></h6>
            
            <br>
            <textarea id="summernote" name="mailContent">${n.noticeContent}</textarea> 
            
            
        <!-- summerNote 관련 script-->      
        <script src="${pageContext.request.contextPath}/resources/js/summerNote/summernote-lite.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/summerNote/lang/summernote-ko-KR.js"></script>
        <script>
            $(document).ready(function() {
            	            	
                //여기 아래 부분
                $('#summernote').summernote({
                    //height:1000,                 // 에디터 높이
                    minHeight: 500,             // 최소 높이
                    maxHeight: 1500,             // 최대 높이
                    focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
                    lang: "ko-KR",					// 한글 설정
                   	toolbar: [ // toolbar사용 안하기                   	 
                   	    ['style', []],
                   	    ['font', []]                   	  
                   	  ]
                });     
                
                
                
                $('#summernote').summernote('disable'); // 비활성화
          
            });            
        </script>
          
            
            
            <br>
                
        </div> 
        
        <div class="ntOuter2"></div>

        <div class="fontsize13 paddingStyle">
            <table >
                <tr>
                    <th width="60px">작성자</th>
                    <td>&nbsp; ${n.empName }</td>
                </tr>
                <tr>
                    <th>등록일자</th>
                    <td>&nbsp; ${n.noticeCreateDate }</td>
                </tr>
            </table>
        </div>

        <div class="ntOuter2"></div>
        
        <div class="fontsize13 paddingStyle">
            <b>첨부파일</b> <br>
            <table style="margin-left: 15px; margin-top: 3px; font-size: 12px;">   
            	<c:choose>
            		<c:when test="${empty list }">
            			<tr><td>첨부파일이 없습니다.</td><tr>
            		</c:when>
            		<c:otherwise>
            			<c:forEach var="f" items="${list }">
            				 <tr><td><a href="${f.filePath }" download="${f.fileOriginName }" class="aStyle">${f.fileOriginName }</a></td></tr>
            			</c:forEach>
            		</c:otherwise>
            	</c:choose>
            
            </table>
        </div>
        
        <br>
        
        <!-- 댓글 기능은 나중에 ajax 배우고 접목시킬예정! 우선은 화면구현만 해놓음 -->
        <table id="replyArea" class="table" align="center">
            <thead>
                <tr>
                    <th colspan="2">
                        <textarea class="form-control insertParentContent" name="nCommentContent" cols="57" rows="2" style="resize:none; width:100%" required></textarea>
                    </th>
                    <th style="vertical-align: middle"><button class="btn btn-secondary" type="button" onclick="insertCommentParent();">등록하기</button></th>
                </tr>
                <tr>
                   <td colspan="3">댓글 (<span id="rcount"></span>) </td>  <!-- 댓글갯수 -->
                </tr>
            </thead>         
        </table>

        <div class="paddingStyle" id="commentArea">
            <!-- 
            
            	댓글 리스트 영역
            
             -->            
        </div> 
   		<!-- ======================================================== Modal ===================================================  -->
   		<!-- 공지사항 삭제 Modal  -->     
        <div class="modal fade" id="deleteNotice" tabindex="-1" aria-labelledby="deleteNoticeModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered ">
                <div class="modal-content" align="center">                    
                    <div class="modal-body">
                       <form action="deleteNotice.nt" method="post">
                       	 <br>
                         해당 공지사항을 삭제하시겠습니까?
                         <br><br>
                         <input type="hidden" name="noticeNo" value="${n.noticeNo }">
                         <button type="submit" class="btn btn-sm btn-danger">삭제</button>
                         <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">취소</button>
                       </form>
                    </div>
                    
                </div>
            </div>
        </div>

        <!-- 댓글 삭제 Modal -->
        <div class="modal fade" id="deleteComment" tabindex="-1" aria-labelledby="deleteCommentModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered ">
                <div class="modal-content" align="center">                    
                    <div class="modal-body">
                        <br>
                        해당 댓글을 삭제하시겠습니까?
                        <br><br>
                        <button type="button" class="btn btn-sm btn-danger" onclick="deleteCommentModal();">삭제</button>
                         <input type="hidden" name="nCommentNo" id="deleteCommentNo"> 
                        <button type="button" class="btn btn-sm btn-secondary" onclick="$('#deleteComment').modal('hide');">취소</button>
                    </div>
                    
                </div>
            </div>
        </div>

        <!-- 댓글 수정 Modal -->
        <div class="modal fade" id="updateComment" tabindex="-1" aria-labelledby="updateCommentModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered ">
                <div class="modal-content" align="center">   
                    <div class="modal-header">
                        <h5 class="modal-title" id="deleteNoticeModalLabel">댓글 수정</h5>                        
                        <button type="button" class="close" onclick='$("#updateComment").modal("hide");' aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>                 
                    <div class="modal-body">
                        <form>
                            <textarea class="form-control" name="nCommentContent" id="updateContent" cols="50" rows="2" style="resize:none; width:100%"></textarea>
                            <input type="hidden" name="nCommentNo" id="updateCommentNo"> 
                            <br> 
                            <button type="button" class="btn btn-sm btn-danger" onclick="updateCommentModal();">수정</button>
                            <button type="button" class="btn btn-sm btn-secondary" onclick='$("#updateComment").modal("hide");'>취소</button>
                        </form>                      
                    </div>
                   
                </div>
            </div>
        </div>
        
        <!-- ======================================================== 댓글관련 script ===================================================  -->
        <script>
        	$(function(){
        		
        		// 댓글 조회
        		replyList();
        		
        		// 답글작성form open 버튼클릭
        		$(document).on("click", ".insertOpen", function(){
                    const $dEl = $(this).parent().next().next();
                    if($dEl.css("display")!= "none"){
                       $dEl.addClass("displayNone");
                    }else{
                        $dEl.removeClass("displayNone");
                    }
                });
        		
        		// 답글 작성하기
        		$(document).on("click", ".insertChild", function(){
        			
        			let nCommentContent = $(this).parent().prev().children(".insertChildComment").val();
        			let nCommentParentNo = $(this).parent().prev().children(".nCommentParentNo").val();
        			let noticeNo = ${n.noticeNo}
					
        			if(nCommentContent.trim() != 0){
            			$.ajax({
                			url:"insertComment.nt",
                			type: "post",
                			data:{
                				noticeNo: noticeNo,
                				empNo: ${loginUser.empNo},
                				empId: "${loginUser.empId}",
                				nCommentContent: nCommentContent ,
                				parentNo: nCommentParentNo
                			},
                			success:function(result){
                				if(result == 'success'){
    								// 비워주기
                					$(".insertChildComment").val("");
                					// 다시 댓글 조회
                					replyList();
                					// 스크롤 맨 아래로 내려주기
                					$('html,body').animate({ scrollTop: $('#commentArea').offset().top }, 500);     
                				}
                			},
                			error:function(){
                				console.log("답글 등록용 ajax 실패");
                			}
                		})	
            		}else{        			
            			$(this).parent().prev().children(".insertChildComment").focus();        			 
            		}       		

        		})
        		
        		// 댓글 수정 시 모달창에 정보전달
        		$(document).on("click", "#commentArea .editComment", function(){
        			// 댓글번호, 내용
        			$("#updateCommentNo").val($(this).next().next().val());
        			$("#updateContent").val($(this).next().next().next().val());        			
        		});
        		
        		// 댓글 삭제 시 모달창에 정보전달
        		$(document).on("click", "#commentArea .deleteComment", function(){
        			// 댓글번호
        			$("#deleteCommentNo").val($(this).next().val());        			     			
        		})
        		
        	});
        	
        	// 댓글 조회
        	function replyList(){
        		$.ajax({
        			url:"replyList.nt",
        			type: "post",
        			data: {
        				noticeNo : ${n.noticeNo}
        			},
        			success:function(list){
									
        				let value = "";
        				
        				$("#rcount").html(list.length); // 댓글갯수
        				
        				for(let i=0; i<list.length; i++){
        					      					
        					let comentNo = list[i].nCommentNo;
        					let empNo = list[i].empNo;
        					let empId = list[i].empId;
        					let profile = list[i].empProfile;
        					let content = list[i].nCommentContent;
        					let createDate = list[i].createDate;
        					let parentCommentNo = list[i].nCommentParentNo; 
        					let comStatus = list[i].nCommentStatus;
        					let level = list[i].level;
        					        					
        					// 원댓글 
        					if(comStatus == 'N' && parentCommentNo == 0){ // 원댓글 + 삭제시
        						value += '<div class="card mb-2" > 삭제된 댓글입니다. </div>';
        					}else{
        						
        						if(parentCommentNo == 0){ 
        							value +=  '<div class="card mb-12" >'
				        			       +      '<div class="row no-gutters">'                
				        		           +         '<div class="col-md-8">'
				        		           +             '<div class="card-body">'
				        		           +                 '<h6 class="card-title">'
				        		           +                     '<img id="profileImg" src="'+ profile  +'"> '+ empId  +' &nbsp;'
				        		           +                     '<span class="card-text"><small class="text-muted">'+ createDate +' </small></span>';
				        		    
				        		           
				        		   if(${loginUser.empNo} == empNo){
				        			   value += 				 '<button type="button" class="btn btn-sm btn-primary editComment" style="margin-left: 35%;" data-toggle="modal" onclick="' + "$('#updateComment').modal('show');\""+ '>수정</button>'
				        		              +                  '<button type="button" class="btn btn-sm btn-danger deleteComment" data-toggle="modal" onclick="' + "$('#deleteComment').modal('show');\""+ '>삭제</button>'
				        		              +					 '<input type="hidden" name="nCommentNo" value="'+ comentNo +'">'
				        		              +					 '<input type="hidden" name="nCommetContent" value="'+ content +'">';
				        		   }
							        value +=             		 '<button class="btn btn-sm btn-light insertOpen material-symbols-outlined"> rate_review </button>'
							        	   +				  '</h6>'
				        		           +                  '<p class="card-text content">'+ content +'</p>' 
				        		           + 				  '<div class="col-12 displayNone">'
					        		       +                	 '<table id="" class="">'
					        		       +                 		'<thead>'
					        		       +                    		 '<tr>'
					        		       +                        		 '<th colspan="2">'
					        		       +                            		 '<textarea class="form-control insertChildComment" name="nCommentContent" cols="50" rows="2" style="resize:none; width:100%"></textarea>'
					        		       +									 '<input type="hidden" class="nCommentParentNo" value="'+ comentNo  +'">'					        		      
					        		       +                         		'</th>'
					        		       +                        	    '<th style="vertical-align: middle"> &nbsp;&nbsp; <button class="btn btn-secondary insertChild" type="button">등록하기</button></th>'
					        		       +                    	    '</tr>'                           
					        		       +                 	  	'</thead>'         
					        		       +             	     '</table>'
					        		       +         		 '</div>'
				        		           +             '</div>'
				        		           +         '</div>'
				        		           +    '</div>'
				        		           + '</div>';				        		          
							  
        						}else{ // 답글
        							if(comStatus == 'N' && parentCommentNo != 0){
        								
        							}else{
        								value += '<div class="card mb-2 marginReply">'
				        				       +     '<div class="row no-gutters">'                                                
				        			           +         '<div class="col-md-8">'
				        			           +             '<div class="card-body">'
				        			           +                 '<h6 class="card-title">'
				        			           +                    '<img id="profileImg" src="'+ profile +'"> '+ empId +' &nbsp;'
				        			           +                     '<span class="card-text"><small class="text-muted">'+ createDate +' </small></span>';
				        			           
        								if(${loginUser.empNo} == empNo){
     				        			   value += 				 '<button type="button" class="btn btn-sm btn-primary editComment" style="margin-left: 35%;" data-toggle="modal" onclick="' + "$('#updateComment').modal('show');\""+ '>수정</button>'
     				        		              +                  '<button type="button" class="btn btn-sm btn-danger deleteComment" data-toggle="modal" onclick="' + "$('#deleteComment').modal('show');\""+ '>삭제</button>'
     				        			  		  +					 '<input type="hidden" name="nCommentNo" value="'+ comentNo +'">'
     				        			  		  +					 '<input type="hidden" name="nCommetContent" value="'+ content +'">';
     				        		     }
				        			    value +=                 '</h6>'
				        			           +                 '<p class="card-text content">'+ content +'</p>'                           
				        			           +             '</div>'
				        			           +         '</div>'
				        			           +     '</div>'
				        			           + '</div>';
        							}
        							        											
        						}
        						
        					}
        					        					
        				}
        				$("#commentArea").html(value);
        			},
        			error:function(){
        				console.log("댓글 리스트 조회용 ajax 실패");
        			}
        			
        		})
        	}
        
        	// 원댓글 등록
        	function insertCommentParent(){
        	        		
        		// 내용이 있을때 실행되게끔
        		// textarea 라고해서 text()로했더니 안뽑힘 => val() * 보통 크롬에서 text()로 안되는 경우 많아서 val()로 뽑는다고 함
        		let parentContent = $(".insertParentContent").val();
        		
        		if(parentContent.trim() != 0){
        			$.ajax({
            			url:"insertComment.nt",
            			type: "post",
            			data:{
            				noticeNo: ${n.noticeNo},
            				empNo: ${loginUser.empNo},
            				empId: "${loginUser.empId}",
            				nCommentContent: parentContent 
            			},
            			success:function(result){
            				if(result == 'success'){
								// 비워주기
            					$(".insertParentContent").val("");
            					// 다시 댓글 조회
            					replyList();
            					// 스크롤 맨 아래로 내려주기
            					//$('html,body').animate({ scrollTop: $('#commentArea').offset().top }, 500);            				
            					//window.scrollTo(0,document.querySelector("#layoutSidenav").scrollHeight);
            					window.scrollTo(0,document.body.scrollHeight);            				
            				}
            			},
            			error:function(){
            				console.log("원댓글 등록용 ajax 실패");
            			}
            		})	
        		}else{        			
        			 $(".insertParentContent").focus();        			 
        		}       		
        		
        	}
        	
        	// 댓글 수정
        	function updateCommentModal(){
        		let nCommentNo = $("#updateComment #updateCommentNo").val();
        		let nCommentContent = $("#updateComment #updateContent").val();
        		if(nCommentContent.trim() != 0){
        			$.ajax({        				
        				url:"updateComment.nt",
        				type: "post",
        				data:{
        					nCommentNo:nCommentNo,
        					nCommentContent:nCommentContent
        				},
        				success:function(result){
        					if(result == 'success'){
        						// 처리 후 모달창 닫기
        						$("#updateComment").modal("hide");
        						// 다시 댓글 조회
        						replyList();
        					}
        				},
        				error:function(){
        					console.log("댓글 수정용 ajax 실패");
        				}
        				
        			})
        		}else{
        			$("#updateContent").focus();
        		}
        	}
        	
        	// 댓글 삭제
        	function deleteCommentModal(){
        		let nCommentNo = $("#deleteComment #deleteCommentNo").val();
        		console.log(nCommentNo);
        		
      			$.ajax({        				
      				url:"deleteComment.nt",
      				type: "post",
      				data:{
      					comNo:nCommentNo      					
      				},
      				success:function(result){
      					if(result == 'success'){
      						// 처리 후 모달창 닫기
      						$("#deleteComment").modal("hide");
      						alert("삭제됐습니다");
      						// 다시 댓글 조회
      						replyList();
      					}
      				},
      				error:function(){
      					console.log("댓글 삭제용 ajax 실패");
      				}
      				
      			})
        		
        	}        	
        </script>

        
    </div>
</body>
</html>


