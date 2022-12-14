<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Full Calendar -->
<link href='${pageContext.request.contextPath}/resources/css/fullcalendar-scheduler/main.css' rel='stylesheet' />
<script src='${pageContext.request.contextPath}/resources/js/fullcalendar-scheduler/main.js'></script>

<style>
#main-outer {
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: space-between;
	padding-top:10px;
}

#main-outer a {
	text-decoration:none;
}

#left-area {
	width: 25%;
	height: 100%;
}

#right-area {
	width:23%;
	height:100%;
}

#profile-area, #timeMenu-area, #dashboard-area, #quickMenu-area {
	width: 100%;
	max-width:100%;
	padding:0;
}

.card text-black mb-4 {
	width:100%;
}

#profileCard {
	width:100%;
	height: auto;
	background-color: #E6EEFF;
}

#profile-tb {
	width: 100%;
}

#profileImg {
	width: 110px;
	height: 110px;
	border: 1px solid lightgray;
	border-radius: 50%;
}

#pf-card-body {
	height: 70%;
	color: black;
}

#pf-card-body a {
	text-decoration: none;
	color: #fff;
}

#pf-card-footer {
	disply:flex;
	justify-content: center;
}

#timeMenu-body, #dashboard-body, #quickMenu-body {
	height: auto;
}

#timeMenu-body *, #dashboard-body *, #quickMenu-body * {
	margin: 0;
	display: flex;
	justify-content: center;
	align-items: center;
}

#timeMenu-tb, #quickMenu-tb {
	width: 100%;
	text-align: center;
	font-size:14px;
}

#timeMenu-tb button {
	width: 45%;
	margin-bottom: 5px;
}

#dashboard-tb {
	width: 100%;
	font-size:14px;
}

#dashboard-tb tr {
	border-bottom: 1px solid #f1f1f1;
	height: 30px;
}

.new-num {
	color: red;
	font-weight: 500;
}

.quickA {
	display: block;
	width: 100%;
	height: 100%;
	text-decoration: none;
	color: black;
}

#center-area {
	width: 50%;
	height: 100%;
}

.card mb-4 {
	width: 100%;
}

.card-header {
	height:auto;

}

.card-total-title {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.read-more {
	text-decoration: none;
	color: black;
	font-size:12px;
}

.card-title {
	display: flex;
	align-items: center;
	margin-bottom:0 !important;
}

.card-title span {
	margin:3px;
}

.header-title {
	font-size: 16px;
	font-weight: 300;
}

.card-body table {
	width: 100%;
	font-size:14px;
}

#noticeList tr:hover{
	cursor:pointer;
}

#signList tr:hover {
	cursor:pointer;
}

#mailList tr:hover{
	cursor:pointer;
}

.fc-view *{color:black;font-size:12px}
.fc-daygrid-day-frame{height:30px;}

