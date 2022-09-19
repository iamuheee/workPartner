<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 템플릿-->
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="resources/css/template.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>

<!-- 구글 아이콘 -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<!-- 부트스트랩 4.6 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

<!-- jQuery 라이브러리 -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- Google Noto Sans Kr 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">

<!-- Google Raleway Sans 폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Raleway:wght@600&display=swap" rel="stylesheet">

 <style>
* {
	font-family: 'Noto Sans KR', sans-serif;
}

   .material-symbols-outlined {
     font-variation-settings:
     'FILL' 0,
     'wght' 250,
     'GRAD' 0,
     'opsz' 30
   }

   .material-symbols-outlined .outFill{
     font-variation-settings:
     'FILL' 1,
     'wght' 250,
     'GRAD' 0,
     'opsz' 30
   }

   .outFill{
       color: white;
   }

   .bg-blue{background-color: #0442AF;}

   .bg-gray{
      background-color: #f1f1f1;
   }
   
   .nav-choice:hover{
      cursor: pointer;  /*btn에 커서가면 커서모양이 손모양으로*/
      background-color: rgb(226, 224, 224);           
      color: #0442AF;             
   }

   .nav-choice{color: rgb(39, 38, 38);}

   .btn-primary{
       background-color: #0442AF;
       border-color:#0442AF;                
   }
   
   .btn-secondary{
   		background-color: rgb(226, 224, 224);
   		color: rgb(36, 35, 35);;
   		border-color: rgb(226, 224, 224);
   	 } 
   .btn-secondary:hover{
   			background-color: rgb(177, 175, 175) !important;
   			color: rgb(36, 35, 35)  !important;
   			border-color: rgb(177, 175, 175)  !important;
   }

   .btn-size{margin-left: 8px;  width: 80%;}    
   
   .starColor{ 
       /* padding: 0; */
       /* font-size: 1.5em;      */
       color:rgba(250, 208, 0, 0.99);
   }

   .menu-side-head{
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
       transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;
   }

   .alertFont{
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
   .small, small {
       font-size: 80%;
       font-weight: 400;
   }

   .text-gray-500 {
       color: #b7b9cc!important;
   }
   .alertFontSize{
    font-size: 13px;             
   }
   .align-items-center {
       align-items: center!important;
   }
   .d-flex {
       display: flex!important;
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
       width: 20rem!important;
   }
   .alertFontMiddle{ font-size: 14px;}
   .menubarHeadBold{ font-weight: 620;}
   .mainOuter{
   		width:95%;
        margin:0px auto;
        padding:10px;
    }
    
   #workpartnerLogo {
   		font-family:'Raleway', 'Noto Sans KR', sans-serif;
   } 
   
</style>
</head>
<body class="sb-nav-fixed">
	<c:if test="${ not empty alertMsg }">
		<script>
			alert("${alertMsg}");
		</script>
		<c:remove var="alertMsg" scope="session" />
	</c:if>

	


	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-blue" style="font-size: 14px;">
	          <!-- 클릭시 메인페이지 이동-->
	          <a class="navbar-brand ps-3" href="main" id="workpartnerLogo">Work Partner!</a>
	
	          <!-- Sidebar Toggle-->
	          <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
	
	          <!-- 공간 띄우기-->
	          <div class="ms-auto me-0 me-md-3 my-2 my-md-0"></div>   
	          
	          <!-- alert -->
	          <ul class="navbar-nav ms-auto ms-md-3 me-6 me-lg-6 alertFontSize">
	               <li class="nav-item dropdown no-arrow mx-1">
	                   <a class="nav-link dropdown-toggle btn-group dropstart" id="alertDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	                       <i class="fas fa-bell fa-fw"></i>
	                       <span class="badge badge-danger badge-counter">3+</span>               
	                   </a>
	                   
	                   <div class="dropdown-list dropdown-menu dropdown-menu-end shadow animated--grow-in"
	                           aria-labelledby="alertsDropdown">
	                           <h6 class="dropdown-header">
	                               Alerts Center
	                           </h6>
	
	                           <!-- 쪽지알람 예시-->
	                           <a class="dropdown-item d-flex align-items-center" href="#">
	                               <div class="mr-3">
	                                   <div class="icon-circle bg-primary">
	                                       <span class="material-symbols-outlined outFill">
	                                           sms
	                                       </span>
	                                   </div>
	                               </div>
	                               &nbsp;&nbsp;&nbsp;
	                               <div>
	                                   <div class="small text-gray-500">2021.09.26</div>
	                                   <span class="font-weight-bold alertFontMiddle">오늘 종강!!!!</span>
	                               </div>
	                           </a>
	
	                           <!-- 근태알람 예시 -->
	                           <a class="dropdown-item d-flex align-items-center" href="#">
	                               <div class="mr-3">
	                                   <div class="icon-circle bg-success">
	                                       <span class="material-symbols-outlined outFill">
	                                           work_history
	                                       </span>
	                                   </div>
	                               </div>
	                               &nbsp;&nbsp;&nbsp;
	                               <div>
	                                   <div class="small text-gray-500">2021.09.26</div>
	                                   <span class="font-weight-bold alertFontMiddle">주 52시간 초과!</span>                                        
	                               </div>
	                           </a>
	
	                           <!-- 기안서 알람 예시 -->
	                           <a class="dropdown-item d-flex align-items-center" href="#">
	                               <div class="mr-3">
	                                   <div class="icon-circle bg-warning">
	                                       <span class="material-symbols-outlined outFill">
	                                           description
	                                       </span>
	                                   </div>
	                               </div>
	                               &nbsp;&nbsp;&nbsp;
	                               <div>
	                                   <div class="small text-gray-500">2021.09.26</div>
	                                   <span class="font-weight-bold alertFontMiddle">업무협조요청이 승인되었습니다.</span>                                    
	                               </div>
	                           </a>
	                           <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
	                       </div>                        
	                
	               </li>
	           </ul>
	          
	          <!-- 프로필 & 로그아웃 -->
	          <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
	              <li class="nav-item dropdown">
	                  <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
	                  <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">                        
	                      <li><a class="dropdown-item" href="logout.em">Logout</a></li>
	                  </ul>
	              </li>
	          </ul>
	       </nav>
	
	       <div id="layoutSidenav">
	           <div id="layoutSidenav_nav" style="font-size: 14px;">
	               <nav class="sb-sidenav accordion sb-sidenav bg-gray" id="sidenavAccordion">
	                   <div class="sb-sidenav-menu">
	                       <div class="nav">
	
	                           <!-- HOME -->     							                          
	                           <a class="nav-link collapsed nav-choice" href="#" data-bs-toggle="collapse" data-bs-target="#collapseHome" aria-expanded="false" aria-controls="collapseHome">
	                               <span class="material-symbols-outlined">
	                                   home
	                               </span>
	                               <span class="menubarHeadBold"> &nbsp; HOME</span>
	                               <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
	                           </a>
	                           <div class="collapse" id="collapseHome" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
	                               <nav class="sb-sidenav-menu-nested nav">
	                                   <a class="nav-link nav-choice" href="mypage.em">마이페이지</a>
	                                   <a class="nav-link nav-choice" href="list.nt">공지사항</a>
	                                   <a class="nav-link nav-choice" href="">쪽지함</a>
	                               </nav>
	                           </div>
	
	                           <!-- 근태관리 -->
	                           <a class="nav-link collapsed nav-choice" href="#" data-bs-toggle="collapse" data-bs-target="#collapseTA" aria-expanded="false" aria-controls="collapseTA">
	                               <span class="material-symbols-outlined">
	                                   work_history
	                               </span>
	                               <span class="menubarHeadBold">&nbsp; 근태관리</span>
	                               <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
	                           </a>
	                           <div class="collapse" id="collapseTA" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
	                               
	                               <nav class="sb-sidenav-menu-nested nav">                                                                    
	                                   <a class="nav-link nav-choice" href="check.att">근태등록</a>
	                                   <a class="nav-link nav-choice" href="my.att">내 근태현황</a>
	                                   <a class="nav-link nav-choice" href="myAttHis.att">근태 이력</a>
	                                   <a class="nav-link nav-choice" href="myVacation.att">휴가관리</a>
	                               </nav>
	                               
	                               <div class="menu-side-head">관리자 메뉴</div>
	                               <nav class="sb-sidenav-menu-nested nav">                                   
	                                   <a class="nav-link nav-choice" href="adminAtt.att">전사원근태현황</a>
	                                   <a class="nav-link nav-choice" href="adminAttAdjust.att">근태조정내역</a>
	                                   <a class="nav-link nav-choice" href="adminVacation.att">전사원휴가현황</a>
	                               </nav>                                
	                           </div>
	
	
	                           <!-- 업무 -->
	                           <a class="nav-link collapsed nav-choice" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages1" aria-expanded="false" aria-controls="collapsePages1">
	                               <span class="material-symbols-outlined">
	                                   event_note
	                               </span>
	                               <span class="menubarHeadBold">&nbsp; 업무</span>
	                               <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
	                           </a>                            
	                           <div class="collapse" id="collapsePages1" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
	                               <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages1">
	                                   <a class="nav-link collapsed nav-choice" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth1" aria-expanded="false" aria-controls="pagesCollapseAuth1">
	                                       개인업무
	                                       <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
	                                   </a>
	                                   <div class="collapse" id="pagesCollapseAuth1" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages1">
	                                       <nav class="sb-sidenav-menu-nested nav">
												<a class="nav-link nav-choice" href="list.du">전체 업무</a>
												<a class="nav-link nav-choice" href="list.to">To Do 리스트</a>
												<a class="nav-link nav-choice" href="">월간 캘린더</a>
												<a class="nav-link nav-choice" href="">주간 캘린더</a>
	                                       </nav>
	                                   </div>
	                                   <a class="nav-link collapsed nav-choice" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseProject" aria-expanded="false" aria-controls="pagesCollapseProject">
	                                       프로젝트
	                                       <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
	                                   </a>
	                                   <div class="collapse" id="pagesCollapseProject" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages1">
	                                       <nav class="sb-sidenav-menu-nested nav">
	                                           <a class="nav-link nav-choice" href="main.pr">홈</a>
	                                           <a class="nav-link nav-choice" href="list.pr">참여프로젝트</a>
	                                           <a class="nav-link nav-choice" href="enroll.pr">프로젝트 생성</a>
	                                           <a class="nav-link nav-choice" href="manage.pr">프로젝트 관리</a>
	                                       </nav>
	                                   </div>
	                               </nav>
	                           </div>
	
	
	                           <!-- mail -->
	                           <a class="nav-link collapsed nav-choice" href="#" data-bs-toggle="collapse" data-bs-target="#collapseMail" aria-expanded="false" aria-controls="collapseMail">
	                               <span class="material-symbols-outlined">
	                                   mail
	                               </span>
	                               <span  class="menubarHeadBold"> &nbsp; 메일</span>
	                               <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
	                           </a>
	                           <div class="collapse" id="collapseMail" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
	                               <nav class="sb-sidenav-menu-nested nav">
	                                   <a class="btn btn-sm btn-primary btn-size" href="insert.ma">메일쓰기</a>
	                                   <a class="nav-link nav-choice" href="starList.ma"> <label class="starColor">★</label> &nbsp; 중요메일함</a>
	                                   <a class="nav-link nav-choice" href="totalList.ma">전체메일함</a>
	                                   <a class="nav-link nav-choice" href="receiveList.ma">받은메일함</a>
	                                   <a class="nav-link nav-choice" href="sendList.ma">보낸메일함</a>
	                                   <a class="nav-link nav-choice" href="bin.ma">휴지통</a>
	                                   <a class="nav-link nav-choice" href="sig.ma">설정</a>
	                               </nav>
	                           </div>
	
	                           
	                           <!-- 전자결재 -->
	                           <a class="nav-link collapsed nav-choice" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages2" aria-expanded="false" aria-controls="collapsePages2">
	                               <span class="material-symbols-outlined">
	                                   description
	                               </span>
	                               <span  class="menubarHeadBold">&nbsp; 기안서</span>
	                               <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
	                           </a>                            
	                           <div class="collapse" id="collapsePages2" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
	                               <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages2">     
	                                   <a id="btn-modal" class="btn btn-sm btn-primary btn-size">기안서 작성</a>                               
	                                   <a class="nav-link collapsed nav-choice" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth2" aria-expanded="false" aria-controls="pagesCollapseAuth2">
	                                       기안서관리
	                                       <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
	                                   </a>
	                                   <div class="collapse" id="pagesCollapseAuth2" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages2">
	                                       <nav class="sb-sidenav-menu-nested nav">
	                                           <a class="nav-link nav-choice" href="saveSi.si">임시저장</a>
	                                           <a class="nav-link nav-choice" href="contSi.si">진행중</a>
	                                           <a class="nav-link nav-choice" href="reSi.si">반려됨</a>
	                                           <a class="nav-link nav-choice" href="endSi.si">완료됨</a>                                            
	                                       </nav>
	                                   </div>
	                                   <a class="nav-link collapsed nav-choice" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseApproval1" aria-expanded="false" aria-controls="pagesCollapseApproval1">
	                                       통합결재보관함
	                                       <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
	                                   </a>
	                                   <div class="collapse" id="pagesCollapseApproval1" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages2">
	                                       <nav class="sb-sidenav-menu-nested nav">
	                                           <a class="nav-link nav-choice" href="othSi.si">결재할기안서 </a>
	                                           <a class="nav-link nav-choice" href="othEndSi.si">결재완료</a>                                         
	                                       </nav>
	                                   </div>
	                                   <a class="nav-link collapsed nav-choice" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseApproval2" aria-expanded="false" aria-controls="pagesCollapseApproval2">
	                                       부서결재보관함
	                                       <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
	                                   </a>
	                                   <div class="collapse" id="pagesCollapseApproval2" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages2">
	                                       <nav class="sb-sidenav-menu-nested nav">
	                                           <a class="nav-link nav-choice" href="deptSi.si">결재할기안서 </a>
	                                           <a class="nav-link nav-choice" href="deptEndSi.si">결재완료</a>                                         
	                                       </nav>
	                                   </div>
	                               </nav>
	                           </div>
	
	
	                           <!-- 주소록 -->						 
								<!-- <a class="nav-link collapsed nav-choice" href="#" data-bs-toggle="collapse" data-bs-target="#collapseContact" aria-expanded="false" aria-controls="collapseContact">
									<span class="material-symbols-outlined">
										perm_contact_calendar
									</span>
									<span  class="menubarHeadBold"> &nbsp; 주소록</span>
									<div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
								</a>
								<div class="collapse" id="collapseContact" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
									<nav class="sb-sidenav-menu-nested nav">
										<a class="btn btn-sm btn-primary btn-size" href="">새연락처</a>
										<a class="nav-link nav-choice" href=""> <label class="starColor">★</label> &nbsp; 별표연락처</a>
										<a class="nav-link nav-choice" href="list.ad">사내연락처</a>
										<a class="nav-link nav-choice" href="">내 연락처</a>                                    
									</nav>
								</div>  -->
															   
	                           
	                           <a class="nav-link  nav-choice" href="list.ad">
	                                <span class="material-symbols-outlined">
	                                    perm_contact_calendar
	                                </span>
	                                <span class="menubarHeadBold">&nbsp; 주소록</span>
                               </a> 
	
	                            <!-- 회의실예약 -->
	                            <a class="nav-link collapsed nav-choice" href="#" data-bs-toggle="collapse" data-bs-target="#collapseReservation" aria-expanded="false" aria-controls="collapseReservation">
	                               <span class="material-symbols-outlined">
	                                   event_available
	                               </span>
	                               <span  class="menubarHeadBold"> &nbsp; 회의실 예약</span>
	                               <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
	                           </a>
	                           <div class="collapse" id="collapseReservation" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
	                           	   <nav class="sb-sidenav-menu-nested nav">
												<a class="btn btn-sm btn-primary btn-size" href="enroll.bk" style="margin:10px;">+ 회의실 예약</a>
												<a class="nav-link nav-choice" href="">내 예약 현황</a>
                                   </nav>
                                   <!-- 인사부 직원에게만 보여지는 메뉴 -->
	                               <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages1">
	                                   <a class="nav-link collapsed nav-choice" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseProject" aria-expanded="false" aria-controls="pagesCollapseProject">
	                                       <span class="material-symbols-outlined">settings</span>회의실 관리
	                                       <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
	                                   </a>
	                                   <div class="collapse" id="pagesCollapseProject" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages1">
	                                       <nav class="sb-sidenav-menu-nested nav">
	                                       	   <a class="btn btn-sm btn-primary btn-size" href="enrollForm.ro" style="margin:10px;">+ 회의실 등록</a>
	                                           <a class="nav-link nav-choice" href="list.ro">회의실 관리</a>
	                                           <a class="nav-link nav-choice" href="">예약 이력 조회</a>
	                                       </nav>
	                                   </div>                                                                    
	                               </nav>
	                           </div>
	
	                          <!-- 인사관리 -->
	                          <!-- 인사부 직원에게만 보이는 메뉴 -->
	                          <!-- 기능 구현 끝난 뒤에 활성화 -->
	                          <%-- <c:if test="${ loginUser.depCd eq '인사부' }"> --%>
	                          <a class="nav-link collapsed nav-choice" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages3" aria-expanded="false" aria-controls="collapsePages3">
	                           <span class="material-symbols-outlined">
	                               manage_accounts
	                           </span>
	                           <span  class="menubarHeadBold">&nbsp; 인사관리</span>
	                           <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
	                           </a>                            
	                           <div class="collapse" id="collapsePages3" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
	                               <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages3">
	                                   <a class="nav-link collapsed nav-choice" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth3" aria-expanded="false" aria-controls="pagesCollapseAuth3">
	                                       임직원 계정관리
	                                       <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
	                                   </a>
	                                   <div class="collapse" id="pagesCollapseAuth3" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages3">
	                                       <nav class="sb-sidenav-menu-nested nav">
	                                           <a class="nav-link nav-choice" href="enrollForm.em">사용자 등록</a>
	                                           <a class="nav-link nav-choice" href="list.em">사용자 조회/수정</a>                                        
	                                       </nav>
	                                   </div>
	                                   <a class="nav-link collapsed nav-choice" href="adminPosition.att">직위/직무등록</a>
	                               </nav>
	                           </div>
                           <%-- </c:if> --%>
                        </div>
                   </div>
                    
	               </nav>
	           </div>
	           <jsp:include page="../sign/dtpaperSignList.jsp"/>
	           <!-- content 영역-->
	           <div id="layoutSidenav_content">
	               <main class="mainOuter">
	                   
	               	           
	      
	       <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	       <script src="resources/js/scripts.js"></script>
</body>
</html>