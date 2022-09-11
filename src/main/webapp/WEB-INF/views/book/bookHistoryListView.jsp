<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- datatable 적용 문제 해결해야 함 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.12.1/b-2.2.3/r-2.3.0/datatables.min.css"/>
<script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.12.1/b-2.2.3/r-2.3.0/datatables.min.js"></script>

<script>
    $(document).ready( function () {
        $('#historyTable').DataTable( {
        } );
    } );
</script> 
        
<style>
	#bookHistory-outer {
        /* border:1px solid blue; */
        width:100%;
        height:100vh;
        padding:10px;
        margin:auto;
        position:relative;
    }

    #chooseDate {
        display:flex;
        justify-content: center;
        align-items: center;
        width:100%;
    
    }

    #chooseDate a {
        color:#0442AF;
        padding-top:8px;
        margin:0px;
        /* font-size:20px; */
    }

    #chooseDate *{
        /* border:1px solid red; */
        font-size: 30px;
        margin:5px;
    }

    #bookHistory {
        width:100%;
        font-size:16px;
    }

    #bookDate {
        font-size:14px;
    }


</style>
</head>
<body>

	<jsp:include page="../common/menubar.jsp" />
	
	<div id="bookHistory-outer">
		<!-- 상단 메뉴 제목 영역 -->
		<div id="bookHistory-header">
		    <h3>예약 이력 조회</h3>
		</div>
		<hr>
		
		<!-- 예약 이력 목록 -->
		<div id="bookHistoryArea">
		    <!-- 날짜 선택 영역 -->
		    <!-- 캘린더 아이콘 눌러서 특정 날짜 선택했을 때 그 날짜의 회의실 예약 내역들이 조회되도록 해야 함 -->
		    <div id="chooseDate">
		        <a href="이전날짜"><i class="fas fa-chevron-left" style="font-size:22px;"></i></a>
		        <span id="current_date"></span>
		        <span class="material-symbols-outlined">calendar_month</span>
		        <a href="다음날짜"><i class="fas fa-chevron-right" style="font-size:22px;"></i></a>
		    </div>
		
		    <script>
		        date = new Date();
		        year = date.getFullYear();
		        month = date.getMonth() + 1;
		        day = date.getDate();
		        document.getElementById("current_date").innerHTML = year + " / " + month + " / " + day;
		    </script>
		    
		    <div id="historyArea">
		        <table id="historyTable" class="table table-hover display">
		            <thead>
		                <tr>
		                    <th scope="col">No.</th>
		                    <th scope="col">회의실</th>
		                    <th scope="col">회의명</th>
		                    <th scope="col">예약자</th>
		                    <th scope="col">예약일정</th>
		                </tr>
		            </thead>
		            <tbody>
		                <tr>
		                    <td>5</td>
		                    <td>Room A</td>
		                    <td>동해물과 백두산이 마르고 닳도록</td>
		                    <td>김미미</td>
		                    <td id="bookDate">YYYY-MM-DD HH:00 ~ YYYY:MM:DD HH:00</td>
		               </tr>
		
		                <tr>
		                    <td>4</td>
		                    <td>Room B</td>
		                    <td>하느님이 보우하사 우리나라 만세</td>
		                    <td>박미미</td>
		                    <td id="bookDate">YYYY-MM-DD HH:00 ~ YYYY:MM:DD HH:00</td>
		                </tr>
		
		                <tr>
		                    <td>3</td>
		                    <td>Room C</td>
		                    <td>무궁화 삼천리 화려강산 대한사람 대한으로</td>
		                    <td>이미미</td>
		                    <td id="bookDate">YYYY-MM-DD HH:00 ~ YYYY:MM:DD HH:00</td>
		                </tr>
		
		                <tr>
		                    <td>2</td>
		                    <td>Room D</td>
		                    <td>길이 보전하세</td>
		                    <td>송미미</td>
		                    <td id="bookDate">YYYY-MM-DD HH:00 ~ YYYY:MM:DD HH:00</td>
		                </tr>
		
		                <tr>
		                    <td>1</td>
		                    <td>Room A</td>
		                    <td>남산 위의 저 소나무 철갑을 두른 듯 바람서리 불변함은 우리 기상일세</td>
		                    <td>강미미</td>
		                    <td id="bookDate">YYYY-MM-DD HH:00 ~ YYYY:MM:DD HH:00</td>
		                </tr>
		            </tbody>
		        </table>
			</div>
	</div>
		
</body>
</html>