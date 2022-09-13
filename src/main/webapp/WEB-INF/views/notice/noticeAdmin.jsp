<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
        width: 50%;       
    }
    table{margin: 5px;}       
    .borderStyle{
        border: 1px solid #aaacaf;
        border-radius: 0.20rem;
    }
</style>
</head>
<body>
    <jsp:include page="../common/menubar.jsp"/>

    <div class="ntOuter">
        
        <div align="center">
            <br>
        <h5><b> 현재 관리자 설정</b></h5>

        <hr style="width: 25%;">
        <br><br>
        </div>
        
        

        <b>기본관리자 : </b> 인사부

        <div style="height: 40px;"></div> 

        <b>추가관리자 </b> 
        <button type="button" class="material-symbols-outlined btn btn-sm btn-secondary" onclick="openAddressWindow();">
            lan
        </button>
        <br><br>

        <!--   
            Y인 애들만 조회하기
            ajax로 계속 조회해야함
        -->
       <form action="">
            <div class="borderStyle" style="min-height: 200px;">
                <table id="adminList">
                    
                </table>
            </div>


        
             <br>


            <div align="center">      
                <button type="submit" class="btn btn-sm btn-primary">저장</button>      
                <button type="button" class="btn btn-sm btn-secondary" onclick="history.back();">이전</button>           


                <div id="result"></div>
            </div>

           
       </form>
       
       <!-- 
            1. 전체 추가관리자 리스트 ajax 
            2. x버튼 누리면 해당 행의 직원번호가 전달 =>  ajax로 data넘겨서 일반직원으로 업데이트 처리 후 리스트를 조회하는 ajax를 다시 호출
            3. 버튼 누르면 해당 테이블에 추가가 되고 =>저장 누르면 최종적으로 추가관리자가 저장됨
        -->

       <script>
             
            var newWindow;
            function openAddressWindow(){
                newWindow = window.open("http://localhost:8888/spring/adressAdmin.nt", "addressWindow", "height=700, width=1000");
            }

            function sendMeData(data){                   
                console.log(data);
                $("#adminList").append(data);           
               
            }

       </script>

        
        
    </div>

    

</body>
</html>