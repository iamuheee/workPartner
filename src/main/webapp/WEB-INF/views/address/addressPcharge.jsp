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
 .adContainer{
   display: grid;
   grid-gap: 20px;
   height: 90vh;
   grid-template-columns: 0.4fr  1fr 25px  0.4fr;
   grid-template-rows: 60px 1fr 35px 30px;
   grid-template-areas: 'header header  header header'
                       ' menu   main1  submit  main2'  
                       ' menu   page  submit  main2'                           
                       'footer footer  footer footer';    
color: rgb(43, 42, 42);  
font-size: 13px;
}

.page{
    grid-area: page;   
}
/*  여기까지 위의 내용은 외부 css가 실시간으로 반영되지않아서 내부방식으로 한번 더 입력한것. 나중에 삭제 예정 */

 * {
font-family: 'Noto Sans KR', sans-serif;
}

</style>
<script>
	$(function(){
		$("#projNo").val( opener.$("input[name=projNo]").val() );
		console.log( $("#projNo") );
	})


	function send() { 
		
		if( $("#myform tr").length != 1 ){
			// 업무 담당자 1명으로 한정
			alert("한 명의 프로젝트 업무 담당자를 지정해야 합니다.");
			$("#myform tr").remove();
		}else{
			// 해당 사원이 프로젝트의 멤버인지 확인
			$.ajax({
				url:"validateme.pr",
				data:{
					projNo: $("#projNo").val(),
					empNo: $("input[name=incharge]").val()
				},
				success:function(result){
					if(result == '성공'){
						// 해당 사원이 프로젝트 멤버임
						if( confirm( $("input[name=inchargeName]").val() + "님을 담당자로 지정하는 것이 맞나요?") ){
					    	let data = $("#inchargeEmp");
					    	opener.sendMeData(data);
					    	alert("성공적으로 담당자로 추가되었습니다.");
							window.close();
					    }else{
							alert("천천히 골라주십쇼!");	 
							$("#myform tr").remove();
					    }
					}else{
						// 해당 사원은 프로젝트 멤버가 아님
						alert("업무 담당자는 프로젝트 멤버여야 합니다.");
						$("#myform tr").remove();
					}
				}
			})
		}
	}
</script>

</head>
<body>
	<div style="display:none">
    	<div id="inchargeEmp"></div>
	</div>

    <div style="height: 20px;"></div>
    <div class="adOuter">

		<div style="display:none">
			<input type="hidden" id="projNo">
		</div>
    
        <div class="adContainer">

            <!-- header영역 -->
            <div class="header">
                <table>
                    <tr>
                        <td width="80px"><h4>주소록</h4></td>                       
                    </tr>
                </table>
                <hr>       
            </div>

            <!-- 조직도 부서별 목록 -->
            <div class="menu">
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

           <div class="main1">
                <!-- 조직도 사원 테이블 -->
                <div id="tableArea">					
	                       	                   
				</div>  

           </div>
           
           <!-- 페이징영역 -->
           <div class="page" align="center">
           
           </div>
                               
           <!-- 왼쪽영역으로 가는 버튼 : 해당 버튼 클릭시 맨 왼쪽 form으로 넘어감-->
           <div class="submit">
                <button type="button" class="btn btn-sm btn-primary material-symbols-outlined" onclick="empNoSend();">
                     arrow_forward_ios
                </button>
           </div>

           <!-- 선택된 직원이 보여지는 영역 => 해당 영역에 있는 사원들이 부모창으로 넘어감 -->
            <div class="main2">

                <form name="myform" id="myform">                                          
                    <table id="adminEmpList">
                        
                    </table>                               
                     
                </form>

            </div>

            <script>
                $(function(){
                    $(document).on("click", ".removeAdmin", function(){
                        $(this).parent().parent().remove();
                    });
                    
                	 // table tr 클릭시 체크박스 선택/해제
                    $(document).on("click", "#tableArea tbody tr", function(){
                    	let checkbox = $(this).find("input:checkbox");   
                    
                   	  	if(checkbox.is(":checked")) checkbox.prop("checked", false);
                         else checkbox.prop("checked", true);
                    });
                    
                })
                
                // 클릭된 사원의 정보를 맨 왼쪽으로 넘기기 
                /* 
                	사번, 부서명, 사원이름으로 표시되도록 했으며, input:hidden으로 사번이 넘어갈 수 있도록 했음  
                	해당 tr > X 클릭 시 tr요소 삭제되게끔 했음
                */
                function empNoSend(){
					
					let value = "";					
					var arr = new Array();		
					
					// 체크된 항목 반복문 돌리고 
					$("input[name='chk']:checked").each(function(){			
						
						const obj = {
							empNo:$(this).parent().siblings(".no").text(),
							depCd:$(this).parent().siblings(".depCd").text(),
							empName:$(this).parent().siblings(".name").text()							
						};				
						
						arr.push(obj);
						
					});
					
					let html = "";
					for(let i=0; i<arr.length; i++){
						 value  += '<tr>'     
			                     +    '<td width="60px" class="empICNo"> ' + arr[i].empNo + ' </td>'
			                     +    '<td width="80px"> '+ arr[i].depCd +' </td>'
			                     +    '<td class="empICName">  '+ arr[i].empName +'  </td>'
			                     +    '<td><input type="hidden" name="empNo" value="'+ arr[i].empNo +'"></td>'                           
			                     +    '<td><span class="removeAdmin" style="cursor: pointer;"> x</span></td>'                            
			                     + '</tr>';
			            
	                    // 부모창에 돌려보내기 위한 구문들
	                    html += '<ul>'
	                    	  + 	'<li>'
	                    	  + 		'<span><b>' + arr[i].empName + '</b></span>님을 담당자로 추가하셨습니다.'
	                    	  + 	'</li>'
	                    	  + '</ul>'
	                    	  + '<input type="hidden" name="incharge" value="' + arr[i].empNo + '">'
	                    	  + '<input type="hidden" name="inchargeName" value="' + arr[i].empName + '">';
					}
					
					$("#inchargeEmp").html(html);
					
					$("#adminEmpList").append(value);
					$("input[name='chk']").prop("checked", false); 
				}

            </script>

           
            <!-- 버튼 : 해당 버튼 클릭 시 부모창으로 정보 전달 -->
            <div class="footer" align="end">             
              
                <input type="button" class="btn btn-sm btn-primary" value="보내기" onclick="send()"/>
              
            </div>

        </div>
        <script>
      	$(function(){
      		
      		// [부서목록]
      		selectDepList();      		
      		
      		// [테이블조회 (부서/그룹코드 넘기고 테이블 조회)]
      		// 1) 사내조직도 직원 테이블
      		$("#empSubMenu").on("click", "li", function(){            			
      			selectdepTbList($(this).find(".depCd").val());
      			// 이렇게 바로 전달 *children().children() 이런식으로 내려가는것보단 find!
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
      	      	
      	// 조직도 목록 클릭 시 테이블 조회용 ajax          	
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
                                  	+   		'<td class="depCd">'+ list[i].depCd +'</td>'
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
      				 //$("#addTitle").html("<h4><b>"+ list[0].depCd +"</b></h4>");
      				            				
      			},
      			error:function(){
      				console.log("조직도 주소록 테이블 조회용 ajax실패");
      			}
      			
      		
      		})
      	}      
      </script>
    </div>
   
		
</body>
</html>