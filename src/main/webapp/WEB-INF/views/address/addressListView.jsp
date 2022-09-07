<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>	    
    .adOuter{margin: auto;
        padding: 20px;         
        align-items: center;
        box-shadow :  2px 3px 5px 2px rgb(212, 211, 211);;
        border-radius: 10px;
        width: 100%; 
        height: 90%;}
    /* 그리드영역 */
     .adContainer{
         display: grid;
         grid-gap: 15px;
         height: 90vh;
         grid-template-columns: 200px 1fr 450px;
         grid-template-rows: 60px 0.45fr 0.45fr 40px;
         grid-template-areas: 'menu1 header header'
                              'menu2_1 main detail'
                              'menu2_2 main detail'
                              'menu3  footer detail';    
        color: rgb(43, 42, 42);  
        font-size: 13px;
     }
     .adContainer div{
         /* border: 1px solid  black; */
     } 

     .addMenu1{grid-area: menu1;}
     
     .addMenu2_1{ grid-area: menu2_1;
     }
     
     .addMenu2_2{grid-area: menu2_2;}
     
     .addMenu3{grid-area: menu3;}
	
     .addSearch{grid-area: header;}

     .addMain{grid-area: main;}

     .detailAdd{grid-area: detail;}

     .pasingAdd{
        grid-area: footer;
        place-items: center;
        display: grid;
    }

     /*  그 외 css */

     .centerBtn{
        margin-top: 15px;
       
        /* position:absolute; right: 20%; */
     }

	 .sub-add {margin-left: 1.5rem;}
     .sub-add:hover{ cursor: pointer;}    
    

     .table>tbody>tr:hover{
         cursor:pointer;
         background-color:#f1f1f1;
      }
     .addBoxShadow {        
         margin-left:30px;
         padding: 10px 10px 10px 50px;         
         align-items: center;
         box-shadow :  2px 3px 5px 2px rgb(212, 211, 211);;
         border-radius: 1px;
         width: 80%; 
     }    
     .Addstar input[type=checkbox]{
         display: none;
     }
     .Addstar label{
         font-size: 2.0em;
         color: transparent;
         text-shadow: 0 0 0 #f0f0f0;
     }
     .Addstar label:hover{ text-shadow: 0 0 0 rgba(250, 208, 0, 0.99); }
     .Addstar label:hover ~ label{ text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);}
     .Addstar input[type=checkbox]:checked ~ label{ text-shadow: 0 0 0 rgba(250, 208, 0, 0.99); }

     .Addstar3 input[type=checkbox]{
         display: none;
     }
     .Addstar3 label{
         font-size: 2.5em;
         color: transparent;
         text-shadow: 0 0 0 #f0f0f0;
     }
     .Addstar3 label:hover{ text-shadow: 0 0 0 rgba(250, 208, 0, 0.99); }
     .Addstar3 label:hover ~ label{ text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);}
     .Addstar3 input[type=checkbox]:checked ~ label{ text-shadow: 0 0 0 rgba(250, 208, 0, 0.99); }

     .fontSmallSize{
         font-size: 13px;
         color: rgb(104, 103, 103);        
     }
     .fontMiddleAdd{            
         font-weight: 500;         
         font-size: 14px;
     }
     #profileImg{
         width:23px;
         height:23px;
         border:1px solid lightgray;
         border-radius: 50%;               
     }
     .aHover:hover{
        cursor: pointer;
     }

    .starYellow{                
        font-size: 1.0em;
        color:rgba(250, 208, 0, 0.99);        
    }
    .starWhite{       
        font-size: 1.0em;     
        color: rgb(197, 197, 194);
    }

    #mainAddMenu, #subAddMenu{ list-style-type: none; margin: 0; padding:0;}

    #subAddMenu>li{padding-left: 20px; margin: 0px;}
   
    #subAddMenu>li:hover{cursor:pointer; background: rgb(233, 244, 248);}
    #mainAddMenu>li:hover{cursor:pointer; background: rgb(233, 244, 248);}
    
    .starAdd:hover{cursor:pointer; background: rgb(233, 244, 248);}

    .btn-text{border-style: none; background-color: white;} 

    #empAddress:hover{cursor:pointer; background: rgb(233, 244, 248);}
    
    .formInput{
        border: 1px solid #ced4da;
        border-radius: 0.25rem;     
        margin: 5px;   
    }

    .btnAdd{border-style: none;}
    .btnAdd:hover{background-color:rgba(250, 208, 0, 0.99);}

    .fontsize16{font-size: 16px;}
    .fontsize13{font-size: 13px;}

    .resize13{height: 13px;}

    /* .gpOption{font-optical-sizing: 10px;} */

    /* #dataStarAddTable{
        vertical-align: middle;
    } */

    .inputStyle input{        
        border: 1px solid #ced4da;
        border-radius: 0.25rem;     
        height: 32px;
        
     }
            
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

            
            <%-- JStree --%>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />

            <!--  별표연락처 & 조직도 -->
            <div class="addMenu2_1">
            
                <!-- 별표연락처 -->
                <div class="starAdd">
                    <span class='starYellow'>★</span><span style="font-size: 16px;"><b>별표연락처</b></span>
                </div>

            <hr width="80%">
            <!-- 조직도 -->
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
                        <li>
                            <div class="btn-group dropright btnPadding">
                                <button type="button" class="btn btn-text">
                                    <span style="font-size: 15px;">구디물산</span>
                                </button> &nbsp; &nbsp;
                                <button type="button" class="btn btn-text dropdown-toggle-split" data-toggle="dropdown" aria-expanded="false" style="padding: 0;">
                                    ፧
                                </button>
                                <div class="dropdown-menu">
                                <!-- Dropdown menu links -->
                                    <button type="button" class="dropdown-item fontsize13" data-toggle="modal" data-target="#editGp">그룹수정</button>
                                    <button type="button" class="dropdown-item fontsize13" data-toggle="modal" data-target="#deleteGp">그룹삭제</button> 
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="btn-group dropright">
                                <button type="button" class="btn btn-text">
                                    <span style="font-size: 15px;">제일디자인</span>
                                </button>  &nbsp; &nbsp;
                                <button type="button" class="btn btn-text dropdown-toggle-split" data-toggle="dropdown" aria-expanded="false" style="padding: 0;">
                                    ፧
                                </button>
                                <div class="dropdown-menu">
                                <!-- Dropdown menu links -->
                                    <button type="button" class="dropdown-item fontsize13" data-toggle="modal" data-target="#editGp">그룹수정</button>
                                    <button type="button" class="dropdown-item fontsize13" data-toggle="modal" data-target="#deleteGp">그룹삭제</button> 
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="btn-group dropright">
                                <button type="button" class="btn btn-text">
                                    <span style="font-size: 15px;">그룹미지정</span>
                                </button>                            
                            </div>
                        </li>

                    </ul>
                </ul>

                    
            </div>
            
            <div class="addMenu3"></div>

            <!--  검색영역 -->
            <div class="addSearch">
                <table class="centerBtn">
                    <tr>
                        <td width="80px"><h4>인사부</h4></td>
                        <td><input type="text" class="form-control" placeholder="부서 또는 이름 입력하세요" name="searchText" id="searchText"  maxlength="30" style="height: 31px; width:300px"></td>
                        <td><button type="button" id="searchBtn" class="btn btn-sm btn-primary" onclick="">검색</button></td>
                        <td width="90px" align="right">전체 3명</td>
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

                    <!-- 내연락처일때만 삭제기능 -->
                    <!-- 삭제 > 모달 > 기능 정보넘기는거 어렵다면 그냥 모달창 띄우지말고 바로 삭제처리 -->
                    <button type="button" class="btn btn-sm btn-secondary" data-toggle="modal" data-target="#addressDelete">삭제</button>                

                    <a class="btn btn-sm btn-primary">메일보내기</a>
                </div>
                
                <br>

                <!-- 조직도 테이블 -->
                <!-- <table class="table" id="dataCompanyTable">
                    <thead>
                        <tr>
                            <th style="width: 15px;"></th>
                            <th>사번</th>
                            <th>이름</th>
                            <th>부서</th>
                            <th>직위</th>
                            <th>이메일</th>
                            <th>내선번호</th>       
                        </tr>
                    </thead>
            
                    <tbody>                    
                        <tr>
                            <td><input type="checkbox" name="chk"></td>
                            <td class="no">D895c123</td>
                            <td>김인사</td>
                            <td>인사부</td>
                            <td>차장</td>
                            <td>jojik123@jojik.com</td>
                            <td>070-4465-4822</td>
                        </tr>		            
                        <tr>
                            <td><input type="checkbox" name="chk"></td>
                            <td class="no">F895c123</td>
                            <td>김인사</td>
                            <td>인사부</td>
                            <td>차장</td>
                            <td>jojik123@jojik.com</td>
                            <td>070-4465-4822</td>
                        </tr>  
                        <tr>
                            <td><input type="checkbox" name="chk"></td>
                            <td class="no">A895c123</td>
                            <td>김인사</td>
                            <td>인사부</td>
                            <td>차장</td>
                            <td>jojik123@jojik.com</td>
                            <td>070-4465-4822</td>
                        </tr> 
                        <tr>
                            <td><input type="checkbox" name="chk"></td>
                            <td class="no">R895c123</td>
                            <td>김인사</td>
                            <td>인사부</td>
                            <td>차장</td>
                            <td>jojik123@jojik.com</td>
                            <td>070-4465-4822</td>
                        </tr> 
                        <tr>
                            <td><input type="checkbox" name="chk"></td>
                            <td class="no">G895c123</td>
                            <td>김인사</td>
                            <td>인사부</td>
                            <td>차장</td>
                            <td>jojik123@jojik.com</td>
                            <td>070-4465-4822</td>
                        </tr> 
                        <tr>
                            <td><input type="checkbox" name="chk"></td>
                            <td class="no">WE95c123</td>
                            <td>김인사</td>
                            <td>인사부</td>
                            <td>차장</td>
                            <td>jojik123@jojik.com</td>
                            <td>070-4465-4822</td>
                        </tr> 
                        <tr>
                            <td><input type="checkbox" name="chk"></td>
                            <td class="no">T5695c123</td>
                            <td>김인사</td>
                            <td>인사부</td>
                            <td>차장</td>
                            <td>jojik123@jojik.com</td>
                            <td>070-4465-4822</td>
                        </tr> 
                            
                    </tbody> 
                </table> -->
                                
                
                <!-- 내 연락처 테이블 -->
                <!-- <table class="table" id="dataAddTable">    
                     <thead>
                        <tr>
                            <th style="width:10px"></th>
                            <th style="width: 10px;"></th>
                            <th>번호</th>
                            <th>이름</th>
                            <th>회사</th>
                            <th>부서</th>
                            <th>직위</th>                
                            <th>휴대전화</th>       
                        </tr>
                    </thead>
            
                    <tbody>
                        <tr>
                            <td><input type="checkbox" name="chk"></td>
                            <td>
                                <span class='starYellow'>★</span>                           
                            </td>
                            <td class="no">10</td>
                            <td>김인사</td>
                            <td>구디물산</td>
                            <td>인사부</td>
                            <td>차장</td>                
                            <td>070-4465-4822</td>
                        </tr>    
                        <tr>
                            <td><input type="checkbox" name="chk"></td>
                            <td>                            
                                <span class='starWhite'>★</span>
                            </td>
                            <td class="no">9</td>
                            <td>김인사</td>
                            <td>구디물산</td>
                            <td>인사부</td>
                            <td>차장</td>                
                            <td>070-4465-4822</td>
                        </tr>         
                    </tbody>
                </table>      -->
                
                
                <!-- 별표연락처 -->
                 <table class="table" id="dataStarAddTable"> 
                    <thead>
                        <tr>
                            <th style="width:10px"></th>
                            <th style="width: 10px;"></th>
                            <th>번호</th>
                            <th>이름</th>
                            <th>회사</th>
                            <th>부서</th>
                            <th>직위</th>                
                            <th>휴대전화</th>       
                        </tr>
                    </thead>
            
                    
                    <tbody>
                        <tr>
                            <td><input type="checkbox" name="chk"></td>
                            <td>
                                <span class='starYellow'>★</span>                           
                            </td>
                            <td class="no">10</td>
                            <td>김인사</td>
                            <td>구디물산</td>
                            <td>인사부</td>
                            <td>차장</td>                
                            <td>070-4465-4822</td>
                        </tr>    
                        <tr>
                            <td><input type="checkbox" name="chk"></td>
                            <td>                            
                                <span class='starYellow'>★</span>
                            </td>
                            <td class="no">9</td>
                            <td>김인사</td>
                            <td>구디물산</td>
                            <td>인사부</td>
                            <td>차장</td>                
                            <td>070-4465-4822</td>
                        </tr>         
                    </tbody>       
                </table>


            
            </div>

            <!-- <script> ajax라서... 어떻게 넘길지 모르겠음
                                
                $(function(){
                   
                    $(".emailTitle").click(function(){
                        location.href = 'detail.ne?no=' + $(this).siblings(".no").text();
                                                        // 해당 emailTitle의 동위요소  중 클래스가 no인
                    })        		
        

                    $("#dataCompanyTable>tbody>tr").click(function(){
                        location.href = 'detailCompany.ad?no=' + $(this).children(".no").text();
                                                        // 해당 tr요소의 자식요소 중 클래스가 no인
                    })   
                    
                    $("#dataAddTable>tbody>tr").click(function(){
                        location.href = 'detailMyAdd.ad?no=' + $(this).children(".no").text();
                                                        // 해당 tr요소의 자식요소 중 클래스가 no인
                    })   

                    $("#dataStarAddTable>tbody>tr").click(function(){
                        location.href = 'detailStarAdd.ad?no=' + $(this).children(".no").text();
                                                        // 해당 tr요소의 자식요소 중 클래스가 no인
                    }) 
                })            	
                
            </script> -->

            <!-- 특정 멤버의 주소록 상세창영역-->
            <div class="detailAdd">           
                <br>
                <!-- 내연락처에만 있는 삭제/ 편집기능-->
                <div style="margin-left: 30px;" align="left">
                    <button type="button" class="btn btn-sm btn-warning" data-toggle="modal" data-target="#addressEdit">편집</button>
                    <button type="button" class="btn btn-sm btn-secondary" data-toggle="modal" data-target="#addressDelete2">삭제</button>      
                </div> 

                <div class="addBoxShadow">
                    <br>
                    <table>	
                        
                        <!--목록클릭 전-->
                        <!-- <br>
                        <p>
                            연락처 상세정보를 보려면 목록을 <br>
                            클릭하세요
                        </p> -->

                        <!-- 주소록 상세보기 -->
                        <!-- <thead>
                            <tr>
                                <th>
                                    <img id="profileImg" src="">
                                </th>
                                <th align="left"><h5><b>감나라</b></h5></th>
                                <th class="fontSmallSize" style="width: 50px;">Maria</th>
                                <th  align="right">
                                    <a class="material-symbols-outlined aHover" style="text-decoration: none;" href="">
                                        mail
                                    </a>
                                </th>
                                <th>
                                    <button type="button" class="material-symbols-outlined aHover btn-text" data-toggle="modal" data-target="#addressChat">
                                        chat
                                    </button>
                                </th>
                            </tr>                       
                        </thead>
                        <tbody>               
                            <tr>
                                <td class="fontSmallSize">부서</td>
                                <td colspan="4" class="fontMiddleAdd">&nbsp; 영업부1팀</td>
                            </tr>
                            <tr>
                                <td class="fontSmallSize">직급</td>
                                <td colspan="4" class="fontMiddleAdd">&nbsp; 주임</td>
                            </tr>
            
                            <tr>
                                <td colspan="5"> <hr style="width: 100%;"> </td>
                            </tr>
            
                            <tr>
                                <td class="fontSmallSize">이메일</td>
                                <td colspan="4" class="fontMiddleAdd">&nbsp; wkdfgjkdl@naver.com</td>
                            </tr>
                            <tr>
                                <td class="fontSmallSize">내선번호</td>
                                <td colspan="4" class="fontMiddleAdd">&nbsp;  073-1234-5689</td>
                            </tr>
                            <tr>
                                <td class="fontSmallSize">휴대전화</td>
                                <td colspan="4" class="fontMiddleAdd">&nbsp; 010-1234-5689</td>
                            </tr>                        
            
                            <tr>
                                <td colspan="5"> <hr style="width: 97%;"> </td>
                            </tr>
            
                            <tr>
                                <td class="fontSmallSize">입사일</td>
                                <td colspan="4" class="fontMiddleAdd">&nbsp;  2018.07.02</td>
                            </tr>                             
                        </tbody>  -->

                        <!-- 별표연락처 & 내 연락처 상세보기 -->
                        <thead>
                                <tr>
                                    <th class="Addstar">
                                        <input type="checkbox" name="addStar" value="" id="rate2">
                                        <label for="rate2">★</label>                                  
                                    </th>
                                    <th align="left"><h2>감나라</h2></th>
                                    <th class="fontSmallSize" style="width: 70px;">Maria</th>
                                    <th align="right">
                                        <a class="material-symbols-outlined aHover" style="text-decoration: none;">
                                            mail
                                        </a>
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="fontSmallSize">회사</td>
                                    <td colspan="3" class="fontMiddleAdd">&nbsp; 제일디자인</td>
                                </tr>
                                <tr>
                                    <td class="fontSmallSize">부서</td>
                                    <td colspan="3" class="fontMiddleAdd">&nbsp; 영업부1팀</td>
                                </tr>
                                <tr>
                                    <td class="fontSmallSize">직급</td>
                                    <td colspan="3" class="fontMiddleAdd">&nbsp; 주임</td>
                                </tr>
                
                                <tr>
                                    <td colspan="4"> <hr style="width: 97%;"> </td>
                                </tr>
                
                                <tr>
                                    <td class="fontSmallSize">이메일</td>
                                    <td colspan="3" class="fontMiddleAdd">&nbsp; wkdfgjkdl@naver.com</td>
                                </tr>
                                <tr>
                                    <td class="fontSmallSize">내선번호</td>
                                    <td colspan="3" class="fontMiddleAdd">&nbsp;  073-1234-5689</td>
                                </tr>
                                <tr>
                                    <td class="fontSmallSize">휴대전화</td>
                                    <td colspan="3" class="fontMiddleAdd">&nbsp; 010-1234-5689</td>
                                </tr>
                
                                <tr>
                                    <td class="fontSmallSize">FAX</td>
                                    <td colspan="3" class="fontMiddleAdd">&nbsp; 02-561-4635</td>
                                </tr>              
                
                                <tr>
                                    <td colspan="4"> <hr style="width: 97%;"> </td>
                                </tr>
                
                                <tr>
                                    <td class="fontSmallSize">메모</td>
                                    <td colspan="3" class="fontMiddleAdd">&nbsp; 시간약속에 철저한 편</td>
                                </tr>                             
                            </tbody>  

            
                    </table> 
                    <br>
                </div>
        
            </div>
                
            <!-- 페이징 영역-->
            <div class="pasingAdd">
                <nav aria-label="Page navigation example">
                <ul class="pagination">
                    <li class="page-item">
                    <a class="page-link" href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                    </li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item">
                    <a class="page-link" href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                    </li>
                </ul>
                </nav>            
            </div>

            <!--==================================== Modal ======================================= -->

            <!-- 새연락처 Modal -->
            <div class="modal fade" id="addressAdd" tabindex="-1" aria-labelledby="addressAddModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <!-- <div class="modal-header">
                            <h5 class="modal-title" id="addressAddModalLabel">새 연락처</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div> -->
                        <div class="modal-body">                          
                            <form action="">
                                <table align="center">   
                                        <tr>
                                            <th class="Addstar3" colspan="2">
                                                <input type="checkbox" name="addStar" value="Y" id="rate3">
                                                <label for="rate3">★</label>                                  
                                            </th>                                    
                                        </tr>                             
                                    <tr>
                                            <th>이름</th>  &nbsp;                                                                       
                                            <td><input class="formInput"  type="text" id="addName" name="addName" required></td>                                       
                                    </tr>
                                    <tr>
                                            <th>닉네임</th>  &nbsp;
                                            <td><input class="formInput" type="text" name="addNick"></td>
                                    </tr>
                                    <tr>
                                            <th>회사</th> &nbsp;
                                            <td><input class="formInput" type="text" name="addCompany" required></td>                                       
                                    </tr>        
                                    <tr>
                                            <th>부서</th>  &nbsp;                                    
                                            <td><input class="formInput" type="text" name="addDepartment" required></td>                                        
                                        </tr>    
                                        <tr>
                                            <th>직급</th>   &nbsp;                                   
                                            <td><input class="formInput" type="text" name="addPosition" required></td>
                                        </tr>                            
                                        <tr>
                                            <th>이메일</th> &nbsp;
                                            <td><input class="formInput" type="email" name="addEmail" required></td>
                                        </tr>
                                        <tr>
                                            <th>휴대전화</th> &nbsp;
                                            <td ><input class="formInput" type="text" name="addTel" placeholder=" -도 함께 입력해주세요." maxlength="13"></td>
                                        </tr>
                                        <tr>
                                            <th>사내번호</th> &nbsp;
                                            <td><input class="formInput" type="text" name="addExtensionNo"></td>
                                        </tr>
                                        <tr>
                                            <th>FAX</th> &nbsp; 
                                            <td><input class="formInput" type="text" name="addFax"></td>
                                        </tr>
                                        <tr>
                                            <th>메모</th> &nbsp;
                                            <td><textarea style="resize: none;" maxlength="19" name="addMemo" id="addMemo1" cols="30" class="formInput"></textarea></td>                                        
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
                                                    <option value="">구디쓰주식회사</option>
                                                    <option value="">제일디자인</option>
                                                    <option value="">그룹미지정</option>
                                                </select>
                                            </td>
                                        </tr>
                                    
                                </table>
                                <br><br>
                                <div align="center">
                                    <button type="submit" class="btn btn-sm btn-primary">수정</button>
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

            <!-- 내연락처 상세보기 삭제 Modal -->
            <div class="modal fade" id="addressDelete2" tabindex="-1" aria-labelledby="addressDelete2ModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="addressDelete2ModalLabel">내 연락처삭제</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            감나라님의 연락처를 내 연락처에서 삭제하시겠습니까?                          
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
                        <!-- <div class="modal-header">
                            <h5 class="modal-title" id="addressEditModalLabel">연락처 편집</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div> -->
                        <div class="modal-body">                          
                            <form action="">
                                <table align="center">  
                                        <tr>
                                            <th class="Addstar3" colspan="2">
                                                <input type="checkbox" name="addStar" value="Y" id="rate4">
                                                <label for="rate4">★</label>                                  
                                            </th>                                    
                                        </tr>                               
                                    <tr>
                                            <th >이름</th>  &nbsp;                                                                       
                                            <td ><input class="formInput"  type="text" id="addName" name="addName" value="감나라" required></td>                                                                             
                                    </tr>
                                    <tr>
                                            <th>닉네임</th>  &nbsp;
                                            <td><input class="formInput" type="text" name="addNick" value="Maria"></td>
                                    </tr>
                                    <tr>
                                            <th>회사</th> &nbsp;
                                            <td><input class="formInput" type="text" name="addCompany" required value="구디쓰주식회사"></td>                                       
                                    </tr>        
                                    <tr>
                                            <th>부서</th>  &nbsp;                                    
                                            <td><input class="formInput" type="text" name="addDepartment" required></td>                                        
                                        </tr>    
                                        <tr>
                                            <th>직급</th>   &nbsp;                                   
                                            <td><input class="formInput" type="text" name="addPosition" required></td>
                                        </tr>                            
                                        <tr>
                                            <th>이메일</th> &nbsp;
                                            <td><input class="formInput" type="email" name="addEmail" required></td>
                                        </tr>
                                        <tr>
                                            <th>휴대전화</th> &nbsp;
                                            <td ><input class="formInput" type="text" name="addTel" placeholder=" -도 함께 입력해주세요." maxlength="13"></td>
                                        </tr>
                                        <tr>
                                            <th>사내번호</th> &nbsp;
                                            <td><input class="formInput" type="text" name="addExtensionNo"></td>
                                        </tr>
                                        <tr>
                                            <th>FAX</th> &nbsp; 
                                            <td><input class="formInput" type="text" name="addFax"></td>
                                        </tr>
                                        <tr>
                                            <th>메모</th> &nbsp;
                                            <td><textarea style="resize: none;" maxlength="19" name="addMemo" id="addMemo" cols="30" class="formInput"></textarea></td>                                        
                                        </tr>
                                        <tr>
                                            <td colspan="2" align="end">
                                                <span id="addMemoContentcount">0</span>
                                                <span class="blueColor">/20</span> 
                                            </td>
                                            <script>
                                                $(function(){
                                                    $("#addMemo").keyup(function(){
                                                        $("#addMemoContentcount").text($(this).val().length); 
                                                    })
                                                })
                                            </script>
                                        </tr>
                                        <tr>
                                            <th>그룹</th>
                                            <td>
                                                <select name="groupNo" class="formInput">
                                                    <option value="">구디쓰주식회사</option>
                                                    <option value="">제일디자인</option>
                                                    <option value="">그룹미지정</option>
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
                            <form align="center" class="inputStyle">
                                <input type="hidden" name="empNo" value="">
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

            <!-- 내연락처 그룹 삭제 Modal -->
            <div class="modal fade" id="deleteGp" tabindex="-1" aria-labelledby="deleteGpModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="deleteGpModalLabel">그룹삭제</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            그룹과 연락처 모두 삭제됩니다. 삭제하시겠습니까?                          
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-sm btn-danger">삭제</button>
                            <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">취소</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 쪽지보내기 Modal -->
            <div class="modal fade" id="addressChat" tabindex="-1" aria-labelledby="addressChatModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                <div class="modal-content"> 
                    <div class="modal-header">
                        <h5 class="modal-title" id="addressDelete2ModalLabel">쪽지보내기</h5>
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
                                    <th><input class="formInput" value="김나라" readonly></th>
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
		
</body>
</html>