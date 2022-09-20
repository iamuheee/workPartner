<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- css  -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/emailCss/email1.css">

</head>
<body>
	<jsp:include page="../common/menubar.jsp"></jsp:include>

    <div style="height: 20px;"></div>

    <div class="ntOuter">

        <div class="ntContainer">
           
            <div class="ntMenu1">            
                <span style="font-size: 18px;"><b>전체메일함</b></span>
            </div>
                
            <!-- 검색 및 필터링-->
            <div class="ntMenu2">
               
                <table>
                    <tr>
                        <td>
                            <select name="searchCategory" id="searchCategory">
                                <option value="mailSenderName" selected>보낸사람</option>
                                <option value="mailTitle">제목</option>
                                <option value="mailContent">내용</option>
                            </select>
                        </td>
                        <td>
                            <input type="text" placeholder="내용을 입력해주세요" maxlength="20" name="keyword" id="keyword">
                        </td>       
                        <td> &nbsp; 기간: &nbsp;</td>                 
                        <td>
                            <select name="filter" id="filter">
                                <option value="periodTotal" selected>전체기간</option>
                                <option value="6months">6개월</option>
                                <option value="1month">1개월</option>
                                <option value="1week">1주일</option>
                            </select>
                        </td>
                        <td>
                            <select name="orderEmail" id="orderEmail">
                                <option value="orderDsec" selected>최신순</option>
                                <option value="orderAsc">받은일자순</option>                    
                            </select>
                        </td>
                        <td>
                            <button type="button" class="btn btn-sm btn-secondary btnSize" onclick="selectTotalList();">검색</button>
                        </td>
                    </tr>

                </table>       
               
            </div>
            

            <div class="ntMenu3">

                &nbsp;&nbsp; <input type="checkbox" name="" id="cbx_chkAll"> &nbsp;&nbsp;
               
                <button type="button" class="btn btn-sm btn-danger" onclick="deleteEmailGroup();">삭제</button>                

                <button type="button" class="btn btn-sm btn-primary" onclick="readEmailGroup();">읽음</button>

                <button type="button" class="btn btn-sm btn-warning" onclick="starOnEmailGroup();">
                   <span style="color:white"> ★</span>
                </button>

                <button type="button" class="btn btn-sm btn-light" onclick="starOffEmailGroup();">
                    <span> ★</span>
                </button>

            </div>
    
            <!-- 테이블 -->
            <div class="ntMain">
                <!-- 중요메일함 버튼 클릭하면 class 효과를 달리주고 =>  db에 star부분 y,n처리 -->
                <table class="table" id="emailTable">
                   <thead>
                        <tr>
                            <th width="20px"></th>
                            <th width="10px"></th>
                            <th width="10px"></th>
                            <th width="10px"></th>
                            <th width="60px">번호</th>
                            <th>보낸사람</th>
                            <th>제목</th>
                            <th>날짜</th>
                        </tr>
                   </thead>
                   
                   <tbody>
                                          
                     
                   </tbody>
                   

                </table>

    
            </div>
    
            <!-- 페이징 -->
            <div class="ntPasing"  align="center" style="display:inline">
                
            </div>
    
        </div>

        
    </div>

    <script>
    
   	 	
   	 	
   	 	$(function(){
   	 	
   	 		// 처음 조회될 테이블 (검색전+후 모두 가능)
   	 		selectTotalList();
   	 		
   	 		// 상세페이지 + 체크박스와 tr요소 분리	         
	         $("#emailTable").on("click", "tr", function(){	         	
	        	location.href = 'detail.ma?no=' + $(this).find(".no").text()+'&mailEmail=' +$(this).find(".mailEmail").val();
	         })
	         $("#emailTable").on("click", ".chk", function(event){
	        	
	        	// 체크박스 클릭해도 tr 클릭이벤트가 발생안하도록
	        	event.stopPropagation();
	        	
	        	// 전체체크 + 개별 체크 갯수비교
	        	// => 전체체크 후 개별 체크로 해제시 전체체크 해제
	        	var total = $("input[name=chk]").length;	     	
		     	var checked = $("input[name=chk]:checked").length;		     	
		     	if(total != checked) $("#cbx_chkAll").prop("checked", false);
		        else $("#cbx_chkAll").prop("checked", true); 
	         })
	        
   	 	});
   	 	
   	 	/*
   	 		다중체크박스  전체선택
   	 	*/
	   	 $("#cbx_chkAll").click(function() {
	         if($("#cbx_chkAll").is(":checked")) $("input[name=chk]").prop("checked", true);
	         else $("input[name=chk]").prop("checked", false);
	     });
				
   	 	// 전체메일함 조회
   	 	function selectTotalList(cpage){
   	 		
   	 		$.ajax({
   	 			url:"selectTotal.ma",   			
   	 			data:{
   	 				email:"${loginUser.empEmail}",
   	 				cpage:cpage,
   	 				searchCategory:$("#searchCategory option:selected").val(),
   	 				keyword:$("#keyword").val(),
   	 				filter:$("#filter option:selected").val(),
   	 				orderEmail:$("#orderEmail option:selected").val()   	 				
   	 			},
   	 			success:function(result){
   	 				let list = result.list;
   	 				let pi = result.pi;
   	 				let value = "";
   	 				let pageValue ="";
   	 				
   	 				if(list.length == 0){
   	 					value += "<tr>"
   	 						  + 	"<td colspan='8'>조회된 메일이 없습니다.</td>"
   	 						  +  '</tr>';
   	 				}else{
	   	 				for(let i=0; i<list.length; i++){
	   	   	 				value += '<tr>'
	   				               +     '<td>'
	   	   	 					   +		'<input type="checkbox" class="chk" name="chk" value="'+ list[i].mailNo +'">'
	   	   	 					   +		'<input type="hidden" class="mailEmail" name="mailEmail" value="'+ list[i].mailEmail +'">'
	   	   	 					   +		'<input type="hidden" class="mailCategory" name="mailCategory" value="'+ list[i].mailCategory +'">'	   	   	 					   
	   	   	 					   +	'</td>'                
	   				               +     '<td>'
	   				               +         '<span class="material-symbols-outlined"';
	   				        if(list[i].mailStar == 'Y'){
	   				        	 value += 		'style="color:rgba(250, 208, 0, 0.99)"';
	   				        }       			         			        	
	   				        	 value +=          '>grade'
	   				               +         '</span>'
	   				               +     '</td>'
	   				               +     '<td>'
	   				               +         '<span class="material-symbols-outlined "';
	   				        if(list[i].mailRead == 'N'){
	   				        	 value += 'style="color:rgb(14, 168, 14)"';
	   				         }     			               
	   				         value +=            '>mail'
	   				               +         '</span>'
	   				               +     '</td>'
	   				               +     '<td>'
	   				               +          '<span class="material-symbols-outlined ">';
	   				       if(list[i].mailFile == 'Y') {
	   				         	value +=    	 'attach_file';	   				              		    	   
	   				       }    			               
	   				         value +=			'</span>'   
	   				        	   +	'</td>'
	   				               +     '<td class="no">' + list[i].mailNo + '</td>'
	   				               +     '<td>'+ list[i].mailSenderName + '</td>'
	   				               +     '<td class="emailTitle">';
	   				       if(list[i].mailSecurity == 'S'){
	   				        	 value +=	  '<span class="borderStyle">기밀</span>'; 
	   				       }  
	   				       	 value += '&nbsp'+ list[i].mailTitle +'';
	   				       if(list[i].mailImportant == 'I'){
	   				       		 value +=	  '<span style="color:red">!</span>';		    	   
	   				       }	 
	   				       	 value += 	'</td>'
	   				               +     '<td>'+ list[i].mailCreateDate + '</td>'
	   				               + '</tr>';  
	   	   	 			}  
   	 				  
	   	 				if(pi.currentPage != 1){
	            			pageValue += "<button class='btn btn-sm btn-outline-primary' onclick='selectTotalList("  + (pi.currentPage - 1) + ")'>&lt;</button>"	
	            		}
	            		
	            		for(let p=pi.startPage; p<=pi.endPage; p++) { 
	    				   
	    		   			if(p == pi.currentPage) { 
	    				   			pageValue += "<button class='btn btn-sm btn-outline-primary' disabled>"  + p  + "</button>"
	    				   	}else {
	    				   			pageValue += "<button class='btn btn-sm btn-outline-primary' onclick='selectTotalList(" + p +")'>" + p + "</button>"
	    		           	} 
	    		         }     
	             
	    		         if(pi.currentPage != pi.maxPage) {
	    		        	  pageValue +=	"<button class='btn btn-sm btn-outline-primary' onclick='selectTotalList("+ (pi.currentPage + 1) + ")'>&gt;</button>"
	    		         }  
    		         	    		       	    		         
   	 				} 	 				   	 				
	    		         $("#emailTable tbody").html(value);
	    		         $(".ntPasing").html(pageValue);   	 				
   	 			},
   	 			error:function(){
   	 				console.log("전체메일함 조회용 ajax실패");
   	 			}
   	 		})
   	 	}
   	 	
   	 	// 1-1 다중선택 => 휴지통
   	 	// 만약 체크안한상태로 클릭시 안넘어가도록 조건처리
   	 	function deleteEmailGroup(){
   	 		var arr = new Array();
	   	 	$("input[name='chk']:checked").each(function(){
	    		arr.push(($(this).val()));      // 값담아서          		
	    	});
	   	 	
		   	 if(arr.length > 0){ // 체크된 요소들이 있다면 arr.length > 0 일 것
	     		ajaxDeleteEmailGroup(arr);
		     }else{
		     		alert("메일을 선택해주세요");
		     }
   	 	}
   	 	
   	 	// 1-2 휴지통함으로 이동
   	 	function ajaxDeleteEmailGroup(arr){
   	 		
   	 		if(confirm( arr.length + "개의 메일을 삭제하시겠습니까? ")){
   	 			
   	 			//메일 구분을 위해서는 1.메일번호 2.받은사람 이메일 3.메일종류(받은메일,보낸메일,참조메일) 
   	 		
   	 			let arr = new Array();
   	 			
	   	 		$("input[name='chk']:checked").each(function(){			
	   	 		
	   	 		// ==> 최종 : "/" 문자열로 여며서 담기 ["66,xxxx@gmail.com,S", "", "", ...]
		   	 		const obj = $(this).val() + "/" + 
		   	 					$(this).next().val() + "/" + 
		   	 					$(this).next().next().val();
   	 				arr.push(obj);  	 				
   	 				
	   	 		}); 
   	 				   	 		
   	 			$.ajax({
   	 				url:"deleteEmailGroup.ma",
   	 				type:"post",
   	 				traditional:true,
   	 				data: {
   	 					// 생각1. arr배열에 각각 
   	 					//arrMailNo:arrMailNo,
   	 					//arrEmail:arrEmail
   	 					  
   	 					// 생각2. [{메일번호,받는사람이메일,메일종류},{},{},..] 로 담아서 넘기기
   	 					
   	 					// 쌤 => ["66,xxxx@gmail.com,S", "", "", ...]
   	 					arr:arr
   	 				},
   	 				success:function(result){
   	 					
 						alert("메일이 삭제되었습니다.");
 						// 전체조회
 						selectTotalList();
 						
 						// 혹시 전체체크됐을때 기능 후 체크가 사라지도록
				        $("#cbx_chkAll").prop("checked", false);
   	 					
   	 				},
   	 				error:function(){
   	 					console.log("메일함 메일삭제용 ajax 실패");
   	 				}
   	 			})  
   	 		}
   	 	}
   	 	
   		// 2-1 다중선택 => 읽음처리
   	 	// 만약 체크안한상태로 클릭시 안넘어가도록 조건처리
   	 	function readEmailGroup(){
   	 		var arr = new Array();
	   	 	$("input[name='chk']:checked").each(function(){
	    		arr.push(($(this).val()));                		
	    	});
	   	 	
		   	 if(arr.length > 0){
	     		ajaxReadEmailGroup(arr);
		     }else{
		     		alert("메일을 선택해주세요");
		     }
   	 	}
   	 	
   	 	// 2-2 읽음처리하는 ajax
   	 	function ajaxReadEmailGroup(arr){
   	 		
   	 		if(confirm( arr.length + "개의 메일을 읽음처리하시겠습니까? ")){
   	 			
   	 			//메일 구분을 위해서는 1.메일번호 2.받은사람 이메일 3.메일종류(받은메일,보낸메일,참조메일) 
   	 		
   	 			let arr = new Array();
   	 			
	   	 		$("input[name='chk']:checked").each(function(){				   	 		
		   	 		const obj = $(this).val() + "/" + 
		   	 					$(this).next().val() + "/" + 
		   	 					$(this).next().next().val();
   	 				arr.push(obj);  
	   	 		}); 
   	 				   	 		
   	 			$.ajax({
   	 				url:"readEmailGroup.ma",
   	 				type:"post",
   	 				traditional:true,
   	 				data: {   	 					
   	 					arr:arr
   	 				},
   	 				success:function(result){
   	 					 						
 						// 전체조회
 						selectTotalList();
 						
 						// 혹시 전체체크됐을때 기능 후 체크가 사라지도록
				        $("#cbx_chkAll").prop("checked", false);
   	 					
   	 				},
   	 				error:function(){
   	 					console.log("읽음처리용 ajax 실패");
   	 				}
   	 			})  
   	 		}
   	 	}
   	 	
   		// 3-1 다중선택 => 중요메일함IN
   	 	// 만약 체크안한상태로 클릭시 안넘어가도록 조건처리
   	 	function starOnEmailGroup(){
   	 		var arr = new Array();
	   	 	$("input[name='chk']:checked").each(function(){
	    		arr.push(($(this).val()));  // checkbox의 value를 메일no를 담았음              		
	    	});
	   	 	
		   	 if(arr.length > 0){ // 만약 그 체크된 value가 담긴 arr의 길이가 0이상이라면 체크된거!
		   		ajaxStarOnEmailGroup(arr); // 위에 확인용으로 담은것뿐 data로 쓰지 않는다 
		     }else{
		     		alert("메일을 선택해주세요");
		     }
   	 	}
   	 	
   	 	// 3-2 중요메일함IN ajax
   	 	function ajaxStarOnEmailGroup(arr){
   	 		
 			//메일 구분을 위해서는 1.메일번호 2.받은사람 이메일 3.메일종류(받은메일,보낸메일,참조메일)    	 		
 			let arrOn = new Array();
  	 			
   	 		$("input[name='chk']:checked").each(function(){				   	 		
	   	 		const obj = $(this).val() + "/" + 
	   	 					$(this).next().val() + "/" + 
	   	 					$(this).next().next().val();
	   	 		arrOn.push(obj);  
   	 		}); 
  	 				   	 		
 			$.ajax({
 				url:"starOnEmailGroup.ma",
 				type:"post",
 				traditional:true,
 				data: {   	 					
 					arr:arrOn
 				},
 				success:function(result){   	 					 						
				// 전체조회
				selectTotalList(); 
				
				// 혹시 전체체크됐을때 기능 후 체크가 사라지도록
		        $("#cbx_chkAll").prop("checked", false);
				
 				},
 				error:function(){
 					console.log("중요메일함In용 ajax 실패");
 				}
 			})     	 		
   	 	}
   	 	
   		// 4-1 다중선택 => 중요메일함OUT
   	 	// 만약 체크안한상태로 클릭시 안넘어가도록 조건처리
   	 	function starOffEmailGroup(){
   	 		var arr = new Array();
	   	 	$("input[name='chk']:checked").each(function(){
	    		arr.push(($(this).val()));                		
	    	});
	   	 	
		   	 if(arr.length > 0){
		   		ajaxStarOffEmailGroup(arr);
		     }else{
		     		alert("메일을 선택해주세요");
		     }
   	 	}
   	 	
   	 	// 4-2 중요일함OUT ajax
   	 	function ajaxStarOffEmailGroup(arr){
   	 		
 			//메일 구분을 위해서는 1.메일번호 2.받은사람 이메일 3.메일종류(받은메일,보낸메일,참조메일)    	 		
 			let arrOff = new Array();
  	 			
   	 		$("input[name='chk']:checked").each(function(){				   	 		
	   	 		const obj = $(this).val() + "/" + 
	   	 					$(this).next().val() + "/" + 
	   	 					$(this).next().next().val();
	   	 		arrOff.push(obj);  
   	 		}); 
  	 				   	 		
 			$.ajax({
 				url:"starOffEmailGroup.ma",
 				type:"post",
 				traditional:true,
 				data: {   	 					
 					arr:arrOff
 				},
 				success:function(result){   	 					 						
				// 전체조회
				selectTotalList();   	 
				
				// 혹시 전체체크됐을때 기능 후 체크가 사라지도록
		        $("#cbx_chkAll").prop("checked", false);
				
 				},
 				error:function(){
 					console.log("중요메일함Out용 ajax 실패");
 				}
 			})     	 		
   	 	}
   	 	
   	 	
   	 	
   	 	
    </script>

</body>
</html>