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


	<!-- =================== ???????????? ?????? ????????? ======================== -->
	<!-- =================== ????????? ???????????? ?????? ======================== -->
	
	<div id="meeting-wrap"></div>
	
	<script>
	   	// ?????? ????????? ????????? ???????????? ajax
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
	    				html+= "?????? ????????? ????????? ????????????.";
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
	     					  +								'<td width="5%"><a class="delete-board">??????</a></td>'
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
	     					  +						'<th>?????????</th>'
	     					  +						'<td>' + mlist[i].inchargeName + '</td>'
	                          +						'<th>?????? ??????</th>'
	                          +						'<td>' + mlist[i].meetingPlace + '</td>'
	     					  +					'</tr>'
	     					  +					'<tr>'
	     					  +						'<th>????????????</th>'
	     					  +						'<td>' + mlist[i].meetingDate + ' '+ mlist[i].startTime +'</td>'
	     					  +						'<th>????????????</th>'
	     					  +						'<td>' + mlist[i].meetingDate + ' ' + mlist[i].endTime + '</td>'
	     					  +					'</tr>'
	     					  +				'</tbody>'
	     					  +			'</table>'
	     					  +		'</div>'
	     					  +		'<hr>'
	     					  +		'<div class="card-body">'
	     					  +			'<h2 style="font-weight:bolder">' + mlist[i].title + '</h3>'
	     					  +			'<div class="content">'
	     					  +				'<p style="white-space:pre-line">' + mlist[i].content + '</p>' 
	     					  +				'<div class="attendance btn-area" align="center">'
	     					  +					'<br><a>?????? ?????? ??????</a><br>';
	   					 	let mem = mlist[i].pmeetMem;
	 						for(let j=0; j<mlist[i].pmeetMem.length; j++){
	 						html += 			'<input type="hidden" name="memNo" value="' + mlist[i].pmeetMem[j].memNo + '">'
	 							  +				'<button class="btn btn-sm btn-att" value="' + mlist[i].pmeetMem[j].attendanceYN + '">' + mlist[i].pmeetMem[j].memName + '</button>&nbsp;';
	 						}
	                     html += 			'</div><br>'
	                     	   +			'<div class="confirm-att" align="center">'
	                     	   +				'<input type="hidden" class="pboardNo" value="' + mlist[i].pboardNo + '">'
	                           +				'<button class="btn btn-success change-attendance" value="Y">??????</button> &nbsp;'
	                           +				'<button class="btn btn-danger change-attendance" value="N">??????</button>'
	                     	   +			'</div><br><br>'
	                     	   +		'</div>'
	                     	   +	'</div>'
	                     	   + '</div><br><br>';
	                     	   
						$("#meeting-wrap").html(html);
	    				}	  

	    				
	    			}
	    			
	    		},
	    		error:function(){
	    			console.log("??????????????????");
	    		}
	    	})
	   	}
	   	
	   	function changeButtonColor(){
		   	// ???????????? ???????????? ????????? ?????? ???/????????? ?????? ?????? ?????? ?????? ??????
		   	$(".btn-att").each(function(){
			   	if( $(this).val() == "Y" ){
					$(this).css("backgroundColor", "green").css("color", "white");
			   	}else if( $(this).val() == "N"){
			   		$(this).css("backgroundColor", "red").css("color","white");
			   	}
		   	})
	   	}
	   	
	   	// ????????? ?????????????????? ?????? ????????? ?????? AJAX
		$(function(){
			loadMeetingList();
			changeButtonColor();
		})
	   	
	   	
	   	// ?????? / ?????? ?????? ????????? ???????????? ?????????
		$(document).on("click", ".change-attendance", function(){
			let att = $(this).val();
			let pboardNo = $(this).siblings("input").val();
			let memNo = $(this).parent().siblings(".attendance").children("input").val()
			
			// ?????? ?????? ????????? ?????? ????????? ????????? ??????
			$.ajax({
				url:"validate.pm",
				data:{
					memNo: ${loginUser.empNo},
					pboardNo:pboardNo
				},
				success:function(result){
					if( result == "??????" ){
						// DB??? ATTENDANCE_YN??? 'Y'/'N'??? ???????????????
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
								console.log("??????????????? ?????????... showatt.pm ??????????????? ??????@!!!")
							}
						})
					}else{
						alert("?????? ?????? ???????????? ?????? ???????????????.");
					}
				},
				error:function(){
					console.log("validate ??????");
				}
			})
		})
		
	   </script>
	   
	   
		<!-- SCRIPT ?????? -->
		<script>
			// ????????? ????????? ????????? ?????? ???????????? ????????????????????? ajax
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
				        console.log("ajax ?????? ?????? : ?????? ????????? ??????")
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
