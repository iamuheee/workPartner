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
            .setting-left{
                float:left;
                width:30%;
            }
            .setting-right{
                float:left;
                margin-left:150px;
                width:30%;
                word-break: break-all;
            }
            .btn-imp{
                line-height: 10px;
                background-color: lightgray;
                font-size: 15px;
            }
            ul{
                padding-left:10px;
            }
            #inchargeEmp li{
                display:inline;
                list-style: none;
                margin-right:10px;
                font-size:12px;
            }
            #inchargeEmp a{
                text-decoration: none;
                color:red;
                padding-left:5px;
            }
            .group-pmenu a{
                text-decoration: none;
                color:black;
            }
            
        </style>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    </head>
    <body>
    	
    	<jsp:include page="../common/menubar.jsp" />
    	
        <br><br><br>
        <div class="container">
            <div class="ztitle-area">
                <h1 style="font-weight:bolder;">???????????? ?????? ??????</h1>
                <hr>
            </div>
            <form action="insertd.pr" method="post" class="inner-area" enctype="multipart/form-data" class="inner-area">
        		<input type="hidden" name="projNo" value="${pb.projNo}">
				<input type="hidden" name="pboardWriter" value="${loginUser.empNo}">
        		<input type="hidden" name="writerName" value="${loginUser.empName}">
        		<input type="hidden" name="refType" value="??????">
        		        		                            
                <span class="title">?????? ??????</span> <br><br>
                <input type="text" name="title" class="form-control" required>
                <br>
                <div class="setting-left">
	                <span class="title">??????</span><br>
					<select name="progress" class="form-select">
						<option selected>??????</option>
						<option >??????</option>
						<option >??????</option>
						<option >??????</option>
					</select>
                </div>
                <div class="setting-right">
	                <span class="title">?????????</span><br>
	                <button type="button" class="btn btn-sm btn-primary" id="search-emp" style="width:100%;">????????? ??????</button> <!-- ????????? ????????? ?????? -->
					<%-- ??? ????????? ???????????? ???????????? --%>
                </div>
                <br style="clear:both;"><br>
                
				<script>
	        		// ????????? ?????? ????????? ??????
	        		$("#search-emp").click(function(){
	        			$("#submit-btn").attr("disabled", true);
	        			$("#inchargeEmp").remove();
	        			window.name = "parentWindow"
	        			let childWindow; // ?????????
	        			childWindow = window.open("addressPcharge.ad","childWindow", "height=700, width=1200, resizable=no, scrollbars=no");  
	        		})
	        		
	        		// ????????????????????? empICNo??? ,??? ????????? ????????? ???????????? ??????
                	function sendMeData(data){
                		console.log(data);
                		$("#search-emp").after(data);
                		$("#submit-btn").attr("disabled", false);
                	}
                	
                </script>
                
                <div class="setting-left">
                    <span class="title" style="margin-bottom:20px;">????????? ??????</span><div style="height:5px;"></div>
	                <input type="radio" name="calendarYN" value="Y" id="Y">
	                <label for="Y">?????? ????????? ???????????? ??????</label> <br>
	                <input type="radio" name="calendarYN" value="N" id="N" checked>
	                <label for="N">?????? ????????? ???????????? ?????? ??????</label>
                </div>
                <br style="clear:both;"><br><br>
                <div class="content">
                    <span class="title">?????? ??????</span><br><br>
                    <textarea name="content" class="form-control" rows="10" style="height:400px; width:100%; overflow:auto; resize:none; requried"></textarea>
                </div>
                <br><br>
                <div class="setting-left">
                    <span class="title">?????????</span>
                    <input type="date" name="startDate" class="form-control" required><br>

                    <span class="title">?????? ??????</span>
                    <input type="file" name="upfile" class="form-control">
                </div>
                <div class="setting-right">
                    <span class="title">?????????</span>
                    <input type="date" name="endDate" class="form-control" required><br>
                </div>
                
                <script>
             		// ????????? ????????? ?????? ?????? ?????? ?????????????????? ?????????
	            	let year = new Date().getFullYear();
	            	let month = ('0' + (new Date().getMonth() + 1)).slice(-2);
	            	let date = ('0' + new Date().getDate()).slice(-2);
	           		$("input[name=startDate]").attr("min", year + '-' + month + '-' + date );
	           		$("input[name=endDate]").attr("min", year + '-' + month + '-' + date );
	           		
	            	// ????????? ????????? ????????? ?????? ?????? ?????????????????? ?????????
	            	$("input[name=startDate]").change(function(){
	            		$("input[name=endDate]").attr("min", $(this).val());
	            	})
	            	
          	    	// TB_DUTY??? TITLE ????????? ???????????? VARCHAR2(500BYTE)??? -> ?????? ?????? 500BYTE ???????????? ????????? ????????????
			    	$("input[name=title]").keyup(function(){
			    		let totalByte = 0;
			    		for( let i=0; i< $(this).val().length; i++ ){
				    		if( escape($(this).val().charAt(i)) > 4 ){ 
				    			// escape("?????????") : ?????? ???????????? 16????????? ??????, ?????????????????? 0x????? 4????????? ????????? (?????? ?????? 4?????? ??????)
				    			totalByte += 2;
				    		}else{
				    			totalByte++;
			    			}
				    		
							if(totalByte > 50){
				    			alert("?????? ???????????? ?????????????????????. ?????? ??????????????????.");
				    			// ????????? ?????? ???????????????
								$(this).val().substring( 0, $(this).val().length - 1 );					
							}	    			
			    		}
			    	})
                </script>
                
                <br style="clear:both;"><br><hr>
                <div class="submit-area" align="right">
                    <button class="btn btn-secondary" onclick="javascript:history.back();">??????</button>
                    <button class="btn btn-success" id="submit-btn" disabled>??????</button>
                </div>
            </form>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
