<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/addressCss/address2.css">
<style>
#empMenu, #empSubMenu{ list-style-type: none; margin: 0; padding:0;}

#empSubMenu>li{padding-left: 20px; margin: 0px;}

#empSubMenu>li:hover{cursor:pointer; background: rgb(233, 244, 248);}
#empMenu>li:hover{cursor:pointer; background: rgb(233, 244, 248);} 
 
</style>

</head>
<body>
	
	<jsp:include page="../common/menubar.jsp"/>
	
    <div style="height: 20px;"></div>
    <div class="adOuter">

    
        <div class="adContainer">

            <!-- 조직도 및 업체연락처 그룹영역 -->
            <div class="addMenu1">
                <button type="button" class="btn btn-primary centerBtn" data-toggle="modal" data-target="#addressAdd">새 연락처</button>   
                <hr width="80%">             
            </div>

            <!--  별표연락처 & 조직도 -->
            <div class="addMenu2_1">
            
                <!-- 별표연락처 -->
                <!-- 로그한 유저의 사번 넘기자 -->              
                <div class="starAdd" onclick="selectStarAdd();">
                    <span class='starYellow'>★</span><span style="font-size: 16px;"><b>별표연락처</b></span>
                </div>

                <hr width="80%">
                <!-- 조직도 -->
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
            
            
            <!-- 내연락처 -->
            <div class="addMenu2_2">
                <hr width="80%">
                <ul id="mainAddMenu">
                    <li>
                        <div class="rowInline">
                            <span class="fontsize16"><b>내 연락처</b></span> &nbsp;&nbsp;&nbsp;
                            <span  data-toggle="modal" data-target="#addGp">
                             +
                            </span>
                        </div>
                    </li>
                    <ul id="subAddMenu">                   
                         
                    </ul>
                </ul>
                    
            </div>            
           
            
            <div class="addMenu3"></div>

            <!-- 검색영역(시간남으면) -->
            <div class="addSearch">
                <table class="centerBtn">
                    <tr>
                        <td id="addTitle" width="120px"><h4><b>주소록</b></h4></td>
                       <!--  <td><input type="text" class="form-control" placeholder="부서 또는 이름 입력하세요" name="searchText" id="searchText"  maxlength="30" style="height: 31px; width:300px"></td>
                        <td><button type="button" id="searchBtn" class="btn btn-sm btn-primary" onclick="">검색</button></td> -->                       
                    </tr>
                </table>
                <hr width="96%">
            </div>
            
            

            <!-- 주소록 테이블 영역-->
            <div class="addMain">

                <!-- 메일보내기 및 삭제 다중선택-->
                <br>
                <div>
                    &nbsp;
                    <input type="checkbox" name="" id="cbx_chkAll" onclick=""> &nbsp;

                    <!-- <a class="btn btn-sm btn-primary">메일보내기</a> -->
                    <!-- 내연락처일때만 삭제기능 -->
                    <!-- 삭제 > 모달 > 기능 정보넘기는거 어렵다면 그냥 모달창 띄우지말고 바로 삭제처리 -->
                    <button id="deleteFeat" type="button" class="btn btn-sm btn-secondary" onclick="deleteAdds();">삭제</button>                      

                </div>
                
                <br>
				
				<div id="tableArea">					
	                <!-- 1. 조직도 테이블 --> 
    	            <!-- 2. 내 연락처 테이블 -->
        	        <!-- 3. 별표연락처 -->              
				</div>
	
            </div>          

            <!-- 특정 멤버의 주소록 상세창영역-->
            <div class="detailAdd">           
                <br>
                <!-- 내연락처에만 있는 삭제/ 편집기능-->
                <div id="myAddChoiceArea" style="visibility:hidden;">                
                    <button type="button" class="btn btn-sm btn-warning openAddEdit" data-toggle="modal" data-target="#addressEdit">편집</button>
                    <button type="button" class="btn btn-sm btn-secondary" onclick="deleteAdd();">삭제</button>      
                </div> 
                
               
                <div class="addBoxShadow" >
                    <br>
                    <table id="adDetailTb" width="85%">	
                        
			           <!--목록클릭 전-->                       
			           <div id="beforeClick">
			               <br>
			               연락처 상세정보를 보려면 이름을 <br>
			               클릭하세요
			            </div> 
                        <!-- 주소록 상세보기 -->    
                        <!-- 별표연락처 & 내 연락처 상세보기 -->
                        
                    </table> 
                    <br>
                </div>
        
            </div>
                
            <!-- 페이징 영역-->
            <div class="pasingAdd" align="center" style="display:inline">
                 
            </div>

            <!--==================================== 삭제용 script ======================================= -->


            <script>

                // 그룹삭제                 
                function deleteAddGp(){
                    if(confirm("그룹과 연락처 모두 삭제됩니다. 삭제하시겠습니까?")){

                    }else{
                        //$("").focus();
                    }
                }

                //내연락처 상세보기 삭제 
                function deleteAdd(){
                    if(confirm("삭제하시겠습니까?")){

                    }else{
                        //$("").focus();
                    }
                }             
               

            </script>

            <!--==================================== Modal ======================================= -->

            <!-- 새연락처 Modal -->
            <div class="modal fade" id="addressAdd" tabindex="-1" aria-labelledby="addressAddModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">                       
                        <div class="modal-body">                          
                            <form action="insertAd.ad" method="post">
                                <table align="center">   
                                        <tr>
                                            <th class="Addstar" colspan="2">
                                                <input type="checkbox" name="addressStar"  value="Y" id="rate3">
                                                <label for="rate3">★</label>      
                                                <input type="hidden" name="employeeNo" value="${loginUser.empNo }">                            
                                            </th>                                    
                                        </tr>                             
                                    <tr>
                                            <th>이름</th>  &nbsp;                                                                       
                                            <td><input class="formInput"  type="text" id="addressName" name="addressName" required></td>                                       
                                    </tr>
                                    <tr>
                                            <th>닉네임</th>  &nbsp;
                                            <td><input class="formInput" type="text" name="addressNickName"></td>
                                    </tr>
                                    <tr>
                                            <th>회사</th> &nbsp;
                                            <td><input class="formInput" type="text" name="addressCompany" required></td>                                       
                                    </tr>        
                                    <tr>
                                            <th>부서</th>  &nbsp;                                    
                                            <td><input class="formInput" type="text" name="addressDepartment" required></td>                                        
                                        </tr>    
                                        <tr>
                                            <th>직급</th>   &nbsp;                                   
                                            <td><input class="formInput" type="text" name="addressPosition" required></td>
                                        </tr>                            
                                        <tr>
                                            <th>이메일</th> &nbsp;
                                            <td><input class="formInput" type="email" name="addressEmail" required></td>
                                        </tr>
                                        <tr>
                                            <th>휴대전화</th> &nbsp;
                                            <td ><input class="formInput" type="text" name="addressTel" placeholder=" -도 함께 입력해주세요." maxlength="13"></td>
                                        </tr>
                                        <tr>
                                            <th>사내번호</th> &nbsp;
                                            <td><input class="formInput" type="text" name="addExtensionNo"></td>
                                        </tr>
                                        <tr>
                                            <th>FAX</th> &nbsp; 
                                            <td><input class="formInput" type="text" name="addressFax"></td>
                                        </tr>
                                        <tr>
                                            <th>메모</th> &nbsp;
                                            <td><textarea style="resize: none;" maxlength="19" name="addressMemo" id="addMemo1" cols="30" class="formInput"></textarea></td>                                        
                                        </tr>
                                        <tr>
                                            <td colspan="2" align="end">
                                                <span id="addMemoContentcount1">0</span>
                                                <span class="blueColor">/20</span> 
                                            </td>
                                            <script>
                                                $(function(){
                                                    $("#addMemo1").keyup(function(){
                                                        $("#addMemoContentcount1").text($(this).val().length); 
                                                    })
                                                })
                                            </script>
                                        </tr>
                                        <tr>
                                            <th>그룹</th>
                                            <td>
                                                <select name="groupNo" class="formInput">
                                                    <option value="7">구디쓰주식회사</option>
                                                    <option value="6">구디물산</option>
                                                    <option value="5">그룹미지정</option>
                                                </select>
                                            </td>
                                        </tr>
                                    
                                </table>
                                <br><br>
                                <div align="center">
                                    <button type="submit" class="btn btn-sm btn-primary">등록</button>
                                    <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">취소</button>
                                </div>
                                
                            </form>
                            <br>
                        </div>                    
                    </div>
                </div>
            </div>

            <!-- 내연락처 다중선택 삭제 Modal -->
            <div class="modal fade" id="addressDelete" tabindex="-1" aria-labelledby="addressDeleteModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="addressDeleteModalLabel">내 연락처삭제</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            4개를 내 연락처에서 삭제하시겠습니까?
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-sm btn-danger">연락처삭제</button>
                            <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">취소</button>
                        </div>
                    </div>
                </div>
            </div> 
                     
            <!-- 내연락처 편집 Modal -->
            <div class="modal fade" id="addressEdit" tabindex="-1" aria-labelledby="addressEditModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">                        
                        <div class="modal-body">                          
                            <form action="updateAdd.ad" method="post">
                                <table id="addEdit" align="center">  
                                   <tr>
                                        <th colspan="2">                                           
                                            <input type="hidden" name="addressNo" id="addressNo" value="">                             
                                        </th>                                    
                                    </tr>                               
                                    <tr>
                                            <th >이름</th>  &nbsp;                                                                       
                                            <td ><input class="formInput"  type="text" id="addressName" name="addressName"  required></td>                                                                             
                                    </tr>
                                    <tr>
                                            <th>닉네임</th>  &nbsp;
                                            <td><input class="formInput" type="text" name="addressNickName" id="addressNickName" ></td>
                                    </tr>
                                    <tr>
                                            <th>회사</th> &nbsp;
                                            <td><input class="formInput" type="text" name="addressCompany" id="addressCompany" required></td>                                       
                                    </tr>        
                                    <tr>
                                            <th>부서</th>  &nbsp;                                    
                                            <td><input class="formInput" type="text" name="addressDepartment" id="addressDepartment" required></td>                                        
                                        </tr>    
                                        <tr>
                                            <th>직급</th>   &nbsp;                                   
                                            <td><input class="formInput" type="text" name="addressPosition" id="addressPosition" required></td>
                                        </tr>                            
                                        <tr>
                                            <th>이메일</th> &nbsp;
                                            <td><input class="formInput" type="email" name="addressEmail" id="addressEmail" required></td>
                                        </tr>
                                        <tr>
                                            <th>휴대전화</th> &nbsp;
                                            <td ><input class="formInput" type="text" name="addressTel" id="addressTel" placeholder=" -도 함께 입력해주세요." maxlength="13"></td>
                                        </tr>
                                        <tr>
                                            <th>사내번호</th> &nbsp;
                                            <td><input class="formInput" type="text" id="addExtensionNo" name="addExtensionNo"></td>
                                        </tr>
                                        <tr>
                                            <th>FAX</th> &nbsp; 
                                            <td><input class="formInput" type="text" name="addressFax" id="addressFax"></td>
                                        </tr>
                                        <tr>
                                            <th>메모</th> &nbsp;
                                            <td><textarea style="resize: none;" maxlength="19" name="addressMemo" id="addressMemo" cols="30" class="formInput"></textarea></td>                                        
                                        </tr>                                       
                                        <tr>
                                            <th>그룹</th>
                                            <td>
                                                <select name="groupNo" class="formInput">
                                                    <option value="7">구디쓰주식회사</option>
                                                    <option value="6">구디물산</option>
                                                    <option value="5">그룹미지정</option>
                                                </select>
                                            </td>
                                        </tr> 
                                    
                                </table>
                                <br>
                                <div align="center">
                                    <button type="submit" class="btn btn-sm btn-primary">수정</button>
                                    <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">취소</button>
                                </div>
                                
                            </form>
                        </div>
                        
                    </div>
                </div>
            </div>

            
            <!-- 내연락처 그룹추가 Modal -->
            <div class="modal fade" id="addGp" tabindex="-1" aria-labelledby="addGpModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="addGpModalLabel">그룹추가</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form align="center" class="inputStyle" action="insertGp.ad" method="post">
                                <input type="hidden" name="employeeNo" value="${loginUser.empNo }">
                                <table align="center">
                                    <tr>
                                        <td><input type="text" name="groupName" placeholder="그룹명을 입력해주세요" required></td>
                                        <td><button type="submit" class="btn btn-sm btn-primary">등록</button></td>
                                        <td><button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">취소</button></td>
                                    </tr>
                                </table>                               
                            </form>
                        </div>
                        <div class="modal-footer">                      
                        
                        </div>
                    </div>
                </div>
            </div>

            <!-- 내연락처 그룹수정 Modal -->
            <div class="modal fade" id="editGp" tabindex="-1" aria-labelledby="editGpModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header" >   
                            <h5 class="modal-title" id="addGpModalLabel">그룹수정</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>                     
                        </div>
                        <div class="modal-body">
                            <form  class="inputStyle">
                                <input type="hidden" name="empNo" value="">
                                <input type="hidden" name="groupNo" value="">
                                <table align="center">
                                    <tr>
                                        <td>
                                            <input type="text" name="groupName"  value="구디물산" required>
                                        </td>
                                        <td><button type="submit" class="btn btn-sm btn-primary">수정</button></td>
                                        <td><button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">취소</button></td>
                                    </tr>
                                </table>                              
                            </form>
                        </div>
                        <div class="modal-footer">                        
                        </div>
                    </div>
                </div>
            </div>
           
            <!-- 쪽지보내기 Modal -->
            <div class="modal fade" id="addressChat" tabindex="-1" aria-labelledby="addressChatModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                <div class="modal-content"> 
                    <div class="modal-header">
                        <h5 class="modal-title" id="addressChatModalLabel">쪽지보내기</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>               
                    <div class="modal-body" align="center">                       
                        <form action="" method="post">
                            <input type="hidden" name="empSendNo" value="">
                            <table>
                                <tr>
                                    <th>제목</th>
                                    <th><input class="formInput" name="noteTitle" placeholder="제목을 입력해주세요" required></th>
                                </tr>
                                <tr>
                                    <!--보이는건 받는사람 이름 / 넘기는건 hidden으로 no-->
                                    <th>받는사람</th>
                                    <td>
                                        <input class="formInput" value="김나라" readonly>
                                        <input id="empNo" type="hidden" name="empNo" value="">
                                    </td>
                                </tr>
                                <tr>
                                    <th>종류</th>
                                    <th>
                                        <select name="noteCategory" class="formInput">
                                            <option>회의</option>
                                            <option>업무</option>
                                            <option>행사</option>
                                            <option>기타</option>
                                        </select>
                                    </th>
                                </tr>
                                <tr>
                                    <th>요청</th>
                                    <th>
                                        <select name="noteRequest" class="formInput">
                                            <option>긴급</option>
                                            <option>답장필요</option>
                                            <option>답장불필요</option>
                                        </select>
                                    </th>
                                </tr>
                                <tr>
                                    <th>내용</th>
                                    <th><textarea maxlength="100" rows="8" cols="40" style="resize: none;" required class="formInput"></textarea></th>
                                </tr>
                            </table>
                            <div align="center">
                                <button type="submit" class="btn btn-sm btn-primary">보내기</button>
                                <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">취소</button>
                            </div>
                        </form>
                    </div>               
                </div>
                </div>
            </div>
            
            <script>
                $(document).ready(function() {
                    $("#cbx_chkAll").click(function() {
                        if($("#cbx_chkAll").is(":checked")) $("input[name=chk]").prop("checked", true);
                        else $("input[name=chk]").prop("checked", false);
                    });

                    $("input[name=chk]").click(function() {
                        var total = $("input[name=chk]").length;
                        var checked = $("input[name=chk]:checked").length;

                        if(total != checked) $("#cbx_chkAll").prop("checked", false);
                        else $("#cbx_chkAll").prop("checked", true); 
                    });
                }); 
            </script>

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
            		// 3) 별표연락처 테이블
            		selectStarAdd();
            		
            		//[상세보기]            		           	
            		// => 선언적함수로 거쳐서 값 전달하는것보다 바로 $function안에서 조회용 함수로 넘기는게 좋다
            		// 1) 사내직원 자세히 보기
            		$(document).on("click", "#dataCompanyTable .name", function(){
            			selectDetailEmp($(this).prev().text());
            		})
            		// 2) 내 연락처 내 상세보기
            		$(document).on("click", "#dataAddTable .name", function(){
            			selectDetailMyAdd($(this).prev().text(), $(this).parents("#dataAddTable").attr("groupno"));
            		})
            		// 3) 별표연락처 상세보기
            		$(document).on("click", "#dataStarAddTable .name", function(){
            			selectDetailMyAdd($(this).prev().text());            			
            		}) 
            		
            		// [별 클릭시 별표연락처설정 실시간변경] => 연락처 번호, input:addStar 값
            		$(document).on("click", "#adDetailTb :checkbox", function(){
            			 let addStar = ''; 
            			 if($(this).is(":checked")) {
            				addStar = 'Y'
            			 } else{
            				addStar = 'N'
            			 }            			
            			updateStarAdd($(this).next().next().val(), addStar, $(this).attr("groupno"));            		
            		})
            		
            		// 클릭 > 삭제
	           		 function deleteAdds(){
	                       if(confirm("4개 모두 삭제하시겠습니까?")){
	
	                       }else{
	                           //$("").focus();
	                       }
	                   }
            		
            		
            	})
            	
            	// 부서별 목록 ajax
            	function selectDepList(){
            		
            		$.ajax({
            			
            			url: "depList.ad",
            			success:function(list){
            				//console.log(list);
            				let value = "";
            				
            				for(let i=0; i<list.length; i++){
            					value += '<li>'
                            		   +	 '<div class="btn-group dropright btnPadding">'
                                	   + 	 	'<button type="button" class="btn btn-text">'
                                       +	    	'<span style="font-size: 15px;">' + list[i].departmentName + '</span>'
                                       +			'<input type="hidden" class="depCd" value="' + list[i].departmentCode + '">'
                                	   +	     '</button>'
                                	   +      '</div>'
                                	   +  '</li>';                              	   
                                	   
            				}
                                $("#empSubMenu").html(value);	                                
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
            				employeeNo: ${loginUser.empNo}            				
            			},
            			success:function(list){            				
            				let value = "";
            				
            				for(let i=0; i<list.length; i++){
            					  value += '<li>'
                           				 +	  '<div class="btn-group dropright btnPadding">'
                                		 + 		  '<button type="button" class="btn btn-text">'
                                         + 				'<span style="font-size: 15px;">'+ list[i].groupName +'</span>'
                                         +				'<input type="hidden" class="groupNo" value="' + list[i].groupNo + '">'
                                		 +    	  '</button> &nbsp; &nbsp;';
                                		 
                              		 if(list[i].groupName != '그룹미지정' ){
                              			 value += '<button type="button" class="btn btn-text dropdown-toggle-split" data-toggle="dropdown" aria-expanded="false" style="padding: 0;">'
                                          	 +	    	 '፧'
                                      		 +   	   '</button>'
                                     		 +         '<div class="dropdown-menu">'                                
                                          	 +        	 	'<button type="button" class="dropdown-item fontsize13" data-toggle="modal" data-target="#editGp">그룹수정</button>'
                                          	 +         		'<button type="button" class="dropdown-item fontsize13" onclick="deleteAddGp()">그룹삭제</button>' 
                                     		 +       	'</div>';
                                		 }
                              		 
                                	value +=  	'</div>'
                        				  + '</li>';
                        				 
            				}            				 
                        		$("#subAddMenu").html(value);	                        		
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
    	                              /*  + 				'<th style="width: 15px;"></th>' */
                                       + 				'<th>사번</th>'
                                	   + 				'<th>이름</th>'
                                	   +				'<th>부서</th>'
                                	   +                '<th>직위</th>'
                                	   +  				'<th>이메일</th>'
                                	   + 				'<th>내선번호</th>'
                                	   +          '</tr>'                        
                                	   +    '</thead>'
                                	   +  '<tbody>'   ;                 						   
            					
            				let pageValue = "";
            				
            				let list = result.list;
            				let pi = result.pi; 
            				
            				if(list.length == 0){
            					value += "<tr>"
            							+	"<td colspan='6'>등록된 직원이 없습니다.</td>"            						
            							+"</tr>";
            				}else{
            					for(let i=0; i<list.length; i++){
            						value += 		'<tr>'
                                        	/* + 			'<td><input type="checkbox" name="chk"></td>' */
                                        	+ 			'<td class="no">'+ list[i].empNo +'</td>'
                                            +   		'<td class="name">'+ list[i].empName +'</td>'
                                        	+   		'<td>'+ list[i].depCd +'</td>'
                                        	+  			'<td>'+ list[i].posCd +'</td>'
                                        	+   		'<td>'+ list[i].empEmail + '</td>';
                                        	
                                        	if(list[i].empExtension != null){
                                        		 value   +=   '<td>'+ list[i].empExtension +'</td>';
                                        	}else{
                                        		 value   +=  '<td>'+ '' +'</td>'; 
                                        	}                                        	
                                    value   +=  '</tr>'	;                                        	
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
            				 $(".pasingAdd").html(pageValue); 
            				 $("#deleteFeat").attr("style", "visibility:hidden");   
            				 $("#cbx_chkAll").attr("style", "visibility:hidden");
            				 $("#addTitle").html("<h4><b>"+ list[0].depCd +"</b></h4>");            				             				 
            				            				
            			},
            			error:function(){
            				console.log("조직도 주소록 테이블 조회용 ajax실패");
            			}
            			
            		
            		})
            	}
            	
            	// 조직도테이블 > 상세보기          	
            	function selectDetailEmp(empNo){
            		$.ajax({
            			url:"detailEmp.ad",
            			type:"post",
            			data:{
            				empNo:empNo
            			},
            			success:function(result){            				
            				let value = "";
            				    value += '<thead>'
                            		 	+		'<tr>'
                            		 	+	        '<th><img id="profileImg" src="';
                            	
                            if(result.empProfile != null){
                            	value +=  result.empProfile;
                            }else{
                            	value += 'resources/profile_images/defaultProfile.png';
                            }		 	
                            	value  +=			'"></th>'
                                		+			'<th align="left"><h5><b>'+ result.empName +'</b></h5></th>'                               
                                		+           '<th  align="right">'
                                    	+				'<a class="material-symbols-outlined aHover" style="text-decoration: none;" href="selectEmail.em?email='+ result.empEmail +'">mail</a>'
                                		+			'</th>'
                                		+			'<th><button type="button" class="material-symbols-outlined aHover btn-text" data-toggle="modal" data-target="#addressChat">chat</button></th>'
                           				+		 '</tr>'                       
                        				+'</thead>'
                       					+'<tbody>'               
                            			+		'<tr>'
                                		+			'<td class="fontSmallSize">부서</td>'
                                		+			'<td colspan="4" class="fontMiddleAdd">&nbsp; '+ result.depCd +'</td>'
                            			+		'</tr>'
                            			+		'<tr>'
                                		+			'<td class="fontSmallSize">직급</td>'
                                		+ 			'<td colspan="4" class="fontMiddleAdd">&nbsp;'+ result.posCd +'</td>'
                            			+ 		'</tr>'
           								+		 '<tr>'
                                		+			'<td colspan="5"> <hr style="width: 100%;"> </td>'
                           				+ 		'</tr>'
                          				+		'<tr>'
			                       		+			'<td class="fontSmallSize">이메일</td>'
			                    		+			'<td colspan="4" class="fontMiddleAdd">&nbsp; '+ result.empEmail+'</td>'
			                			+       '</tr>'
			                			+		'<tr>'
		                      			+ 			'<td class="fontSmallSize">내선번호</td>';		                			
			                			
                           
                           if(result.empExtension != null){
                        	   		value += 		'<td colspan="4" class="fontMiddleAdd">&nbsp; '+ result.empExtension+'</td>'
                           }
		                    		value +=	'</tr>'
		                    			  + 	 '<tr>'
				                       	  +			'<td class="fontSmallSize">휴대전화</td>';
                           
                           if(result.empPhone != null){
                        	   value += 			'<td colspan="4" class="fontMiddleAdd">&nbsp;' + result.empPhone + ' </td>';			               			  
                           }
                            			                    
                           		value	+=		'</tr>'
                           				+       '<tr>'
                                		+			'<td colspan="5"> <hr style="width: 97%;"> </td>'
                            			+		'</tr>'
			                            +		'<tr>'
                                		+			'<td class="fontSmallSize">입사일</td>'
                                		+			'<td colspan="4" class="fontMiddleAdd">&nbsp;'+ result.empEnrollDate+ '</td>'
                            			+		'</tr>'                             
                        				+'</tbody>'; 
                        				
                        	$("#beforeClick").remove();		
                        	$("#adDetailTb").html(value);	
                        	$("#myAddChoiceArea").attr("style", "visibility:hidden; margin-left:30px;");
                        	                        	                        				
            			},
            			error:function(){
            				console.log("조직도 직원 상세보기용 ajax 실패");
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
            					 value += '<table class="table" id="dataAddTable" groupno="'+ groupNo + '">'
    	                               +	'<thead>'
    	                               +         '<tr>'
    	                               +				'<th style="width:10px"></th>'
    	                               +				'<th style="width: 10px;"></th>'
    	                               +				'<th>번호</th>'
    	                               +				'<th>이름</th>'
    	                               +				'<th>회사</th>'
    	                               +				'<th>부서</th>'
    	                               +				'<th>직위</th>'                
    	                               +				'<th>휴대전화</th>'      
                                	   +          '</tr>'                        
                                	   +    '</thead>'
                                	   +  '<tbody>'   ;                 						   
            					
            				let pageValue = "";
            				
            				let list = result.list;
            				let pi = result.pi;   
            				
            				if(list.length == 0){
            					value += "<tr>"
            							+	"<td colspan='8'>등록된 연락처가 없습니다.</td>"            						
            							+"</tr>";
            				}else{
            					for(let i=0; i<list.length; i++){
            						value += 		'<tr>'
                                        	+ 			'<td><input type="checkbox" name="chk"></td>'
                                        	+			'<td>'
                                            +				'<span class="';
                                    if(list[i].addressStar == 'Y'){
                                    		value +=  'starYellow';
                                    }else{
                                    	value += 'starWhite';
                                    }     
                                            
                                     value  +=                '">★</span>'                           
                                        	+			'</td>'
                                        	+			'<td class="no">'+ list[i].addressNo +'</td>'
                                        	+			'<td class="name">'+ list[i].addressName +'</td>'
                                        	+			'<td>'+ list[i].addressCompany +'</td>'
                                        	+			'<td>'+ list[i].addressDepartment +'</td>'
                                        	+			'<td>'+ list[i].addressPosition +'</td>'                                        	       
                                        	
                                        	if(list[i].addressTel != null){
                                        		 value   +=   '<td>'+ list[i].addressTel +'</td>';
                                        	}else{
                                        		 value   +=  '<td>'+ '' +'</td>'; 
                                        	}                                        	
                                    value   +=  '</tr>'	;                                        	
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
            				 $(".pasingAdd").html(pageValue); 
            				            				            				
            				$("#addTitle").html("<h4><b>내 연락처</b></h4>");      
            				$("#deleteFeat").attr("style", "visibility:visible");
            				$("#cbx_chkAll").attr("style", "visibility:visible");
            				
            			},
            			error:function(){
            				console.log("내연락처 주소록 테이블 조회용 ajax실패");
            			}       		
            		})
            	} 
            	
            	// 내연락처 & 별표연락처 상세보기
            	function selectDetailMyAdd(addressNo, groupNo){
            		$.ajax({
            			url : "detailMyAdd.ad",
            			type:  "post",
            			data:{
            				addressNo:addressNo
            			},
            			success:function(result){
            				let value = "";
        				    value += '<thead>'
                        		 	+		'<tr>'
                        		 	+	        '<th class="Addstar">'
                        		 	+				'<input type="checkbox" name="addStar" value="Y" id="rate2" groupno="' + groupNo + '"';
                        	if(result.addressStar == 'Y'){
                        	 value +=				'checked';
                        	}	 	
                        		 	
                        	value 	+=  			'><label for="rate2">★</label>'   
                        			+				'<input type="hidden" class="no" value="'+ result.addressNo +'">'
                        		 	+			'</th>'
                            		+			'<th align="left"><h5><b>'+ result.addressName +'</b></h5></th>';
                          	if(result.addressNickName != null){
                          		value += '<th class="fontSmallSize" style="width: 70px;">'+ result.addressNickName+'</th>';
                          	} 		
                             value +=           '<th  align="right">'
                                	+				'<a class="material-symbols-outlined aHover" style="text-decoration: none;" href="selectEmail.em?no='+ result.addressEmail +'">mail</a>'
                            		+			'</th>'
                       				+		 '</tr>'                       
                    				+'</thead>'
                   					+'<tbody>' 
                   					+		'<tr>'
			                        +           '<td class="fontSmallSize">회사</td>'
			                        +           '<td colspan="3" class="fontMiddleAdd">&nbsp;'+ result.addressCompany +'</td>'
			                        +       '</tr>'		
                        			+		'<tr>'
                            		+			'<td class="fontSmallSize">부서</td>'
                            		+			'<td colspan="4" class="fontMiddleAdd">&nbsp; '+ result.addressDepartment +'</td>'
                        			+		'</tr>'
                        			+		'<tr>'
                            		+			'<td class="fontSmallSize">직급</td>'
                            		+ 			'<td colspan="4" class="fontMiddleAdd">&nbsp; '+ result.addressPosition +'</td>'
                        			+ 		'</tr>'
       								+		 '<tr>'
                            		+			'<td colspan="5"> <hr style="width: 100%;"></td>'
                       				+ 		'</tr>'
                      				+		'<tr>'
		                       		+			'<td class="fontSmallSize">이메일</td>'
		                    		+			'<td colspan="4" class="fontMiddleAdd">&nbsp;'+ result.addressEmail+'</td>'
		                			+       '</tr>'
		                			+		'<tr>'
	                      			+ 			'<td class="fontSmallSize">내선번호</td>';		                			
		                			
                       
                      	 if(result.addressExtensionNo != null){
                    	   		value += 		'<td colspan="4" class="fontMiddleAdd">&nbsp; '+ result.addExtensionNo+'</td>'
                      	 }
	                    		value +=	'</tr>'
	                    			  + 	 '<tr>'
			                       	  +			'<td class="fontSmallSize">휴대전화</td>';
                       
                      	 if(result.addressTel != null){
                    	 	   value += 		'<td colspan="4" class="fontMiddleAdd">&nbsp;' + result.addressTel + ' </td>';			               			  
                      	 }
		                       value +=		'</tr>'
		             			 	 + 	 	'<tr>'
			                       	 +			'<td class="fontSmallSize">FAX</td>';
                       	if(result.addressFax != null){
                   	 	       value += 		'<td colspan="4" class="fontMiddleAdd">&nbsp;' + result.addressFax + ' </td>';			               			  
                     	}            	 
                        			                    
                       		   value +=		'</tr>'
                       				 +       '<tr>'
                            		 +			'<td colspan="5"> <hr style="width: 97%;"> </td>'
                        			 +		'</tr>'
		                             +		'<tr>'
                            		 +			'<td class="fontSmallSize">메모</td>';
                            		
                          if(result.addressMemo != null ){
                        	  value += 			'<td colspan="4" class="fontMiddleAdd">&nbsp;'+ result.addressMemo+ '</td>';
                          } 		
                              value	+=		'</tr>'                             
                    				+'</tbody>'; 
                    			
                    	$("#beforeClick").remove();		
                    	$("#adDetailTb").html(value);	
                    	$("#myAddChoiceArea").attr("style", "visibility:visible; margin-left:30px;");
                    	
                    	// 편집버튼 클릭 시 편집모달창에 값 뿌리기                    	
	                    $(document).ready(function(){
	             			$(".openAddEdit").click(function(){	   
	             				const el = $("#addressEdit table");
	             				el.find("#addressNo").val(addressNo);
	             				el.find("#addressName").val(result.addressName);
	             				el.find("#addressNickName").val(result.addressNickName);
	             				el.find("#addressCompany").val(result.addressCompany);
	             				el.find("#addressDepartment").val(result.addressDepartment);
	             				el.find("#addressPosition").val(result.addressPosition);
	             				el.find("#addressEmail").val(result.addressEmail);
	             				el.find("#addressTel").val(result.addressTel);
	             				el.find("#addExtensionNo").val(result.addExtensionNo);
	             				el.find("#addressFax").val(result.addressFax);
	             				el.find("#addressMemo").val(result.addressMemo);	             				
	             			});
	             		});                    	
                    	
                 		
            			},
            			error:function(){
            				console.log("내연락처 내 상세보기 ajax 실패");
            			}
            			
            			
            		})
            	}            	     	
            	            	
            	// 별표연락처 테이블 조회            	            	
            	function selectStarAdd(cpage){
            		$.ajax({
            			url: "starList.ad",
            			type: "post",
            			data: {
            				empNo: ${loginUser.empNo},
            				cpage:cpage
            			},
            			success:function(result){
            				let list = result.list;
            				let pi = result.pi;
            				let value="";       					
       						let pageValue = "";
       						
       						value += '<table class="table" id="dataStarAddTable">' 
       	                   		 	+ 	'<thead>'
                            		+   	'<tr>'
                                	+			'<th style="width:10px"></th>'
                               		+			'<th style="width: 10px;"></th>'		   
                                	+			'<th>번호</th>'
                                	+			'<th>이름</th>'
    		   						+			'<th>그룹명</th>'	
                                	+			'<th>회사</th>'
                                	+			'<th>부서</th>'
                                	+  			'<th>직위</th>'                
                                	+			'<th>휴대전화</th>'       
                            		+		'</tr>'
                        			+	'</thead>'	
                					+ 	'<tbody>';
                					
       						if(list.length == 0){
            					value += "<tr>"
            							+	"<td colspan='8'>등록된 연락처가 없습니다.</td>"            						
            							+"</tr>";
            				}else{
            					for(let i=0; i<list.length; i++){
            						value += 		'<tr>'
                                        	+ 			'<td><input type="checkbox" name="chk"></td>'
                                        	+			'<td>'
                                            +				'<span class="';
                                    if(list[i].addressStar == 'Y'){
                                    		value +=  'starYellow';
                                    }else{
                                    	value += 'starWhite';
                                    }     
                                            
                                     value  +=                '">★</span>'                           
                                        	+			'</td>'
                                        	+			'<td class="no">'+ list[i].addressNo +'</td>'
                                        	+			'<td class="name">' + list[i].addressName + '</td>'
                                        	+			'<td>'+ list[i].groupName +'</td>'
                                        	+			'<td>'+ list[i].addressCompany +'</td>'
                                        	+			'<td>'+ list[i].addressDepartment +'</td>'
                                        	+			'<td>'+ list[i].addressPosition +'</td>';                                             
                                        	
                                        	if(list[i].addressTel != null){
                                        		 value   +=   '<td>'+ list[i].addressTel +'</td>';
                                        	}else{
                                        		 value   +=  '<td>'+ '' +'</td>'; 
                                        	}                                        	
                                    value   +=  '</tr>'	;                                        	
            					}
            					
            					 if(pi.currentPage != 1){
                        			pageValue += "<button class='btn btn-sm btn-outline-primary' onclick='selectStarAdd("+ (pi.currentPage - 1) + ")'>&lt;</button>"	
                        		}
                        		
                        		for(let p=pi.startPage; p<=pi.endPage; p++) { 
                				   
                		   			if(p == pi.currentPage) { 
                				   			pageValue += "<button class='btn btn-sm btn-outline-primary' disabled>"  + p  + "</button>"
                				   	}else {
                				   			pageValue += "<button class='btn btn-sm btn-outline-primary' onclick='selectStarAdd("+ p +")'>" + p + "</button>"
                		           	} 
                		         }     
                         
                		         if(pi.currentPage != pi.maxPage) {
                		        	  pageValue +=	"<button class='btn btn-sm btn-outline-primary' onclick='selectAddTbList("  + (pi.currentPage + 1) + ")'>&gt;</button>"
                		         }  
            				}
            				
            				value   +=	'</tbody>'
                        			+ '</table>';
                        
                        
                        
                    $("#tableArea").html(value);
       			    $(".pasingAdd").html(pageValue); 
       			 	$("#deleteFeat").attr("style", "visibility:visible"); 
       			    $("#cbx_chkAll").attr("style", "visibility:visible");
       				$("#addTitle").html("<h4><b>별표연락처</b></h4>");        				     	
       						
            			}, 
            			error:function(){
            				console.log("별표연락터 조회용 ajax실패")
            			}    
            		})
            	}
            	
            	// 별 클릭시 실시간 별표연락처 변경
            	function updateStarAdd(addNo, addStar, groupNo){
            		$.ajax({
            			url:"updateStar.ad",
            			type: "post",
            			data: {
            				addressNo:addNo,
            				addressStar:addStar
            			},
            			success:function(result){
            				if(result == "success"){ 
            					
        						if($("#tableArea>table").is("#dataStarAddTable")){
        							// =>별표목록리스트 조회하는 ajax 호출
        							selectStarAdd();
        						}else{
        							selectAddTbList(groupNo);
        						}
        						
        						
        					}
            			},
            			error:function(){
            				console.log("실시간 별표연락처 변경 ajax 실패");
            			}
            		})
            		
            	}
            	         
            	
            	
            </script>
		
</body>
</html>