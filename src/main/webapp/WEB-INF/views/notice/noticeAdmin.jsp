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
       
       <!-- 이건 제가 수행 해당 기능에서 해야 할 것
            1. 전체 추가관리자 리스트 ajax 
            2. x버튼 누리면 해당 행의 직원번호가 전달 =>  ajax로 data넘겨서 일반직원으로 업데이트 처리 후 리스트를 조회하는 ajax를 다시 호출
            3. 버튼 누르면 해당 테이블에 추가가 되고 =>저장 누르면 최종적으로 추가관리자가 저장됨
        -->
        
        
        <!-- 
            window.open(첫번째, 두번째, 세번째);
            첫번째 : 새 창에서 열고자 하는 url주소
            두번째 : 창 이름(target), 창 이름이 같은게 이미 열려있을 경우 새 창이 열리지 않고 기존의 창이 새로고침됨
            세번째 : 새창의 너비, 높이, 주소창의 여부, 툴바여부, 스크롤바 여부 등등 새로운 창의 특성(브라우저마다 적용범위 다름)
            
            *창의 특성
                width : 창의 너비(px)
                height : 창의 높이(px)
        -->
       <script>
             
            var newWindow;
            function openAddressWindow(){
                newWindow = window.open("${pageContext.request.contextPath}/addressAdmin.ad", "addressWindow", "height=700, width=1100");
            }
			
            /* 자식창으로부터 전달된 정보  */
            function sendMeData(data){                   
                //console.log(data);
                $("#adminList").append(data);           
               
            }

       </script>

        
        
    </div>

    

</body>
</html>