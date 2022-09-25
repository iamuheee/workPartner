<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fullcalendar/main.css">
<script src='${pageContext.request.contextPath}/resources/js/fullcalendar/main.js'></script>
<style>
    .div1{
        display:inline-block;
        width: 100%;
        height: 90%;
        }
        
	.fc-day-sun a {
	  color: red;
	  text-decoration: none;
	}  
	.fc-day-sat a {
	  color: blue;
	  text-decoration: none;
	}
	.fc-day-mon a {
	  color: black;
	  text-decoration: none;
	}
	.fc-day-tue a {
	  color: black;
	  text-decoration: none;
	}
	.fc-day-wed a {
	  color: black;
	  text-decoration: none;
	}
	.fc-day-thu a {
	  color: black;
	  text-decoration: none;
	}
	 .fc-day-fri a {
	  color: black;
	  text-decoration: none;
	}
	      
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	
	<div style="height:2%"></div>
	
		<div id="outer" style="width:80%">
			<!-- 상단 메뉴 제목 영역 -->
			<div id="header">
			    <h3>근태 등록</h3>
			</div>
			
			<hr>
			
			<br><br>	
			
			<div style="clear:both"></div>
			
		 	<div id='calendar' class="div1 ">
		 		
			</div>
	          
	</div>
	
	<br><br>
	
	
	<script>

		document.addEventListener('DOMContentLoaded', function() {
		  var calendarEl = document.getElementById('calendar');
		  var calendar = new FullCalendar.Calendar(calendarEl, {
			  initialView: 'dayGridMonth',
			  //googleCalendarApiKey: 'AIzaSyDb-QzeaUWOmy40bh95g5FO0qfU9X6Hz6g',
			  titleFormat: function (date) {
			      year = date.date.year;
			      month = date.date.month + 1;
					
			      return year + "년 " + month + "월";
			    }, 
       

			    eventSources: [
				    {
			          googleCalendarId: 'ko.south_korea.official#holiday@group.v.calendar.google.com',
			          color: "red", //rgb,#ffffff 등의 형식으로 할 수 있어요.
			          textColor: "white"
			          
			          //textColor: 'black' 
			        },
			    ],
			    events:[
			    	  	
			    		  <c:forEach var="c" items="${list}">   // 연휴
			    		  {
			    			  title:"${c.holName}",
			    			  start:"${c.holDay}",
			    			  color : "#FF0000", 
			    			  textColor : "white"
			    		  },
			    		  </c:forEach>
			    		  
			    		  <c:forEach var="a" items="${list2}">  // 결근
			    		  {
			    			  title:"${a.status}",
			    			  start:"${a.dt}",
			    			  content: "출근 : ${a.attCmt} / 퇴근시간 : ${a.attQt}",
			    			  color: "green"
			    			  
			    		  },
			    		  </c:forEach>
			    		  
			    		  <c:forEach var="b" items="${list3}">  // 정상
			    		  {
			    			  title:"${b.status}",
			    			  start:"${b.dt}",
			    			  color : "#0000FF", 
			    			  textColor : "white",
			    			  
			    		  },
			    		  </c:forEach>
			    		  <c:forEach var="b" items="${list3}">
			    		  {
			    			  title:"출근 : ${b.attCmt} / 퇴근 : ${b.attQt}",   //정상
			    			  start:"${b.dt}",
			    			  color : "#0000FF", 
			    			  textColor : "white" 
			    			  
			    		  },
			    		  </c:forEach>
			    		  
			    		  <c:forEach var="d" items="${list4}">        //연차
			    		  {
			    			  title:"${d.status}",
			    			  start:"${d.dt}",
			    			  content: "출근시간 : ${d.attCmt} / 퇴근시간 : ${d.attQt}",
			    			  color: "yellow",
			    		      textColor : "red" 
			    			  
			    		  },
			    		  </c:forEach>
			    		  
			    		  <c:forEach var="b" items="${list5}">  // 지각, 조퇴
			    		  {
			    			  title:"${b.status}",
			    			  start:"${b.dt}",
			    			  color : "skyblue", 
			    			  textColor : "white",
			    			  
			    		  },
			    		  </c:forEach>
			    		  <c:forEach var="b" items="${list5}">
			    		  {
			    			  title:"출근 : ${b.attCmt} / 퇴근 : ${b.attQt}",   // 지각, 조퇴
			    			  start:"${b.dt}",
			    			  color : "skyblue", 
			    			  textColor : "white" 
			    			  
			    		  },
			    		  </c:forEach>
			    		  
				          {
				        	  title:'zzz',
				        	  start:'21000902'
				          }
			    ]
			    ,  dateClick: function(info) {
			        
			    	let clickDate = new Date(info.dateStr);
			    	clickDate.setHours(clickDate.getHours() + 9)
			    	let currentDate = new Date()
			    	
			    	if(clickDate <= currentDate){
			    		a(info.dateStr);
			    	}else{
			    		b(info.dateStr);
			    	}
			    	
			      }
			  });
			  calendar.render();
			});
		
		// 출퇴근시간변경
		function a(time){
			
			
			$("#zzz").click()
			
			$.ajax({
    			url: "changeAttendanceTime.att",
    			data: {
    					time:time,
    					empNo:${ loginUser.empNo }
    			      },
    				   
    			success:function(list){
    				
    				let a = list[0].a;
    				let b = list[0].b;
    				
    				$("#text1").val(time);
    				$("#text2").val(a);
    				$("#text3").val(b);
    				
    			},error:function(){
    				console.log("댓글리스트 조회용 ajax통신 실패");
    			}
			})
		
		}
		
		
		function b(time){
			
			$("#zzz1").click()
			$("#text11").val(time);
			
		}
	
	</script>
	
	<button id="zzz" data-target="#departmentUpdate" data-toggle="modal" style="display:none"></button>
	<button id="zzz1" data-target="#departmentUpdate1" data-toggle="modal" style="display:none"></button>
	
	
	   <!-- ====================================================  Modal ================================================================ -->

        <!-- 근무수정 및 삭제 -->
        <div class="modal fade" id="departmentUpdate" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">출퇴근 시간 변경</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">                          
                         <form action="changeAttendanceTime2.att" method="get"> 
                         <input type="hidden" name="empNo" value="${loginUser.empNo }">                                             
                            <div align="center">
                                <table>
                                	<tr>                                    
                                        <th>수정할 날짜</th>                                                                      
                                        <td>
                                           	<input type="text" id="text1" name="text1" style="text-align:center" readonly>                                    
                                        </td>                                                                             
                                    </tr>    
                                	<tr>                                    
                                        <th>출근시간</th>                                                                      
                                        <td>
                                           	<input type="text" id="text2" name="text2" style="text-align:center" readonly>                                    
                                        </td>                                                                             
                                    </tr>                                                             
                                    <tr>                                    
                                        <th>퇴근시간</th>                                                                      
                                        <td>
                                           	<input type="text" id="text3" name="text3" style="text-align:center" readonly>                                    
                                        </td>                                                                             
                                    </tr>  
                                    <tr><td colspan="2">--------------------------------------------------------------------------</td></tr>
                                    <tr>                                    
                                        <th>수정할 출근시간</th>                                                                      
                                        <td>
                                           	<input type="text" id="text4" name="text4" style="text-align:center" >                                    
                                        </td>                                                                            
                                    </tr>                                                             
                                    <tr>                                    
                                        <th>수정할 퇴근시간</th>                                                                      
                                        <td>
                                           	<input type="text" id="text5" name="text5" style="text-align:center" >                                    
                                        </td>                                                                             
                                    </tr>                             
                                    <tr>
                                    	<th>사 유</th>
                                    	<td>
                                    		<textarea id="text6" name="text6"  rows="5" cols="25" wrap="hard"></textarea>
                                    	</td>
                                    </tr>
                                   
                                     
                                </table>
                            </div>
                            <br>
                            <div align="center">
                                <button type="submit" class="btn btn-sm btn-warning" id="dUpdatebutton">수정</button>
                                <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">취소</button>
                            </div>
                            
                            <br>
                            
                       </form>
                    </div>
                    
                </div>
            </div>
        </div>
        
        
        
        
        
         <!-- ====================================================  Modal ================================================================ -->

        <!-- 근무시간 변경 -->
        <div class="modal fade" id="departmentUpdate1" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">근무시간 변경</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">                          
                         <form action="changeAttendanceTime3.att" method="get"> 
                         <input type="hidden" name="empNo" value="${loginUser.empNo }">                                             
                            <div align="center">
                                <table>
                                	<tr>                                    
                                        <th>수정할 날짜</th>                                                                      
                                        <td>
                                           	<input type="text" id="text11" name="text11" style="text-align:center" readonly>                                    
                                        </td>                                                                             
                                    </tr>    
                                	<tr>                                    
                                        <th>지정 출근시간</th>                                                                      
                                        <td>
                                           	<input type="text" id="text22" name="text22" style="text-align:center" value="0900" readonly>                                    
                                        </td>                                                                             
                                    </tr>                                                             
                                    <tr>                                    
                                        <th>지정 퇴근시간</th>                                                                      
                                        <td>
                                           	<input type="text" id="text33" name="text33" style="text-align:center" value="1800" readonly>                                    
                                        </td>                                                                             
                                    </tr>  
                                    <tr><td colspan="2">--------------------------------------------------------------------------</td></tr>
                                    <tr>                                    
                                        <th>수정할 출근시간</th>                                                                      
                                        <td>
                                           	<input type="text" id="text44" name="text44" style="text-align:center" >                                    
                                        </td>                                                                            
                                    </tr>                                                             
                                    <tr>                                    
                                        <th>수정할 퇴근시간</th>                                                                      
                                        <td>
                                           	<input type="text" id="text55" name="text55" style="text-align:center" >                                    
                                        </td>                                                                             
                                    </tr>                             
                                    <tr>
                                    	<th>사 유</th>
                                    	<td>
                                    		<textarea id="text66" name="text66"  rows="5" cols="25" wrap="hard"></textarea>
                                    	</td>
                                    </tr>
                                   
                                     
                                </table>
                            </div>
                            <br>
                            <div align="center">
                                <button type="submit" class="btn btn-sm btn-warning" id="dUpdatebutton">수정</button>
                                <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">취소</button>
                            </div>
                            
                            <br>
                            
                       </form>
                    </div>
                    
                </div>
            </div>
        </div>
        
        
</body>
</html>