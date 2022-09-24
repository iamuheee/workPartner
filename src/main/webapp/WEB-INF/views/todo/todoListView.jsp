<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>WorkPartner!</title>
    <link href="css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <script src="https://use.fontawesome.com/95b5cbecad.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <style>
        a{
            text-decoration: none;
            color:black;
            font-size: small;
        }
        .filter{
            font-size: small;
            color: gray;
        }
        .title{
            font-size: larger;
            font-weight: bolder;
        }
        .inner-area{
            padding:10px;
        }
        .btn-area button{
            width:50px;
            height:20px;
            font-size: 10px;
            line-height: 10px;
            background-color: lightgray;
        }
        .todo-cate{
            display:inline-block;
            float:left;
            margin-left:20px; margin-right:20px;
            margin-top:10px; margin-bottom: 10px;
            width:280px;
            height:400px;
            border:1px solid lightgray;
            border-radius: 5px;
            background-color: #F1F2f1;
            overflow:auto;
        }
        .todo-cate-1st{
            float:left; 
            display:block;
        }
        .todo-list{
            margin:auto;
            margin-top:5px; 
            margin-bottom:5px;
            height:50px; 
            width:95%; 
            border:1px solid gray; 
            background-color:white;
            border-radius:5px;
        }
        .modal-body .filter{
            font-weight:bold;
        }
    </style>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<body>
	<jsp:include page="../common/menubar.jsp" />
	
	<script>
		// Todo 리스트를 조회하는 선언적 함수
		function selectTodoList(){
			$.ajax({
				url: "todo.to",
				type:"POST",
				data:{
					empNo:${loginUser.empNo}
				},
				success: function(tclist){
					console.log(tclist);
					
					let html = ""; // 투두리스트를 조회하여 동적으로 띄워줄 용도의 문자열
					let modalHtml = "";	// 새로운 투두 등록 모달의 카테고리 선택 option들을 동적으로 만드는 용도의 문자열					
					if(tclist != null){
						for(let i=0; i<tclist.length; i++){
							html += '<div class="todo-cate shadow-sm inner-area">'
								  +  	'<span class="filter" onclick="deleteCate(' + tclist[i].categoryNo + ')">해당 카테고리 삭제</span>'
								  + 	'<div class="todo-title">'
								  +			'<span class="title todo-cate-title">'+ tclist[i].categoryTitle + '</span>'
								  + 	'</div>'
							for(let j=0; j<tclist[i].todosPerCate.length; j++){
								html += '<div class="todo-list">'
									  + 	'<input type="hidden" value="' + tclist[i].todosPerCate[j].todoNo + '">';
								if( tclist[i].todosPerCate[j].doneYN == 'Y' ){
								html += 	'<label style="margin-bottom:0px; font-size:14px; text-decoration:line-through">'
									  +			'<input type="checkbox" class="doneYN" style="margin-left:10px; margin-right:10px;" checked disabled>'
									  + 	 	tclist[i].todosPerCate[j].todoContent 
								}else{
								html += 	'<label style="margin-bottom:0px; font-size:14px;">'
									  +			'<input type="checkbox" class="doneYN" style="margin-left:10px; margin-right:10px;">' 
									  +			tclist[i].todosPerCate[j].todoContent 
								}
								html += 	'</label><br>'
									  +		'<div style="float:right; margin-right:5px;">'
									  +			'<span class="delete-todo filter" onclick="deleteTodo(' + tclist[i].todosPerCate[j].todoNo + ');">삭제</span>'
									  +		'</div>'
									  +	'</div>';
							}
							html += '</div>';
							
							modalHtml += '<option value="' + tclist[i].categoryNo + '" label="' + tclist[i].categoryTitle + '"></option>';
						}
						
						$("#todo-list-wrap").html(html);				
						$("#selectCategory").html(modalHtml);
					}
				},
				error: function(){
					console.log("리스트 조회 AJAX 통신 실패");
				}
			})
		}
		
		// 체크리스트 선택하면 > doneYN의 컬럼값을 'Y'로 바꾸고, ajax를 reload하여 doneYN의 컬럼값에 따라 다르게 보이게 하기
		$(document).on("click", "input[type=checkbox]", function(){
			$(this).attr("disabled", true);
			$(this).parent("label").css("text-decoration", "line-through");
			$.ajax({
				url:"done.to",
				data:{
					todoNo: $(this).parent().siblings("input").val()
				},
				success:function(result){
					alert(result);
				}
			})
		})
	</script>

	<div class="container">
	
		<%-- TO DO 상단의 무조건 보이는 영역 --%>
		<div class="title-area">
            <h1 style="font-weight:bolder;">To Do List</h1>
		</div>
		
        <div align="center">
            <span class="filter">
                할 일을 체크리스트로 작성할 수 있는 공간입니다. <br>
                To Do 항복은 한 번 삭제하면 복구할 수 없으니 신중히 삭제하세요.
            </span>
        </div>
        <hr>
		
		<%-- 아래부터는 로그인 여부, TO DO 존재 여부에 따라 보이는 내용이 달라짐 --%>
		<div id="todoList">
		    <c:choose>
		    	<c:when test="${ empty loginUser }">
		    		<div align="center">
		    			<span>To do 일정이 없습니다.</span>
		    		</div>
		    	</c:when>
		    	<c:otherwise>
			        <%-- TO DO 상단의 카테고리 추가 영역 --%>
					<div class="add-todo" align="right" style="margin:10px;">
					    <a class="filter" data-bs-toggle="modal" data-bs-target="#insertCategoryModal">
					        새로운 To Do 카테고리 <i class="fa fa-plus" aria-hidden="true"></i>
					    </a>
					    &nbsp; &nbsp; &nbsp;  
			   		    <a class="filter" data-bs-toggle="modal" data-bs-target="#insertTodoModal">
					        새로운 To Do 일정 <i class="fa fa-plus" aria-hidden="true"></i>
					    </a>
					</div>
		    		<script>selectTodoList();</script>
		    		
		    		<div id="todo-list-wrap"></div>
		    	</c:otherwise>
		    </c:choose>
		</div>
		
	</div>
	
	
    <script>
        // 카테고리 삭제 클릭시 해당 카테고리와 카테고리에 속한 모든 투두 삭제하는 AJAX
        function deleteCate(categoryNo){
        	if(window.confirm("해당 카테고리에 속한 모든 투두도 함께 지워집니다. <br> 정말 삭제하시겠습니까?")){
            	// AJAX
            	$.ajax({
            		url:"delCate.to",
            		data:{
            			categoryNo : categoryNo
            		},
            		success:function(result){
            			alert(result);
            			location.reload();
            		},
            		error:function(){
            			console.log("AJAX 통신 실패");
            		}
            	})
        	}
        }
        
        // 투두 삭제 클릭시 해당 요소 삭제하는 AJAX
        function deleteTodo(todoNo){
            if(window.confirm("정말 삭제하시겠습니까?")){
            	// AJAX
            	$.ajax({
            		url:"delete.to",
            		data:{
            			todoNo : todoNo
            		},
            		success:function(result){
            			alert(result);
            			location.reload();
            		},
            		error:function(){
            			console.log("AJAX 통신 실패");
            		}
            	})
            }
            
        }
    </script>
    
    <%-- 새로운 카테고리 추가하는 모달 시작 --%>
    <div class="modal fade" id="insertCategoryModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">To Do 카테고리 추가</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" id="submitCate">
                    <span class="filter">카테고리 이름</span><br>
                    <input type="text" name="categoryTitle" class="form-control col-md-4" required>
                    <br><br>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" >닫기</button>
                    <button type="button" class="btn btn-success" onclick="submitCate();" >확인</button>
                </div>
            </div>
        </div>
    </div>
    <%-- 새로운 카테고리 추가하는 모달 끝 --%>
    
    <%-- 새로운 카테고리 추가하는 모달의 내용을 DB에 반영하는 AJAX --%>
	<script>
        function submitCate(){
            // AJAX 작성
            // - DB에 새로운 카테고리 추가
            $.ajax({
            	url:"newcate.to",
            	data:{
            		empNo : ${loginUser.empNo},
            		categoryTitle : $("input[name=categoryTitle]").val(),
            		color : $("input[name=color]").val()
            	},
            	success:function(result){
            		alert(result);
            		location.reload();
            	}
            })
        }
    </script>


    <%-- 새로운 To Do를 추가하는 Modal --%>
    <div class="modal fade" id="insertTodoModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">To do 추가</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <span class="title">카테고리 선택</span><br>
                    <select name="selectCategory" id="selectCategory" required>
                    </select>
                    <br><br>
                    <span class="title">등록할 To do</span><br>
                    <input type="text" class="form-control" name="todoContent" required>
                    <br><br>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                    <button type="button" class="btn btn-success" onclick="submitTodo();">확인</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        function submitTodo(){
            // AJAX 작성
            // - DB에 새로운 카테고리 추가
            $.ajax({
            	url:"insert.to",
            	data:{
            		empNo : ${loginUser.empNo},
            		categoryNo : $("#selectCategory option:selected").val(),
            		todoContent : $("input[name=todoContent]").val(),
            	},
            	success:function(result){
            		alert(result);
            		location.reload();
            	}
            })
        }
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
</body>
</html>
