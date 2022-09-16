<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
 	#mypage-outer {
	    /* border:1px solid blue;  */
	    width:100%;
	    height:100vh;	/* 스크롤 안 생기게 하려면 100%로 수정 */
   	    margin:auto;
	    padding:10px;
	    position:relative;
	}
		
	#empListArea {
		width:100%;
		/* border:1px solid red; */
	}
	
	#empList {
	    width:100%;
	    font-size:13.5px;
	}
			
	#insertEmp input{
	    width:100px;
	    font-size:14px;
	    margin:0;
	}
	
	#insertEmp select {
	    width: 50px;
	   	font-size:14px;
	}
	
	#insertEmp input, select {
	    height:25px;
	    border: 1px solid #b7b9cc;
	}
	
	#sort-search {
		display:flex;
		justify-content:space-between;
	}
	
	
	#searchArea #condition, #keyword {
	    border:1px solid #b7b9cc;
	}
	
	#searchArea {
	    display: flex;
	    justify-content: flex-end;
	    margin-bottom:20px;
	}
	
	#pagingArea {
	    width: fit-content;
	    margin: auto;
	    margin-top:30px;
	}
	
	.page-link {
	    color:#0442AF;
	}
	
	.empIdArea {
	    cursor: pointer;
	}
	
	.modal-body #empInfo {
	    margin:auto;
	}
	
	#empInfo {
	    width:100%;
	}
	
	#empInfo th{
	    height: 70px;
	    width: 15%;
	    font-size:16px;
	}
	
	#empInfo td {
	    width: 35%;
	    
	}
	
	#empInfo input {
	    width:300px;
	    height:40px;
	    padding-left:10px;
	    border:1px solid #b7b9cc;
	}
	
	#empInfo select {
	    width: 200px;
	    height:40px;
	    border:1px solid #b7b9cc;
	    padding-left:10px;
	}
		
	#profileImg{
	    width:180px;
	    height:180px;
	    border:1px solid #b7b9cc;
	    border-radius: 50%;
	}
	
	#profile-box {
	    width:200px;
	    display: flex;
	    flex-direction: column;
	}
	

