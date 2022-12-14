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
                height:19px;
                font-size: 12px;
                line-height: 10px;
                background-color: lightgray;
            }
            .card-comment{
                width:100%;
                background-color: #f1f1f1;
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
            .duty-wrapper hr{
            	color:white;
            	height:0.5px;
            }
        </style>
    
    </head>
    <body>
    	<jsp:include page="../common/menubar.jsp" />
    	
    	<br><br><br>
        <div class="container">
            <jsp:include page="projectDetailMenubar.jsp"/>

            <div class="filter-wrap btn-area">
				<select name="" id="" class="filter">
				    <option value="" selected>?????? ??????</option>
				    <option value="">?????? ??????</option>
				    <option value="">???????????? ??????</option>
				    <option value="">?????? ??????</option>
				    <option value="">?????? ??????</option>
				</select>
				
				<input type="text" placeholder="?????? ????????? ??????????????????." style="height:18px; font-size:smaller;">
				<button class="btn btn-sm" style="margin-bottom:3px;">??????</button>
            </div>
            <br><br>


            <!-- =================== ???????????? ?????? ????????? ======================== -->
            <!-- =================== ????????? ???????????? ?????? ======================== -->
            <script>
            	function loadDutyList(){
            		$.ajax({
            			url:"dlist.pr",
            			data:{
            				projNo:$("input[name=projNo]").val()
            			},
            			async:false,
            			success:function(dlist){
            				console.log(dlist);
            				
            				let html = "";
            				for(let i=0; i<dlist.length; i++){
	            				html += '<div class="card shadow-sm border-1 rounded-lg">'
	            					  +		'<div class="card-title">'
	            					  + 		'<div class="left" style="width:8%; height:50px;">'
	            					  +				'<span class="title" style="line-height:70px; padding:20px;">' + dlist[i].refType + '</span>'
	            					  +			'</div>'
	            					  +			'<div class="right" class="writer-info" style="width:92%; height:50px;">'
	            					  +				'<form action="editd.pr" method="post" class="edit-form">'
	            					  +					'<input type="hidden" name="pboardNo" value="' + dlist[i].pboardNo + '">'
	            					  +					'<input type="hidden" class="pboardWriter" value="' + dlist[i].pboardWriter + '">'
	            					  +					'<table width="100%">'
	            					  +						'<tbody>'
	            					  +							'<tr>'
	            					  +								'<td width="90%" style="padding-top:15px;">'
	            					  +									'<span style="font-weight:bold;">'+ dlist[i].writerName + '</span><br>'
	            					  +									'<span style="font-size:small; color:gray;">' + dlist[i].createDate + '</span>'
	            					  +								'</td>'
	            					  +								'<td width="5%"><a class="submitEditForm">??????</a></td>'
	            					  +								'<td width="5%"><a class="delete-board">??????</a></td>'
	            					  +							'</tr>'
	            					  +						'</tbody>'
	            					  +					'</table>'
	          					  	  +				'</form>'
	          					  	  +			'</div>'
	          					  	  +		'</div>'
	          					  	  +		'<hr style="border:0.1px solid white;">'
	          					  	  +		'<div class="card-description">'
	          					  	  +			'<table width="50%;" style="float:left; margin-right:50px; margin-left: 30px;">'
	          					  	  +				'<tr>'
	          					  	  +					'<th width="90px">?????????</th>'
	          					  	  +					'<td>' + dlist[i].pduty.inchargeName + '</td>'
	          					  	  +					'<th width="90px">????????????</th>'
	  		                          + 				'<td>' + dlist[i].pduty.progress + '</td>'
	          					  	  +				'</tr>'
	          					  	  +				'<tr>'
	          					  	  +					'<th>????????????</th>'
	          					  	  +					'<td>' + dlist[i].pduty.startDate + '</td>'
	          					  	  +					'<th>????????????</th>'
	          					  	  +					'<td>' + dlist[i].pduty.endDate + '</td>'
	          					  	  +				'</tr>'
	          					  	  +			'</table>'
		                              +		'</div>'
		                              +		'<hr style="border:0.1px solid white;">'
		                              +		'<div class="card-body">'
		                              +			'<h2 style="font-weight:bolder">' + dlist[i].title + '</h3>'
		                              +			'<div class="content"><p style="white-space:pre-line">' + dlist[i].content +'</p></div>';
							if( dlist[i].file != null){
		                         html +=		' <div class="content-file" align="center">'
		                         	  +				'<img src="' + dlist[i].file.filePath + '" width="150px" ><br>'
		                              +				'<span>???????????? <i class="fa fa-download" aria-hidden="true"></i> &nbsp; </span>'
		                              +				'<a href="' + dlist[i].file.filePath + '">' + dlist[i].file.fileOriginName + '</a>'
		                              +			'</div>';      
							}
								html += 	'</div>'
									  +		'<div class="card-comment">'
									  +			'<input type="hidden" class="pboardNo" value="' + dlist[i].pboardNo + '">'
									  +			'<table class="table-comment" style="table-layout:fixed; width:100%;">'
									  +			'</table>'
									  +		'</div>'
									  +		'<div class="write-comment">'
									  +			'<input type="hidden" name="comRefBno" value="' + dlist[i].pboardNo + '">'
									  +			'<textarea name="comContent" class="form-control" style="width:90%; height:80px; margin:20px; float:left; resize:none"></textarea>'
									  +			'<button class="btn btn-sm btn-primary insertComment" style="float:left; height:80px; width:5%; margin-top:20px;">??????<br>??????</button>'
									  +		'</div>'
		                              +	'</div><br><br>';
            				}
            				
            				$("#duty-wrapper").html(html);
            			},
            			error:function(){
            				console.log("??????~");
            			}
            		})
            	}
            	
            	function loadCommentList(){
            		$(".table-comment").each(function(){
	            		let parent = $(this);
	            		
            			$.ajax({
	            			url:"dclist.pr",
	            			data:{
	            				comRefBno:$(this).siblings("input").val()
	            			},
	            			success:function(dclist){
	            				console.log("??????")
	            				
	            				let comment = "";
	            				if(dclist != null){
	            					for(let i=0; i<dclist.length; i++){
										comment += '<tr width="100%" height="10px;">'
										   		 +		'<th width="8%" style="padding-left:20px;">' + dclist[i].empName + '</th>'
										   		 +		'<td width="72%;" style="padding:20px; white-space:pre-line; overflow:ellipsis;">' + dclist[i].comContent + '</td>'
										   		 +		'<td width="10%;" style="color:gray;">' + dclist[i].comCreateDate + '</td>'
										   		 +		'<td style="display:none" class="comNo">' + dclist[i].comNo + '</td>'
										   		 +		'<td style="display:none" class="empNo">' + dclist[i].empNo + '</td>'
										   		 +		'<td><a width="5%" class="deleteComment">??????</a></td>'
										   		 + '</tr>'
										parent.html(comment);
	            					}
	            				}else{
	            					comment += '<tr><b>?????? ????????? ????????? ????????????.</b></tr>';
	            					parent.html(comment);
	            				}
	            			},
	            			error:function(){
	            				console.log("??????");
	            			}
	            		})
	            		
	            	})
           		} 
            
            	// ????????? ?????????????????? loadDutyList() ?????? ??????
            	$(function(){
		            loadDutyList();
		            loadCommentList();
            	})	
            </script>
            
			<div id="duty-wrapper"></div>
			<br><br>
				
			
			<script>
				// ?????? ????????? ????????? ?????? ???????????? ?????? ???????????? ??????
				$(document).on("click", ".submitEditForm", function(){
					if( $(this).parent().parent().parent().parent().siblings(".pboardWriter").val() == ${loginUser.empNo} ){
						$(this).parents("form").submit();
					}else{
						alert("?????? ????????? ???????????? ????????? ??? ????????????.");
					}
				})
				
				// ?????? ????????? ????????? ?????? ???????????? ????????????????????? ajax
				$(document).on("click", ".delete-board", function(){
					if( $(this).parent().parent().parent().parent().siblings(".pboardWriter").val() == ${loginUser.empNo} ){
					    $.ajax({
					        url:"deleted.pr",
					        data:{
					        	projNo:$("input[name=projNo]").val(),
					            pboardNo:$(this).parent().parent().parent().parent().siblings("input[name=pboardNo]").val()
					        },
					        success:function(alertMsg){
					            alert(alertMsg);
					            loadDutyList();
					            loadCommentList();
					        },
					        error:function(){
					            console.log("ajax ?????? ?????? : ?????? ????????? ??????")
					        }
					    }) 
					}else{
						alert("?????? ????????? ???????????? ????????? ??? ????????????.");
					}
				})
				
			    // ?????? ???????????? ?????? ????????? ?????? ???????????? ajax
			    $(document).on("click", ".insertComment", function(){
			    	$(this).siblings("input[name=comRefBno]").val();
			    	$(this).siblings("input[name=conContent]").val();
			    	console.log('?????????');
			    	  $.ajax({
				        url:"insertc.pr",
				        data:{
				            comRefBno:$(this).siblings("input[name=comRefBno]").val(),
				            comContent:$(this).siblings("textarea[name=comContent]").val(),
				            empNo:"${loginUser.empNo}",
				            empId:"${loginUser.empId}",
				            empName:"${loginUser.empName}"
				        },
				        success:function(alertMsg){
							alert(alertMsg);
				        	loadDutyList();
				        	loadCommentList();
				        },
				        error:function(){
				            console.log("??????????????????~")
				        }
				    })
			    })
				    
				
			    // ?????? ???????????? ?????? ???????????? ajax
			    $(document).on("click", ".deleteComment", function(){
			    	if( $(this).parent().siblings(".empNo").text() == ${loginUser.empNo} ){
				    	$.ajax({
				    		url:"deletec.pr",
				    		data:{
				    			comNo:$(this).parent().siblings(".comNo").text()
				    		},
				    		success:function(result){
				    			loadCommentList();
				    			alert(result);
				    		}
				    	})
			    	}else{
						alert("?????? ????????? ????????? ????????? ??? ????????????.")
					}
			    })
				    
				    
			</script>


        </div>

        <br><br><br><br><br><br><br><br><br><br>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
</html>