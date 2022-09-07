<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
    .ntOuter{
        margin: auto;
        padding: 0px;         
        align-items: center;
        box-shadow :  2px 3px 5px 2px rgb(212, 211, 211);
        border-radius: 5px;
        width: 80%; 
        /* height: 80%; */
        color: rgb(43, 42, 42);               
    }
       
    .ntOuter2{
        margin: auto;
        padding: 10px;         
        align-items: center;     
        height: 5px;
        background-color:  rgb(236, 236, 236);               
    }

    .ntOuter input{        
        border: 1px solid #ced4da;
        border-radius: 0.25rem;     
        height: 30px;        
     }

    .fontsize13{font-size: 13px;}

    .textareaStyle{
        height: 350px;
        width: 100%;
        /* border-color:rgb(182, 181, 181) ; */
        border-style: none;        
    }

    .aStyle{text-decoration: none; color:  rgb(43, 42, 42);}

    .borderColor{border: 1px solid rgb(212, 211, 211) ;}
    .paddingStyle{padding: 15px;}

    #profileImg{
         width:23px;
         height:23px;
         border:1px solid lightgray;
         border-radius: 50%;               
     }

    table *{margin:5px;}
    table{width:100%;}
     
    .sympathyRed{color: red;}
    .sympathywhite{color: rgb(197, 197, 194);}
    .marginReply{margin-left: 7%;}
</style>
   
