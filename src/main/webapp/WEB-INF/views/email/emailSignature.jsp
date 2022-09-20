<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .emailSigOuter{
        margin: auto;
        padding: 20px;         
        align-items: center;
        box-shadow :  2px 3px 5px 2px rgb(212, 211, 211);;
        border-radius: 10px;
        width: 40%;      
        font-size: 13px;
    }    
    
    .roundStyle{
        background-color: #0442AF;
        border-radius: 8px; 
        color:white;        
        padding: 1px;        
    } 

    .sigTable{
        margin: 5px;
        border-collapse: separate;
	    border-spacing: 0 20px;
    }
    
    .sigTableModal input{
        border: 1px solid #ced4da;
        border-radius: 0.25rem;     
        margin: 10px;  
    }
    
    .mainOuter{ margin:auto !important;}
    
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>

    <div class="emailSigOuter">
        <br>
        <h5><b>메일 서명관리</b></h5>
        <hr>

       <form action="sigManage.ma" method="post"> 
            <input type="hidden" name="empNo" value="${loginUser.empNo }">
            <!-- 서명사용설정  -->
            <table class="sigTable">
            
            
            </table>
                          
             <table>   
                <tr>
                    <th>서명관리</th>
                    <td>
                        <button type="button" class="btn btn-sm btn-secondary sigAddBtn" data-toggle="modal" data-target="#sigInsert">서명추가</button> 
                    </td>                                
                </tr>
            </table>
             
            <br>
                
            <!-- 등록된 서명 list 조회 -->
            <table id="sigListTb">
            
            </table>    
                
                                
			<div align="end">
                <button type="submit" class="btn btn-sm btn-primary">확인</button>                
            </div>
            
        </form>
      
        <!-- ====================================================  Modal ================================================================ -->

        <!-- 서명등록 -->
        <div class="modal fade" id="sigInsert" tabindex="-1" aria-labelledby="sigInsertModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="sigInsertModalLabel">서명등록</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">                          
                         <form action="insertSig.ma" method="post">                                              
                            <div align="center">
                                <table class="sigTableModal">                                                               
                                    <tr>                                    
                                        <th colspan="2">이름</th>                                                                      
                                        <td>
                                            <input type="text" name="sigName" id="sigName" value="" readonly>     
                                            <input type="hidden" name="empNo" value="${loginUser.empNo }">                                     
                                        </td>                                                                             
                                    </tr>                               
                                    <tr>
                                        <th colspan="2">부서</th>
                                        <td>
                                            <input type="text" name="sigDepartment" id="sigDepartment" value="" readonly>
                                        </td>                                       
                                    </tr>                                         
                                    <tr>
                                        <th colspan="2">직급</th>                                     
                                        <td>
                                            <input type="text" name="sigPosition" id="sigPosition" value="" readonly>
                                        </td>
                                    </tr> 
                                    <tr>
                                        <th colspan="2">휴대전화</th> 
                                        <td><input class="formInput" type="text" name="sigTel" id="sigTel" placeholder=" -도 함께 입력해주세요." maxlength="13" value=""></td>
                                    </tr>                 
                                    <tr>
                                        <th colspan="2">이메일</th> 
                                        <td><input class="formInput" type="email" name="sigEmail" id="sigEmail" value="" required></td>
                                    </tr>
                                    <tr>
                                        <th colspan="2">사내번호</th> 
                                        <td><input class="formInput" type="text" name="sigExtension" id="sigExtension" value="" ></td>                                      
                                    </tr>                                     
                                    <tr>
                                        <td><input type="checkbox" name="sigAddress" id="sigAddress" value="Y"></td>
                                        <th>회사주소 :  &nbsp;</th>
                                        <td>서울 금천구 가산디지털2로 115</td>
                                    </tr>   
                                </table>
                            </div>
                            <br>
                            <div align="center">
                                <button type="submit" class="btn btn-sm btn-primary">등록</button>
                                <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">취소</button>
                            </div>
                            
                       </form>
                    </div>
                    
                </div>
            </div>
        </div>
        
        <script>
        
	        $(function(){
	             	
	    		// 등록 된 서명리스트 조회
	    		selectSigList();
	    		    		
	    		// 서명 삭제
	    		$(document).on("click", "#sigListTb #sigDelete", function(){	    		
	    			//console.log($(this).parent().prev().children("input").val());
	    			deleteSig($(this).parent().prev().children("input").val());
	    		});
	    		
				// 서명 등록에 필요한 정보 employee 가져오기 
				selectEmp();
								
	    	})
	    	
	    	// 등록된 서명 리스트 조회용 ajax
	    	function selectSigList(){
	        	$.ajax({
	        		url:"selectSigList.ma",
	        		data:{empNo:${loginUser.empNo}},
	        		success:function(list){	 
	        			
	        			let value= "";	  
	        			
	        			for(let i=0; i<list.length; i++){
	        				value += '<tr>'                    
					               +     '<td colspan="2" align="end" width="180px">';
					      if(list[i].sigBasic == 'Y'){
					         value += 	 	'<span class="roundStyle">기본</span>  &nbsp;';
					        } 
					         value +=       '<input type="radio" name="sigNo" value="'+ list[i].sigNo +'" id="'+list[i].sigNo+'"';
					      if(list[i].sigBasic == 'Y'){
					    	 value +=             'checked'; 									
					      }
					         value +=        '><label for="'+list[i].sigNo+'"> 서명' + list[i].rnum + '</label>'
					               +     '</td>'                  
					               +     '<td align="end" width="100px"><button type="button" class="btn btn-sm btn-secondary" id="sigDelete">삭제</button></td>'
					               + '</tr>';
	        			}
	        			
	        			$("#sigListTb").html(value);
	        		},
	        		error:function(){
	        			console.log("등록한 서명 조회용 ajax실패");
	        		}
	        	})
	        }
	    
	        // 삭제 기능  
	        function deleteSig(sigNo){
	            if(confirm("해당 서명을 삭제하시겠습니까??")){
					$.ajax({
						url: "deleteSig.ma",
						data:{
								sigNo:sigNo,
								empNo:${loginUser.empNo}
							},
						success:function(result){
							if(result == 'success'){
								alert("서명을 삭제했습니다.");
								// 등록된 서명조회 호출
								selectSigList();								
							}
						},
						error:function(){
							console.log("서명삭제 실패");
						}
					})
	            }else{	              
	            } 
	        }
	        
	        // 서명등록을 위한 사원정보 조회
	        function selectEmp(){
	        	$.ajax({
	        		url:"selectSigEmp.ma",
	        		data:{
	        			empNo:${loginUser.empNo}
	        		},
	        		success:function(result){	   
	        			//console.log(result);
	        			const el = $(".sigTableModal");
	        			el.find("#sigName").val(result.empName);
	        			el.find("#sigDepartment").val(result.depCd);
	        			el.find("#sigPosition").val(result.posCd);
	        			el.find("#sigExtension").val(result.empExtension);	        			
	        			el.find("#sigTel").val(result.empPhone);
	        			el.find("#sigEmail").val(result.empEmail);
	        			
	        			let value = "";
	        			value += '<tr>'
				               +     '<th width="60px">서명</th>'
				               +     '<td width="80px">'
				               +         '<input type="radio" id="use" name="empSigUse" value="Y"';
				               
				        if(result.empSigUse == 'Y'){
				        	 value +=   														'checked';
				         	}      				               							
				         value +=         '><label for="use">사용함</label>'    
				               +     '</td>'
				               +     '<td>'
				               +         '<input type="radio" id="noUse" name="empSigUse" value="N"';
				         if(result.empSigUse == 'N'){
					         value +=   													     'checked';
					         } 
				         value +=         '><label for="noUse">사용 안함</label>'    
				               +     '</td>'
				               + '</tr>';
				               
				         $(".sigTable").html(value);   
	        			
	        		},
	        		error:function(){
	        			console.log("서명추가 시 사원정보 조회용 ajax 실패");
	        		}
	        		
	        	})
	        }
	        
	      /*  function sigManage(){
	    	   $.ajax({
	    		   url:"sigManage.ma",
	    		   data:{
	    			   
	    			   
	    		   }
	    		   
	    	   })
	       } */
	        
        
        </script>

                


    </div>
</body>
</html>