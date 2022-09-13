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
    .btn-primary{
        background-color: #0442AF;
        border-color:#0442AF;                
    }
    * {
	font-family: 'Noto Sans KR', sans-serif;
}
    
</style>
</head>
<body>	
		
    <div style="height: 20px;"></div>
    <div class="adOuter3">
    
        <div class="adContainer3">

            <!-- 선택한 부서명 & 검색 -->
            <div class="header3">
                <table>
                    <tr>
                        <td width="80px"><h4>인사부</h4></td>
                        <td><input type="text" class="form-control" placeholder="부서 또는 이름 입력하세요" name="searchText" id="searchText"  maxlength="30" style="height: 31px; width:300px"></td>
                        <td><button type="button" id="searchBtn" class="btn btn-sm btn-primary" onclick="">검색</button></td>
                    
                    </tr>
                </table>
                <hr>       
            </div>


            <!-- JStree -->            
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />

            <div class="menu3">
                <!-- 조직도 메뉴바 -->
                <h6 id="empAddress"><b>조직도</b></h6>           
                <div id="tree" class="fontsize16">
                    
                </div>
            
                <script>
                    $('#tree').jstree({ 
                            'plugins': ["wholerow"] ,
                        'core' : {	                    
                            'data' : [
                            { "id" : "ajson1", "parent" : "#", "text" : "인사부" , "icon" : false},
                            { "id" : "ajson2", "parent" : "#", "text" : "영업부", "icon" : false},
                            { "id" : "ajson3", "parent" : "ajson2", "text" : "해외영업", "icon" : false },
                            { "id" : "ajson4", "parent" : "ajson2", "text" : "국내영업", "icon" :  false},
                            { "id" : "ajson5", "parent" : "#", "text" : "마케팅부" , "icon" :  false},
                            { "id" : "ajson6", "parent" : "#", "text" : "IT개발부" , "icon" :  false},
                            { "id" : "ajson7", "parent" : "ajson6", "text" : "개발 1팀", "icon" :  false },
                            { "id" : "ajson8", "parent" : "ajson6", "text" : "개발 2팀", "icon" :  false }
                            ]
                        }
                    });
                </script>  

            </div>

           <div class="adNoteMain">
                <!-- 조직도 테이블 -->
                <table class="table" id="dataCompanyTable">
                                                                     
                    <tr>                        
                        <td class="no">D8123</td>
                        <td class="name">김인사</td>
                        <td>인사부</td>                        
                        <td>jojik123@jojik.com</td>   
                        <td><input type="radio" name="Y"></input></td>                         
                    </tr>		            
                    <tr>                        
                        <td class="no">A5123</td>
                        <td class="name">김마켓</td>
                        <td>마켓팅부</td>                        
                        <td>jojik123@jojik.com</td>   
                        <td><input type="radio" name="Y"></input></td>                         
                    </tr>                       
                   
                </table>

           </div>
              
           <div class="footer3" align="end">
                <input type="button" class="btn btn-sm btn-primary" value="보내기" onclick="send()"/>
           </div>
        </div>
        
    </div>

    <div style="height: 20px;"></div>
   
    <!-- <script>
       window.onload= function send() { 
            var empName = $(this).val();
            var empNo = $(this).parent().prev().prev().prev().prev().text();

           console.log(empName, typeof(empName));
           window.opener.document.getElementById("empName").value = empName;
           window.opener.document.getElementById("empNo").value = empNo;
             
            window.close();
        }
    </script> -->

    <script>
        function send() { 
            var empNo = $("input:checked").parent().siblings(".no").text();
            var empName = $("input:checked").parent().siblings(".name").text();
            console.log(empNo, empName);
            window.opener.$("#empName").val(empName);          
            window.opener.$("#empNo").val(empNo);           
            window.close();
        }
    </script>
</body>
</html>