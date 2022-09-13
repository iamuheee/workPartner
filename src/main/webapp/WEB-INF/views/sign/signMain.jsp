<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
        .material-symbols-outlined {
            font-variation-settings:
                'FILL' 0,
                'wght' 250,
                'GRAD' 0,
                'opsz' 30
        }

        .material-symbols-outlined .outFill {
            font-variation-settings:
                'FILL' 1,
                'wght' 250,
                'GRAD' 0,
                'opsz' 30
        }

        .outFill {
            color: white;
        }

        .bg-blue {
            background-color: #0442AF;
        }

        .bg-gray {
            background-color: #f1f1f1;
        }

        .nav-choice:hover {
            cursor: pointer;
            /*btn에 커서가면 커서모양이 손모양으로*/
            background-color: rgb(226, 224, 224);
            color: #0442AF;
        }

        .nav-choice {
            color: rgb(39, 38, 38);
        }

        .btn-primary {
            background-color: #0442AF;
            border-color: #0442AF;
        }

        .btn-size {
            margin-left: 8px;
            width: 80%;
        }

        .starColor {
            /* padding: 0; */
            /* font-size: 1.5em;      */
            color: rgba(250, 208, 0, 0.99);
        }

        .menu-side-head {
            margin-left: 10px;
            padding: 1.75rem 1rem 0.75rem;
            font-size: 0.75rem;
            font-weight: bold;
        }


        .badge-danger {
            color: #fff;
            background-color: #e74a3b;
        }

        .badge {
            display: inline-block;
            padding: 0.25em 0.4em;
            font-size: 75%;
            font-weight: 700;
            line-height: 1;
            text-align: center;
            white-space: nowrap;
            vertical-align: baseline;
            border-radius: 0.35rem;
            transition: color .15s ease-in-out, background-color .15s ease-in-out, border-color .15s ease-in-out, box-shadow .15s ease-in-out;
        }

        .alertFont {
            font-size: 13px;
            color: rgb(94, 94, 94);
        }

        .dropdown-list {
            padding: 0;
            border: none;
            overflow: hidden;
        }

        .dropdown-header {
            background-color: #0b60e0;
            border: 1px solid #0b60e0;
            padding-top: 0.75rem;
            padding-bottom: 0.75rem;
            color: white;
        }

        .dropdown-list-image {
            position: relative;
            height: 2.5rem;
            width: 2.5rem;
        }

        .icon-circle {
            height: 2.5rem;
            width: 2.5rem;
            border-radius: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .small,
        small {
            font-size: 80%;
            font-weight: 400;
        }

        .text-gray-500 {
            color: #b7b9cc !important;
        }

        .alertFontSize {
            font-size: 13px;
        }

        .align-items-center {
            align-items: center !important;
        }

        .d-flex {
            display: flex !important;
        }

        .dropdown-item {
            display: block;
            width: 100%;
            padding: 0.25rem 1.5rem;
            clear: both;
            font-weight: 400;
            color: #3a3b45;
            text-align: inherit;
            white-space: nowrap;
            background-color: transparent;
            border: 0;
        }

        .topbar .dropdown-list {
            width: 20rem !important;
        }

        .alertFontMiddle {
            font-size: 14px;
        }

        .menubarHeadBold {
            font-weight: 620;
        }

        /* ------------------------------------------------------------- */
        .col-xl-6{
            margin-top: 20px;
        }
        .endListBox {
            margin: 20px 20px 25px 20px
        }

        .endSignList {
            border-top: 1px solid #878787;
            border-bottom: 1px solid #878787;
            text-align: center;
            width: 100%;

        }

        .endSignList tr {
            border-top: 1px solid #8787874c;
            border-bottom: 1px solid #8787874c;
        }

        .endSignList th {
            background-color: #8787872c;
        }

        .endNum {
            width: 10%;
        }

        .endCreate {
            width: 30%
        }

        .endTitle {
            width: 60%;
        }

        #listSection {
            height: 50%;
            box-shadow: 0px 0px 4px #8787877d;
        }

        .card-header {
            background-color: white;
        }

        .col-md-6 {
            width: 20%;
            text-align: center;
        }

        .bg-primary,
        .bg-warning,
        .bg-success,
        .bg-danger {
            color: black !important;
            width: 70%;
            display: inline-block !important;
            height: 200px;
            border-radius: 25px;
            font-size: 25px;
            vertical-align: middle;
            box-shadow: 0px 0px 4px #878787;
        }

        .bg-primary {
            background-color: rgba(52, 152, 219, 0.2) !important;
            color: white;
        }

        .bg-warning {
            background-color: rgba(243, 156, 18, 0.2) !important;
        }

        .bg-success {
            background-color: rgba(46, 204, 113, 0.2) !important;
        }

        .bg-danger {
            background-color: rgba(255, 24, 0, 0.2) !important;
        }

        #totalBox {
            background-color: rgba(61, 96, 122, 0.2) !important;
        }

        #listSection a {
            height: 100%;
            vertical-align: middle;
            font-size: 60px;
            color: black !important;
            margin: auto;
            text-decoration: none;
        }

        #signColorBox {
            margin-top: 20px;
            margin-left: 15px;
            margin-right: 15px;
        }
        #detailListIcon{
            vertical-align: middle;
            float: right;
        }
        #detailListIcon:hover{
            cursor: pointer;
            background-color: #8787871c;
        }
        .card-footer{
            background: none;
            padding-top: 15px;
        }
        tr{
            font-size: 20px;
        }
        td{
            font-size: 18px;
        }
    </style>
