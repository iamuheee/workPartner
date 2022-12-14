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
            .title{
                font-size: larger;
                font-weight: bolder;
            }
            .inner-area{
                padding:100px;
                padding-top:10px;
            }
            .btn-area button{
                width:50px;
                height:20px;
                font-size: 10px;
                line-height: 10px;
                background-color: lightgray;
            }
            ul{
                padding-left:10px;
            }
            .list-mem li{
                display:inline;
                list-style: none;
                margin-right:10px;
                font-size:12px;
            }
            .list-mem a{
                text-decoration: none;
                color:red;
                padding-left:5px;
            }
            .group-pmenu a{
                text-decoration: none;
                color:black;
            }
            .hidden-info{
                display:none;
            }
            .card-comment{
                width:100%;
                background-color: lightgray;
                border-bottom-left-radius: 5px;
                border-bottom-right-radius: 5px;
            }
            a{
                text-decoration: none;
                color:black;
                font-size: small;
            }
        </style>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    </head>
    <body>
    	
    	<jsp:include page="../common/menubar.jsp" />
    	
        <br><br><br>
        <div class="container">
            <!-- =================== ???????????? ?????? ????????? ======================== -->
            <div class="card shadow-sm border-1 rounded-lg">
                <div class="card-title">
                    <div class="right" class="writer-info" style="height:50px;">
                        <form action="" method="post" class="edit-form">
                            <input type="hidden" name="dutyNo" value="${d.dutyNo}">
                            <table width="100%">
                                <tr>
                                    <td width="85%" style="padding-left:35px;padding-top:10px;">
                                        <span style="font-size:small; color:gray;">[?????????]</span>
                                        <span style="font-size:small; color:gray;">
                                        	<c:forEach var="e" items="${d.empIC}">
                                        		<span>${e.empICName} </span>
                                        	</c:forEach>
                                        </span>
                                        <h4 style="font-weight:bold;">${ d.title }</h4>
                                    </td>
                                    <td width="5%"><a href="list.du">??????</a></td>
                                    <td width="5%"><a href="uform.du?no=${d.dutyNo}">??????</a></td>
                                    <td width="5%"><a class="delete-board" onclick="deleteBoard();">??????</a></td>
                                </tr>
                            </table>
                        </form>
                    </div>

                    <script>
                        // ?????? ?????? > ?????? ????????? ????????? ?????? ???????????? ????????????????????? ??????
                        // AJAX ?????? ?????? (???????????? ???????????? ???)
                        function deleteBoard(){
                            if( window.confirm("?????? ?????????????????????????") ){
                                location.href="delete.du?dutyNo=" + ${d.dutyNo}
                            }
                        }
                    </script>
                </div>
                <hr style="height:0.1px;">
                <div class="card-description">
                    <table width="30%;" style="float:left; margin-right:100px; margin-left:40px;">
                        <tr>
                            <th>????????????</th>
                            <td>${ d.dutyNo }</td>
                        </tr>
                        <tr>
                            <th>????????????</th>
                            <td>${ d.startDate }</td>
                            <th>????????????</th>
                            <td>${ d.endDate }</td>
                        </tr>
                    </table>
                    <table width="30%" class="btn-area" style="float:left;">
                        <tr class="tr-importance">
                            <th>????????????</th>
                            <td><button class="btn btn-sm">??????</button></td>
                            <td><button class="btn btn-sm">??????</button></td>
                            <td><button class="btn btn-sm">??????</button></td>
                            <td><button class="btn btn-sm">??????</button></td>
                        </tr>
                        <tr class="tr-progress">
                            <th>????????????</th>
                            <td><button class="btn btn-sm">??????</button></td>
                            <td><button class="btn btn-sm">??????</button></td>
                            <td><button class="btn btn-sm">??????</button></td>
                            <td><button class="btn btn-sm">??????</button></td>
                        </tr>
                    </table>
                </div>

                <script>
                    // ???????????? ??????, ?????? ????????? ?????? ?????? ???????????????
                    $(function(){
                        $(".tr-progress").each(function(){
                            switch( "${d.progress}" ){
                                case '??????' : $(this).children("td").eq(0).children().css("background-color", "lightgreen"); break;
                                case '??????' : $(this).children("td").eq(1).children().css("background-color", "skyblue"); break;
                                case '??????' : $(this).children("td").eq(2).children().css("background-color", "yellow"); break;
                                case '??????' : $(this).children("td").eq(3).children().css("background-color", "violet"); break;
                            }
                        })
                        $(".tr-importance").each(function(){
                            switch( "${d.importance}" ){
                                case '??????' : $(this).children("td").eq(0).children().css("background-color", "red"); break;
                                case '??????' : $(this).children("td").eq(1).children().css("background-color", "orange"); break;
                                case '??????' : $(this).children("td").eq(2).children().css("background-color", "lightgreen"); break;
                                case '??????' : $(this).children("td").eq(3).children().css("background-color", "gray").color("color", "white"); break;
                            }
                        })
                    })
                </script>
                
                <hr>
                <div class="card-body">
                    <div class="content-area">
                        <p id="content" style="white-space:pre-line; padding-left:20px;padding-right:20px;padding-bottom:50px;">
                            ${d.content}
                        </p>
                    </div>
                    <div class="content-file" align="center">
	                <c:if test="${not empty d.filePath}">
	                	<img src="${d.filePath}" style="width:150px;"><br><br>
	            		<i class="fa fa-download" aria-hidden="true"></i>
		            	<a href="${d.filePath}">????????????</a>
	            	</c:if>
                    </div>
                </div>
                <div class="card-comment">
                    <div class="read-comment">
                        <table width="100%" id="comment-table" style="border-collapse: collapse">
                        	
                        </table>
                    </div>
                    <form class="write-comment" id="commentForm" >
                        <input type="hidden" name="empNo" value="${loginUser.empNo}">
                        <input type="hidden" name="empName" value="${loginUser.empName}">
                        <input type="hidden" name="comType" value="1">
                        <input type="hidden" name="comRefBno" value="${d.dutyNo}">
                        <input type="file" name="upfile" class="hidden-info">
                        <textarea name="comContent" class="form-control" style="width:90%; height:80px; margin:10px; float:left; resize:none"></textarea>
                        <button type="button" class="btn btn-sm btn-success" onclick="insertFile()" style="float:left; height:80px; width:3%; margin-top:10px; margin-right:5px;">
                            <i class="fa fa-paperclip" aria-hidden="true"></i>
                        </button>
                        <button type="button" class="btn btn-sm btn-secondary" onclick="insertComment()" style="float:left; height:80px; width:3%; margin-top:10px;">??????</button>
                        <br style="clear:both;">
                        <a id="fileName" style="padding:20px; color:gray;"></a>
                    </form>
                </div>
            </div>
            <br><br>
		</div>

        <script>
        	
        	/////////////////////////////
        	// ?????? ?????? ?????? function //
        	/////////////////////////////
        	
        	// ???????????? ?????????????????? ?????? ???????????? ???????????? ??????
        	$(function(){
        		selectCommentList();
        	})
        	
        	// ?????? ?????? ?????? (AJAX)
        	function selectCommentList(){
        		html = "";
        		
        		$.ajax({
        			url:"select.co",
        			data:{
        				comType:"1",
        				comRefBno:${d.dutyNo}
        			},
        			success:function(clist){
        				if(clist.length == 0){
        					// ???????????? ????????? ?????? ??????
        					html += '<th style="padding:30px;text-align:center"><span>?????? ????????? ????????? ????????????.</span></th>';
        				}else{
        					// ???????????? ????????? ?????? ??????
	        				for(let i=0; i<clist.length; i++){
	        					html += '<tr>'
	        						  + 	'<th width="8%" style="padding-left:20px;">' + clist[i].empName + '</th>'
	        						  + 	'<td width="77%;" style="padding:10px; white-space:pre-line;">' + clist[i].comContent + '</td>'
									  +		'<td width="10%;" style="color:gray;font-size:small;">' + clist[i].comCreateDate + '</td>'
								  	  +		'<td><a width="5%" href="delete.co?dno=' + ${d.dutyNo} + '&cno=' + clist[i].comNo + '">??????</a></td>'
	        						  + '</tr>';
	        						  // ??????????????? ?????? ???????????? ??? ??? ???????????? ?????? ???????????? ?????? ??? ????????? ???
								if(clist[i].file != null){ 
									console.log(clist[i].file);
									html += '<tr><td/><td colspan="4" style="padding-left:15px;font-size:small;color:gray;">??? ?????? ???????????? : <a href="' + clist[i].file.filePath + '">' + clist[i].file.fileOriginName + '</a></td><tr>';
								}
	        				}
        				}
        				// ?????? ????????? html??? ???????????? ????????????
        				$("#comment-table").html(html);
        			},
        			error:function(){
        				console.log("?????? ?????? AJAX ?????? ??????");
        			}
        		})
        	}
        	
        									
        	/////////////////////////////
        	// ?????? ?????? ?????? function //
        	/////////////////////////////
        	
        	// ?????? ????????? ?????? ???????????? ??????
            function insertFile(){
                $("input[name=upfile]").click();
            }
        	
            $("input[name=upfile]").change(function(){
                $("#fileName").html( $(this)[0].files[0].name + "?????? ?????????");
            })
            
            // ?????? ???????????? ??????
            function insertComment(){
            	console.log("?????? ????????? ??? ")
           		// trim() : ??????????????? ?????? ????????? ???????????? ?????? => ?????? "   "??? ????????? ???????????? ?????????! (????????? ??????)
            	if( $("textarea[name=comContent]").val().trim().length > 0 ){
            		// ajax??? form??? ???????????? ?????? formData ????????? ??????, ??????
            		let formData = new FormData($("#commentForm")[0]);
            		
            		console.log(formData);
            		
            		$.ajax({
            			url:"insert.co",
            			data:formData,
            			contentType:false,
            			processData:false,
            			type:"POST",
            			success:function(alertMsg){
            				// INSERT ???????????? ?????????, ??????/?????? ????????? ?????? ??? ????????? ?????? ???????????? ??????
            				alert(alertMsg);
            				selectCommentList();
            				$("textarea[name=comContent]").val("");
            				$("#fileName").html("");
            			},
            			error:function(){
            				console.log("?????? ?????? AJAX ?????? ??????");
            			}
            		})
            	}
            }
            
            // ?????? ????????? ????????? ???????????? ???????????? ??????
	    	$("textarea[name=comContent]").keyup(function(){
	    		let totalByte = 0;
	    		for( let i=0; i< $(this).val().length; i++ ){
		    		if( escape($(this).val().charAt(i)) > 4 ){ 
		    			// escape("?????????") : ?????? ???????????? 16????????? ??????, ?????????????????? 0x????? 4????????? ????????? (?????? ?????? 4?????? ??????)
		    			totalByte += 2;
		    		}else{
		    			totalByte++;
	    			}
		    		
					if(totalByte > 500){
		    			alert("?????? ???????????? ?????????????????????. ?????? ??????????????????.");
		    			// ????????? ?????? ???????????????
						$(this).val().substring( 0, $(this).val().length - 1 );					
					}	    			
	    		}
	    	})
            
            
            
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
