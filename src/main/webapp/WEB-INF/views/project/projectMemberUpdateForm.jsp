<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Login - SB Admin</title>
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <script src="https://use.fontawesome.com/95b5cbecad.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

        <style>
            .title{
                font-size: small;
                font-weight: bold;
                color:gray;
            }
            .pmenu-item{
                float:left;
                list-style: none;
                padding-left: 0px;
                margin-left:30px;
                padding-bottom: 15px;
                font-weight: bold;
            }
            .inner-area{
                padding:100px;
                padding-top:10px;
            }
            a{
                text-decoration: none;
                color:black;
            }
            .filter{
                font-size: small;
                color: gray;
            }
            .btn-imp{
                height:18px;
                line-height: 8px;
                margin-bottom:3px;
                background-color: lightgray;
                font-size: 12px;
                
            }
        </style>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    </head>
    <body>
    	
		<jsp:include page="../common/menubar.jsp" />
    
        <br><br><br>
        <div class="container">
            <div class="title-area">
                <h1 style="font-weight:bolder;">프로젝트430(프로젝트명) 관리</h1>
                <hr>
            </div>
            <div class="project-menubar">
                <ul class="group-pmenu" style="color:black;">
                    <li class="pmenu-item"><a href="">프로젝트 관리</a></li>
                    <li class="pmenu-item"><a href="">멤버 관리</a></li>
                </ul>
                <hr style="clear:both;">
            </div>

            <div class="filter-area" style="padding-left:10px;">
                <a href="" class="filter">선택 멤버에게 메일 발송</a>
                
                <span class="filter" style="margin-left:20px;">빠른 조회</span>
                <select name="" class="filter">
                    <option value="" selected>전체</option>
                    <option value="">팀장</option>
                    <option value="">관리자</option>
                    <option value="">일반 멤버</option>
                </select>

                <div class="search-area" style="float:right;">
                    <input type="text" name="" id="" placeholder="멤버 이름으로 검색" class="filter">
                    <button class="btn btn-sm btn-secondary" style="margin-bottom:3px; height:25px; line-height: 10px;">검색</button>
                </div>
            </div>
            <br>
            <table class="table" >
                <thead>
                    <tr>
                        <th width="5%;"><input type="checkbox" name="" id=""></th>
                        <th width="10%;">역할</th>
                        <th width="10%;">이름</th>
                        <th width="10%;">사번</th>
                        <th width="15%;">부서</th>
                        <th width="25%;">이메일</th>
                        <th width="20%;">연락처</th>
                        <th width="5%;">수정</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><input type="checkbox" name="" id=""></td>
                        <td>관리자</td>
                        <td>노희영</td>
                        <td>EMP21</td>
                        <td>혜진비서부</td>
                        <td>nonoheeyoug@naver.com</td>
                        <td>$320,800</td>
                        <td><button class="btn btn-sm btn-modal" data-bs-toggle="modal" data-bs-target="#exampleModal">수정</button></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="" id=""></td>
                        <td>관리자</td>
                        <td>노희영</td>
                        <td>EMP21</td>
                        <td>혜진비서부</td>
                        <td>nonoheeyoug@naver.com</td>
                        <td>$320,800</td>
                        <td><button class="btn btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal">수정</button></td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">멤버 수정</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <span class="title">이름</span><br>
                        <span>민진손</span>
                        <br><br>
                        <span class="title">역할</span><br>
                        <!-- 현재 해당 사원의 역할에 따라 selected 속성 주기 -->
                        <select name="" id="" class="filter" style="color:black;">
                            <option value="2">관리자</option>
                            <option value="3">일반 멤버</option>
                        </select>
                        <button class="btn btn-sm btn-imp" onclick="updateRole($('input[name=memRole]').val())">수정</button>
                        <br><br>
                        <span class="title">멤버 삭제</span><br>
                        <span>삭제하면 돌이킬 수 없습니다.</span>
                        <button class="btn btn-sm btn-imp" onclick="deleteMem();">삭제</button>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-success">확인</button>
                    </div>
                </div>
            </div>
        </div>

        <script>
            // 해당 멤버의 역할에 따라 selected 속성 부여하는 함수
            $(function(){

            })

            function updateRole(role){
                $.ajax({
                    url:"",
                    data:{
                        memRole:role,
                        projNo:"현재프로젝트번호",
                        empNo:"해당멤버사번"
                    }
                })
            }

            function deleteMem(){
                $.ajax({
                    url:"",
                    data:{
                        projNo:"현재프로젝트번호",
                        empNo:"해당멤버사번"
                    }
                })
            }
        </script>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