</style>
</head>
<body>
    <jsp:include page="../common/menubar.jsp"/>

    <div style="height: 10px;"></div>
    <div  style="margin-left: 84%;">
        <a class="btn btn-sm btn-primary" href="update.nt">수정</a> 
        <a class="btn btn-sm btn-secondary" data-toggle="modal" data-target="#deleteNotice">삭제</a>
    </div>
    <br>
    <div class="ntOuter">
        <div class="paddingStyle">        

            <h6><b>2022 하반기 워크샵공지 <span style="color: red;">!</span></b></h6>
            
            <br>
            <textarea  class="textareaStyle" style="resize: none;">내용자리 입니다.</textarea>  
            <br>
                
        </div> 

        <div class="ntOuter2"></div>

        <div class="fontsize13 paddingStyle">
            <table>
                <tr>
                    <th>작성자</th>
                    <td>&nbsp; 김인사</td>
                </tr>
                <tr>
                    <th>등록일자</th>
                    <td>&nbsp; 2022.08.20</td>
                </tr>
            </table>
        </div>

        <div class="ntOuter2"></div>
        
        <div class="fontsize13 paddingStyle">
            <b>첨부파일</b> <br>
            <table style="margin-left: 10px; font-size: 12px;">            
                <tr><td><a href="" download="" class="aStyle">파일명.jpg</a></td></tr>
                <tr><td><a href="" download="" class="aStyle">파일명.jpg</a></td></tr>
            </table>
        </div>

        <br>
        
        <!-- 댓글 기능은 나중에 ajax 배우고 접목시킬예정! 우선은 화면구현만 해놓음 -->
        <table id="replyArea" class="table" align="center">
            <thead>
                <tr>
                    <th colspan="2">
                        <textarea class="form-control" name="nCommentContent" id="content" cols="57" rows="2" style="resize:none; width:100%"></textarea>
                    </th>
                    <th style="vertical-align: middle"><button class="btn btn-secondary">등록하기</button></th>
                </tr>
                <tr>
                   <td colspan="3">댓글 (<span id="rcount">3</span>) </td> 
                </tr>
            </thead>         
        </table>

        <div class="paddingStyle">
            <!-- 댓글-->
            <div class="card mb-2" >
                <div class="row no-gutters">                  
                    <div class="col-md-8">
                        <div class="card-body">
                            <h6 class="card-title">
                                <img id="profileImg" src="${pageContext.request.contextPath}/resources/profile_images/defaultProfile.png"> 김개똥 &nbsp;
                                <span class="card-text"><small class="text-muted">2022.08.20 </small></span>
                                <span id="sympathyArea" class="sympathywhite" style="margin-left: 5%; font-size: 20px;" onclick="sympathy();">♥</span> <small class="text-muted">공감 123</small>
                                <button type="button" class="btn btn-sm btn-primary" style="margin-left: 35%;" data-toggle="modal" data-target="#updateComment">수정</button>
                                <button type="button" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#deleteComment">삭제</button>
                            </h6>
                            <p class="card-text">댓글내용입니다. 과연 댓글기능을 성공할 수 있을까요 ㅎㅎㅎ</p>                           
                        </div>
                    </div>
                </div>
            </div>
               

            <!-- 대댓글 -->           
            <div class="card mb-2 marginReply">
                <div class="row no-gutters">                                                 
                    <div class="col-md-8">
                        <div class="card-body">
                            <h6 class="card-title">
                                <img id="profileImg" src="${pageContext.request.contextPath}/resources/profile_images/defaultProfile.png"> 김개똥 &nbsp;
                                <span class="card-text"><small class="text-muted">2022.08.20 </small></span>
                                <span id="sympathyArea" class="sympathyRed" style="margin-left: 5%; font-size: 20px;" onclick="sympathy();">♥</span> <small class="text-muted">공감 123</small>
                            </h6>
                            <p class="card-text">대댓글내용입니다. 과연 댓글기능을 성공할 수 있을까요 ㅎㅎㅎ</p>                           
                        </div>
                    </div>
                </div>
            </div>
            <div class="card mb-2 marginReply">
                <div class="row no-gutters">                                  
                    <div class="col-md-8">
                        <div class="card-body">
                            <h6 class="card-title">
                                <img id="profileImg" src="${pageContext.request.contextPath}/resources/profile_images/defaultProfile.png"> 김개똥 &nbsp;
                                <span class="card-text"><small class="text-muted">2022.08.20 </small></span>
                                <span id="sympathyArea" class="sympathywhite" style="margin-left: 5%; font-size: 20px;" onclick="sympathy();">♥</span> <small class="text-muted">공감 123</small>
                            </h6>
                            <p class="card-text">대댓글내용입니다. 과연 댓글기능을 성공할 수 있을까요 ㅎㅎㅎ</p>                           
                        </div>
                    </div>
                </div>
            </div>

            <!-- 대댓글 작성 -->
            <div class="card mb-2 marginReply">
                <div class="col-md-12">
                    <table id="" class="">
                        <thead>
                            <tr>
                                <th colspan="2">
                                    <textarea class="form-control" name="nCommentContent" id="content" cols="50" rows="2" style="resize:none; width:100%"></textarea>
                                </th>
                                <th style="vertical-align: middle"> &nbsp;&nbsp; <button class="btn btn-secondary">등록하기</button></th>
                            </tr>                            
                        </thead>         
                    </table>
                </div>
            </div>

             <!-- 댓글-->
             <div class="card mb-2" >
                <div class="row no-gutters">                  
                    <div class="col-md-8">
                        <div class="card-body">
                            <h6 class="card-title">
                                <img id="profileImg" src="${pageContext.request.contextPath}/resources/profile_images/defaultProfile.png"> 김개똥 &nbsp;
                                <span class="card-text"><small class="text-muted">2022.08.20 </small></span>
                                <span id="sympathyArea" class="sympathywhite" style="margin-left: 5%; font-size: 20px;" onclick="sympathy();">♥</span> <small class="text-muted">공감 123</small>
                            </h6>
                            <p class="card-text">댓글내용입니다. 과연 댓글기능을 성공할 수 있을까요 ㅎㅎㅎ</p>                           
                        </div>
                    </div>
                </div>
            </div>

        </div>

         <!-- 공지사항 삭제 Modal -->
         <div class="modal fade" id="deleteNotice" tabindex="-1" aria-labelledby="deleteNoticeModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="deleteNoticeModalLabel">공지사항 삭제</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        삭제하시겠습니까?
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-sm btn-danger">삭제</button>
                        <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">취소</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- 댓글 삭제 Modal -->
        <div class="modal fade" id="deleteComment" tabindex="-1" aria-labelledby="deleteCommentModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content" align="center">                    
                    <div class="modal-body">
                        <br>
                        해당 댓글을 삭제하시겠습니까?
                        <br><br>
                        <button type="submit" class="btn btn-sm btn-danger">삭제</button>
                        <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">취소</button>
                    </div>
                    
                </div>
            </div>
        </div>

        <!-- 댓글 수정 Modal -->
        <div class="modal fade" id="updateComment" tabindex="-1" aria-labelledby="updateCommentModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content" align="center">   
                    <div class="modal-header">
                        <h5 class="modal-title" id="deleteNoticeModalLabel">댓글 수정</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>                 
                    <div class="modal-body">
                        <form>
                            <textarea class="form-control" name="nCommentContent" id="content" cols="50" rows="2" style="resize:none; width:100%"></textarea> 
                            <br>
                            <button type="submit" class="btn btn-sm btn-danger">삭제</button>
                            <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">취소</button>
                        </form>                      
                    </div>
                   
                </div>
            </div>
        </div>

           


        
        
    </div>
</body>
</html>


