<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- summer note -->
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/summerNote/summernote-lite.css"> --%>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/noticeCss/notice2.css">
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
    <div style="height: 30px;"></div>

    <div class="ntOuter" align="center">
        <br>
        <h5><b>공지사항</b></h5>
        <br>
        <form name="dataForm" id="dataForm"  action="insertNotice.nt" method="post" enctype="multipart/form-data">
        	<input type="hidden" name="empNo" value="${loginUser.empNo}">
        	<input type="hidden" name="empName" value="${loginUser.empName}">
            <table>
                <tr>
                    <td class="fontsize13" width="30px">제목 </td>
                    <td colspan="3"><input type="text" name="noticeTitle" placeholder="제목을 입력해주세요" maxlength="33" style="width: 500px;" required></td>
                </tr>
                <tr>
                    <td class="fontsize13">중요</td>
                    <td width="40px">
                        <input type="checkbox" name="noticeImportant" value="I" id="noticeImportant">                       
                    </td>
                    <td class="fontsize13" width="40px">상단</td>
                    <td>
                        <input type="checkbox" name="noticeTop" value="T" id="noticeTop1">                       
                    </td>
                </tr>               
                <tr>
                    <td colspan="4">
                       
                        <textarea id="summernote" name="noticeContent" required> </textarea>
                    </td>
                </tr>
              
               <tr>
	                    <td colspan="2" width="90px">
	                        <button id="btn-upload" type="button" class="btn btn-sm btn-secondary">파일 추가</button>
	                        <input id="upfile" name="upfile"  multiple="multiple" type="file" style="display:none;" >
	                    </td>
	                    <td colspan="2"><span style="font-size:10px; color: gray;">※첨부파일은 최대 3개까지 등록이 가능합니다.</span></td>
	                </tr>
	                <tr>
	                    <td colspan="4">
	                    	<!-- 파일목록이 올 자리  -->
	                        <div class="file-list" id="file-list" style="border: 1px solid  #e0e3e6; height: 100px;">                            
	                            
	                        </div>
	                    </td>    
	            </tr>  	    
                
                
            </table>

            <br>
            <button type="submit" class="btn btn-sm btn-primary">등록</button>
            <a class="btn btn-sm btn-secondary" href="list.nt">이전</a>            

        </form>

        <!-- summerNote 관련 script-->
        <script src="${pageContext.request.contextPath}/resources/js/summerNote/summernote-lite.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/summerNote/lang/summernote-ko-KR.js"></script>
        <script>
            $(document).ready(function() {
                //여기 아래 부분
                $('#summernote').summernote({
                    height: 500,                 // 에디터 높이
                    minHeight: 300,             // 최소 높이
                    maxHeight: 500,             // 최대 높이
                    focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
                    lang: "ko-KR",					// 한글 설정
                    placeholder: '내용을 입력해주세요',	//placeholder 설정                   
                    toolbar: [
                            // 글꼴 설정
                            ['fontname', ['fontname']],
                            // 글자 크기 설정
                            ['fontsize', ['fontsize']],
                            // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
                            ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
                            // 글자색
                            ['color', ['forecolor','color']],
                            // 표만들기
                            ['table', ['table']],
                            // 글머리 기호, 번호매기기, 문단정렬
                            ['para', ['ul', 'ol', 'paragraph']],
                            // 줄간격
                            ['height', ['height']],
                            // 그림첨부, 링크만들기, 동영상첨부
                            ['insert',['picture','link','video']],
                            // 코드보기, 확대해서보기, 도움말
                            ['view', ['codeview','fullscreen', 'help']]
                        ],
                        // 추가한 글꼴
                        fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
                        // 추가한 폰트사이즈
                        fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
                     	
                        //콜백 함수
                        callbacks : { 
                        	onImageUpload : function(files, editor, welEditable) {
                        		
	                        	// 파일 업로드(다중업로드를 위해 반복문 사용)
		                        for (var i = files.length - 1; i >= 0; i--) {
		                        	
		                        	// 파일사이즈 체크!
		                        	if(files[i].size > 1024*1024*5){
		                        		alert("이미지업로드는 5MB 미만 가능합니다.");
		                        		return;
		                        	}
		                        	// file sending
		                        	 for (var i = files.length - 1; i >= 0; i--) {
		                        		 uploadSummernoteImageFile(files[i], this);					                        		 
		                        	 }	                        	 
		                        	
	                        	}
                        	}
                        }
                
                });      
                
                // summerNote에서 이미지 업로드 시 동작하는 함수
                // ajax로 서버에 파일 업로드를 진행 => 파일업로드 후에 경로를 return 받아야함
                function uploadSummernoteImageFile(file, el) {
                	
                	// ajax로 파일 넘기고자 할 경우 가상의 form요소를 만들어서 담은 후 전달 
        			data = new FormData();
        			data.append("file", file);
        			$.ajax({
        				data : data,
        				type : "POST",
        				url : "uploadSummernoteImageFile.nt",
        				contentType : false,
        				enctype : 'multipart/form-data',
        				processData : false,
        				success : function(url) {        
        					// editor.insertImage기능을 통해 (전달받은 저장경로)  => 이미지를 삽입될 수 있도록
        					$(el).summernote('editor.insertImage', url);
        				},
        				error:function(){
        					console.log("summerNote 이미지업로드용 ajax 실패");
        				}
        			});
        		}
                
                
            });           
          
        </script>
          
          <!-- 파일 업로드 스크립트 -->
          <script>
						                    
                
             	// ---------------- 첨부 파일 ---------------------
             	$(document).ready(function(){
                 // input file 파일 첨부시 addFile 함수 실행
                     $("#upfile").on("change", addFile);
               }); 
	         
	          /**
	           * 첨부파일로직 : button클릭시 upfile클릭			             
	           */
	          $(function () {
	              $('#btn-upload').click(function (e) {
	                  e.preventDefault();
	                  $('#upfile').click();
	              });
	          });
	
                var fileNo = 0; // 첨부파일 번호
                var filesArr = new Array(); // 다중 첨부파일 들어갈 파일 배열

                /* 첨부파일 추가 */
                function addFile() {
                   
                   // 안내문 삭제
                   //$(".fileMsg").remove();
                   
                   var maxFileCnt = 3; // 첨부파일 최대 개수
                   var attFileCnt = document.querySelectorAll('.filebox').length; // 기존 추가된 첨부파일 개수
                   var remainFileCnt = maxFileCnt - attFileCnt; // 추가로 첨부가능한 개수
                   var files = $('#upfile')[0].files; // 현재 선택된 첨부파일 리스트 FileList

                   // 첨부파일 개수 확인
                   if (files.length > remainFileCnt) {
                      alert("첨부파일은 최대 " + maxFileCnt + "개 까지 첨부 가능합니다.");
                      
                      fileDataTransfer();
                   }else{
                      // 파일 배열에 담기
                      let currFileArr = Array.from(files); // FileList => Array로 변환
                      filesArr = filesArr.concat(currFileArr); // 추가한 fileList에 또 추가할 수 있도록 설정
                      
                      fileDataTransfer();
                       
                   }
                   //console.log(filesArr);
                   renderingFileDiv(); // 추가 및 삭제할 때 마다 호출해서 index번호 초기화
                   
                }
                
                /* 첨부파일 목록 html */
                function renderingFileDiv(){
                   
                   let htmlData = '';
                   for(let i=0; i<filesArr.length; i++){
                      // i => 삭제할 파일 인덱스 번호가 될것 (deleteFile호출시 )
                      
                      // 목록 추가
                      htmlData += '<div id="file' + i + '" class="filebox">';
                      htmlData += '   <span class="name">'+ filesArr[i].name + '</span>';
                      htmlData += '   <a class="delete" onclick="deleteFile('+ i + 
                               ');"><i class="far fa-minus-square"></i></a>';
                      htmlData += '</div>';
                   }
                   
                   $(".file-list").html(htmlData); // change가 발생할 때마다 목록 초기화한 뒤 넣어짐

                }

                /* 첨부파일 삭제 */
                function deleteFile(fileNo) { // 매개변수 : 첨부된 파일 번호(fileNo, i)
                
                   //console.log(fileNo);
                   
                   // class="fileMsg"에 있는 문구 삭제
                   document.querySelector("#file" + fileNo).remove();
                   
                    filesArr.splice(fileNo, 1);   // 해당되는 index의 파일을 배열에서 제거(1 : 한개만 삭제하겠다 라는 의미)
                   	
                    // fileArr에 있는 파일배열을 dataTransfer을 통해 input multifile형식에 맞게 담아준다.
                    fileDataTransfer();

                    // 파일 index 번호 초기화
                    renderingFileDiv();
                }
                
                
                /* 첨부파일 담는 배열 */
                function fileDataTransfer(){
                   
                   const dataTransfer = new DataTransfer();

                    filesArr.forEach(function(file){ 
                    //남은 배열을 dataTransfer로 처리(Array -> FileList)
                       dataTransfer.items.add(file); 
                    });
                    
                    $('#upfile')[0].files = dataTransfer.files;   //제거 처리된 FileList를 돌려줌
                }    
                
                
                // 내용이 비워있는지 아닌지 확인
               /*  function submitCheck(){
                	 var a = $('#summernote');
                	
                	 if (!a.summernote('isEmpty')) {
                          alert('에디터 안에 글 존재함');
                          return true;
                     }else{
                    	  alert("글 없음");
                    	  return false;
                     }
      
                } */

            </script>
        


    </div>

    <div style="height: 30px;"></div>

</body>
</html>