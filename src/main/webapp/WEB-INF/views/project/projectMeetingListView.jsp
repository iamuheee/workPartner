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
            a{
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
            .filter{
                font-size: small;
                color: gray;
            }
            .hidden-info{
                display:none;
            }
        </style>
    
    </head>
    <body>
	<jsp:include page="../common/menubar.jsp" />
    
    <br><br><br>
	<div class="container">
	
	<jsp:include page="projectDetailMenubar.jsp" />
	<input type="hidden" name="projNo" value="${p.projNo}">


	<!-- =================== 여기부터 업무 게시글 ======================== -->
	<!-- =================== 반복문 시작하는 위치 ======================== -->
	
	<div id="meeting-wrap"></div>
	
	<script>
	   	// 업무 게시글 리스트 조회하는 ajax
	   	function loadMeetingList(){
	    	$.ajax({
	    		url:"mtlist.pr",
	    		data:{
	    			projNo:$("input[name=projNo]").val()
	    		},
	    		async:false,
	    		success:function(mlist){
	    			console.log(mlist)
	    			html = "";
	    			if(mlist == null){
	    				html+= "아직 등록된 회의가 없습니다.";
	    				$("#meeting-wrap").html(html);
	    			}else{
	    				for(let i=0; i<mlist.length; i++){
	     				html += '<div class="card shadow-sm border-1 rounded-lg">'
	     					  +		'<div class="card-title">'
	     					  +			'<div class="left" style="width:8%; height:50px;">'
	     					  +				'<span class="title" style="line-height:70px; padding:20px;">' + mlist[i].refType + '</span>'
	     					  +			'</div>'
	     					  +			'<div class="right" class="writer-info" style="width:92%; height:50px;">'
	     					  +				'<form action="editm.pr" method="post">'
	     					  +					'<input type="hidden" name="pboardNo" value="' + mlist[i].pboardNo + '">'
	     					  +					'<input type="hidden" name="pboardWriter" value="' + mlist[i].pboardWriter + '">'
	     					  +					'<table width="100%">'
	     					  +						'<tbody>'
	     					  +							'<tr>'
	     					  +								'<td width="90%" style="padding-top:15px;">'
	     					  +									'<span style="font-weight:bold;">' + mlist[i].writerName + '</span><br>'
	     					  +									'<span style="font-size:small; color:gray;">' + mlist[i].createDate + '</span>'
	     					  +								'</td>'
	     					  +								'<td width="5%"><a class="delete-board">삭제</a></td>'
	     					  +							'</tr>'
	     					  +						'</tbody>'
	     					  +					'</table>'
	     					  +				'</form>'
	     					  +			'</div>'
	     					  +		'</div>'
	     					  +		'<hr>'
	     					  +		'<div class="card-description">'
	     					  +			'<table width="50%;" style="float:left; margin-right:50px; margin-left: 30px;">'
	     					  +				'<tbody>'
	     					  +					'<tr>'
	     					  +						'<th>담당자</th>'
	     					  +						'<td>' + mlist[i].inchargeName + '</td>'
	                          +						'<th>회의 장소</th>'
	                          +						'<td>' + mlist[i].meetingPlace + '</td>'
	     					  +					'</tr>'
	     					  +					'<tr>'
	     					  +						'<th>시작일시</th>'
	     					  +						'<td>' + mlist[i].meetingDate + ' '+ mlist[i].startTime +'</td>'
	     					  +						'<th>종료일시</th>'
	     					  +						'<td>' + mlist[i].meetingDate + ' ' + mlist[i].endTime + '</td>'
	     					  +					'</tr>'
	     					  +				'</tbody>'
	     					  +			'</table>'
	     					  +		'</div>'
	     					  +		'<hr>'
	     					  +		'<div class="card-body">'
	     					  +			'<h3 class="title">' + mlist[i].title + '</h3>'
	     					  +			'<div class="content">'
	     					  +				'<p style="white-space:pre-line">' + mlist[i].content + '</p>' 
	     					  +				'<div class="attendance btn-area" align="center">'
	     					  +					'<br><a>참석 확인 현황</a><br>';
	   					 	let mem = mlist[i].pmeetMem;
	 						for(let j=0; j<mlist[i].pmeetMem.length; j++){
	 						html += 			'<input type="hidden" name="memNo" value="' + mlist[i].pmeetMem[j].memNo + '">'
	 							  +				'<button class="btn btn-sm btn-att" value="' + mlist[i].pmeetMem[j].attendanceYN + '">' + mlist[i].pmeetMem[j].memName + '</button>&nbsp;';
	 						}
	                     html += 			'</div><br>'
	                     	   +			'<div class="confirm-att" align="center">'
	                     	   +				'<input type="hidden" class="pboardNo" value="' + mlist[i].pboardNo + '">'
	                           +				'<button class="btn btn-success change-attendance" value="Y">참석</button> &nbsp;'
	                           +				'<button class="btn btn-danger change-attendance" value="N">불참</button>'
	                     	   +			'</div><br><br>'
	                     	   +		'</div>'
	                     	   +	'</div>'
	                     	   + '</div><br><br>';
	                     	   
						$("#meeting-wrap").html(html);
	    				}	  

	    				
	    			}
	    			
	    		},
	    		error:function(){
	    			console.log("에이젝스실패");
	    		}
	    	})
	   	}
	   	
	   	function changeButtonColor(){
		   	// 동적으로 리스트를 불러온 뒤에 참/불참에 따라 버튼 색깔 넣는 효과
		   	$(".btn-att").each(function(){
			   	if( $(this).val() == "Y" ){
					$(this).css("backgroundColor", "green").css("color", "white");
			   	}else if( $(this).val() == "N"){
			   		$(this).css("backgroundColor", "red").css("color","white");
			   	}
		   	})
	   	}
	   	
	   	// 페이지 로드되자마자 회의 리스트 뽑는 AJAX
		$(function(){
			loadMeetingList();
			changeButtonColor();
		})
	   	
	   	
	   	// 참석 / 불참 버튼 클릭시 발생하는 이벤트
		$(document).on("click", ".change-attendance", function(){
			let att = $(this).val();
			let pboardNo = $(this).siblings("input").val();
			let memNo = $(this).parent().siblings(".attendance").children("input").val()
			
			// 내가 해당 회의의 참석 명단에 있는지 확인
			$.ajax({
				url:"validate.pm",
				data:{
					memNo: ${loginUser.empNo},
					pboardNo:pboardNo
				},
				success:function(result){
					if( result == "성공" ){
						// DB의 ATTENDANCE_YN를 'Y'/'N'로 바꾸어주기
						$.ajax({
							url:"showatt.pm",
							data:{
								memNo: ${loginUser.empNo},
								pboardNo: pboardNo,
								attendanceYN: att
							},
							success:function(result){
								alert(result);
								loadMeetingList();
								changeButtonColor();
							},
							error:function(){
								console.log("성공까지는 왔는데... showatt.pm 불러오기에 실패@!!!")
							}
						})
					}else{
						alert("해당 회의 참석자만 선택 가능합니다.");
					}
				},
				error:function(){
					console.log("validate 실패");
				}
			})
		})
		
	   </script>
	   
	   
		<!-- SCRIPT 영역 -->
		<script>
			// 게시글 삭제를 누르면 해당 게시글이 삭제되도록하는 ajax
			$(document).on("click", ".delete-board", function(){
				$.ajax({
				    url:"deletem.pr",
				    data:{
				        pboardNo:$(this).parent().parent().parent().parent().siblings("input[name=pboardNo]").val()
				    },
				    success:function(result){
				       alert(result);
				       loadMeetingList();
				       changeButtonColor();
				    },
				    error:function(){
				        console.log("ajax 통신 실패 : 업무 게시글 삭제")
				    }
				})
			})
		
		</script>
	


        </div>

        <br><br><br><br><br><br><br><br><br><br>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
