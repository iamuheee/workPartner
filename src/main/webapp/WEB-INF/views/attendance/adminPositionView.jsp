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
	
	<div id="outer" style="width:96%">
		<!-- 상단 메뉴 제목 영역 -->
		<div id="header">
		    <h3>직위/직무 설정</h3>
		</div>
		
		<div style="width:80%"><hr></div>
		
		<div style="width:82%">
			<!-- 테이블 -->
		    <div class="div1" style="width:44%; height:600px; float: left;">
		  
		  		<br>
		  		<div style="height: 90%; width:90%">
					<button data-toggle="modal" data-target="#positionInsert" class="btn btn-sm btn-primary" style="width:50px; height:30px; font-size:15px; float:right" >등록</button>

					<br><br>

					<table class="table table-hover" style="text-align:center" id="updatePosition">
						<thead>
							<tr>                            
								<th>직위코드</th>
								<th>직위명</th>			
							</tr>
						</thead>
						<tbody>
					  	<c:choose>
						  	<c:when test="${ empty list2 }">
						  		<td colspan="2">조회된 직위가 없습니다.</td>
							</c:when>
							<c:otherwise>
								<c:forEach var="p" items="${list2}">
								  <tr data-target="#positionUpdate" data-toggle="modal">
									  <td class="no">${p.posCd}</td>
								  	  <td class="name">${p.posName}</td>
							  	  </tr>
							 	</c:forEach>
							</c:otherwise> 
					 	</c:choose>
					  </tbody>
					
			
					</table>
				</div>
		    </div>
			
			<!-- 테이블 -->
		    <div class="div1" style="width:44%; height:600px; float:right;" >
		  
				<br>
				<div style="height: 90%; width:90%">
				  <button data-toggle="modal" data-target="#departmentInsert" class="btn btn-sm btn-primary" style="width:50px; height:30px; font-size:15px; float:right" >등록</button>

				  <br><br>

				  <table class="table table-hover" style="text-align:center" id="updateDepartment">
					  <thead>
						  <tr>                            
							  <th>부서코드</th>
							  <th>부서명</th>			
						  </tr>
					  </thead>
					  <tbody>
					  	<c:choose>
						  	<c:when test="${ empty list }">
						  		<td colspan="2">조회된 부서가 없습니다.</td>
							</c:when>
							<c:otherwise>
								<c:forEach var="d" items="${list}">
								  <tr data-target="#departmentUpdate" data-toggle="modal">
									  <td class="no">${d.depCd}</td>
								  	  <td class="name">${d.depName}</td>
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

        <!-- 직위등록 -->
        <div class="modal fade" id="positionInsert" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">직위등록</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">                          
                         <form action="insert.pst" method="get">                                              
                            <div align="center">
                                <table>    
                                	<tr>                                    
                                        <th>직위코드</th>                                                                      
                                        <td>
                                           	<input type="text" name="positionCode" style="text-align:center" required>                                    
                                        </td>                                                                             
                                    </tr>                                                             
                                    <tr>                                    
                                        <th>직위명</th>                                                                      
                                        <td>
                                           	<input type="text" name="positionName" style="text-align:center" required>                                    
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

        <!-- 직위수정 및 삭제 -->
        <div class="modal fade" id="positionUpdate" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">직위수정/삭제</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">                          
                         <form action="" method="get">                                              
                            <div align="center">
                                <table>    
                                	<tr>                                    
                                        <th>직위코드</th>                                                                      
                                        <td>
                                           	<input type="text" id="pCodeText" name="positionCode1" style="text-align:center" readonly>                                    
                                        </td>                                                                             
                                    </tr>                                                             
                                    <tr>                                    
                                        <th>직위명</th>                                                                      
                                        <td>
                                           	<input type="text" id="pNameText" name="positionName1" style="text-align:center" readonly>                                    
                                        </td>                                                                             
                                    </tr>  
                                    <tr><td colspan="2">--------------------------------------------------------------------------</td></tr>
                                    <tr>                                    
                                        <th>수정할 직위코드</th>                                                                      
                                        <td>
                                           	<input type="text" id="pCodeText1" name="positionCode2" style="text-align:center">                                    
                                        </td>                                                                            
                                    </tr>                                                             
                                    <tr>                                    
                                        <th>수정할 직위명</th>                                                                      
                                        <td>
                                           	<input type="text" id="pNameText1" name="positionName2" style="text-align:center">                                    
                                        </td>                                                                             
                                    </tr>                             
                                   
                                     
                                </table>
                            </div>
                            <br>
                            <div align="center">
                                <button type="button" class="btn btn-sm btn-warning" id="pUpdatebutton">수정</button>
                                <button type="submit" class="btn btn-sm btn-secondary" id="pDeletebutton" style="background-color:red; color:white">삭제</button>
                                <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">취소</button>
                            </div>
                            
                            <br>
                            
                       </form>
                    </div>
                    
                </div>
            </div>
        </div>
        
        <!-- ====================================================  Modal ================================================================ -->

        <!-- 부서등록 -->
        <div class="modal fade" id="departmentInsert" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">부서등록</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">                          
                         <form action="insert.dep" method="get">                                              
                            <div align="center">
                                <table>    
                                	<tr>                                    
                                        <th>부서코드</th>                                                                      
                                        <td>
                                           	<input type="text" name="departmentCode" style="text-align:center" required>                                    
                                        </td>                                                                             
                                    </tr>                                                             
                                    <tr>                                    
                                        <th>부서명</th>                                                                      
                                        <td>
                                           	<input type="text" name="departmentName" style="text-align:center" required>                                    
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

        <!-- 부서수정 및 삭제 -->
        <div class="modal fade" id="departmentUpdate" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">부서수정/삭제</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">                          
                         <form action="" method="get">                                              
                            <div align="center">
                                <table>    
                                	<tr>                                    
                                        <th>부서코드</th>                                                                      
                                        <td>
                                           	<input type="text" id="dCodeText" name="departmentCode1" style="text-align:center" readonly>                                    
                                        </td>                                                                             
                                    </tr>                                                             
                                    <tr>                                    
                                        <th>부서명</th>                                                                      
                                        <td>
                                           	<input type="text" id="dNameText" name="departmentName1" style="text-align:center" readonly>                                    
                                        </td>                                                                             
                                    </tr>  
                                    <tr><td colspan="2">--------------------------------------------------------------------------</td></tr>
                                    <tr>                                    
                                        <th>수정할 부서코드</th>                                                                      
                                        <td>
                                           	<input type="text" id="dCodeText1" name="departmentCode2" style="text-align:center" >                                    
                                        </td>                                                                            
                                    </tr>                                                             
                                    <tr>                                    
                                        <th>수정할 부서명</th>                                                                      
                                        <td>
                                           	<input type="text" id="dNameText1" name="departmentName2" style="text-align:center" >                                    
                                        </td>                                                                             
                                    </tr>                             
                                   
                                     
                                </table>
                            </div>
                            <br>
                            <div align="center">
                                <button type="submit" class="btn btn-sm btn-warning" id="dUpdatebutton">수정</button>
                                <button type="button" class="btn btn-sm btn-secondary" id="dDeletebutton" style="background-color:red; color:white">삭제</button>
                                <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">취소</button>
                            </div>
                            
                            <br>
                            
                       </form>
                    </div>
                    
                </div>
            </div>
        </div>
        
        
        
        
		<script>
			
			// 직위 테이블 클릭시 수정 및 삭제 모달창
			
			$(function(){
				$("#updatePosition>tbody>tr").click(function(){
					
					if($(this).attr('data-click-state') == 1) {

						$(this).attr('data-click-state', 0)

					} else {

						$(this).attr('data-click-state', 1)
					}
				
					$("#pCodeText").val(($(this).children(".no").text()));
					$("#pNameText").val(($(this).children(".name").text()));
					
				})
							
			})
			
			// 부서 테이블 클릭시 수정 및 삭제 모달창
			
			$(function(){
				$("#updateDepartment>tbody>tr").click(function(){
					
					if($(this).attr('data-click-state') == 1) {

						$(this).attr('data-click-state', 0)

					} else {

						$(this).attr('data-click-state', 1)
					}
				
					$("#dCodeText").val(($(this).children(".no").text()));
					$("#dNameText").val(($(this).children(".name").text()));
					
				})
							
			})
			
			
			$(function(){
				
				$("#pUpdatebutton").on('click', function(){
					
					var a = $("#pCodeText").val();
					var b = $("#pNameText").val();
					var c = $("#pCodeText1").val();
					var d = $("#pNameText1").val();
					
					location.href="update.pst?positionCode1=" + a + "&positionName1=" + b + "&positionCode2=" + c + "&positionName2=" + d
				})
				
			})
			
			
			$(function(){
				
				$("#pDeletebutton").on('click', function(){
					
					var a = $("#pCodeText").val();
					var b = $("#pNameText").val();
					var c = $("#pCodeText1").val();
					var d = $("#pNameText1").val();
					
					location.href="delete.pst?positionCode1=" + a + "&positionName1=" + b
				})
				
			})
			
			
			$(function(){
				
				$("#dUpdatebutton").on('click', function(){
					
					var a = $("#dCodeText").val();
					var b = $("#dNameText").val();
					var c = $("#dCodeText1").val();
					var d = $("#dNameText1").val();
					
					location.href="update.dep?departmentCode1=" + a + "&departmentName1=" + b + "&departmentCode2=" + c + "&departmentName2=" + d
				})
				
			})
			
			
			$(function(){
				
				$("#dDeletebutton").on('click', function(){
					
					var a = $("#dCodeText").val();
					var b = $("#dNameText").val();
					var c = $("#dCodeText1").val();
					var d = $("#dNameText1").val();
					
					location.href="delete.dep?departmentCode1=" + a + "&departmentName1=" + b
				})
				
			})
			
		</script>
        
	
</body>
</html>