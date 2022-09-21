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
                <h1 style="font-weight:bolder;">${p.projTitle} 관리</h1>
                <input type="hidden" id="projNo" value="${p.projNo}">
                <hr>
            </div>
            <div class="project-menubar">
                <ul class="group-pmenu" style="color:black;">
                    <li class="pmenu-item"><a href="manage.pr?projNo=${p.projNo}">프로젝트 관리</a></li>
                    <li class="pmenu-item"><a href="">멤버 관리</a></li>
                </ul>
                <hr style="clear:both;">
            </div>

			<div style="float:left;">
				<a class="addMember filter" style="text-decoration:none;color:black;font-size:small;color:gray;">새로운 관리자 초대</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a class="addMember filter" style="text-decoration:none;color:black;font-size:small;color:gray;">새로운 멤버 초대</a>
				<input type="hidden" id="newMemRole">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="filter">||</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a class="waitingMember filter" style="text-decoration:none;color:black;font-size:small;color:gray;">초대 수락 대기중인 멤버 조회</a>
	            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</div>
                
           <script>
           	$(".addMember").click(function(){
           		if($(this).text() == '새로운 관리자 초대'){
           			$("#newMemRole").val("관리자");
           		}else{
           			$("#newMemRole").val("일반멤버");
           		}
             	window.name = "parentWindow"
    			let childWindow; // 자식창
    			childWindow = window.open("addressProject.ad","childWindow", "height=700, width=1200, resizable=no, scrollbars=no");
           		
           	})
           	
			$(".waitingMember").click(function(){
	    		$.ajax({
   					url:"wlist.pr",
   					data:{
   						projNo:$("#projNo").val()
   					},
   					success:function(wlist){
   						let html = "";
   						console.log(wlist);
   						
   						for(let i=0; i<wlist.length; i++){
   							html += '<tr>'
   								  +		'<td class="memNo"><span>' + wlist[i].memNo + '</span></td>'
   								  +		'<td class="memRole">' + wlist[i].memRole + '</td>'
   								  +		'<td class="memName">' + wlist[i].memName + '</td>'
   								  +		'<td class="department">' + wlist[i].department + '</td>'
   								  +		'<td class="email">' + wlist[i].email + '</td>'
   								  +		'<td class="phone">' + wlist[i].phone + '</td>'
   								  +		'<td class="proNo" style="display:none"><input type="hidden" class="projNo" value="' + wlist[i].projNo + '"></td>'
   								  +		'<td><button class="btn btn-sm btn-waiting-modal" value="' + wlist[i].memNo + '">초대취소</button></td>'
   								  + '</tr>'
   						}
   						$("#member-list").html(html);
   					},
   					error:function(){
   						console.log("멤버 리스트 조회..실패...")
   					}
  				})
 			})
                
           	// 삭제 버튼 클릭시 해당 멤버 초대 취소하는 모달 띄우기
           	$(document).on("click", ".btn-waiting-modal", function(){
           		if( confirm("해당 멤버를 정말로 취소하시겠습니까?") ){
	           		$.ajax({
	           			url:"delwmem.pr",
	           			data:{
	           				projNo:$(this).parent().siblings(".proNo").children(".projNo").val(),
	           				memNo:$(this).val()
	           			},
	           			success:function(result){
	           				alert(result);
	           				$(".waitingMember").click();
	           			},
	           			error:function(){
	           				console.log("멤버 초대 취소 실패")
	           			}
	           		})
           		}
           	})	
           </script>
                
                
            <div class="filter-area" style="padding-left:10px; float:right">
            	<span class="filter" style="text-decoration:none;color:black;font-size:small;color:gray;" onclick="loadMemberList();">현재 멤버 총원 조회</span>
                <span class="filter" style="margin-left:20px;">빠른 조회</span>
                <select id="filterRole" name="memRole" class="filter">
                    <option class="role" value="all" selected>전체</option>
                    <option class="role" value="팀장">팀장</option>
                    <option class="role" value="관리자">관리자</option>
                    <option class="role" value="일반멤버">일반멤버</option>
                </select>
                
                <script>

                
					 $("#filterRole").change(function(){
						 if( $(this).val() == 'all' ){
							 loadMemberList();
						 }else{
							 $.ajax({
							 	url:"byrole.pr",
							 	data:{
							 		projNo:$("#projNo").val(),
							 		memRole:$("select[name=memRole]").val()
							 	},
							 	success:function(mlist){
									let html = "";
									console.log(mlist);
									
									for(let i=0; i<mlist.length; i++){
										html += '<tr>'
											  +		'<td class="memNo">' + mlist[i].memNo + '</td>'
											  +		'<td class="memRole">' + mlist[i].memRole + '</td>'
											  +		'<td class="memName">' + mlist[i].memName + '</td>'
											  +		'<td class="department">' + mlist[i].department + '</td>'
											  +		'<td class="email">' + mlist[i].email + '</td>'
											  +		'<td class="phone">' + mlist[i].phone + '</td>'
											  +		'<td><button class="btn btn-sm btn-modal">수정</button></td>'
											  + '</tr>'
									}
									$("#member-list").html(html);
							 	}
							 })
						 }
					 })               
                </script>
                <button class="openModal" data-bs-toggle="modal" data-bs-target="#exampleModal" id="#editModal" style="display:none;"></button>
            </div>
            
            
			<!-- 어차피 필터, 검색 기능하려면 리스트를 AJAX로 띄우니까, 애초에 AJAX로 띄우자 -->
			<script>
			console.log( $("#projNo").val() )
			function loadMemberList(){
				$.ajax({
					url:"mlist.pr",
					data:{
						projNo:$("#projNo").val()
					},
					success:function(mlist){
						let html = "";
						console.log(mlist);
						
						for(let i=0; i<mlist.length; i++){
							html += '<tr>'
								  +		'<td class="memNo">' + mlist[i].memNo + '</td>'
								  +		'<td class="memRole">' + mlist[i].memRole + '</td>'
								  +		'<td class="memName">' + mlist[i].memName + '</td>'
								  +		'<td class="department">' + mlist[i].department + '</td>'
								  +		'<td class="email">' + mlist[i].email + '</td>'
								  +		'<td class="phone">' + mlist[i].phone + '</td>'
								  +		'<td><button class="btn btn-sm btn-modal">수정</button></td>'
								  + '</tr>'
						}
						$("#member-list").html(html);
					},
					error:function(){
						console.log("멤버 리스트 조회..실패...")
					}
				})
			}
			
			$(function(){
				/* 페이지가 로드되자마자 함수 호출 */ 
				loadMemberList(); 
			})
		</script>
            <br>
            
            <script>
            	$(document).on("click", ".btn-modal", function(){
            		$("#editmem-name").text( $(this).parent().siblings(".memName").text() );
            		$("input[name=memNo]").val( $(this).parent().siblings(".memNo").text() );
            		$(".openModal").click();
            	})	
            </script>
            
            <br><br>
            
            <table class="table" >
                <thead>
                    <tr>
                        <th width="10%;">사번</th>
                        <th width="10%;">역할</th>
                        <th width="10%;">이름</th>
                        <th width="10%;">부서</th>
                        <th width="25%;">이메일</th>
                        <th width="25%">전화번호</th>
                        <th width="10%;">관리</th>
                    </tr>
                </thead>
                <tbody id="member-list">
                	<%-- AJAX로 리스트 띄울 것임 --%>
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
                        <span id="editmem-name"></span>
                        <br><br>
                        <span class="title">역할</span><br>
                        <!-- 현재 해당 사원의 역할에 따라 selected 속성 주기 -->
                        <select name="memRole" id="editmem-role" class="filter" style="color:black;" required>
                        	<option>팀장</option>
                            <option>관리자</option>
                            <option>일반멤버</option>
                        </select>
                        <br><br>
                        <span class="title">멤버 삭제</span><br>
                        <input type="hidden" name="memNo">
                        <button class="btn btn-sm btn-imp" onclick="deleteMem();">해당 멤버를 삭제하겠습니다.</button>
                    </div>
                    <div class="modal-footer">
                        <button type="button" id="byeModal" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-success" onclick="updateMem();">확인</button>
                    </div>
                </div>
            </div>
        </div>
        

        <script>
        
            function updateMem(){
				$.ajax({
					url:"updateme.pr",
					data:{
						/* ProjectMember m 객체로 넘겨 */
					    memRole:$("select[name=memRole]").val(),
					    projNo:$("#projNo").val(),
					    memNo:$("input[name=memNo]").val()
					},
					success:function(result){
						alert(result);
						loadMemberList();
					},
					error:function(){
						console.log("AJAX 통신 실패");
					}
				})
            }

            function deleteMem(){
            	if( confirm("정말로 삭제하시겠습니까?") ){
	                $.ajax({
	                    url:"deleteme.pr",
	                    data:{
	                    	/* Project p 객체로 넘겨 */
	                        projNo:$("#projNo").val(),
	                        memNo:$("input[name=memNo]").val()
	                    },
	                    success:function(result){
	                    	alert(result);
							$("#byeModal").click();
	                    	loadMemberList();
	                    },
	                    error:function(){
	                    	console.log("삭제실패다");
	                    }
	                })
            	}
            }
        </script>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
