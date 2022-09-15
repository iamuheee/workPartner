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

    <div class="emOuter1">

        <div class="EmContainer1">
           
            <div class="emMenu1">            
               <a class="btn btn-sm btn-primary" href="reply.ma">답장하기</a>
               <button class="btn btn-sm btn-secondary" onclick="history.back()">이전</button>

               <!-- 기밀인 경우 전달하기 버튼 비활성화 -->
               <a class="btn btn-sm btn-warning" href="forward.ma">전달하기</a>
               <hr>
            </div>
                
            <!-- 정보 -->
            <div class="emMenu2">

               <span class="borderStyle">기밀</span> 로고디자인 <span style="color: red;">!</span> 
               <br><br>

               <table class="emailDetailTable">                                                 
                  <tr>
                        <th style="font-size: 11px;">보낸사람</th>
                        <td>현예술  &nbsp; <span name="emailSender">&lt; jojik2562@jojik.com &gt;</span></td>                        
                        <td>2022.08.21 14:30</td>
                    </tr>

                  
                    <tr>
                        <th style="font-size: 11px;">받는사람</th>
                        <td colspan="2" name="emailRecipient">jojik1045@jojik.com, jojik1045@jojik.com, tjdrhdgofk49@naver.com</td>
                    </tr>
                    <tr>
                        <th style="font-size: 11px;">참조</th>
                        <td colspan="2" name="">jojik1045@jojik.com, jojik1045@jojik.com</td>
                    </tr>                                       
               </table>
                   
               <hr>

               <b>첨부</b> 
               <div class="borderFileStyle">                                 
                    <a href="" download="" class="aStyle1">파일명.jpg</a> <br>
                    <a href="" download="" class="aStyle1">파일명.jpg</a> <br>                                
                </div>
                
                <br>
            </div>
            
            <!-- 내용자리 -->
            <div class="emMain">
               
                이번 10주년 기념 굿즈 제작에 들어갈 로고 디자인입니다.
                수정필요한 부분 체크했으니 
                
                이번주 수요일까지 수정안 보내주시면 감사하겠습니다.
               
                <!-- 서명부분 -->
                <div style="height: 80px;"></div>
                <hr width="60%">
                <!-- <table style="font-size: 11px; color: #525252;">
                    <tr>
                        <th>이름</th>
                        <td>한예술</td>
                        <td colspan="2"></td>
                    </tr>
                    <tr>
                        <th>부서</th>
                        <td>인사부</td>                    
                        <th>직급</th>
                        <td>사원</td>
                    </tr>
                    <tr>
                        <th>회사주소</th>
                        <td colspan="3">서울 금천구 가산디지털2로 115</td>
                    </tr>
                    <tr>
                        <th>사내번호</th>
                        <td>050-123-456</td>                   
                        <th>Tel</th>
                        <td>010-1234-5678</td>
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td colspan="3">jojik12452@jojik.com</td>
                    </tr>
                </table> -->

                <div style="font-size: 11px; color:#525252;">
                    <b>이름 </b>한예술 <br>
                    <b>부서 </b>인사부 <b>직급</b> 사원 <br>
                    <b>회사주소 </b> 서울 금천구 가산디지털2로 <br>
                    <b>사내번호 </b>050-123-456 <br>
                    <b>Tel </b>010-1234-5678 <br>
                    <b>Email </b> jodjik456@adf.com
                </div>
                    

            </div>
    
         
    
        </div>

        
    </div>

    
</body>
</html>