</style>
</head>
<body>

	<jsp:include page="../common/menubar.jsp" />

	<div id="mypage-outer">
	    <!-- 상단 메뉴 제목 영역 -->
	    <div id="mypage-header">
	        <h3>사용자 조회 · 수정</h3>
	    </div>
	    <hr>
	    <!-- 정렬 & 검색 영역 -->
	    <div id="sort-search">
	    	<select id="sortEmp" name="sort" onchange="selectList();" style="margin-right:10px;height:30px;">
	    		<option value="10">10명</option>
	    		<option value="20">20명</option>
	    		<option value="50">50명</option>
	    	</select>
	        <div id="searchArea">
	            <select id="condition" name="condition" style="margin-right:10px;height:30px;">
	                <option value="empNo">사번</option>
	                <option value="empName">이름</option>
	                <option value="empId">아이디</option>
	            </select>
	            <input type="text" id="keyword" name="keyword" style="height:30px;margin-right:3px">
	            <button type="button" class="btn btn-primary btn-sm" onclick="selectSearchList();"><i class="fa-solid fa-magnifying-glass"></i></button>
	        </div>
	    </div>	    
	    
	    <!-- 사용자(구성원) 계정 및 정보 목록 -->
	    <div id="empListArea">
	        <table id="empList" class="table table-hover">
	            <thead>
	                <tr>
	                    <th scope="col">사번</th>
	                    <th scope="col">이름<span style="color:red;">&nbsp;*</span></th>
	                    <th scope="col">아이디<span style="color:red;">&nbsp;*</span></th>
	                    <th scope="col">비밀번호<span style="color:red;">&nbsp;*</span></th>
	                    <th scope="col">입사일</th>
	                    <th scope="col">부서</th>
	                    <th scope="col">직위</th>
	                    <th scope="col">재직상태</th>
	                    <th scope="col">계정상태</th>
	                    <th scope="col" colspan="2">계정관리</th>
	                </tr>
	                <tr id="insertEmp">
	                    <td align="center" style="color:#007bff;">
	                        간편등록
	                    </td>
	                    <td>
	                        <input type="text" class="newEmp" id="empName" name="empName" placeholder="이름">
	                    </td>
	                    <td>
	                        <input type="text" class="newEmp" id="empId" name="empId" placeholder="아이디"><br>
	                        <span id="checkResult"></span>
	                    </td>
	                    <td>
	                        <input type="password" class="newEmp" id="empPwd" name="empPwd" placeholder="비밀번호">
	                    </td>
	                    <td>
	                        <input type="date" class="newEmp" id="empEnrollDate" name="empEnrollDate">
	                    </td>
	                    <td>
	                        <select class="newEmp" name="depCd" id="depCd" style="margin-right:20px; width:70px">
	                            <option value="1">인사부</option>
                                <option value="2">영업부</option>
                                <option value="3">마케팅부</option>
                                <option value="4">IT개발부</option>
                                <option value="5">재무회계부</option>
	                        </select>
	                    </td>
	                    <td>
	                        <select class="newEmp" name="posCd" id="posCd" required>
	                             <option value="1" disabled>대표</option>
                                 <option value="2" selected>부장</option>
                                 <option value="3">과장</option>
                                 <option value="4">대리</option>
                                 <option value="5">사원</option>
                                 <option value="6">인턴</option>
	                        </select>
	                    </td>
	                    <td>
	                        <select class="newEmp" name="empStatus" id="empStatus" required>
	                            <option value="Y">재직</option>
	                        </select>
	                    </td>
	                    <td colspan="2" align="center">
	                    	<div>
	                        	<button class="btn btn-primary btn-sm" id="insertEmpBtn" style="margin-right:5px;" onclick="insertEmployeeSimply();">저장</button>
	                        	<button class="btn btn-secondary btn-sm" onclick="deleteValue();">취소</button>
	                    	</div>
	                    	<script>
	                    		function deleteValue(){
	                    			$('input').val('');
	                    			$('#checkResult').hide();
	 					   		   	$('select').find('option:first').attr('selected', 'selected');
	                    		}
	                    	</script>
	                    </td>
	                </tr>
                </thead>
	            <tbody id="employeeList">
	            	<tr class="newEmp">
	            	</tr>
	            </tbody>
            </table>
	    </div>
	    
	    <!-- 페이징 처리 -->
        <div id="pagingArea">
        </div>  
	                
        <script>
			/* 전체 사원 조회 ==> 이 페이지의 모든 요소들이 로딩된 후에 바로 실행되어야 함 */
			/* 조회 메뉴를 눌렀을 때 jsp로 가게 하고, jsp의 모든 요소가 로딩된 다음에 컨트롤러로 가서 값 가져옴 */
			
			$(function(){
				selectEmpList();
			})
						
			/* 검색 전 - 후 실행할 함수 구분을 위한 조건 검사 */
			function selectList(){
				if($("#keyword").val() == ""){	// 검색하지 않은 전체 결과 조회
					selectEmpList();
				}else {	// 검색 결과 조회
					selectSearchList();
				}
			}
						
			/* 사용자 리스트 조회 + 페이징 처리 ajax */
			function selectEmpList(cpage){
					
					$.ajax({
						url:"listSelect.em",
						type:"post",
						data:{
							cpage:cpage,
							sort:$("#sortEmp option:selected").val()
						},
						success:function(result){
							//console.log(result);
							console.log("사용자 목록 조회용 ajax 통신 성공");
							
							let list = result.list;
							let pi = result.pi;
							
							var value = "";
							var pgValue = "";
							
							for(let i=0; i<list.length; i++) {
								
								value += '<tr>'
									   	+ '<td>' + list[i].empNo + '</td>'
									   	+ '<td>' + list[i].empName + '</td>'
									   	+ '<td><a data-toggle="modal" data-target="#updateEmp" class="empIdArea" onclick="selectEmployee(this);">' + list[i].empId + '</a></td>'
									   	+ '<td id="updatePwd">********</td>'
									   	+ '<td>' + list[i].empEnrollDate + '</td>'
									   	+ '<td>' + list[i].depCd + '</td>'
									   	+ '<td>' + list[i].posCd + '</td>';
									   	
									   	if(list[i].empStatus == 'Y') {
											value += '<td>재직</td>';
									   	}else {
									   		value += '<td>퇴사</td>';
									   	}
									   	
									   	if(list[i].empAccStatus == 'Y') {
									   		value += '<td>정상</td>';
									   	}else {
									   		value += '<td>휴면</td>';
									   	}
	                			
									   	if(list[i].empStatus == 'Y' && list[i].empAccStatus == 'Y') {
									   		value += '<td><button type="button" class="btn btn-secondary btn-sm" onclick="계정상태변경">정지</td>';
									   	}else if(list[i].empStatus == 'Y' && list[i].empAccStatus == 'N') {
									   		value += '<td><button type="button" class="btn btn-warning btn-sm" onclick="계정상태변경">복구</td>';
									   	}else {
									   		value += '<td><button type="button" class="btn btn-danger btn-sm" onclick="계정상태변경">삭제</td>';
									   	}
						   	}
							
							
							if(pi.currentPage != 1){
                       			pgValue += "<button class='btn btn-sm btn-outline-primary' onclick='selectEmpList("+ (pi.currentPage - 1) + ")'>&lt;</button>"	
                       		}
                       		
                       		for(let p=pi.startPage; p<=pi.endPage; p++) { 
               		   			if(p == pi.currentPage) { 
               				   			pgValue += "<button class='btn btn-sm btn-outline-primary' disabled>"  + p  + "</button>"
               				   	}else {
               				   			pgValue += "<button class='btn btn-sm btn-outline-primary' onclick='selectEmpList("+ p +")'>" + p + "</button>"
               		           	} 
               		         }     
                        
               		         if(pi.currentPage != pi.maxPage) {
               		        	  pgValue += "<button class='btn btn-sm btn-outline-primary' onclick='selectEmpList("  + (pi.currentPage + 1) + ")'>&gt;</button>"
               		         }  
							
							$("#employeeList").html(value);
							$("#pagingArea").html(pgValue);
							
							//console.log(pi.boardLimit);
						},
						error:function(){
							console.log("사용자 목록 조회용 ajax 통신 실패");
						}
					})
			  	}	
			
				/* 사용자 검색 ajax */
				function selectSearchList(cpage){
					
					if( $("#keyword").val().trim().length != 0 ) {	// 유효한 검색 키워드가 입력됐을 경우에만 ajax로 select 요청
						
						$.ajax({
							url:"search.em",
							type:"post",
							data:{
								condition:$("#condition option:selected").val(),
								keyword:$("#keyword").val(),
								cpage:cpage,
								sort:$("#sortEmp option:selected").val()
							},
							success:function(result){
								console.log("사용자 검색용 ajax 통신 성공");
								//console.log(result);
								
								var list = result.list;
								var pi = result.pi;
								
								//console.log(list);
								//console.log(pi);
								
								var value = "";
								var pgValue = "";
								
								if(list.length > 0) {	// 검색 결과가 있는 경우
									for(let i=0; i<list.length; i++) {
										
										value += '<tr>'
											   	+ '<td>' + list[i].empNo + '</td>'
											   	+ '<td>' + list[i].empName + '</td>'
											   	+ '<td id=""><a data-toggle="modal" data-target="#updateEmp" class="empIdArea" onclick="selectEmployee(this);">' + list[i].empId + '</a></td>'
											   	+ '<td id="updatePwd">********</td>'
											   	+ '<td>' + list[i].empEnrollDate + '</td>'
											   	+ '<td>' + list[i].depCd + '</td>'
											   	+ '<td>' + list[i].posCd + '</td>';
											   	
											   	if(list[i].empStatus == 'Y') {
													value += '<td>재직</td>';
											   	}else {
											   		value += '<td>퇴사</td>';
											   	}
											   	
											   	if(list[i].empAccStatus == 'Y') {
											   		value += '<td>정상</td>';
											   	}else {
											   		value += '<td>휴면</td>';
											   	}
			                			
											   	if(list[i].empStatus == 'Y' && list[i].empAccStatus == 'Y') {
											   		value += '<td><button type="button" class="btn btn-secondary btn-sm" onclick="계정상태변경">정지</td>';
											   	}else if(list[i].empStatus == 'Y' && list[i].empAccStatus == 'N') {
											   		value += '<td><button type="button" class="btn btn-warning btn-sm" onclick="계정상태변경">복구</td>';
											   	}else {
											   		value += '<td><button type="button" class="btn btn-danger btn-sm" onclick="계정상태변경">삭제</td>';
											   	}
								   	}
								
									if(pi.currentPage != 1){
		                       			pgValue += "<button class='btn btn-sm btn-outline-primary' onclick='selectSearchList("+ (pi.currentPage - 1) + ")'>&lt;</button>"	
		                       		}
		                       		
		                       		for(let p=pi.startPage; p<=pi.endPage; p++) { 
		               		   			if(p == pi.currentPage) { 
		               				   			pgValue += "<button class='btn btn-sm btn-outline-primary' disabled>"  + p  + "</button>"
		               				   	}else {
		               				   			pgValue += "<button class='btn btn-sm btn-outline-primary' onclick='selectSearchList("+ p +")'>" + p + "</button>"
		               		           	} 
		               		         }     
		                        
		               		         if(pi.currentPage != pi.maxPage) {
		               		        	  pgValue += "<button class='btn btn-sm btn-outline-primary' onclick='selectSearchList("  + (pi.currentPage + 1) + ")'>&gt;</button>"
		               		         }  
								
								}else {	// 검색 결과가 없는 경우
									value += '<tr align="center"><td colspan="10">검색 결과가 없습니다.</tr>'								
								}
								
								$("#employeeList").html(value);
								$("#pagingArea").html(pgValue);
								
							},
							error:function(){
								console.log("사용자 검색용 ajax 통신 실패");
							}
						})
						
					}else {	// 검색 키워드가 입력되지 않았을 경우
						alert("검색 키워드를 입력해 주세요.");
					}
				}
				
				/* 사용자 간편 등록 ajax */
				function insertEmployeeSimply() {
					if( $("#insertEmp input").val().trim().length != 0 ) {	// 모든 input 값이 들어있을 때만 실행 ==> input 
						$.ajax({
							url:"insertSimply.em",
							type:"post",
							data:{
								empName:$("#empName").val(),
								empId:$("#empId").val(),
								empPwd:$("#empPwd").val(),
								empEnrollDate:$("#empEnrollDate").val(),
								depCd:$("#depCd option:selected").val(),
								posCd:$("#posCd option:selected").val()
							},
							success:function(e){
								console.log("사용자 간단 추가용 ajax 통신 성공");
								//console.log(result);
								
								var value = "";
								
								value += '<td>' + e.empNo + '</td>'
							   		   + '<td>' + e.empName + '</td>'
							   		   + '<td><a data-toggle="modal" data-target="#updateEmp" class="empIdArea">' + e.empId + '</a></td>'
							   		   + '<td id="updatePwd">********</td>'
							   		   + '<td>' + e.empEnrollDate + '</td>'
							   		   + '<td>' + e.depCd + '</td>'
							   		   + '<td>' + e.posCd + '</td>';
							   	
					   		   selectEmpList();
					   		   
					   		   $('input').val('');
					   		   $('select').find('option:first').attr('selected', 'selected');
							},
							error:function(){
								console.log("사용자 간단 추가용 ajax 통신 실패");
							}
						})
					}else {
						alert("사용자 정보를 입력해 주세요.");
					}
				}
				
				/* 중복 아이디 체크 ajax */
				$(function(){
	    		const $idInput = $("#empList input[name=empId]");
	    		
	    		$idInput.keyup(function(){

	    			let regExp = /[A-Za-z0-9]+$/;
	    			
	    			if(regExp.test( $idInput.val() )) {	// 제대로 입력한 경우 ==> 중복확인
	    				$.ajax({
	    					url:"idCheck.em",
	    					type:"post",
	    					data:{checkId:$idInput.val()},
	    					success:function(result){
	    						console.log("id 중복 체크용 ajax 통신 성공");
	    						
	    						if(result == "NNNNN"){
	    							$("#checkResult").show();
	    							$("#checkResult").css("color", "red").text("사용 중인 아이디");
	    							$("#insertEmpBtn").attr("disabled", true);
	    							
	    						}else {
	    							$("#checkResult").show();
	    							$("#checkResult").css("color", "green", "bold").text("사용 가능");
	    							$("#insertEmpBtn").removeAttr("disabled");
	    						}
	    					},error:function(){
	    						console.log("id 중복 체크용 ajax 통신 실패")
	    					}
	    				})
	    				
	    			}else {	// 영문자+숫자 외 다른 문자를 입력한 경우
	    				$("#checkResult").show();
	    				$("#checkResult").css("color", "blue").text("알파벳, 숫자만 가능");
	    				$("#insertEmpBtn").attr("disabled", true);
	    			}
	    		})
	    	})
	    	
	    	/* 사용자 정보 조회 ajax */
	    	function selectEmployee(empId){
					$.ajax({
						url:"select.em",
						type:"post",
						data:{
							empId:$(empId).text()
						},
						success:function(result){
							console.log("사용자 정보 조회용 ajax 통신 성공");
							//console.log($(empId).text());	// 클릭한 아이디가 컨트롤러로 정상적으로 넘어감
							
							var e = result.e;
							var d = result.d;
							var p = result.p;
							
							//console.log(e);
							//console.log(d);
							//console.log(p);
							
							var headerValue = '';
							var value = "";
							
							headerValue += '<h4 class="modal-title">사용자 정보 - ' + e.empName + ' (' + e.depCd + ' / ' + e.posCd + ')</h4>'
			                    		 + '<button type="button" class="close" data-dismiss="modal">&times;</button>'; 
							
							value += '<tr>'
                            	   +	'<th width="150px">이름</th>'
                            	   +	'<td width="300px">' + e.empName + '</td>'
                            	   +	'<th width="150px">프로필 사진</th>'
                            	   +	'<td rowspan="3">'
                                   +		'<div id="profile-box">'
                                   +			'<img id="profileImg" src="' + e.empProfile + '"><br>'
                                   +		'</div>'
                            	   +	'</td>'
                        		   + '</tr>'
                        		   + '<tr>'
                            	   +	'<th>사번</th>'
                            	   +	'<td>' + e.empNo + '</td>'
                        		   + '</tr>'
                        		   + '<tr>'
                            	   + 	'<th >아이디</th>'
                            	   +	'<td id="modalEmpId">' + e.empId + '</td>'
                        		   + '</tr>'
                        	       + '<tr>'
                            	   +	'<th>이메일</th>'
                            	   +	'<td>' + e.empEmail + '</td>'
                                   + 	'<th>재직 상태&nbsp;<i class="fa-solid fa-eraser"></i></th>'
                            	   +	'<td>'
                                   +		'<select name="empStatus" id="modalStatus" required>';
                                   
                                   if(e.empStatus == 'Y'){
                                	   value += '<option value="Y" selected>재직</option>'
                                	   		  + '<option value="N">퇴사</option>';
                                   }else {
                                	   value += '<option value="Y">재직</option>'
                             	   		  	  + '<option value="N" selected>퇴사</option>';
                                   }
                            
                                   value +=		'</select>'
                            	   +	'</td>'
                        		   + '</tr>'
                        		   + '<tr>'
                            	   + 	'<th>부서&nbsp;<i class="fa-solid fa-eraser"></i></th>'
                            	   +	'<td>'
                            	   +		'<select name="depCd" id="modalDepCd" style="margin-right:20px" required>';
                            	   
                            	   // 현재 이 사람이 속한 부서의 option이 selected 된 상태로 보여야 함
                            	   for(let i=0; i<=4; i++) {
                            		   if(e.depCd == d[i].departmentName) {
                            			   value += '<option value="' + (i+1) + '" selected> ' + d[i].departmentName + '</option>';
                            		   }else {
                            			   value += '<option value="' + (i+1) + '"> ' + d[i].departmentName + '</option>';
                            		   }
                            	   }
                            	   
                            value +=		'</select>'
                            	   +	'</td>'
                            	   +	'<th>직위&nbsp;<i class="fa-solid fa-eraser"></i></th>'
                            	   +	'<td>'
                                   +		'<select name="posCd" id="modalPosCd" style="margin-right:20px" required>';
                            
                            	   // 현재 이 사람의 직위인 option이 selected 된 상태로 보여야 함
                            	   for(let i=0; i<=5; i++) {
                            		   if(p[i].positionName == "대표") {
                            			   value += '<option value="' + (i+1) + '" disabled> ' + p[i].positionName + '</option>';
                            		   }else if(e.posCd == p[i].positionName) {
                            			   value += '<option value="' + (i+1) + '" selected> ' + p[i].positionName + '</option>';
                            		   }else {
                            			   value += '<option value="' + (i+1) + '"> ' + p[i].positionName + '</option>';
                            		   }
                            	   }
                            	   
                            value +=		'</select>'
                            	   +	'</td>'
                        		   + '</tr>'
                        	       + '<tr>'
                            	   +	'<th>입사일</th>'
                            	   +	'<td>' + e.empEnrollDate + '</td>'
                            	   +	'<th>퇴사일&nbsp;<i class="fa-solid fa-eraser"></i></th>'
                            	   +	'<td>';
                            	   
                            	   if(!e.empRetireDate) {	// NaN이 옆에 뜨는데 왜그러는지 확인하기
                            		   value += '<input type="date" name="empRetireDate">';
                            	   }else {
                            		   value += e.empRetireDate; 
                            	   }
                            	   
                            value +=		
                            	   +	'</td>'
                        		   + '</tr>'
                        	  	   + '<tr>'
                            	   +	'<th>내선번호&nbsp;<i class="fa-solid fa-eraser"></i></th>'
                            	   +	'<td>';
                        	  	   
                            	   // 이 사용자의 내선번호가 등록돼 있다면 기본 값으로 보여야 함
                        	  	   if(!e.empExtension) {
                        	  		   value += '<input type="phone" id="empExtension" name="empExtension">';
                        	  	   }else {
                            		   value += '<input type="phone" id="empExtension" name="empExtension" placeholder="' + e.empExtension + '">';
                        	  	   }
                            	   
                            value +=	'</td>'
                            	   +	'<th>휴대전화&nbsp;<i class="fa-solid fa-eraser"></i></th>'
		                           +	'<td>';
		                        
		                           // 이 사용자의 휴대전화번호가 등록돼 있다면 기본 값으로 보여야 함
                        	  	   if(!e.empPhone) {
                        	  		   value += '<input type="phone" id="empPhone" name="empPhone">';
                        	  	   }else {
                            		   value += '<input type="phone" id="empPhone" name="empPhone" placeholder="' + e.empPhone + '">';
                        	  	   }
                            value +=	'</td>'
                        		   + '</tr>';
                        	
                     		$(".modal-header").html(headerValue);
                     		$("#empInfo").html(value);
                     		
						},
						error:function(){
							console.log("사용자 정보 조회용 ajax 통신 실패");
						}
						
					})
				}
				
				/* 사용자 정보 수정 ajax  */
				function updateEmployee(){
					$.ajax({
						url:"update.em",
						type:"post",
						data:{
							empId:$("#modalEmpId").text(),
							empStatus:$("#modalStatus option:selected").val(),
							depCd:$("#modalDepCd option:selected").val(),
							posCd:$("#modalPosCd option:selected").val(),
							empRetireDate:$("input[name=empRetireDate]").val(),
							empExtension:$("input[name=empExtension]").val(),
							empPhone:$("input[name=empPhone]").val()
						},
						success:function(result){
							console.log("사용자 정보 수정용 ajax 성공");
							console.log(result);
							if(result == 'success') {
									// 전체 사용자 목록 조회
									selectEmpList();
							}
						},
						error:function(){
							console.log("사용자 정보 수정용 ajax 실패");
						}
					})
				}
				
		        </script> 

<!-- 아이디 클릭 시 뜨는 모달 ==> 사용자 정보 수정 -->
    <div class="modal fade" id="updateEmp" aria-hidden="true">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">사용자 정보 - 사용자 이름</h4>
                    <button type="button" class="close" onclick="$('#updateEmp').modal('hide');" aria-label="Close">
                    	<span aria-hidden="true">&times;</span>
                    </button> 
                </div>

                    <!-- Modal Body -->
                    <div class="modal-body">
                        <table id="empInfo">
                        </table>
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" style="margin-right:5px;" onclick="updateEmployee();" data-dismiss="modal">수정</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                    </div>
            </div>
        </div>
    </div>
</body>
</html>