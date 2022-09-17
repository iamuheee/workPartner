<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 구글 아이콘 -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<!-- 구글폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&family=Poppins:wght@300&display=swap" rel="stylesheet">

<!-- 부트스트랩 4.6 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

<!-- jQuery 라이브러리 -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/addressCss/address1.css">
<style>
 .adContainer2{
     display: grid;
     grid-gap: 15px;
     height: 90vh;
     grid-template-columns: 0.4fr  1fr 25px  0.5fr;
     grid-template-rows: 60px 0.5fr  0.5fr 35px 60px;
     grid-template-areas: 'header2 header2  header2 header2'
                          ' adEmMenu1   adEmMain1  adEmSubmit  adEmMain2'   
                          ' adEmMenu2   adEmMain1  adEmSubmit  adEmMain2'  
                          ' adEmMenu2     page     adEmSubmit  adEmMain2'                        
                          'adEmFooter adEmFooter  adEmFooter adEmFooter';    
    color: rgb(43, 42, 42);  
    font-size: 13px;
 }

.page{
    grid-area: page;   
}
/* =========================================================  */
* {
	font-family: 'Noto Sans KR', sans-serif;
}
#empMenu, #empSubMenu{ list-style-type: none; margin: 0; padding:0;}

#empSubMenu>li{padding-left: 20px; margin: 0px;}

#empSubMenu>li:hover{cursor:pointer; background: rgb(233, 244, 248);}
#empMenu>li:hover{cursor:pointer; background: rgb(233, 244, 248);} 
</style>

<script>
    function send() { 

        var data = $("#myform tr");

        // 부모창의 함수호출
        window.opener.sendDataCC(data);
        window.close();
    }
