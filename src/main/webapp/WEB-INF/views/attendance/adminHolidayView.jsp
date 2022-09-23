<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .alignCenter{text-align: center; font-size: larger; color:blue}
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
	tr, th{
		padding:15px;
	}
	tbody tr{
		cursor : pointer;
	}
	
</style>
</head>
<body>
	
	<jsp:include page="../common/menubar.jsp" />

	<div style="height:2%"></div>
	
	<div id="outer" style="width:96%; height:1200px">
		<!-- 상단 메뉴 제목 영역 -->
		<div id="header">
		    <h3>공휴일 관리</h3>
		</div>
		
		<div style="width:80%"><hr></div>
		
		<div style="width:82%;">
			<!-- 테이블 -->
		    <div class="div1" style="width:44%; height:900px; float: left;">
		  
		  		<br>
		  		<div style="height: 90%; width:90%">
					<button data-toggle="modal" data-target="#holidayInsert" class="btn btn-sm btn-primary" style="width:50px; height:30px; font-size:15px; float:right" >등록</button>

					<br><br>

					<table class="table table-hover" style="text-align:center" id="updateHoliday">
						<thead>
							<tr>                            
								<th>날짜</th>
								<th>공휴일명</th>			
							</tr>
						</thead>
						<tbody>
					  	<c:choose>
						  	<c:when test="${ empty list }">
						  		<tr>
						  			<td colspan="2">조회된 공휴일이 없습니다.</td>
						  		<tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="h" items="${list}">
								  <tr data-target="#holidayUpdate" data-toggle="modal">
									  <td class="no">${h.holDay}</td>
								  	  <td class="name">${h.holName}</td>
							  	  </tr>
							 	</c:forEach>
							</c:otherwise> 
					 	</c:choose>
					  </tbody>
					
			
					</table>
				</div>
		    </div>
			
		</div>
		<div style="clear:both"></div>
	
	</div>	
	<br><br><br><br><br><br><br><br><br><br><br><br><br>
	
        
        <!-- ====================================================  Modal ================================================================ -->

        <!-- 공휴일등록 -->
        <div class="modal fade" id="holidayInsert" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">공휴일 등록</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">                          
                         <form action="insert.hol" method="get">                                              
                            <div align="center">
                                <table>    
                                	<tr>                                    
                                        <th>날짜</th>                                                                      
                                        <td>
                                           	<input type="text" name="holidayCode" style="text-align:center" required>                                    
                                        </td>                                                                             
                                    </tr>                                                             
                                    <tr>                                    
                                        <th>공휴일명</th>                                                                      
                                        <td>
                                           	<input type="text" name="holidayName" style="text-align:center" required>                                    
                                        </td>                                                                             
                                    </tr>                               
                                   
                                    </tr>   
                                </table>
                            </div>
                            <br>
                            <div align="center">
                                <button type="submit" class="btn btn-sm btn-primary" id="button1">등록</button>
                                <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">취소</button>
                            </div>
                            
                       </form>
                    </div>
                    
                </div>
            </div>
        </div>
        
        <!-- ====================================================  Modal ================================================================ -->

        <!-- 공휴일수정 및 삭제 -->
        <div class="modal fade" id="holidayUpdate" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">공휴일 수정/삭제</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">                          
                         <form action="" method="get">                                              
                            <div align="center">
                                <table>    
                                	<tr>                                    
                                        <th>날짜</th>                                                                      
                                        <td>
                                           	<input type="text" id="hCodeText" name="holidayCode1" style="text-align:center" readonly>                                    
                                        </td>                                                                             
                                    </tr>                                                             
                                    <tr>                                    
                                        <th>공휴일명</th>                                                                      
                                        <td>
                                           	<input type="text" id="hNameText" name="holidayName1" style="text-align:center" readonly>                                    
                                        </td>                                                                             
                                    </tr>  
                                    <tr><td colspan="2">--------------------------------------------------------------------------</td></tr>
                                    <tr>                                    
                                        <th>수정할 날짜</th>                                                                      
                                        <td>
                                           	<input type="text" id="hCodeText1" name="holidayCode2" style="text-align:center">                                    
                                        </td>                                                                            
                                    </tr>                                                             
                                    <tr>                                    
                                        <th>수정할 공휴일명</th>                                                                      
                                        <td>
                                           	<input type="text" id="hNameText1" name="holidayName2" style="text-align:center">                                    
                                        </td>                                                                             
                                    </tr>                             
                                   
                                     
                                </table>
                            </div>
                            <br>
                            <div align="center">
                                <button type="button" class="btn btn-sm btn-warning" id="hUpdatebutton">수정</button>
                                <button type="submit" class="btn btn-sm btn-secondary" id="hDeletebutton" style="background-color:red; color:white">삭제</button>
                                <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">취소</button>
                            </div>
                            
                            <br>
                            
                       </form>
                    </div>
                    
                </div>
            </div>
        </div>
        
        <script>
        
	     // 공휴일 테이블 클릭시 수정 및 삭제 모달창
			
			$(function(){
				$("#updateHoliday>tbody>tr").click(function(){
					
					if($(this).attr('data-click-state') == 1) {

						$(this).attr('data-click-state', 0)

					} else {

						$(this).attr('data-click-state', 1)
					}
					
					console.log()
					$("#hCodeText").val(($(this).children(".no").text()));
					$("#hNameText").val(($(this).children(".name").text()));
					
				})
							
			})
	     
	     
			$(function(){
				
				$("#hUpdatebutton").on('click', function(){
					
					var a = $("#hCodeText").val();
					var b = $("#hNameText").val();
					var c = $("#hCodeText1").val();
					var d = $("#hNameText1").val();
					
					location.href="update.hol?holidayCode1=" + a + "&holidayName1=" + b + "&holidayCode2=" + c + "&holidayName2=" + d
				})
				
			})
			
			
			$(function(){
				
				$("#hDeletebutton").on('click', function(){
					
					var a = $("#hCodeText").val();
					var b = $("#hNameText").val();
					var c = $("#hCodeText1").val();
					var d = $("#hNameText1").val();
					
					location.href="delete.hol?holidayCode1=" + a + "&holidayName1=" + b
				})
				
			})
	     
	     
	     
        </script>
        
	
</body>
</html>