</style>
</head>
<body>
	<jsp:include page="menubar.jsp" />

			<!-- ??????????????? ?????? ?????? -->
			<div id="main-outer">

				<!-- ?????? ?????? -->
				<div id="left-area">
					<!-- ????????? ?????? -->
					<div class="col-xl-3 col-md-6 left-box" id="profile-area">
						<div class="card text-white mb-4" id="profileCard">
							<div class="card-body" id="pf-card-body">
								<table id="profile-tb">
									<tr align="center">
										<td rowspan="2" width="50%;">
											<img src="<c:out value='${ loginUser.empProfile }' default='resources/profile_images/defaultProfile.png'/>" id="profileImg">
										</td>
										<td style="padding-top: 15px;"><h4>${ loginUser.empName }</h4></td>
									</tr>
									<tr align="center">
										<td>
											<h6>
												${ loginUser.depCd } / ${ loginUser.posCd } <br> Work Partner!
											</h6>
										</td>
									</tr>
								</table>
							</div>
							<div class="card-footer d-flex align-items-center" id="pf-card-footer">
								<a href="mypage.em" style="text-decoration: none; color: black;text-align:center;">??? ?????? ??????</a>
							</div>
						</div>
					</div>
					<!-- ????????? ?????? ??? -->

					<!-- ?????? / ?????? ?????? -->
					<div class="col-xl-3 col-md-6 left-box" id="timeMenu-area">
						<div class="card text-black mb-4" id="timeMenu">
							<div class="card-body" id="timeMenu-body">
								<span id="realClock"></span>
							</div>
							<div class="card-footer d-flex align-items-center" id="timeMenu-footer">
								<table id="timeMenu-tb">
									<tr>
										<td width="50%">
											<button class="btn btn-primary btn-sm" id="cmtButton" onclick="location.href='goWork.att?empNo=${ loginUser.empNo }'">??????</button> <br>
											<span id="time1" style="font-size:17px">MM : DD AM</span>
										</td>
										<td>
											<button class="btn btn-danger btn-sm" id="qtButton" onclick="location.href='outWork.att?empNo=${ loginUser.empNo }'">??????</button> <br>
											<span id="time2" style="font-size:17px">MM : DD AM</span>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
					<!-- ?????? / ?????? ?????? ??? -->

					<!-- ?????? ?????? ?????? -->
					<script>
						var value = document.getElementById("realClock");

						function clock() {

							const d = new Date();

							const y = String(d.getFullYear());
							const m = String(d.getMonth() + 1);
							const dd = String(d.getDate());
							const day = String(d.getDay());
							const week = [ '???', '???', '???', '???', '???', '???', '???' ];

							const h = String(d.getHours()).padStart(2, "0");
							const mi = String(d.getMinutes()).padStart(2, "0");
							const s = String(d.getSeconds()).padStart(2, "0");

							realClock.innerHTML = '<span class="material-symbols-outlined">schedule</span>&nbsp;'
												+ y + '-' + m + '-' + dd + ' (' + week[day] + ') '
												+ h + ':' + mi + ':' + s;
						}

						clock();
						setInterval(clock, 1000); // 1????????? ??????
					</script>

					<!-- Dashboard ?????? -->
					<div class="col-xl-3 col-md-6 left-box" id="dashboard-area">
						<div class="card text-black mb-4" id="dashboard">
							<div class="card-body" id="dashboard-body">
								<p id="dashboardHeader">
									<span class="material-symbols-outlined">speed</span>&nbsp;<em>Dashboard</em>
								</p>
							</div>
							<div class="card-footer d-flex align-items-center id="dashboard-footer">
								<table id="dashboard-tb">
									<tr>
										<td width="50%">?????? / ???????????????</td>
										<!-- ?????? ?????? ?????? / ??? ?????? ??? -->
										<td align="right"><span class="new-num"> ${notReadCount} </span> / ${revCount} 
											???</td>
									</tr>
									<tr>
										<td>?????? / ???????????????</td>
										<td align="right"><span class="new-num"> 7 </span> / 356
											???</td>
									</tr>
									<tr>
										<td>?????? / ????????? ??????</td>
										<td align="right"><span class="new-num"> 3 </span> ???</td>
									</tr>
									<tr>
										<td>?????? / ?????? ??????</td>
										<td align="right"><span class="new-num"> 0 </span> ???</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
					<!-- Dashboard ?????? ??? -->

					<!-- QuickMenu ?????? -->
					<div class="col-xl-3 col-md-6 left-box" id="quickMenu-area">
						<div class="card text-black mb-4" id="quickMenu">
							<div class="card-body" id="quickMenu-body">
								<p id="quickMenuHeader">
									<span class="material-symbols-outlined">bolt</span>&nbsp;<em>Quick
										Menu</em>
								</p>
							</div>
							<div class="card-footer d-flex align-items-center id="quickMenu-footer">
								<table id="quickMenu-tb">
									<tr>
										<td style="border-right: 1px solid #b7b9cc"><a
											href="insert.ma" class="quickA">?????? ??????</a></td>
										<td><a href="enrollForm.bk" class="quickA">????????? ??????</a></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
					<!-- QuickMenu ?????? ??? -->
				</div>
				<!-- ?????? ?????? ??? -->

				<!-- ????????? ?????? -->
				<div id="center-area">

					<!-- ???????????? ??????-->
					<div class="card mb-4">
						<!-- ??? ?????? ?????? -->
						<div class="card-header">
							<div class="card-total-title">
								<div class="card-title">
									<span class="material-symbols-outlined">keyboard_voice</span>
									<span class="header-title">????????????</span>
								</div>
								<a href="list.nt" class="read-more">????????? +</a>
							</div>
						</div>
						<!-- ??? ?????? ????????? ?????? -->
						<div class="card-body">
							<table id="noticeList" class="table table-sm table-hover">
								<thead>
									<tr align="center">
										<th scope="col" width="80%">??????</th>
										<th scope="col">?????????</th>
									</tr>
								</thead>
								<tbody>
									<!--
										
										???????????? ??? ?????? (?????? ?????? top 5)	
										
									  -->
								</tbody>
							</table>
						</div>
					</div>
					<!-- ???????????? ?????? ??? -->

					<!-- ???????????? ??????-->
					<div class="card mb-4">
						<!-- ??? ?????? ?????? -->
						<div class="card-header">
							<div class="card-total-title">
								<div class="card-title">
									<span class="material-symbols-outlined">approval_delegation</span>
									<span class="header-title">????????????</span>
								</div>
								<a href="" class="read-more">????????? +</a>
							</div>
						</div>
						<!-- ??? ?????? ????????? ?????? -->
						<div class="card-body">
							<table id="signList" class="table table-sm table-hover">
								<thead align="center">
									<tr>
										<th scope="col" width="32%">????????????</th>
										<th scope="col" width="32%">??????</th>
										<th scope="col" width="32%">?????????</th>
									</tr>
								</thead>
								<tbody>
									
								</tbody>
							</table>
						</div>
					</div>
					<!-- ???????????? ?????? ??? -->
					
					

					<!-- ?????? ??????-->
					<div class="card mb-4">
						<!-- ??? ?????? ?????? -->
						<div class="card-header">
							<div class="card-total-title">
								<div class="card-title">
									<span class="material-symbols-outlined">mail</span>  <span	class="header-title">??????</span>
								</div>
								<a href="receiveList.ma" class="read-more">????????? +</a>
							</div>
						</div>
						<!-- ??? ?????? ????????? ?????? -->
						<div class="card-body">
							<table id="mailList" class="table table-sm table-hover">
								<thead>
									<tr align="center">
										<th scope="col" width="50%">??????</th>
										<th scope="col" width="20%">????????????</th>
										<th scope="col" width="30%">??????</th>
									</tr>
								</thead>
								<tbody>
									<!-- 
										????????? ??? ??????
									 -->
								</tbody>
							</table>
						</div>
					</div>
					<!-- ?????? ?????? ??? -->
					

				</div>
				<!-- ????????? ?????? ???-->

				<!-- ????????? ?????? -->
				<div id="right-area">
					<!-- ?????? ?????? ??????-->
					<div class="card mb-4">
						<!-- ??? ?????? ?????? -->
						<div class="card-header">
							<div class="card-total-title">
								<div class="card-title">
									<span class="material-symbols-outlined">trending_up</span> 
									<span class="header-title">?????? ??????</span>
								</div>
								<a href="" class="read-more">????????? +</a>
							</div>
						</div>
						<!-- ??? ?????? ????????? ?????? -->
						<div class="card-body">
							<table id="taskList" class="table table-sm">
								<thead>
									<tr align="center">
										<th scope="col" style="color: #1A7742">??????</th>
										<th scope="col" style="color: #0b60e0">??????</th>
										<th scope="col">??????</th>
										<th scope="col" style="color: #e74a3b">??????</th>
									</tr>
								</thead>
								<tbody>
									<tr align="center">
										<td>6</td>
										<td>2</td>
										<td>5</td>
										<td>3</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!-- ?????? ?????? ?????? ??? -->

					<!-- To do list ??????-->
					<div class="card mb-4">
						<!-- ??? ?????? ?????? -->
						<div class="card-header">
							<div class="card-total-title">
								<div class="card-title">
									<span class="material-symbols-outlined">checklist</span>
									<span class="header-title">To do List</span>
								</div>
								<a href="list.to" class="read-more">????????? +</a>
							</div>
						</div>
						<!-- ??? ?????? ????????? ?????? -->
						<div class="card-body">
							<table id="todoList" class="table table-sm">
								<thead>
									<tr align="center">
										<th scope="col">?????? ????????? ????????? To do List</th>
									</tr>
								</thead>
								<tbody id="todo-area">
								</tbody>
							</table>
						</div>
					</div>
					<!-- To do list ?????? ??? -->
					<%-- To do list ???????????? AJAX ?????? --%>
					<script>
						$.ajax({
							url:"ltlist.to",
							data:{
								empNo:${loginUser.empNo}
							},
							success:function(tlist){
								console.log(tlist)
								// String ????????? ????????????
								let html = "";
								for(let i=0; i<tlist.length; i++){
									html += '<tr>'
										  +		'<td style="padding-left:20px; font-size:12px; padding-right:20px;">' + tlist[i].todoContent + '</td>'
										  + '</tr>';
									$("#todo-area").html(html);
								}
							},
							error:function(){
								console.log("??????!!")
							}
						})
					</script>
					<%-- To do list ???????????? AJAX ??? --%>
					

					<!-- ????????? ?????? -->
					<div class="card mb-4">
						<!-- ??? ?????? ?????? -->
						<div class="card-header">
							<div class="card-total-title">
								<div class="card-title">
									<span class="material-symbols-outlined">calendar_month</span>
									<span class="header-title">?????????</span>
								</div>
								<a href="" class="padding:0px;"></a>
							</div>
						</div>
						<!-- ??? ?????? ????????? ?????? -->
						<div id="calendar" style="padding:5px;"></div>
					</div>
					<!-- ????????? ?????? ??? -->
					<script>
					$(function(){
						// -------------------- ????????? ????????? --------------------
						var calendarEl = document.getElementById('calendar');
						var calendar = new FullCalendar.Calendar(calendarEl, {
							locale: 'kr',	// ?????? ??????
					     
							height:'200px',	// ????????? ?????? ??????
							expandRows:true,
							initialView: 'dayGridMonth',	// ?????? ?????? ??????
							schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',	// trial ?????? ?????? ???????????? ???
					
							views: {
							   resourceTimeGridFourDay: {
							     type: 'resourceTimeGrid',
							     duration: { week: 1 },
								}
							},
					     	 headerToolbar: {
					          left: 'none',
					          center: 'none',
					          right: 'none'
					        },
							weekends: false,	// ????????? ????????? ?????? ???
							slotMinTime: "09:00:00",	// ????????? ?????? ??????
							slotMaxTime: "18:00:00",	// ????????? ?????? ??????
							allDaySlot: false,
							selectable: false,	// ???????????? ????????? ??????????????? ????????? ??? ?????? ???
							nowIndicator: false,	// ?????? ?????? ??????
						});
						calendar.render();
						calendar.updateSize();
						// -------------------- ????????? ????????? ??? --------------------
						$(".fc-scroller").css("overflow", "hidden");
						$(".fc-toolbar").css("display", "none");
						$(".fc-toolbar-ltr").css("display", "none");
					})
					</script>
					
					
				</div>
				<!-- ????????? ?????? ??? -->

			</div>
			
			
			
			<!-- ?????? ????????? ?????? ????????? ajax -->
			
			<script>
				$(function(){
					
					// 10??????????????? topBoardList???????????? => ????????? ????????? ???????????? ?????????????????? ??????????????? ????????????
		    		//setInterval( topBoardList, 10000);
					
					let x = "";
					let y = "";
					
					$.ajax({
						url: "mainTime.tm",
						data: {empNo:${ loginUser.empNo }},
						success:function(list){
							
							if( list.length != 0){
							x = list[0].attCmt;
							y = list[0].attQt;
							}
							
							if(x != "" ){
								$("#time1").html(x);
								$("#cmtButton").attr("disabled", true)
							
							}

							
							if(y != "" ){
						
								if(y == undefined){
									console.log(y)
								}else{
									$("#time2").html(y);
									$("#qtButton").attr("disabled", true)	
								}
								
							}
							
						},error:function(){
							console.log("??????????????? ?????? ajax ?????? ??????");
						}
    				});
					
					
					/*  ============================================================================  */
					
					// ???????????? ??????
					selectNoticeTopList();
					
					$(document).on("click", "#noticeList tr", function(){
		           		location.href = 'detail.nt?no=' + $(this).children(".noticeNo").val();
		            });  
					
					// email ??????
					selectEmailTopList();	
					
					 $("#mailList").on("click", "tr", function(){	         	
				        	location.href = 'detail.ma?no=' + $(this).find(".emailNo").val()+'&mailEmail=' +$(this).find(".mailEmail").val();
				     });
					
					 selectMainSign();	
					 $("#signList").on("click", "tr", function(){	         	
				        	location.href = 'detailMy.si?dpNo=' + $(this).find(".dpNo").val()+'&ct=' + $(this).find(".ct").val() + '&st=' + + $(this).find(".st").val();
				     });
				})
				
				
				/* ===================================== ???????????? & ????????? ==========================================  */
				// ???????????? ??????
				function selectNoticeTopList(){
					
					$.ajax({
						url:"topMainList.nt",
						success:function(list){
						    let value = "";
							for(let i=0; i<list.length; i++){
								
								value += '<tr>'
										+   '<input type="hidden" class="noticeNo" value="'+ list[i].noticeNo + '">'
									    +	'<td>'+ list[i].noticeTitle + ' <span style="color: red;">';
								if(list[i].noticeImportant == 'I'){
								 value  += 		'!';
								}	    
								value+=    	'</td>'
										+	'<td align="center">'+ list[i].noticeCreateDate +'</td>'
										+'</tr>';
								
							}
							
							$("#noticeList tbody").html(value);							
						}, 
						error:function(){
							console.log("??????????????? ???????????? ????????? ajax ??????");
						}				
						
					})
				}
				
				// ????????? ??????
				function selectEmailTopList(){
					
					console.log("${loginUser.empEmail}");
					$.ajax({
						url:"selectMainTopEmail.ma",
						data :{email:"${loginUser.empEmail}"},
						success:function(list){
							let value = "";
							
							if(list.length == 0){
								value += '<tr>'
										+	'<td colspan="3">?????? ???????????? ????????????.</td>'
										+'</tr>';
							}
							for(let e=0; e<list.length; e++){
								value += '<tr>'
										+   '<input type="hidden" class="emailNo" value="'+ list[e].mailNo + '">'
										+   '<input type="hidden" class="mailEmail" value="'+ list[e].mailEmail + '">'
										+	'<td>'+ list[e].mailTitle +'</td>'
										+	'<td align="center">'+ list[e].mailSenderName  +'</td>'
										+	'<td align="center">'+ list[e].mailCreateDate +'</td>'
										+'</tr>';
							};
						
							$("#mailList tbody").html(value);
						}					
					})
				}
				
				// ????????? ??????
				function selectMainSign(){
					$.ajax({
						url:"mainSelectSign.si",
						data : {empNo:${ loginUser.empNo }
					},
						success:function(list){
							let value = "";
							
							if(list.length == 0){
								value += '<tr>'
										+	'<td colspan="3">???????????? ???????????? ????????????.</td>'
										+'</tr>';
							}
							for(let h=0; h < 5; h++){
								value += '<tr>'
										+   '<input type="hidden" class="dpNo"" value="'+ list[h].dpNo + '">'
										+   '<input type="hidden" class="ct" value="'+ list[h].dpCategory + '">'
										+   '<input type="hidden" class="st" value="be">'
										+	'<td align="center">'+ list[h].dpNo +'</td>'
										+	'<td align="center">'+ list[h].dpTitle  +'</td>'
										+	'<td align="center">'+ list[h].dpCreate +'</td>'
										+'</tr>';
							};
						
							$("#signList tbody").html(value);
						}					
					})
				}
			</script>
</body>
</html>