</script>
</head>
<body>
	
		
    <div style="height: 20px;"></div>
    <div class="adOuter1">
    
        <div class="adContainer2">
           
            <div class="header2">                
                <td width="80px"><h4>주소록</h4></td>
                <hr>       
            </div>

            
            <!-- 조직도 부서별 목록 -->
            <div class="adEmMenu1">
                <div style="height: 10px;"></div>
                
                <ul id="empMenu">
                    <li>
                        <div class="rowInline">
                            <span class="fontsize16" ><b>조직도</b></span> &nbsp;&nbsp;&nbsp;                            
                        </div>
                    </li>
                    <ul id="empSubMenu">                

                    </ul>
                </ul>

            </div>

			<!-- 내연락처 목록  -->
            <div class="adEmMenu2">
                <hr>
                <ul id="mainAddMenu">
                    <li>
                        <div class="rowInline">
                            <span class="fontsize16"><b>내 연락처</b></span> &nbsp;&nbsp;&nbsp;                            
                        </div>
                    </li>
                    <ul id="subAddMenu">                   
                         
                    </ul>
                </ul>
                                       
            </div>

		   
           <div class="adEmMain1">
                <!-- 조직도 테이블 -->
                <div id="tableArea">					
	                <!-- 1. 조직도 테이블 --> 
    	            <!-- 2. 내 연락처 테이블 -->        	                   
				</div>                
				
           </div>
           
           <!-- 페이징 -->
           <div class="page" align="center">
           
           </div>
                               
           <!-- 왼쪽영역으로 가는 버튼 -->
           <div class="adEmSubmit">
                <button type="button" class="btn btn-sm btn-primary material-symbols-outlined" onclick="emailSend();">
                     arrow_forward_ios
                </button>
           </div>

           <!-- 선택된 이메일이 보여지는 영역 -->
            <div class="adEmMain2">

                <form name="myform" id="myform">                                          
                    <table id="adminEmpList">
                    
                        <!-- 여기에 보여짐 -->           
                        
                    </table>                               
                     
                </form>

            </div>

            <script>
				// 선택된 메일들 개별삭제            
                $(function(){
                    $(document).on("click", ".removeMail", function(){
                        $(this).parent().parent().remove();
                    })
                })
                
				// 3명까지만 넘어 갈 수 있도록
                function countEmail(){
                    let ccCount = $("#myform tr").length;
                    //console.log(ccCount);
                    if(ccCount <= 3){
                        send();
                    }else{
                       alert("3명까지만 가능합니다.");
                    }
                }
				
				function emailSend(){
					
					let value = "";
					
					// 선택한 연락처의 이메일정보 넘기기
					var arr = new Array();					
					$("input[name='chk']:checked").each(function(){						
						arr.push($(this).parent().siblings(".email").text());
					});
					
					for(let i=0; i<arr.length; i++){
						 value  += '<tr>'                                   
	                            +       '<td><span>'+  arr[i] + '</span></td>'
	                            +       '<td><input type="hidden" name="mailCC" value="'+  arr[i]  +'"></td>'
	                            +       '<td><span class="removeMail">x</span></td>'
	                            + '</tr>';
					}
					
					$("#adminEmpList").append(value);
					$("input[name='chk']").prop("checked", false);
				}
				
				
            </script>

           
            <!-- 버튼-->
            <div class="adEmFooter" align="end">             
                <hr>
                <input type="button" class="btn btn-sm btn-primary" value="보내기" onclick="countEmail()"/>
              
            </div>

        </div>
        
    
    
    <script>
      	$(function(){
      		
      		// [부서, 내연락처 목록]
      		selectDepList();
      		selectGpList(); 
      		
      		// [테이블조회 (부서/그룹코드 넘기고 테이블 조회)]
      		// 1) 사내조직도 직원 테이블
      		$("#empSubMenu").on("click", "li", function(){            			
      			selectdepTbList($(this).find(".depCd").val());
      			// 이렇게 바로 전달 *children().children() 이런식으로 내려가는것보단 find!
      		})    
      		// 2) 내 연락처 내 테이블
      		$("#subAddMenu").on("click", "li", function(){            			
      			selectAddTbList($(this).find(".groupNo").val()); 
      		})
      	})         
      		
      	
      	// 부서별 목록 ajax
      	function selectDepList(){
      		
      		$.ajax({
      			
      			url: "depList.ad",
      			success:function(list){
      				//console.log(list);
      				let value = "";
      				
      				for(let i=0; i<list.length; i++){
      					value  += '<li>'
                      		   +	 '<div class="btn-group dropright btnPadding">'
                          	   + 	 	'<button type="button" class="btn btn-text">'
                               +	    	'<span style="font-size: 15px;">' + list[i].departmentName + '</span>'
                               +			'<input type="hidden" class="depCd" value="' + list[i].departmentCode + '">'
                          	   +	     '</button>'
                          	   +      '</div>'
                          	   +  '</li>';
                          	   
                          $("#empSubMenu").html(value);	   
                          	   
      				}
      			},
      			error:function(){
      				console.log("부서리스트 ajax통신 실패");
      			}
      			
      		})            		
      	}
      	
      	// 내 연락처 그룹별 목록
      	function selectGpList(){
      		$.ajax({
      			url: "gpList.ad",
      			data: {
      				employeeNo: ${loginUser.empNo}  // loginUser.empNo            				
      			},
      			success:function(list){            				
      				let value = "";
      				
      				for(let i=0; i<list.length; i++){
      					  value += '<li>'
                     			 +	  '<div class="btn-group dropright btnPadding">'
                          		 + 		  '<button type="button" class="btn btn-text">'
                                 + 				'<span style="font-size: 15px;">'+ list[i].groupName +'</span>'
                                 +				'<input type="hidden" class="groupNo" value="' + list[i].groupNo + '">'
                          		 +    	  '</button> &nbsp; &nbsp;'                       		 
                   		 		 +     '</div>'
                  				 + '</li>';
                  				 
                  		$("#subAddMenu").html(value);		 
      				}
      				 
      			},
      			error:function(){
      				console.log("내연락처 목록용 ajax실패");
      			}
      			
      		})
      	}
      	
      	// 조직도목록 클릭시 상세 테이블 조회용 ajax          	
      	function selectdepTbList(selectDepCd, cpage){            		
      		$.ajax({
      			type: "post",
      			url : "depTb.ad",
      			data : { 
      				depCd: selectDepCd,
      				cpage: cpage
      			},            			
      			success : function(result){
      				
      				let value="";
      					 value += '<table class="table" id="dataCompanyTable">'
                               +	'<thead>'
                               +         '<tr>'
                               + 				'<th style="width: 15px;"></th>'
                               + 				'<th>사번</th>'
                          	   + 				'<th>이름</th>'
                          	   +				'<th>부서</th>'
                          	   +                '<th>직위</th>'
                          	   +  				'<th>이메일</th>'
                          	   +          '</tr>'                        
                          	   +    '</thead>'
                          	   +  '<tbody>'   ;                 						   
      					
      				let pageValue = "";
      				
      				let list = result.list;
      				let pi = result.pi; 
      				
      				if(list.length == 0){
      						value   +=     "<tr>"
      								+			"<td colspan='6'>등록된 직원이 없습니다.</td>"            						
      								+      "</tr>";
      				}else{
      					for(let i=0; i<list.length; i++){
      						value   += 		'<tr>'
                                  	+ 			'<td><input type="checkbox" name="chk"></td>'
                                  	+ 			'<td class="no">'+ list[i].empNo +'</td>'
                                    +   		'<td class="name">'+ list[i].empName +'</td>'
                                  	+   		'<td>'+ list[i].depCd +'</td>'
                                  	+  			'<td>'+ list[i].posCd +'</td>'
                                  	+   		'<td class="email">'+ list[i].empEmail + '</td>';
                                  	+   	'</tr>'	;                                        	
      					}
      					
      					 if(pi.currentPage != 1){
                  			pageValue += "<button class='btn btn-sm btn-outline-primary' onclick='selectdepTbList("+ selectDepCd + ", "  + (pi.currentPage - 1) + ")'>&lt;</button>"	
                  		}
                  		
                  		for(let p=pi.startPage; p<=pi.endPage; p++) { 
          				   
          		   			if(p == pi.currentPage) { 
          				   			pageValue += "<button class='btn btn-sm btn-outline-primary' disabled>"  + p  + "</button>"
          				   	}else {
          				   			pageValue += "<button class='btn btn-sm btn-outline-primary' onclick='selectdepTbList("+ selectDepCd + ", "  + p +")'>" + p + "</button>"
          		           	} 
          		         }     
                   
          		         if(pi.currentPage != pi.maxPage) {
          		        	  pageValue +=	"<button class='btn btn-sm btn-outline-primary' onclick='selectdepTbList(" + selectDepCd + ", " + (pi.currentPage + 1) + ")'>&gt;</button>"
          		         }  
      				}
      				
      				value   +=	'</tbody>'
                  			+ '</table>';
      				
      				 $("#tableArea").html(value); 
      				 $(".page").html(pageValue); 
      				        				     	
      				            				
      			},
      			error:function(){
      				console.log("조직도 주소록 테이블 조회용 ajax실패");
      			}
      			
      		
      		})
      	}
      	      	
      	            	
      	// 내 연락처 목록클릭 시 조회테이블
      	function selectAddTbList(groupNo, cpage){
      		
      		$.ajax({
      			type: "post",
      			url : "myAdTb.ad",
      			data : { 
      				groupNo: groupNo,
      				cpage: cpage
      			},            			
      			success : function(result){
      				
      				let value="";
      					 value += '<table class="table" id="dataAddTable">'
                               +	'<thead>'
                               +         '<tr>'
                               +				'<th style="width:10px"></th>'
                               +				'<th>번호</th>'
                               +				'<th>이름</th>'
                               +				'<th>회사</th>'
                               +				'<th>부서</th>'
                               +				'<th>이메일</th>'                
                          	   +          '</tr>'                        
                          	   +    '</thead>'
                          	   +  '<tbody>'   ;                 						   
      					
      				let pageValue = "";
      				
      				let list = result.list;
      				let pi = result.pi;   
      				
      				if(list.length == 0){
      					   value   += 		"<tr>"
      							   +			 "<td colspan='6'>등록된 연락처가 없습니다.</td>"            						
      							   +		"</tr>";
      				}else{
      					for(let i=0; i<list.length; i++){
      						value   += 		'<tr>'
                                  	+ 			'<td><input type="checkbox" name="chk"></td>'                                  	
                                  	+			'<td class="no">'+ list[i].addressNo +'</td>'
                                  	+			'<td class="name">'+ list[i].addressName +'</td>'
                                  	+			'<td>'+ list[i].addressCompany +'</td>'
                                  	+			'<td>'+ list[i].addressDepartment +'</td>'
                                  	+			'<td class="email">'+ list[i].addressEmail +'</td>'                                        	       
                                  	+ 		'</tr>';                                        	
      					}
      					
      					 if(pi.currentPage != 1){
                  			pageValue += "<button class='btn btn-sm btn-outline-primary' onclick='selectAddTbList("+ groupNo + ", "  + (pi.currentPage - 1) + ")'>&lt;</button>"	
                  		}
                  		
                  		for(let p=pi.startPage; p<=pi.endPage; p++) { 
          				   
          		   			if(p == pi.currentPage) { 
          				   			pageValue += "<button class='btn btn-sm btn-outline-primary' disabled>"  + p  + "</button>"
          				   	}else {
          				   			pageValue += "<button class='btn btn-sm btn-outline-primary' onclick='selectAddTbList("+ groupNo + ", "  + p +")'>" + p + "</button>"
          		           	} 
          		         }     
                   
          		         if(pi.currentPage != pi.maxPage) {
          		        	  pageValue +=	"<button class='btn btn-sm btn-outline-primary' onclick='selectAddTbList(" + groupNo + ", " + (pi.currentPage + 1) + ")'>&gt;</button>"
          		         }  
      				}
      				
      				value   +=	'</tbody>'
                  			+ '</table>';
      				
                  			//console.log(value);
      				$("#tableArea").html(value);
      				$(".page").html(pageValue);      				            				            				
      			   
      			},
      			error:function(){
      				console.log("내연락처 주소록 테이블 조회용 ajax실패");
      			}       		
      		})
      	}      	      	
      	
      </script>
   </div>
		
</body>
</html>