</head>
<body>
<jsp:include page="../common/menubar.jsp"/>
<div id="layoutSidenav_content">
            <main style="margin:20px">
                <div class="container-fluid  px-4">
                    <div class="row" id="signSection">
                        <div class="searchBar" >
                            <select style="height: 30px; width:90px; text-align:center; border:none; box-shadow: 0px 0px 4px #878787;">
                                <option value="agree">결재완료</option>
                                <option value="re">반려됨</option>
                            </select>
                            <input type="text" style="width: 30%; height: 30px; box-shadow: 0px 0px 4px #878787; border:none;">
                            <button style="width:60px; height: 30px; padding:0; border: none; background: #87878740;box-shadow: 0px 0px 4px #878787;">검색</button>
                        </div>
                        <div class="col-xl-6">
                            <div class="card mb-4" style="height: 90%;box-shadow: 0px 0px 4px #8787877d;">
                                <div class="card-header">
                                    <i class="fas fa-chart-area me-1"></i>
                                    최근 작성된 기안서
                                    <span id="detailListIcon" class="material-icons" >
                                        navigate_next
                                    </span>
                                </div>
                                <div class="endListBox">
                                    <table class="endSignList">
                                        <tr>
                                            <th class="endNum">번호</th>
                                            <th class="endTitle">제목</th>
                                            <th class="endCreate">작성일</th>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td>여기는 제목이 나타나는 곳</td>
                                            <td>2022-09-01</td>
                                        </tr>

                                        <tr>
                                            <td>3</td>
                                            <td>여기는 제목이 나타나는 곳</td>
                                            <td>2022-09-01</td>
                                        </tr>

                                        <tr>
                                            <td>3</td>
                                            <td>여기는 제목이 나타나는 곳</td>
                                            <td>2022-09-01</td>
                                        </tr>

                                        <tr>
                                            <td>3</td>
                                            <td>여기는 제목이 나타나는 곳</td>
                                            <td>2022-09-01</td>
                                        </tr>

                                        <tr>
                                            <td>3</td>
                                            <td>여기는 제목이 나타나는 곳</td>
                                            <td>2022-09-01</td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-6">
                            <div class="card mb-4" style="height: 90%; box-shadow: 0px 0px 4px #8787877d;">
                                <div class="card-header">
                                    <i class="fas fa-chart-bar me-1"></i>
                                    결재된 보관함
                                    <span id="detailListIcon" class="material-icons" >
                                        navigate_next
                                    </span>
                                </div>
                                <div class="endListBox">
                                    <table class="endSignList">
                                        <tr>
                                            <th class="endNum">번호</th>
                                            <th class="endTitle">제목</th>
                                            <th class="endCreate">작성일</th>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td>여기는 제목이 나타나는 곳</td>
                                            <td>2022-09-01</td>
                                        </tr>

                                        <tr>
                                            <td>3</td>
                                            <td>여기는 제목이 나타나는 곳</td>
                                            <td>2022-09-01</td>
                                        </tr>

                                        <tr>
                                            <td>3</td>
                                            <td>여기는 제목이 나타나는 곳</td>
                                            <td>2022-09-01</td>
                                        </tr>

                                        <tr>
                                            <td>3</td>
                                            <td>여기는 제목이 나타나는 곳</td>
                                            <td>2022-09-01</td>
                                        </tr>

                                        <tr>
                                            <td>3</td>
                                            <td>여기는 제목이 나타나는 곳</td>
                                            <td>2022-09-01</td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="card mb-4" id="listSection">
                        <div class="card-header">
                            <i class="fas fa-table me-1"></i>
                            기안서 현황
                        </div>
                        <div class="row" id="signColorBox">
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-primary text-white mb-4">
                                    <div class="card-body">작성중</div>
                                    <div id="listblue"
                                        class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">22</a>
                                    </div>
                                </div>
                            </div>

                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body">진행중</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">13</a>
                                    </div>
                                </div>
                            </div>

                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-warning text-white mb-4">
                                    <div class="card-body">결재완료</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">2</a>
                                    </div>
                                </div>
                            </div>


                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-danger text-white mb-4">
                                    <div class="card-body">반려됨</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">0</a>
                                    </div>
                                </div>
                            </div>

                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-danger text-white mb-4" id="totalBox">
                                    <div class="card-body">기안전체</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">13</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    
                    <!-- 기안서 리스트 -->
                    
                </div>
            </main>
            <!-- 푸터에 div단는거 두 개 필요 인클루드 하면 밑에 두개 삭제 -->
            </div>
        </div>
</body>
</html>