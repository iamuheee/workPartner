<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .ntOuter{
        margin: auto;
        margin-top:100px;
        padding: 20px;         
        align-items: center;
        box-shadow :  2px 3px 5px 2px rgb(212, 211, 211);;
        border-radius: 10px;
        width: 50%;       
    }
    table{margin: 5px;}       
    .borderStyle{
        border: 1px solid #aaacaf;
        border-radius: 0.20rem;
    }
     .mainOuter{ margin:auto !important;}
</style>
</head>
<body>
    <jsp:include page="../common/menubar.jsp"/>

    <div class="ntOuter">
        
        <div align="center">
            <br>
        <h5><b> 현재 관리자 설정</b></h5>

        <hr style="width: 25%;">
        <br><br>
        </div>
        
        

        <b>기본관리자 : </b> 인사부

        <div style="height: 40px;"></div> 

        <b>추가관리자 </b> 
        <button type="button" class="material-symbols-outlined btn btn-sm btn-secondary" onclick="openAddressWindow();">
            lan
        </button>
        <br><br>
          
        <div class="borderStyle" style="min-height: 200px;">
            <table id="adminList">
                
            </table>
        </div>


    
         <br>


        <div align="center">      
            <button type="button" class="btn btn-sm btn-primary" onclick="updateAdminY();">저장</button>      
            <button type="button" class="btn btn-sm btn-secondary" onclick="history.back();">이전</button>           


            <div id="result"></div>
        </div>

           
      
       
       <!-- 해당 기능에서 해야 할 것
            1. 전체 추가관리자 리스트 ajax 
            2. x버튼 누리면 해당 행의 직원번호가 전달 =>  ajax로 data넘겨서 일반직원으로 업데이트 처리 후 리스트를 조회하는 ajax를 다시 호출
            3. 주소록버튼 누르면 해당 테이블에 추가가 되고 =>저장 누르면 최종적으로 추가관리자가 저장됨
            
            [주소록]
            1. 우선 인사부는 아예 항목에서 안나오게
			2. nt_Adim 상태 조회해오기
			3. N인 애들만 넘어오게 해놨음
			
			=> 이제 조회목록에는 기존에 Y인 애들과 추가한 N인 애들이 있음			
			=> 개별 삭제 시 Y인 애들은 db변경
			=> N인 애들은 바로 삭제 해주면 됨
        -->
                        
        
        <!-- 
            window.open(첫번째, 두번째, 세번째);
            첫번째 : 새 창에서 열고자 하는 url주소
            두번째 : 창 이름(target), 창 이름이 같은게 이미 열려있을 경우 새 창이 열리지 않고 기존의 창이 새로고침됨
            세번째 : 새창의 너비, 높이, 주소창의 여부, 툴바여부, 스크롤바 여부 등등 새로운 창의 특성(브라우저마다 적용범위 다름)
            
            *창의 특성
                width : 창의 너비(px)
                height : 창의 높이(px)
        -->
       <script>
             
            var newWindow;
            function openAddressWindow(){
                newWindow = window.open("${pageContext.request.contextPath}/addressAdmin.ad", "addressWindow", "height=700, width=1100");
            }
			
            /* 자식창으로부터 전달된 정보  */
            function sendMeData(data){                   
                //console.log(data);
                $("#adminList").append(data);           
               
            }
            
            
            $(function(){
            	
            	// ntAdmin이 Y인 애들 조회해오기
            	ajaxSelectNtAdminY();
            	
            	
            	// removeAdmin 클릭시 삭제
            	$(document).on("click", ".removeAdmin", function(){ // x클릭시 실행할 내용
					let empNtAdminStatus = $(this).parent().prev().children().val();
            		let empNo = $(this).parent().prev().prev().children().val();
            		console.log(empNo);
            		console.log(empNtAdminStatus);
            		
            		// 1. empNtAdmin='N'일때 바로 삭제
            		if(empNtAdminStatus != 'Y'){
                    // 현재 클릭이벤트가 발생한 x의 부모요소들 중에 tr 태그인 요소만 선택 => remove();                            
                	   $(this).parent().parent().remove();   
                	   console.log($(this).parent().parent());
                	   
                   } else{
                	   
                	  // 2. empNtAdmin ="Y"인 경우에는
                	  // 우선 table에 있는 해당 tr을 지워주고 
                	  $(this).parent().parent().remove();
                	  // db에 적용
                	  $.ajax({
                		   url:"upDateAdminN.nt",
                		   data:{
                			   empNo:empNo
                		   },
                		   success:function(result){
                			   if(result == 'success'){                				   
                				   //ajaxSelectNtAdminY();
                				   // => 얘는 Y인 애들만 조회하는거라서 남아있는 추가하려고 검색해온 일반사원들이 없어져버림
                				   // 그래서 ajax 처리 전에 클릭한 this에 tr을 없애도록!!!
                				   alert("삭제되었습니다.");
                			   }
                		   }, 
                		   error:function(){
                			   console.log("공지사항 관리자 삭제 ajax실패");
                		   }
                	   }); 
                   }  
                });
            	 
            })
            
            // ntAdmin이 Y인 애들 조회해오기
            function ajaxSelectNtAdminY(){
            	$.ajax({
            		url:"selectNtAdminY.nt",
            		success:function(list){
            			let value = "";
            			for(let i=0; i<list.length; i++){
            				value  += '<tr>'     
			                    	+    '<td width="60px"> ' + list[i].empNo + ' </td>'
			                  	 	+    '<td width="80px"> '+ list[i].depCd +' </td>'
			                  	    +    '<td>  '+ list[i].empName +'  </td>'
			                     	+    '<td><input type="hidden" class="empNo" name="empNo" value="'+ list[i].empNo +'"></td>'                           
			                     	+    '<td><input type="hidden" name="empNtAdmin" value="'+ list[i].empNtAdmin +'"></td>'                           
			                    	+    '<td><span class="removeAdmin" style="cursor: pointer;"> x</span></td>'                            
			                        + '</tr>';	
            			}
            			
            			$("#adminList").html(value);
            			
            		},
            		error:function(){
            			console.log("관리자 조회용 ajax실패");
            		}
            		
            	})
            }
            
            // 관리자 설정 Y
            function updateAdminY(){
            	
            	// adminList에 최종적으로 남은 tr의 empNo를 돌려서 배열에 담아줌
            	let arr = new Array();
            	$("#adminList .empNo").each(function(){
            		
            		console.log($(this).val());
            		arr.push($(this).val());
            	});            	
            	//console.log(arr);
            	
            	// table안에 사번이 있을때 update 실행
            	if(arr.length > 0){
            		$.ajax({
            			url : "updateAdminY.nt",
            			traditional:true,
            			data : { 
            				arrEmp:arr
            			},
            			success : function(result){
            				if(result == 'success'){
            					alert("관리자로 설정되었습니다.");
            					// 다시 조회
            					ajaxSelectNtAdminY();
            				}
            			},
            			error:function(){
            				console.log("관리자 설정 ajax 실패");
            			}           			
            			
            		})
            	}else{
            		// 테이블에 직원이 없고 저장 클릭 시 
            		alert("관리자로 설정할 직원을 선택해주세요");
            	}
            	
            	
            }

       </script>

        
        
    </div>

    

</body>
</html>