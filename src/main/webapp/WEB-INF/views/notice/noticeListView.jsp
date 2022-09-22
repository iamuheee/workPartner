<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/noticeCss/notice1.css">
<style>
table tr:hover{
	cursor:pointer;
	background-color:#f1f1f1;
}
.ntOuter{
    margin: auto;
    padding: 5px;         
    align-items: center;
    box-shadow :  2px 3px 5px 2px rgb(212, 211, 211);;
    border-radius: 10px;
    width: 80%; 
    height: 100%;
}
/* 그리드영역 ===> 기존의 외부css 에서 수정했음 =>나중에 외부로 뺴기  */
.ntContainer{
     margin: 10px;
     display: grid;
     grid-gap: 10px;
     height: 100%;         
     grid-template-columns: 1fr 1fr;
     grid-template-rows: 30px 30px 0.3fr 30px 0.7fr 30px;
     grid-template-areas: 'menu1_1 menu1_2'
                          'menu2_1 menu2_2'
                          'main1 main1'
                          'footer1 footer1'    
                          'main2 main2'
                          'footer2 footer2';    
    color: rgb(43, 42, 42);  
    font-size: 13px;
 }
 .ntContainer div{
       border: none;        
 } 

.ntMenu1_1{ grid-area: menu1_1; }

