<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
    #roomList-outer {
        /* border:1px solid blue; */
        width:100%;
        height:100%;
        padding:10px;
        margin:auto;
        position:relative;
    }

    #roomEnroll {
        width:95%;
        margin:auto;
        text-align: right;
    }

    #roomListArea {
        width:100%;
        height:100%;
        margin:auto;
        display:flex;
        flex-wrap:wrap;
        justify-content:space-between;
        align-content: center;
    }

    .roomCard{
        width:260px;
        height:380px;
        border:1px solid #f1f1f1;
        border-bottom-right-radius: 8px;
        border-bottom-left-radius: 8px;
        margin:10px;
        box-shadow: rgba(0, 0, 0, 0.1) 0px 20px 25px -5px, rgba(0, 0, 0, 0.04) 0px 10px 10px -5px;
    }
    
    .roomCard:hover {
        transform: scale(1.05);
        transition: all 0.3s;
    }

    .roomThumbnail {
        border:1px solid #f1f1f1;
        width:260px;
        height:140px;
    }

    .roomDetail { 
        font-size:16px;
        /* border:1px solid red; */
        height:150px;
        margin:auto;
        margin-top:20px;
        width:90%;
    }
    
    .roomUpdate {
        width:90%;
        /* border:1px solid red; */
        margin:auto;
        margin-top:20px;
        text-align:right;
    }

</style>

</head>
<body>

	<jsp:include page="../common/menubar.jsp" />

	<div id="roomList-outer">
	    <!-- 상단 메뉴 제목 영역 -->
	    <div id="roomList-header">
	        <h3>회의실 관리</h3>
	    </div>
	    <hr>
	
	    <!-- 회의실 등록 영역 -->
	    <div id="roomEnroll">
	        <button class="btn btn-primary" onclick="location.href='insertForm.rm';" type=button><i class="fa-solid fa-plus"></i> 회의실 등록</button>
	    </div>
	
	    <!-- 회의실 목록 영역 -->
	    <div id="roomListArea">
	        <div class="roomCard">                                
	            <img src="" class="roomThumbnail">
	            <table class="roomDetail">
	                <tr>
	                    <th colspan="2"><h5 style="color:#0F52FC;">Room A</h5></th>
	                </tr>
	                <tr>
	                    <th width="75px">수용 인원</th>
	                    <td>5명</td>
	                </tr>
	                <tr>
	                    <th height="auto">장비</th>
	                    <td style="font-size:12px;">TV, 컨퍼런스콜</td>
	                </tr>
	                <tr>
	                    <th>상태</th>
	                    <td>이용 가능</td>
	                </tr>
	            </table>
	            <div class="roomUpdate">
	                <a href="updateForm.rm">수정</a>&nbsp;&nbsp;|&nbsp;&nbsp;
	                <!-- 삭제 클릭 시 컨펌창 뜨게 하기 -->
	                <a href="회의실삭제url" onclick="return userConfirm();">삭제</a>
	            </div>
	        </div>
	
	        <script>
	            function userConfirm() {
	                if(confirm('회의실 삭제 시, 모든 예약 기록이 삭제되며 복구할 수 없습니다.\n회의실을 삭제하시겠습니까?')) {
	                    return true;
	                }else {
	                    return false;
	                }
	            }
	        </script>
	        
	        <div class="roomCard">                                
	            <img src="" class="roomThumbnail">
	            <table class="roomDetail">
	                <tr>
	                    <th colspan="2"><h5 style="color:#FEB50D;">Room B</h5></th>
	                </tr>
	                <tr>
	                    <th width="80px">수용 인원</th>
	                    <td>5명</td>
	                </tr>
	                <tr>
	                    <th>장비</th>
	                    <td style="font-size:12px;">TV, 컨퍼런스콜</td>
	                </tr>
	                <tr>
	                    <th>상태</th>
	                    <td>이용 가능</td>
	                </tr>
	            </table>
	            <div class="roomUpdate">
	                <a href="updateForm.rm">수정</a>&nbsp;&nbsp;|&nbsp;&nbsp;
	                <a href="회의실삭제">삭제</a>
	            </div>
	        </div>
	
	        <div class="roomCard">                                
	            <img src="" class="roomThumbnail">
	            <table class="roomDetail">
	                <tr>
	                    <th colspan="2"><h5 style="color:#1A7742;">Room C</h5></th>
	                </tr>
	                <tr>
	                    <th width="80px">수용 인원</th>
	                    <td>5명</td>
	                </tr>
	                <tr>
	                    <th>장비</th>
	                    <td style="font-size:12px;">TV, 컨퍼런스콜</td>
	                </tr>
	                <tr>
	                    <th>상태</th>
	                    <td>이용 가능</td>
	                </tr>
	            </table>
	            <div class="roomUpdate">
	                <a href="회의실상태변경페이지요청url">수정</a>&nbsp;&nbsp;|&nbsp;&nbsp;
	                <a href="회의실삭제">삭제</a>
	            </div>
	        </div>
	
	        <div class="roomCard">                                
	            <img src="" class="roomThumbnail">
	            <table class="roomDetail">
	                <tr>
	                    <th colspan="2"><h5 style="color:#D11E35;">Room D</h5></th>
	                </tr>
	                <tr>
	                    <th width="80px">수용 인원</th>
	                    <td>5명</td>
	                </tr>
	                <tr>
	                    <th>장비</th>
	                    <td style="font-size:12px;">TV, 컨퍼런스콜</td>
	                </tr>
	                <tr>
	                    <th>상태</th>
	                    <td>이용 가능</td>
	                </tr>
	            </table>
	            <div class="roomUpdate">
	                <a href="회의실상태변경요청url">수정</a>&nbsp;&nbsp;|&nbsp;&nbsp;
	                <a href="회의실삭제">삭제</a>
	            </div>
	        </div>
	       
	        <!-- 회의실 추가 등록 시 보여질 화면 구성 -->
	        
	        <div class="roomCard">                                
	            <img src="" class="roomThumbnail">
	            <table class="roomDetail">
	                <tr>
	                    <th colspan="2"><h5 style="color:#8840A7;">Room E</h5></th>
	                </tr>
	                <tr>
	                    <th width="80px">수용 인원</th>
	                    <td>5명</td>
	                </tr>
	                <tr>
	                    <th>장비</th>
	                    <td style="font-size:12px;">TV, 컨퍼런스콜</td>
	                </tr>
	                <tr>
	                    <th>상태</th>
	                    <td>이용 가능</td>
	                </tr>
	            </table>
	            <div class="roomUpdate">
	                <a href="회의실상태변경요청url">수정</a>&nbsp;&nbsp;|&nbsp;&nbsp;
	                <a href="회의실삭제">삭제</a>
	            </div>
	        </div>
	        
	    </div>
	</div>

</body>
</html>