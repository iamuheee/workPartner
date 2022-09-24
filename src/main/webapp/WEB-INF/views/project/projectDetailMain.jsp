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
        <title>WorkPartner!</title>
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <script src="https://use.fontawesome.com/95b5cbecad.js"></script>
		
        <style>
            table a{
                text-decoration: none;
                color:black;
                font-size: small;
            }
            .title{
                font-size: larger;
                font-weight: bolder;
            }
            .inner-area{
                padding:10px;
            }
            .left{
                width:40%;
                height:150px;
                float: left;
            }
            .right{
                float:right;
                width:59%;
                height:150px;
            }
            .pmenu-item{
                float:left;
                list-style: none;
                padding-left: 0px;
                margin-left:30px;
                padding-bottom: 15px;
                font-weight: bold;
            }
            .content>p{
                padding:20px;
                white-space:pre-line;
            }
            .btn-area button{
                width:50px;
                height:20px;
                font-size: 10px;
                line-height: 10px;
                background-color: lightgray;
            }
            .card-comment{
                width:100%;
                background-color: lightgray;
                border-bottom-left-radius: 5px;
                border-bottom-right-radius: 5px;
            }
            ul{
                list-style: none;
            }
            .description{
            	color:gray;
            	font-size:small;
            }
            .pmenu-item>span{
            	cursor:pointer;
            }
        </style>
    
    </head>
    <body>
    
    	<jsp:include page="../common/menubar.jsp" />
    
        <br><br><br>
        <div class="container">
            <jsp:include page="projectDetailMenubar.jsp"/>

            <div class="left card shadow-sm border-1 rounded-lg">
                <div class="card-body">
                    <div class="title-area">
                        <span class="title">전체 진행도</span>
                        &nbsp;&nbsp;&nbsp;
                        <span class="title">이번주 진행도</span>
                    </div>
                    <div class="inner-area">
                        <table>
                            <tr>
                                <td rowspan="2" style="padding-right:30px;">
                                    <span class="title" style="font-size:xxx-large">01</span> <span class="title">%</span>
                                </td>
                                <td style="padding-right:50px;">
                                    <span class="title">준비</span>
                                    <span class="description"> 25건</span>
                                </td>
                                <td>
                                    <span class="title">진행</span>
                                    <span class="description"> 13건</span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span class="title">완료</span>
                                   <span class="description"> 26건</span>
                                </td>
                                <td>
                                    <span class="title">지연</span>
                                    <span class="description"> 32건</span>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <div class="right card shadow-sm border-1 rounded-lg">
                <div class="card-body"  style="overflow: auto;">
                    <div class="title-area">
                        <span class="title">팀원 연락망</span>
                    </div>
                    <div class="inner-area">
                        <!-- project_mem list의 홀수번째만 -->
                        <ul style="width:50%; float:left;">
	                        <c:forEach var="m" items="${p.mlist}" step="2">
	                            <li style="margin-bottom:10px;">
	                            	<c:if test="${not empty m.empProfile}">
	                            		<img src="${m.empProfile}" style="width:30px;height:30px;border-radius:50%;">
									</c:if>
	                                <span>${m.memName}</span>
	                                <span style="color:gray; font-size:small">${m.memRole}</span>&nbsp;&nbsp;
	                                <form action="selectEmail.ma" method="post" style="display:inline-block">
	                                	<input type="hidden" name="email" value="${m.email}">
		                                <button type="submit" class="btn btn-sm btn-primary envelope" style="height:20px;width:50px;font-size:12px;line-height:10px">메일</button>&nbsp;
	                                </form>
	                            </li>
	                        </c:forEach>
                        </ul>
                        <!-- project_mem list의 짝수번째만 -->
                        <ul style="width:48%; float:left;">
                        	<c:forEach var="m" items="${p.mlist}" begin="1" step="2" >
	                            <li style="margin-bottom:10px;">
	                            	<c:if test="${not empty m.empProfile}">
	                            		<img src="${m.empProfile}" style="width:30px;height:30px;border-radius:50%;">
									</c:if>
	                                <span>${m.memName}</span>
	                                <input type="hidden" name="email" value="${m.email}">
	                                <span style="color:gray; font-size:small">${m.memRole}</span>&nbsp;&nbsp;
	                                <form action="selectEmail.ma" method="post" style="display:inline-block">
	                                	<input type="hidden" name="email" value="${m.email}" >
		                                <button type="submit" class="btn btn-sm btn-primary envelope" style="height:20px;width:50px;font-size:12px;line-height:10px">메일</button>&nbsp;
	                            </li>
                        	</c:forEach>
                        </ul>
                    </div>
                </div>
            </div>	
            <div style="clear:both;"></div><br><br><br>
            <span class="title">프로젝트 캘린더</span><br><br>




        </div>

        <br><br><br><br><br><br><br><br><br><br>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
