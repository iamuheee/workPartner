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
                height:19px;
                font-size: 12px;
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
            <h1 style="font-weight:bolder;"><span>${p.projTitle}</span> 업무 공유방</h1>
            <hr>
            
            <form id="moveToURL" method="post">
            	<input type="hidden" name="projNo" value="${p.projNo}">
            	<input type="hidden" name="pboardWriter" value="${loginUser.empNo}"}>
            </form>
            <script>
            	function moveToURL(url){
            		$("#moveToURL").attr("action", url);
            		$("#moveToURL").submit();
            	}
            </script>
            
            <div class="project-menubar">
                <ul class="group-pmenu">
                    <li class="pmenu-item"><span onclick="moveToURL('proom.pr')">홈</span></li>
                    <li class="pmenu-item"><span onclick="moveToURL('duty.pr')">업무</span></li>
                    <li class="pmenu-item"><span onclick="moveToURL('meet.pr')">회의</span></li>
                    <li class="pmenu-item"><span onclick="moveToURL('bmk.pr')">북마크</span></li>
                    <li class="pmenu-item"><span onclick="moveToURL('cal.pr')">캘린더</span></li>
                </ul>
                <div align="right">
					<button class="btn btn-sm btn-primary" onclick="moveToURL('newduty.pr')">새로운 업무 추가</button> 
					&nbsp;&nbsp;
					<button class="btn btn-sm btn-primary" onclick="moveToURL('newmeet.pr')">새로운 회의 추가</button> 
                </div>
            </div>
            
            <hr style="clear: both;">

            <div class="filter-wrap btn-area">
				<select name="" id="" class="filter">
				    <option value="" selected>전체 보기</option>
				    <option value="">나의 업무</option>
				    <option value="">북마크한 업무</option>
				    <option value="">긴급 업무</option>
				    <option value="">지연 업무</option>
				</select>
				
				<input type="text" placeholder="업무 제목을 입력해주세요." style="height:18px; font-size:smaller;">
				<button class="btn btn-sm" style="margin-bottom:3px;">검색</button>
            </div>
            <br><br>


            <!-- =================== 여기부터 업무 게시글 ======================== -->
            <!-- =================== 반복문 시작하는 위치 ======================== -->
            <script>
            	function loadDutyList(){
            		$.ajax({
            			url:"dlist.pr",
            			data:{
            				projNo:$("input[name=projNo]").val()
            			},
            			success:function(dlist){
            				console.log(dlist);
            				
            				let html = "";
            				// dlist[i] = ProjectBoard 객체
            				for(let i=0; i<dlist.length; i++){
            				html += '<div class="card shadow-sm border-1 rounded-lg">'
            					  +		'<div class="card-title">'
            					  + 		'<div class="left" style="width:8%; height:50px;">'
            					  +				'<span class="title" style="line-height:70px; padding:20px;">' + dlist[i].refType + '</span>'
            					  +			'</div>'
            					  +			'<div class="right" class="writer-info" style="width:92%; height:50px;">'
            					  +				'<form action="editd.pr" method="post" class="edit-form">'
            					  +					'<input type="hidden" name="pboardNo" value="' + dlist[i].pboardNo + '">'
            					  +					'<table width="100%">'
            					  +						'<tr>'
            					  +							'<td width="90%" style="padding-top:15px;">'
            					  +								'<span style="font-weight:bold;">'+ dlist[i].writerName + '</span><br>'
            					  +								'<span style="font-size:small; color:gray;">' + dlist[i].createDate + '</span>'
            					  +							'</td>'
            					  +							'<td width="5%"><a class="submitEditForm">수정</a></td>'
            					  +							'<td width="5%"><a class="delete-board">삭제</a></td>'
            					  +						'</tr>'
            					  +					'</table>'
          					  	  +				'</form>'
          					  	  +			'</div>'
          					  	  +		'</div>'
          					  	  +		'<hr style="border:0.1px solid white;">'
          					  	  +		'<div class="card-description">'
          					  	  +			'<table width="50%;" style="float:left; margin-right:50px; margin-left: 30px;">'
          					  	  +				'<tr>'
          					  	  +					'<th width="90px">담당자</th>'
          					  	  +					'<td>' + dlist[i].pduty.inchargeName + '</td>'
          					  	  +					'<th width="90px">진행상태</th>'
  		                          + 				'<td>' + dlist[i].pduty.progress + '</td>'
          					  	  +				'</tr>'
          					  	  +				'<tr>'
          					  	  +					'<th>시작일시</th>'
          					  	  +					'<td>' + dlist[i].pduty.startDate + '</td>'
          					  	  +					'<th>종료일시</th>'
          					  	  +					'<td>' + dlist[i].pduty.endDate + '</td>'
          					  	  +				'</tr>'
          					  	  +			'</table>'
	                              +		'</div>'
	                              +		'<hr style="border:0.1px solid white;">'
	                              +		'<div class="card-body">'
	                              +			'<h2 class="title">' + dlist[i].title + '</h3>'
	                              +			'<div class="content"><p style="white-space:pre-line">' + dlist[i].content +'</p></div>'
	                              +		'</div>'      
	                              +	'</div><br><br>'
            				}
            				
            				$("#duty-wrapper").html(html);
            			},
            			error:function(){
            				console.log("실패~");
            			}
            		})
            	}
            
            
            	// 페이지 로드되자마자 loadDutyList() 함수 호출
            	$(function(){
		            loadDutyList();

            	})	
            </script>
            
			<div id="duty-wrapper"></div>
			
			
			<br><br>
				
			
			
			<script>
				// 수정 버튼을 누르면 해당 게시글의 수정 페이지로 이동
				$(document).on("click", ".submitEditForm", function(){
					$(this).parents("form").sumbit();
				})
				
				// 삭제 버튼을 누르면 해당 게시글이 삭제되도록하는 ajax
				$(document).on("click", ".delete-board", function(){
				    $.ajax({
				        url:"deleted.pr",
				        data:{
				        	projNo:$("input[name=projNo]").val(),
				            boardNo:$(this).parents("input[name=pboardNo]").val()
				        },
				        success:function(result){
				            alert(result);
				            loadDutyList();
				        },
				        error:function(){
				            console.log("ajax 통신 실패 : 업무 게시글 삭제")
				        }
				    })
				})
				
				function insertComment(){
				    // 댓글 작성하고 댓글 리스트 새로 불러오는 ajax
				    $.ajax({
				        url:"",
				        data:{
				            comRefBno:$("input[name=comRefBno]").val(),
				            comType:$("input[name=comType]").val(),
				            comContent:$("input[name=conContent]").val()
				        },
				        success:function(){
				
				        },
				        error:function(){
				            
				        }
				    })
				}
			</script>


        </div>

        <br><br><br><br><br><br><br><br><br><br>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
</html>