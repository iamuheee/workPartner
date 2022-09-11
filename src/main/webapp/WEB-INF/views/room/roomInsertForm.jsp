<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#roomEnroll-outer {
        /* border:1px solid blue; */
        width:100%;
        height:100%;
        padding:10px;
        margin:auto;
        position:relative;
    }

    #roomEnroll {
        width:95%;
        height:600px;
        margin:auto;
    }

    #roomEnroll * {
        /* border:1px solid red; */
    }

    #roomEnroll th {
        font-size:16px;
    }

    #roomEnroll * {
        padding-top:7px;
        padding-bottom:7px;
    }
    #rmName {
        width:150px;
    }

    #rmName, #rmPerson {
        padding-left:10px;
    }
</style>
</head>
<body>

	<jsp:include page="../common/menubar.jsp" />
	
	<div id="roomEnroll-outer">
	    <!-- 상단 메뉴 제목 영역 -->
	    <div id="roomEnroll-header">
	        <h3>회의실 등록</h3>
	    </div>
	    <hr>
	    <!-- 사용자에게 입력받아야 하는 것 : 첨부파일, 제목, 수용인원, 회의 장비-->
	    <div id="enrollArea">
	        <form id="enroll-room" action="회의실등록요청받는url" method="post" enctype="multipart/form-data">
	            <table id="roomEnroll">
	                <tr>
	                    <th width="20%">회의실 이름</th>
	                    <td colspan="3">
	                        <input type="text" id="rmName" name="rmName" style="width:240px;height:40px;border:1px solid #b7b9cc"required>
	                    </td>
	                </tr>
	                <tr>
	                    <th>회의실 대표 이미지</th>
	                    <td colspan="3">
	                        <img id="titleImg" width="240" height="180" onclick="choosefile(1);">
	                    </td>
	                </tr>
	                <tr align="left">
	                    <th>회의실 상세 이미지</th>
	                    <td width="250"><img id="contentImg1" width="240" height="180" onclick="choosefile(2);"></td>
	                    <td width="250"><img id="contentImg2" width="240" height="180" onclick="choosefile(3);"></td>
	                    <td><img id="contentImg3" width="240" height="180" onclick="choosefile(4);"></td>
	                </tr>
	                <tr>
	                    <th>수용인원</th>
	                    <td colspan="3">
	                        <input type="number" id="rmPerson" name="rmPerson" min="1" style="width:60px;height:30px;border:1px solid #b7b9cc" required > 명
	                    </td>
	                </tr>
	                <tr>
	                    <th>회의장비</th>
	                    <td colspan="3">
	                        <input type="button" class="btn btn-secondary btn-sm" name="" value="화상회의 장비">
	                        <input type="button" class="btn btn-secondary btn-sm" name="" value="빔프로젝터">
	                        <input type="button" class="btn btn-secondary btn-sm" name="" value="TV">
	                        <input type="button" class="btn btn-secondary btn-sm" name="" value="PC/노트북">
	                        <input type="button" class="btn btn-secondary btn-sm" name="" value="컨퍼런스콜">
	                        <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#insertEquip">+ 장비 추가</button>
	                    </td>
	                </tr>
	                <tr>
	                    <th colspan="4" style="height:70px">
	                        <button type="submit" class="btn btn-primary" style="margin-right:5px;">저장</button>
	                        <button type="button" class="btn btn-secondary" 
	                        		onclick="location.href='javascript:history.back();'">취소</button>
	                    </th>
	                </tr>
	            </table>
	        </form>
	    </div>
	
	    <!-- 장비 추가 버튼 클릭 시 뜨는 모달 ==> TB_EQUIP에 INSERT -->
	    <div class="modal fade" id="insertEquip">
	        <div class="modal-dialog modal-sm">
	            <div class="modal-content">
	                <!-- Modal Header -->
	                <div class="modal-header">
	                    <h4 class="modal-title">장비 추가</h4>
	                    <button type="button" class="close" data-dismiss="modal">&times;</button> 
	                </div>
	
	                <form action="장비추가요청받아주는url" method="post">
	                    <!-- Modal Body -->
	                    <div class="modal-body">
	                        <table id="empInfo">
	                            <tr>
	                                <th width="150px">장비명</th>
	                                <td width="300px">
	                                    <input type="text" id="eqName" name="eqName">
	                                </td>
	                            </tr>
	                        </table>
	                    </div>
	                    <!-- Modal footer -->
	                    <div class="modal-footer">
	                        <button type="submit" class="btn btn-primary" style="margin-right:5px;">추가</button>
	                        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	                    </div>
	                </form>
	            </div>
	        </div>
	    </div>
	</div>

</body>
</html>