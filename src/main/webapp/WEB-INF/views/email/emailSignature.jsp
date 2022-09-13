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
    
    .formInput{
        border: 1px solid #ced4da;
        border-radius: 0.25rem;     
        /* margin: 5px;    */
    }
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>

    <div class="emailSigOuter">
        <br>
        <h5><b>메일 서명관리</b></h5>
        <hr>

        <form action="">
            
            <table class="sigTable">
                <tr>
                    <th width="60px">서명</th>
                    <td width="80px">
                        <input type="radio" id="use" name="sigUse" value="N" checked> 
                        <label for="use">사용함</label>    
                    </td>
                    <td>
                        <input type="radio" id="noUse" name="sigUse" value="Y"> 
                        <label for="noUse">사용 안함</label>    
                    </td>
                </tr>
                <tr>
                    <th>서명관리</th>
                    <td>
                        <button type="button" class="btn btn-sm btn-secondary" data-toggle="modal" data-target="#sigInsert">서명추가</button> 
                    </td> 
                    <td> 2개까지 설정가능합니다.</td>                   
                </tr>
                <tr>                    
                    <td colspan="2" align="end">
                        <span class="roundStyle">기본</span>  &nbsp;
                        <input type="radio" name="sigNo" value="4" id="4">
                        <label for="4">서명4</label>
                    </td>                    
                    <td align="end"><button type="button" class="btn btn-sm btn-secondary" onclick="deleteSig();">삭제</button></td>
                </tr>
                <tr>
                    <td colspan="2" align="end">                        
                        <input type="radio" name="sigNo" value="5" id="5">
                        <label for="5">서명5</label>
                    </td>                   
                    <td align="end"><button type="button" class="btn btn-sm btn-secondary" onclick="deleteSig();">삭제</button></td>
                </tr>

            </table>

        </form>

        <script>
            function deleteSig(){
                if(confirm("해당 서명을 삭제하시겠습니까??")){

                }else{
                    //$("").focus();
                }
            }
        </script>


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
                        <form action="">                                                 
                            <div align="center">
                                <table class="sigTable">                                                               
                                    <tr>                                    
                                        <th colspan="2">이름</th>                                                                      
                                        <td>
                                            김나라
                                            <input type="hidden" name="" value="김나라">
                                        </td>                                                                             
                                    </tr>                               
                                    <tr>
                                        <th colspan="2">부서</th>
                                        <td>
                                            인사부
                                            <input type="hidden" name="" value="인사부">
                                        </td>                                       
                                    </tr>                                         
                                    <tr>
                                        <th colspan="2">직급</th>                                     
                                        <td>
                                            사원
                                            <input type="hidden" name="" value="사원">
                                        </td>
                                    </tr> 
                                    <tr>
                                        <th colspan="2">휴대전화</th> 
                                        <td><input class="formInput" type="text" name="addTel" placeholder=" -도 함께 입력해주세요." maxlength="13" value="010-5869-2583"></td>
                                    </tr>                 
                                    <tr>
                                        <th colspan="2">이메일</th> 
                                        <td><input class="formInput" type="email" name="addEmail" value="df234@jojik.com"></td>
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox" name="address" value="Y"></td>
                                        <th>회사주소 :  &nbsp;</th>
                                        <td>서울 금천구 가산디지털2로 115</td>
                                    </tr>        
                                    <tr>
                                        <td><input type="checkbox" name="" value="031-1234-5678"></td>
                                        <th>사내번호 :  &nbsp;</th> 
                                        <td>031-1234-5678</td>
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

                


    </div>
</body>
</html>