.ntMenu1_2{ grid-area: menu1_2; }
 
 .ntMenu2_1{ grid-area: menu2_1;}

 .ntMenu2_2{ grid-area: menu2_2;}
      
 .ntMainTop{grid-area: main1;}
 .ntMain{grid-area: main2;}

 .ntPasing1{
    grid-area: footer1;       
}
.ntPasing2{
    grid-area: footer2;
    place-items: center;
    display: grid;
}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>

    <div style="height: 20px;"></div>

    <div class="ntOuter">

        <div class="ntContainer">

            <!-- 관리자 설정 / 새 게시글 -->
            <div class="ntMenu1_1" style="margin-right:91%">  
            	
            	<!-- 기본관리자인 인사부는 추가관리자 설정가능  -->
            	<c:choose>
            		<c:when test="${loginUser.empNtAdmin eq 'A' }">
            			 <a id="adminSetting" class="material-symbols-outlined" href="admin.nt">
		                    settings
		                </a> 
            		</c:when>            		
            	</c:choose>      
                   
            </div>

            <div class="ntMenu1_2" align="end">
            	
            	<!-- 글작성은 관리자 모두  -->
            	<c:choose>
            		<c:when test="${loginUser.empNtAdmin eq 'A' or loginUser.empNtAdmin eq 'Y'}">
            			<a class="btn btn-sm btn-primary" href="insertNtForm.nt">새 게시글</a>   
            		</c:when>   
            		<%-- <c:when test="${ loginUser.empNtAdmin eq 'Y' }">
            			<a class="btn btn-sm btn-primary" href="insertNtForm.nt">새 게시글</a>   
            		</c:when> --%>         		
            	</c:choose> 
            	                               
            </div>
    
            <!-- 검색 및 필터링-->
            <div class="ntMenu2_1">
              
                  <table>
                      <tr>
                          <td>
                              <select name="searchCategory" id="searchCategory">
                                  <option value="noticeTitle" selected>제목</option>
                                  <option value="noticeContent">내용</option>
                                  <option value="writer">작성자</option>
                              </select>
                          </td>
                          <td>
                              <input type="text" placeholder="내용을 입력해주세요" maxlength="20" name="keyword" id="keyword">
                          </td>
                          <td>
                              <button type="button" class="btn btn-sm btn-secondary btnSize" onclick="selectNoticeList(1);">검색</button>
                          </td>
                      </tr>
                  </table>       
             
            </div>
            

            <div class="ntMenu2_2" align="end">

                <select name="filter" id="filter" onchange="selectNoticeList(1);">
                    <option value="periodTotal" selected>전체기간</option>
                    <option value="6months">6개월</option>
                    <option value="1month">1개월</option>
                    <option value="1week">1주일</option>
                </select>

                <select name="orderNotice" id="orderNotice" onchange="selectNoticeList(1);">
                    <option value="createDesc" selected>최신순</option>
                    <option value="countDesc">조회순</option>                    
                </select>

            </div>
    
            <!-- 테이블 -->
		    <!-- 상단에 고정된 공지사항 -->
            <div class="ntMainTop">

                <table class="table" id="noticeTopTable">
                    <thead>
                        <tr>    
                            <th class="col-sm-1">번호</th>
                            <th class="col-sm-1"></th>
                            <th class="col-sm-1"></th>                        
                            <th class="col-sm-3">제목</th>
                            <th class="col-sm-2">작성자</th>
                            <th class="col-sm-3">등록일</th>
                            <th class="col-sm-1">조회수</th>
                        </tr>
                    </thead>
                    <tbody>
                    
                        <!-- 상단 공지사항 올 곳 -->
                        
                    </tbody>
                  
                </table>
             </div>   
             
             <!-- 상단공지사항 페이징  -->
             <div class="ntPasing1"  align="center" style="display:inline">
                
            </div>
                  
             <!-- 일반 공지사항  -->                
             <div class="ntMain"> 
             <br>	  
                <table class="table"  id="noticeTable">  
	          		<tbody>
                        <!-- 일반공지사항 자리  -->
	          		</tbody>
                </table>
                             
            </div>
               
            <!-- 일반공지사항 테이블 페이징 -->
            <div class="ntPasing2"  align="center" style="display:inline">
                 
            </div>
    
        </div>
		
		<script>
            
             $(function(){
             	
            	/* 클릭시 상세페이지 이동  */ 
             	$(document).on("click", "#noticeTopTable tr", function(){
             		location.href = 'detail.nt?no=' + $(this).children(".no").text();
             	});
             	
               	$(document).on("click", "#noticeTable tr", function(){
           			location.href = 'detail.nt?no=' + $(this).children(".no").text();
             	});    
               
               	// 상단공지사항 + 일반 공지사항을 동시에 진행 되게끔
             	selectNoticeList(1);                            	
             })      
             
             function selectNoticeList(cpage){
            	 selectNoticeTopList(1);
            	 selectNoticeNormalList(1);
             }
             
             
             function selectNoticeTopList(cpage){
            	 $.ajax({
            		 url:"selectTop.nt",
            		 data : {
            			 cpage:cpage,
            			 searchCategory:$("#searchCategory option:selected").val(),
            			 keyword:$("#keyword").val(),
            			 filter:$("#filter option:selected").val(),
            			 orderNotice:$("#orderNotice option:selected").val()
            			 
            		 },
            		 success:function(result){
            			 let list = result.list;
            			 let pi = result.pi;
            			 let value = "";
            			 let pageValue = "";
            			 
            			if(list.length == 0){
            				value += '<tr>'
            					   +	'<td colspan="7">주요 공지사항이 없습니다. </td>'
            					   +'</tr>'
            			}else{
            				 for(let i=0; i<list.length; i++){
                				 value  += '<tr>'
    			                    	 +     '<td class="no">'+ list[i].noticeNo +'</td>'
    			                   		 +     '<td>'
    			                   		 +         '<span class="material-symbols-outlined" style="color: red;">'
    			                   		 +             'campaign'
    			                   		 +         '</span>'
    			                   		 +    '</td>'
    			                   		 +    '<td>'
    			                   		 +         '<span class="material-symbols-outlined">';
    				             if(list[i].noticeFile != 'N'){
    				            	 value +=		'attach_file';
    				             }		
    				             value +=         '</span>'
    				                    +     '</td>'
    				                    +     '<td>'+ list[i].noticeTitle +' <span style="color: red;">';
    				             if(list[i].noticeImportant == 'I'){
    				            	 value += '!';
    				             }       
    				              value +=      '</span></td>'
    				                    +     '<td>'+ list[i].empName +'</td>'
    				                    +     '<td>'+ list[i].noticeCreateDate +'</td>'
    				                    +     '<td>'+ list[i].noticeCount +'</td>'
    				                    + '</tr>';
    	            		};
    	            		
    	            		if(pi.currentPage != 1){
    	            			pageValue += "<button class='btn btn-sm btn-outline-primary' onclick='selectNoticeTopList("  + (pi.currentPage - 1) + ")'>&lt;</button>"	
    	            		}
    	            		
    	            		for(let p=pi.startPage; p<=pi.endPage; p++) { 
    	    				   
    	    		   			if(p == pi.currentPage) { 
    	    				   			pageValue += "<button class='btn btn-sm btn-outline-primary' disabled>"  + p  + "</button>"
    	    				   	}else {
    	    				   			pageValue += "<button class='btn btn-sm btn-outline-primary' onclick='selectNoticeTopList(" + p +")'>" + p + "</button>"
    	    		           	} 
    	    		         }     
    	             
    	    		         if(pi.currentPage != pi.maxPage) {
    	    		        	  pageValue +=	"<button class='btn btn-sm btn-outline-primary' onclick='selectNoticeTopList("+ (pi.currentPage + 1) + ")'>&gt;</button>"
    	    		         }  
            			}     
            			
	            		$("#noticeTopTable tbody").html(value);
            			$(".ntPasing1").html(pageValue); 
            		 },
            		 error:function(){
            			 console.log("공지사항 top 조회용 실패");
            		 }
            	 })
             };
             
             function selectNoticeNormalList(cpage){
            	 $.ajax({
            		 url:"selectNormal.nt",
            		 data : {
            			 cpage:cpage,
            			 searchCategory:$("#searchCategory option:selected").val(),
            			 keyword:$("#keyword").val(),
            			 filter:$("#filter option:selected").val(),
            			 orderNotice:$("#orderNotice option:selected").val()
            			 
            		 },
            		 success:function(result){
            			 let list = result.list;
            			 let pi = result.pi;
            			 let value = "";
            			 let pageValue = "";
            			 
            			if(list.length == 0){
            				value += '<tr>'
            					   +	'<td colspan="6">등록된 공지사항이 없습니다.</td>'
            					   +'</tr>'
            			}else{
            				 for(let i=0; i<list.length; i++){
                				 value  += '<tr>'
                                 		+		'<td class="no col-sm-2">'+ list[i].noticeNo +'</td>'                                                                               
                                 		+		'<td class="col-sm-1">'
                                     	+			'<span class="material-symbols-outlined">';
                                  if(list[i].noticeFile != 'N'){
                                	  value +=			'attach_file';
                                  }   	
                                  value +=  		'</span>'
				                        +         '</td>'
				                        +         '<td class="col-sm-3">'+ list[i].noticeTitle + ' <span style="color: red;">';
				                  if(list[i].noticeImportant == 'I'){
				                	  value +=		'!';
				                  }     
				                  value +=  		'</span></td>'
				                        +         '<td class="col-sm-2">' + list[i].empName + '</td>'
				                        +         '<td class="col-sm-3">' + list[i].noticeCreateDate + '</td>'
				                        +         '<td class="col-sm-1">' + list[i].noticeCount + '</td>'
				                        +     '</tr>'; 
    	            		};
    	            		
    	            		if(pi.currentPage != 1){
    	            			pageValue += "<button class='btn btn-sm btn-outline-primary' onclick='selectNoticeNormalList("  + (pi.currentPage - 1) + ")'>&lt;</button>"	
    	            		}
    	            		
    	            		for(let p=pi.startPage; p<=pi.endPage; p++) { 
    	    				   
    	    		   			if(p == pi.currentPage) { 
    	    				   			pageValue += "<button class='btn btn-sm btn-outline-primary' disabled>"  + p  + "</button>"
    	    				   	}else {
    	    				   			pageValue += "<button class='btn btn-sm btn-outline-primary' onclick='selectNoticeNormalList(" + p +")'>" + p + "</button>"
    	    		           	} 
    	    		         }     
    	             
    	    		         if(pi.currentPage != pi.maxPage) {
    	    		        	  pageValue +=	"<button class='btn btn-sm btn-outline-primary' onclick='selectNoticeNormalList("+ (pi.currentPage + 1) + ")'>&gt;</button>"
    	    		         }  
            			}
            			          			
	            		$("#noticeTable tbody").html(value);
            			$(".ntPasing2").html(pageValue); 
            		 },
            		 error:function(){
            			 console.log("공지사항 top 조회용 실패");
            		 }
            	 })
             }
             
         </script>
       
    </div>
   
</body>
</html>