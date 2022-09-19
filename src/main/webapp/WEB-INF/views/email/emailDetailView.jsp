<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/emailCss/email1.css">

</head>
<body>
	<jsp:include page="../common/menubar.jsp"></jsp:include>	

    <div style="height: 20px;"></div>

    <div class="emOuter1" style="height:155%">

        <div class="EmContainer1">
           
            <div class="emMenu1">            
               <a class="btn btn-sm btn-primary" href="reply.ma?mailNo=${m.mailNo }">답장하기</a>
               <a class="btn btn-sm btn-secondary" href="totalList.ma">이전</a>

               <!-- 기밀인 경우 전달하기 버튼 비활성화 -->
                <c:if test="${ m.mailSecurity ne 'S' }">
	               <a class="btn btn-sm btn-warning" href="forward.ma?mailNo=${m.mailNo }">전달하기</a>
               </c:if>
               <hr>
            </div>
                
            <!-- 정보 -->
            <div class="emMenu2">

               <c:if test="${ m.mailSecurity eq 'S' }">
               		<span class="borderStyle">기밀</span>
               </c:if>
                ${ m.mailTitle } 
                <c:if test="${ m.mailImportant eq 'I' }">
	                <span style="color: red;">!</span> 
                </c:if>
               <br><br>

               <table class="emailDetailTable">                                                 
                  <tr>
                        <th style="font-size: 11px;">보낸사람</th>
                        <td>${ m.mailSenderName }  &nbsp; <span name="emailSender">&lt; ${m.mailSender}  &gt;</span></td>                        
                        <td>${ m.mailCreateDate }</td>
                    </tr>

                  
                    <tr>
                        <th style="font-size: 11px;">받는사람</th>
                        <td colspan="2" name="emailRecipient">${ m.mailRecipient }</td>
                    </tr>
                    <tr>
                        <th style="font-size: 11px;">참조</th>
                        <td colspan="2" name="">${ m.mailCC }</td>
                    </tr>                                       
               </table>
                   
               <hr>

               <b>첨부</b> 
               <div class="borderFileStyle">       
                    <c:choose>
                    	<c:when test="${empty list }">
                    		첨부파일이 없습니다.
                    	</c:when>
                    	<c:otherwise>
                    		<c:forEach var="f" items="${list}">
                    			<a href="${ f.filePath }" download="${ f.fileOriginName }" class="aStyle1">${ f.fileOriginName }</a> <br>
                    		</c:forEach>
                    	</c:otherwise>
                    </c:choose>                    
                                                 
                </div>
                
                <br>
            </div>
            
            <!-- 내용자리 -->
            <div class="emMain">
                             
	                ${ m.mailContent }
            
            </div>
    
         
    
        </div>

        
    </div>

    
</body>
</html>