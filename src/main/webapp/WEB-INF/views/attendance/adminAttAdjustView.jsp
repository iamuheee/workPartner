<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.alignCenter{text-align: left; font-size: larger; color:blue}
    .alignLeft{text-align: left;}
    .div1{
        display:inline-block;
        box-shadow :  1px 1px 1px 1px rgb(212, 211, 211);
        margin-right: 5%;
	}
    .ntPasing{
	    grid-area: footer;
	    place-items: center;
	    display: grid;
	    margin-right:15%
	}
</style>
</head>
<body>
	
	<jsp:include page="../common/menubar.jsp" />
	
	<div style="height:2%"></div>
	
	<div id="outer" style="width:96%">
		<!-- 상단 메뉴 제목 영역 -->
		<div id="header">
		    <h3>근태 조정 내역</h3>
		</div>
		
		<div style="width:80%"><hr></div>
		

	    
	    <br><br>
	    
 <h4>출퇴근시간변경</h4>
	    <br>
	    <!-- 테이블 -->
	    <div class="ntMain" style="width:80%">
	        <table class="table table-hover" style="text-align:center" id="detail1">
	            <thead>
	                <tr>     
	                	<th>문서번호</th>                       
	                    <th>조정일</th>
	                    <th>부서명</th>
	                    <th>사원명</th>
	                    <th>제목</th>
	                    <th>진행상황</th>
	                    <th><th>
	                </tr>
	            </thead>
	            <tbody>
	               <c:choose>
                		<c:when test="${empty list}">
                			<tr>
                				<td colspan="7">조회된 출퇴근시간 조정내역 없습니다.</td>
                			</tr>
                		</c:when>
                		<c:otherwise>
							<c:forEach var="a" items="${list}">
								<tr>
			                        <td class="no">${a.a}</td>
			                        <td class="date">${a.b}</td>
			                        <td>${a.c}</td>
			                        <td class="name">${a.d}</td>
			                        <td>${a.e}</td>
			                        <td>${a.f}</td>
			                        <td>
			                        	<c:if test="${ a.f == '조정중' }">
			                        	<button class="btn btn-sm btn-primary" id="button1">승인</button> / 
	                    				<button class="btn btn-sm btn-warning" id="button2">반려</button>
			                      		 </c:if>
			                        </td>        
			                    </tr>
							</c:forEach>
                		</c:otherwise>                    
                    </c:choose>     

	            </tbody>
	        
	
	        </table>
	        
	        <br><br><br>
	        
	    <h4>근무시간변경</h4>
		<br>
	         <table class="table table-hover" style="text-align:center" id="detail2">
	             <thead>
	                <tr>     
	                	<th>문서번호</th>                       
	                    <th>조정일</th>
	                    <th>부서명</th>
	                    <th>사원명</th>
	                    <th>제목</th>
	                    <th>진행상황</th>
	                    <th><th>
	                </tr>
	            </thead>
	            <tbody>
	                 
	                <c:choose>
                		<c:when test="${empty list2}">
                			<tr>
                				<td colspan="7">조회된 근무시간조정내역 없습니다.</td>
                			</tr>
                		</c:when>
                		<c:otherwise>
							<c:forEach var="a" items="${list2}">
								<tr>
			                        <td class="no">${a.a}</td>
			                        <td class="date">${a.b}</td>
			                        <td>${a.c}</td>
			                        <td class="name">${a.d}</td>
			                        <td>${a.e}</td>
			                        <td>${a.f}</td>
			                        <td>
			                        	<c:if test="${ a.f == '조정중' }">
			                        	<button class="btn btn-sm btn-primary" id="button3">승인</button> / 
	                    				<button class="btn btn-sm btn-warning" id="button4">반려</button>
			                       		 </c:if>
			                        </td>        
			                    </tr>
							</c:forEach>
                		</c:otherwise>                    
                    </c:choose>     

	            </tbody>
	        
	
	        </table>
	
	    </div>

	
	
	</div>
	
	<br><br><br><br><br><br><br><br><br>
	
	<script>
	
		$(function(){
			
			$("#button1").on('click', function(){
				
				var a = $(this).parent().siblings(".no").text();
				var b = $(this).parent().siblings(".name").text();
				var c = $(this).parent().siblings(".date").text();
				
				$.ajax({	
	    			url:"agreeModify.att",
	    			data:{"aatNo":a, "empName":b, "date":c},
	    			success:function(){
	    				
	    				location.reload();
	    				
	    			},
	    			error:function(){
	    				console.log("근태수정신청 ajax 통신 실패");
	    			}
				
	    		
			})
			
			})
		})
		
		$(function(){
			
			$("#button2").on('click', function(){
				
				var a = $(this).parent().siblings(".no").text();
				
				$.ajax({	
	    			url:"agreeModify2.att",
	    			data:{"aatNo":a},
	    			success:function(){
	    				
	    				location.reload();
	    				
	    			},
	    			error:function(){
	    				console.log("근태수정신청 ajax 통신 실패");
	    			}
				
	    		
			})
			
			})
		})
		
		
		$(function(){
			
			$("#button3").on('click', function(){
				
				var a = $(this).parent().siblings(".no").text();
				
				$.ajax({	
	    			url:"agreeModify3.att",
	    			data:{"aatNo":a},
	    			success:function(){
	    				
	    				location.reload();
	    				
	    			},
	    			error:function(){
	    				console.log("근태수정신청 ajax 통신 실패");
	    			}
				
	    		
			})
			
			})
		})
		
		$(function(){
			
			$("#button4").on('click', function(){
				
				var a = $(this).parent().siblings(".no").text();
				
				$.ajax({	
	    			url:"agreeModify2.att",
	    			data:{"aatNo":a},
	    			success:function(){
	    				
	    				location.reload();
	    				
	    			},
	    			error:function(){
	    				console.log("근태수정신청 ajax 통신 실패");
	    			}
				
	    		
			})
			
			})
		})
		
		
		
		$(function(){
            	
			$("#detail1>tbody>tr").click(function(){
            		
					let x = $(this).children().siblings(".no").text();

          			$("#z").click()
          			
          			$.ajax({
	    			url: "detail.att",
	    			data: {
	    					  "aatNo":x
	    			      },
	    				   
	    			success:function(list){
	    				
	    				let a = list[0].a;
	    				let b = list[0].b;
	    				let c = list[0].c;
	    				let d = list[0].d;
	    				let e = list[0].e;
	    				let f = list[0].f;
	    				
	    				$("#text1").val(a);
	    				$("#text2").val(b);
	    				$("#text3").val(c);
	    				$("#text4").val(d);
	    				$("#text5").val(e);
	    				$("#text6").val(f);
	    				
	    			},error:function(){
	    				console.log("댓글리스트 조회용 ajax통신 실패");
	    			}
				})
          			
          			
       		})
       })
		
		// 근무시간
		$(function(){
            		$("#detail2>tbody>tr").click(function(){

            			let y = $(this).children().siblings(".no").text();

              			$("#zz").click()
              			
              			$.ajax({
    	    			url: "detail.att",
    	    			data: {
    	    					  "aatNo":y
    	    			      },
    	    				   
    	    			success:function(list){
    	    				
    	    				let a = list[0].a;
    	    				let b = list[0].b;
    	    				let c = list[0].c;
    	    				let d = list[0].d;
    	    				let e = list[0].e;
    	    				let f = list[0].f;
    	    				
    	    				$("#text11").val(a);
    	    				$("#text22").val(b);
    	    				$("#text33").val(c);
    	    				$("#text44").val(d);
    	    				$("#text55").val(e);
    	    				$("#text66").val(f);
    	    				
    	    			},error:function(){
    	    				console.log("댓글리스트 조회용 ajax통신 실패");
    	    			}
    				})
            		
            		})
        })
	</script>
	
	<button id="z" data-target="#departmentUpdate" data-toggle="modal" style="display:none"></button>
	<button id="zz" data-target="#departmentUpdate1" data-toggle="modal" style="display:none"></button>
	
	
	
	<!-- ====================================================  Modal ================================================================ -->

        <!-- 직위등록 -->
        <div class="modal fade" id="departmentUpdate" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">출퇴근시간변경</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">                          
                         <form action="insert.pst" method="get">                                              
                            <div align="center">
                                <table>
                                	<tr>                                    
                                        <th>수정할 날짜</th>                                                                      
                                        <td>
                                           	<input type="text" id="text1" name="text1" style="text-align:center" readonly>                                    
                                        </td>                                                                             
                                    </tr>    
                                	<tr>                                    
                                        <th>출근시간</th>                                                                      
                                        <td>
                                           	<input type="text" id="text2" name="text2" style="text-align:center" readonly>                                    
                                        </td>                                                                             
                                    </tr>                                                             
                                    <tr>                                    
                                        <th>퇴근시간</th>                                                                      
                                        <td>
                                           	<input type="text" id="text3" name="text3" style="text-align:center" readonly>                                    
                                        </td>                                                                             
                                    </tr>  
                                    <tr><td colspan="2">--------------------------------------------------------------------------</td></tr>
                                    <tr>                                    
                                        <th>수정할 출근시간</th>                                                                      
                                        <td>
                                           	<input type="text" id="text4" name="text4" style="text-align:center" readonly>                                    
                                        </td>                                                                            
                                    </tr>                                                             
                                    <tr>                                    
                                        <th>수정할 퇴근시간</th>                                                                      
                                        <td>
                                           	<input type="text" id="text5" name="text5" style="text-align:center" readonly>                                    
                                        </td>                                                                             
                                    </tr>                             
                                    <tr>
                                    	<th>사 유</th>
                                    	<td>
                                    		<textarea id="text6" name="text6"  rows="5" cols="25" wrap="hard" readonly></textarea>
                                    	</td>
                                    </tr>
                                   
                                     
                                </table>
                            </div>
                            <br>
                            <div align="center">
                                <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">취소</button>
                            </div>
                            
                       </form>
                    </div>
                    
                </div>
            </div>
        </div>
        
        
        
        
        <!-- ====================================================  Modal ================================================================ -->

        <!-- 직위등록 -->
        <div class="modal fade" id="departmentUpdate1" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">근무시간변경</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">                          
                         <form action="insert.pst" method="get">                                              
                            <div align="center">
                                <table>
                                	<tr>                                    
                                        <th>수정할 날짜</th>                                                                      
                                        <td>
                                           	<input type="text" id="text11" name="text1" style="text-align:center" readonly>                                    
                                        </td>                                                                             
                                    </tr>    
                                	<tr>                                    
                                        <th>지정출근시간</th>                                                                      
                                        <td>
                                           	<input type="text" id="text22" name="text2" style="text-align:center" readonly>                                    
                                        </td>                                                                             
                                    </tr>                                                             
                                    <tr>                                    
                                        <th>지정퇴근시간</th>                                                                      
                                        <td>
                                           	<input type="text" id="text33" name="text3" style="text-align:center" readonly>                                    
                                        </td>                                                                             
                                    </tr>  
                                    <tr><td colspan="2">--------------------------------------------------------------------------</td></tr>
                                    <tr>                                    
                                        <th>수정할 출근시간</th>                                                                      
                                        <td>
                                           	<input type="text" id="text44" name="text4" style="text-align:center" readonly>                                    
                                        </td>                                                                            
                                    </tr>                                                             
                                    <tr>                                    
                                        <th>수정할 퇴근시간</th>                                                                      
                                        <td>
                                           	<input type="text" id="text55" name="text5" style="text-align:center" readonly>                                    
                                        </td>                                                                             
                                    </tr>                             
                                    <tr>
                                    	<th>사 유</th>
                                    	<td>
                                    		<textarea id="text66" name="text6"  rows="5" cols="25" wrap="hard" readonly></textarea>
                                    	</td>
                                    </tr>
                                   
                                     
                                </table>
                            </div>
                            <br>
                            <div align="center">
                                <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">취소</button>
                            </div>
                            
                       </form>
                    </div>
                    
                </div>
            </div>
        </div>
	
</body>
</html>