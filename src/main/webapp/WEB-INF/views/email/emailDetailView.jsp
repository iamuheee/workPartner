<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .ntOuter{
        margin: auto;
        padding: 20px;         
        align-items: center;
        box-shadow :  2px 3px 5px 2px rgb(212, 211, 211);;
        border-radius: 10px;
        width: 80%; 
        height: 95%;
        background-color:  rgb(248, 248, 248);   
    }

    /* 그리드영역 */
    .ntContainer{
         margin: 30px;
         display: grid;
         grid-gap: 15px;
         height: 90vh;               
         grid-template-rows:  40px 0.3fr 0.65fr;
         grid-template-areas: 'menu1'
                              'menu2'                              
                              'main';    
        color: rgb(43, 42, 42);  
        font-size: 13px;
     }
     .ntContainer div{
         /* border: 1px solid  black;         */
     } 

    .ntMenu1{ grid-area: menu1; }

    .ntMenu2{ grid-area: menu2; }   
               
    .ntMain{
        grid-area: main;
        background-color: white;
        padding: 10px;
    }

   
    .ntContainer select{        
        border: 1px solid #ced4da;
        border-radius: 0.10rem;      
        /* margin: 5px;          */
        height: 30px;
               
     }
     
     .ntContainer input{        
        border: 1px solid #ced4da;
        border-radius: 0.10rem;     
        height: 30px;
        
     }  
       
    .borderStyle{
        border: 1px solid red;
        border-radius: 3px;
        background-color: white;
        color: red;
        font-size: 12px;
        padding: 2px;
    }

    .borderFileStyle{
        background-color:  white;   
        /* border: 1px solid #ced4da; */
        height: 80px;
        width: 100%;
        margin-top: 5px;
        /* margin-left: 40px; */
        padding: 5px;
    }
 
    .emailTable *{margin: 5px;}
    .emailTable{width:100%;}

    .aStyle{text-decoration: none; color:  rgb(43, 42, 42);}
  
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"></jsp:include>

    <div style="height: 20px;"></div>

    <div class="ntOuter">

        <div class="ntContainer">
           
            <div class="ntMenu1">            
               <a class="btn btn-sm btn-primary" href="reply.em">답장하기</a>
               <button class="btn btn-sm btn-secondary" onclick="history.back()">이전</button>

               <!-- 기밀인 경우 전달하기 버튼 비활성화 -->
               <a class="btn btn-sm btn-warning">전달하기</a>
               <hr>
            </div>
                
            <!-- 정보 -->
            <div class="ntMenu2">

               <span class="borderStyle">기밀</span> 로고디자인 <span style="color: red;">!</span> 
               <br><br>

               <table class="emailTable">                                                 
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
                    <a href="" download="" class="aStyle">파일명.jpg</a> <br>
                    <a href="" download="" class="aStyle">파일명.jpg</a> <br>                                
                </div>
                
                <br>
            </div>
            
            <!-- 내용자리 -->
            <div class="ntMain">
               
                이번 10주년 기념 굿즈 제작에 들어갈 로고 디자인입니다.
                수정필요한 부분 체크했으니 
                
                이번주 수요일까지 수정안 보내주시면 감사하겠습니다.
               
                <!-- 서명부분 -->
                <div style="height: 80px;"></div>
                <hr width="60%">
                <table style="font-size: 11px; color: #525252;">
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
                </table>
                    

            </div>
    
         
    
        </div>

        
    </div>

    
</body>
</html>