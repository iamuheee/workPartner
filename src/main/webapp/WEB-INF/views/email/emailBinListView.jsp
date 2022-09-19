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
                <span style="font-size: 18px;"><b>휴지통</b></span>
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

               &nbsp;&nbsp; <input type="checkbox" name="" id="cbx_chkAll" onclick=""> &nbsp;&nbsp;
               
                <button type="button" class="btn btn-sm btn-danger" onclick="deleteFix();">영구삭제</button>                

                <button type="button" class="btn btn-sm btn-primary" onclick="mailReset();">복구</button>

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
   	 	
   	 		// 처음 조회될 테이블 (검색전)
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
				
   	 	// 휴지통 조회
   	 	function selectTotalList(cpage){
   	 		
   	 		$.ajax({
   	 			url:"selectBin.ma",   			
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
   	 	
   	 	// 1-1 다중선택 => 영구삭제
   	 	// 만약 체크안한상태로 클릭시 안넘어가도록 조건처리
   	 	function deleteFix(){
   	 		var arr = new Array();
	   	 	$("input[name='chk']:checked").each(function(){
	    		arr.push(($(this).val()));                		
	    	});
	   	 	
		   	 if(arr.length > 0){
		   		ajaxDeleteFix(arr);
		     }else{
		     		alert("메일을 선택해주세요");
		     }
   	 	}
   	 	
   	 	// 1-2 완전삭제처리
   	 	function ajaxDeleteFix(arr){
   	 		
   	 		if(confirm( "휴지통의 메일을 지우면 지워진 메일은 복구할 수 없습니다. 메일을 삭제하시겠습니까?")){
   	 			
   	 			//메일 구분을 위해서는 1.메일번호 2.받은사람 이메일 3.메일종류(받은메일,보낸메일,참조메일) 
   	 		
   	 			let arr = new Array();
   	 			
	   	 		$("input[name='chk']:checked").each(function(){				   	 		
	   	 		// ==> 최종 : "/" 문자열로 여며서 담기 ["66/xxxx@gmail.com/S", "", "", ...]
		   	 		const obj = $(this).val() + "/" + 
		   	 					$(this).next().val() + "/" + 
		   	 					$(this).next().next().val();
   	 				arr.push(obj);  	
	   	 		}); 
   	 				   	 		
   	 			$.ajax({
   	 				url:"deleteFix.ma",
   	 				type:"post",
   	 				traditional:true,
   	 				data: {   	 					
   	 					arr:arr
   	 				},
   	 				success:function(result){
   	 					
 						alert("메일을 영구삭제했습니다.");
 						// 전체조회
 						selectTotalList();
 						
 						// 혹시 전체체크됐을때 기능 후 체크가 사라지도록
				        $("#cbx_chkAll").prop("checked", false);
   	 					
   	 				},
   	 				error:function(){
   	 					console.log("휴지통 영구삭제용 ajax 실패");
   	 				}
   	 			})  
   	 		}
   	 	}
   	 	
   		// 1-1 다중선택 => 복구
   	 	// 만약 체크안한상태로 클릭 시 안 넘어가도록 조건 처리
   	 	function mailReset(){
   	 		var arr = new Array();
	   	 	$("input[name='chk']:checked").each(function(){
	    		arr.push(($(this).val())); // checked 된 input의 value를 받고          		
	    	});
	   	 	
		   	 if(arr.length > 0){ // 그 받아서 차곡차곡 쌓은 arr.length가 0이라면 체크된게 없다는거
		   		ajaxMailReset(arr);
		     }else{
		     		alert("메일을 선택해주세요");
		     }
   	 	}
   	 	
   	 	// 1-2 복구
   	 	function ajaxMailReset(arr){
   	 		
   	 		//메일 구분을 위해서는 1.메일번호 2.받은사람이메일 3.메일종류(받은메일,보낸메일,참조메일) 
   	 		
	 		let arrY = new Array();
	 			
   	 		$("input[name='chk']:checked").each(function(){				   	 		
   	 		// ==> 최종 : "/" 문자열로 여며서 담기 ["66/xxxx@gmail.com/S", "", "", ...]
	   	 		const obj = $(this).val() + "/" + 
	   	 					$(this).next().val() + "/" + 
	   	 					$(this).next().next().val();
	 				arrY.push(obj);  	
   	 		}); 
	 				   	 		
	 			$.ajax({
	 				url:"updateMailY.ma",
	 				type:"post",
	 				traditional:true,
	 				data: {   	 					
	 					arr:arrY
	 				},
	 				success:function(result){
	 					
						alert("메일이 복구됐습니다.");
						// 전체조회
						selectTotalList();
						
						// 혹시 전체체크됐을때 복구기능 후 체크가 사라지도록
				        $("#cbx_chkAll").prop("checked", false);
	 					
	 				},
	 				error:function(){
	 					console.log("휴지통 복구용 ajax 실패");
	 				}
	 			})
   	 	}
   	 	
   	 	
   	 	
   	 	
    </script>

</body>
</html>