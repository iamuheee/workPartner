<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
     <meta charset="utf-8" />
     <meta http-equiv="X-UA-Compatible" content="IE=edge" />
     <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
     <meta name="description" content="" />
     <meta name="author" content="" />
     <title>WorkPartner!</title>
     <link href="css/styles.css" rel="stylesheet" />
     <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>

     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
     <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
     <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

     <style>
         .filter{
             font-size: small;
             color: gray;
         }
         th,td{
             text-align: center;
         }
         .btn{
            height:25px; line-height: 15px;
         }
     </style>
 
</head>
<body class="sb-nav-fixed">
   	<jsp:include page="../common/menubar.jsp" />
    
    <div id="content">
        <main>
            <div class="container-fluid px-4">
                <h2 class="mt-4">개인 업무 <span style="font-size:18px;color:gray;">(42)</span></h2><br>
                
                <form action="" align="right" class="filter">
                    <input type="checkbox" name="exceptDone" id="exceptDone" class=".form-check-inline">
                    <label for="exceptDone">완료 업무 제외</label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    
                    <span>우선순위별 조회</span>
                    <select name="filter" class="filter">
                        <option>전체보기</option>
                        <option value="">긴급</option>
                        <option value="">중요</option>
                        <option value="">지연</option>
                        <option value="">진행</option>
                    </select>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    
                    <input type="text" name="keyword" id="search" class="mb-3" style="border:1px solid lightgray;"placeholder="업무명으로 검색">
                    <button class="btn btn-sm btn-secondary" style="margin-bottom:3px;">검색</button>
                </form>
                
                <div class="filter">
                    <button class="btn btn-sm filter">전체 업무</button> |
                    <button class="btn btn-sm filter">내 등록 업무</button> |
                    <button class="btn btn-sm filter">내 담당 업무</button>
                </div>

                <table class="table">
                    <thead>
                        <tr>
                            <th width="10%">업무번호</th>
                            <th width="30%">업무명</th>
                            <th width="20%">담당자</th>
                            <th width="5%">우선순위</th>
                            <th width="5%">진행상태</th>
                            <th width="10%">시작일</th>
                            <th width="10%">마감일</th>
                            <th width="10%">등록일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>53</td>
                            <td>아이즈원 아이브 장기하와 얼굴들 국민의 힘 프로듀스101 선발 프로젝트</td>
                            <td>장원영, 장기하, 장제원</td>
                            <th><a class="btn btn-sm btn-warning">중요</a></th>
                            <th><a class="btn btn-sm btn-success">진행</a></th>
                            <td>2022-08-02</td>
                            <td>2022-09-02</td>
                            <td>1999-01-01</td>
                        </tr>
                    </tbody>
                </table>

                <div class="paging" align="center">
                    페이징바 들어가는 영역
                </div>

            </div>
        </main>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" cossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
    <script src="js/datatables-simple-demo.js"></script>
</body>
</html>