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
</style>
</head>
<body>
	
	<jsp:include page="../common/menubar.jsp" />

	<div style="height:2%"></div>
	
	<div id="outer" style="width:96%">
		<!-- 상단 메뉴 제목 영역 -->
		<div id="header">
		    <h3>공휴일 관리</h3>
		</div>
		
		<div style="width:80%"><hr></div>
		
		<div style="width:82%">
			<!-- 테이블 -->
		    <div class="div1" style="width:44%; height:600px; float: left;">
		  
		  		<br>
		  		<div style="height: 90%; width:90%">
					<button data-toggle="modal" data-target="#positionInsert" class="btn btn-sm btn-primary" style="width:50px; height:30px; font-size:15px; float:right" >등록</button>

					<br><br>

					<table class="table table-hover" style="text-align:center">
						<thead>
							<tr>                            
								<th>공휴일코드</th>
								<th>공휴일명</th>
							</tr>
						</thead>
						<tbody>
					  	<c:choose>
						  	<c:when test="${ empty list2 }">
						  		<td colspan="2">조회된 직위가 없습니다.</td>
							</c:when>
							<c:otherwise>
								<c:forEach var="p" items="${list2}">
								  <tr>
									  <td>${p.posCd}</td>
								  	  <td>${p.posName}</td>
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

        <!-- 서명등록 -->
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
                         <form action="" method="get">                                              
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
        
	
</body>
</html>