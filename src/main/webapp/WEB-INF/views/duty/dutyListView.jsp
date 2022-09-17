<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
     <meta charset="utf-8" />
     <meta http-equiv="X-UA-Compatible" content="IE=edge" />
     <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
     <meta name="description" content="" />
     <meta name="author" content="" />
     <title>WorkPartner!</title>
     <link href="css/styles.css" rel="stylesheet" />
     <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>

     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
     <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
     <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

     <style>
     	.cate-title{
     		font-weight:bolder;
     	}
	 	tr,td{
	 		text-align:center;
	 		padding-bottom:5px;
	 	}
	 	td{
	 		padding-top:10px;
	 		font-size:14px;
	 	}
		.filter{
		    font-size: small;
		    color: gray;
		}
		button.filter{
			font-weight:bold;
			height:20px;
			line-height:10px;
			border-radius:0px;
			border-right:1px solid gray;
		}
		.page-link *{
			color:gray;
			text-decoration:none;
		}
		.paging{
			margin-top:20px;
			float:right;
		}
     </style>
 
</head>
<body class="sb-nav-fixed">
   	<jsp:include page="../common/menubar.jsp" />
    
    <div id="content">
        <main>
            <div class="container-fluid px-4">
                <h2 class="mt-4 cate-title">개인 업무 <span style="font-size:18px;color:gray;">(${ dlist.size() })</span></h2>
                
                <form action="search.du" method="get" align="right" class="filter">
                    <input type="checkbox" name="exceptDone" id="exceptDone" onclick="doneFilter();">
                    <label for="exceptDone">완료 업무 제외</label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    
                    <select name="progress" class="filter">
                        <option selected>전체</option>
                        <option>준비</option>
                        <option>진행</option>
                        <option>지연</option>
                        <option>완료</option>
                    </select>
                    
                    <input type="hidden" name="empNo" value="${ loginUser.empNo }">
                    <input type="text" name="title" id="search" class="mb-3" style="border:1px solid lightgray;" required placeholder="업무명으로 검색">
                    <button class="btn btn-sm btn-secondary" style="margin-bottom:3px;line-height:10px;">검색</button>
                </form>
                
                <br>
                
                <div class="filter" align="center">
                    <button class="btn btn-sm filter" id="all" value="all" onclick="selectMine(this);">전체 업무</button> 
                    <button class="btn btn-sm filter" value="enroll" onclick="selectMine(this);">내 등록 업무</button> 
                    <button class="btn btn-sm filter" value="incharge" onclick="selectMine(this);" style="border:none;">내 담당 업무</button>
                </div>
				
				<hr style="height:0.1px; background-color:black">
				
                <table class="table-hover" id="duty-table" style="width:100%;">
                    <thead>
                        <tr>
                            <th width="5%">No</th>
                            <th width="40">업무명</th>
                            <th width="5%">중요도</th>
                            <th width="5%">상태</th>
                            <th width="10%">작성자</th>
                            <th width="15%">담당자</th>
                            <th width="10%">시작일</th>
                            <th width="10%">마감일</th>
                        </tr>
                    </thead>
                	<c:choose>
                		<c:when  test="${ not empty dlist }">
	                    <tbody id="original-tbody">
                		<c:forEach var="d" items="${ dlist }">
		                        <tr class="each-duty original-tr">
		                            <td class="dutyNo">${ d.dutyNo }</td>
		                            <td>${ d.title }</td>
		                            <td><span class="imp">${ d.importance }</span></td>
		                            <td><span class="prog">${ d.progress }</span></td>
		                            <td>${ d.empName }</td>
		                            <td>
		                            	${ d.empIC[0].empICName } <c:if test="${ d.empIC.size() != 1 }"> 외 ${ d.empIC.size() - 1 }명</c:if>
		                            </td>
		                            <td>${ d.startDate }</td>
		                            <td>${ d.endDate }</td>
		                        </tr>
                		</c:forEach>
	                    </tbody>
                		</c:when>
                		<c:otherwise>
                			<tbody>
                				<tr>
                					<td colspan="7">등록된 업무가 없습니다.</td>
                				</tr>
                			</tbody>
                		</c:otherwise>
                	</c:choose>
                </table>
				
				<br><br>
				
				<!-- 페이징 -->
				<div class="paging">
			    	<ul class="pagination">
						<li class="page-item">
					        <a class="page-link" href="list.du?cpage=${ pi.currentPage - 1 }" aria-label="Previous">
				          		<span aria-hidden="true">&laquo;</span>
					        </a>
						</li>
							<c:forEach var="no" begin="${ pi.startPage }" end="${ pi.endPage }" step="1">
								<li class="page-item"><a class="page-link" href="list.du?cpage=${ no }"><span>${ no }</span></a></li>
							</c:forEach>
						<li class="page-item">
							<a class="page-link" href="list.du?cpage=${ pi.currentPage + 1 }" aria-label="Next">
		  						<span aria-hidden="true">&raquo;</span>
							</a>
						</li>
				    </ul>
				</div>
				<div style="height:100px;"></div>
            </div>
        </main>
    </div>
    
    
    <script>
		// tbody의 tr 클릭하면 해당 업무번호의 detail.du?no=XX으로 이동
		$(".each-duty").click(function(){
			location.href = "detail.du?no=" + $(this).children(".dutyNo").text();
		})

		/////////////////////////////////////
		// 리스트 조회 필터 관련 스크립트 //
		
		// 다른 버튼 클릭시 완료 업무 제외 체크박스 해제되도록 
		$("button").click(function(){
			$("#exceptDone").prop("checked", false);
		})
		
		// 1) 완료 업무 제외
		function doneFilter(){
			let doneDuty = "";
			if( $("#exceptDone").is(":checked") ){
				$(".prog").each(function(){
					if( $(this).text() == "완료" ){
						doneDuty += $(this).parent().siblings(".dutyNo").text() + ",";
					}
				})
				
				// doneDuty는 숫자,숫자,숫자,숫자, 형태 (마지막이 무조건 ,로 끝남) => 맨 마지막 인덱스를 없애주자!
				doneDuty = doneDuty.substring(0, doneDuty.length-1);
				
				// AJAX로 완료가 아닌 (DUTY_NO = NOT IN ?) 업무만 조회해 Array에 담아 반환	
				let tr = "";
				let paging = "";
				$.ajax({
					url:"incomplete.du",
					data:{
						empNo:${loginUser.empNo},
						dutyNo:doneDuty,
						value:"notDone"
					},
					success:function(hashMap){
						// 기존에 있던 tbody의 tr요소를 모두 지우고 내가 원하는 tr요소만 띄우기
						$(".original-tr").hide();
						for(let i=0; i<hashMap.notDoneList.length; i++){
							tr += '<tr class="each-duty ajax-tr">'
								  + 	'<td class="dutyNo">' + hashMap.notDoneList[i].dutyNo  + '</td>'
								  +		'<td>' + hashMap.notDoneList[i].title + '</td>'
								  + 	'<td><span class="imp">' + hashMap.notDoneList[i].importance + '</span></td>'
								  + 	'<td><span class="prog">' + hashMap.notDoneList[i].progress + '</span></td>'
								  +		'<td>' + hashMap.notDoneList[i].empName + '</td>'
								  +		'<td>' + hashMap.notDoneList[i].empIC[0].empICName + '외 ' + (hashMap.notDoneList[i].empIC.length - 1) + '명</td>'
								  +		'<td>' + hashMap.notDoneList[i].startDate + '</td>'
								  +		'<td>' + hashMap.notDoneList[i].endDate + '</td>'
								  + '</tr>'
						}
						$("#original-tbody").html(tr);
						
						// 페이징바도 새로 해야함
						$(".page-item").hide();
						paging += '<li class="page-item">'
								+ 	'<a class="page-link" href="list.du?cpage=' + (hashMap.pi.currentPage - 1) + '" aria-label="Previous">'
								+		'<span aria-hidden="true">&laquo;</span>'
								+	'</a>'
								+ '</li>';
						
						for(let i=hashMap.pi.startPage; i<=hashMap.pi.endPage; i++){
							paging += '<li class="page-item"><a class="page-link" href="list.du?cpage=' + i + '"><span>' + i + '</span></a></li>'
						}
						paging += '<li class="page-item">'
								+ 	'<a class="page-link" href="list.du?cpage=' + (hashMap.pi.currentPage + 1) + '" aria-label="Previous">'
								+		'<span aria-hidden="true">&raquo;</span>'
								+	'</a>'
								+ '</li>';
						
						$(".pagination").html(paging);
						
					},
					error:function(){
						console.log("완료 업무 제외 AJAX 통신 실패");
					}
				})
			}else {
				location.reload();
			}
		}
		
		// 2) 테이블 중앙에 있는 필터 기능
		function selectMine(e){
			let tr = "";
			let paging = "";
			$.ajax({
				url:"myduty.du",
				data:{
					empNo:${loginUser.empNo},
					value:e.value,
				},
				success:function(hashMap){
					$(".original-tr").hide();
					for(let i=0; i<hashMap.mylist.length; i++){
						tr += '<tr class="each-duty ajax-tr">'
							+ 	'<td class="dutyNo">' + hashMap.mylist[i].dutyNo  + '</td>'
							+		'<td>' + hashMap.mylist[i].title + '</td>'
							+ 	'<td><span class="imp">' + hashMap.mylist[i].importance + '</span></td>'
							+ 	'<td><span class="prog">' + hashMap.mylist[i].progress + '</span></td>'
							+		'<td>' + hashMap.mylist[i].empName + ' </td>'
							+		'<td>' + hashMap.mylist[i].empIC[0].empICName ;

							if(hashMap.mylist[i].empIC.length > 1){
								tr += ' 외 ' + (hashMap.mylist[i].empIC.length - 1) + '명'
							} 
							  
						tr += '</td>'
							+		'<td>' + hashMap.mylist[i].startDate + '</td>'
							+		'<td>' + hashMap.mylist[i].endDate + '</td>'
							+ '</tr>'
					}
					$("#original-tbody").html(tr);
					
					// 페이징바도 새로 해야함
					$(".page-item").hide();
					paging += '<li class="page-item">'
							+ 	'<a class="page-link" href="list.du?cpage=' + (hashMap.pi.currentPage - 1) + '" aria-label="Previous">'
							+		'<span aria-hidden="true">&laquo;</span>'
							+	'</a>'
							+ '</li>';
					
					for(let i=hashMap.pi.startPage; i<=hashMap.pi.endPage; i++){
						paging += '<li class="page-item"><a class="page-link" href="list.du?cpage=' + i + '"><span>' + i + '</span></a></li>'
					}
					paging += '<li class="page-item">'
							+ 	'<a class="page-link" href="list.du?cpage=' + (hashMap.pi.currentPage + 1) + '" aria-label="Previous">'
							+		'<span aria-hidden="true">&raquo;</span>'
							+	'</a>'
							+ '</li>';
					
					$(".pagination").html(paging);
				},error:function(){
					console.log("필터 기능 AJAX 통신 실패");
				}
			})
		}
			
			
			
		
		///////////////////////////
		// 페이징 관련 스크립트 //

		// 1) pi.currentPage == 1인 경우, Previous 버튼 비활성화
		if( ${pi.currentPage} == 1 ){
			$("a[aria-label='Previous']").removeAttr("href");
		}
		
		// 2) pi.currentPage == pi.endPage인 경우, Next 버튼 비활성화
		if( ${pi.currentPage} == ${pi.endPage} ){
			$("a[aria-label='Next']").removeAttr("href");
		}
		
    
    </script>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" cossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
    <script src="js/datatables-simple-demo.js"></script>
</body>
</html>