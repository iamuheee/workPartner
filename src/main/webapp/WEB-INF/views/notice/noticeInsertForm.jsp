<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- summer note -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/summerNote/summernote-lite.css">
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
        <form name="dataForm" id="dataForm" onsubmit="return registerAction()">
            <table>
                <tr>
                    <td class="fontsize13" width="30px">제목 </td>
                    <td colspan="3"><input type="text" placeholder="제목을 입력해주세요" maxlength="33" style="width: 500px;" required></td>
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
                        <script src="${pageContext.request.contextPath}/resources/js/summerNote/lang/summernote-ko-KR.js"></script>
                        <script src="${pageContext.request.contextPath}/resources/js/summerNote/summernote-lite.js"></script>
                        <textarea id="summernote" name="editordata" required></textarea>
                    </td>
                </tr>
                <!-- <tr>   
                    <td>첨부파일</td>                 
                    <td><input type="button" value="파일 추가" onClick="nt_addFile()"></td>                   
                        
                </tr> 
                <tr>
                    <td colspan="2">
                        <div id="nt_file"></div>
                    </td>    
                </tr>  -->

                <tr>
                    <td colspan="2" width="90px">
                        <button id="btn-upload" type="button" class="btn btn-sm btn-secondary">파일 추가</button>
                        <input id="input_file" multiple="multiple" type="file" style="display:none;">
                    </td>
                    <td colspan="2"> <span style="font-size:10px; color: gray;">※첨부파일은 최대 3개까지 등록이 가능합니다.</span></td>
                </tr>
                <tr>
                    <td colspan="4">
                        <div class="data_file_txt" id="data_file_txt" style="border: 1px solid  #e0e3e6; height: 100px;">                            
                            <div id="articlefileChange">
                            </div>
                        </div>
                    </td>    
                </tr>  
            </table>

            <br>
            <button type="submit" class="btn btn-sm btn-primary">등록</button>
            <a class="btn btn-sm btn-secondary" href="list.nt">이전</a>            

        </form>

        <!-- summerNote 관련 script-->
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
                        fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
                });               
                
            });
           
            // function nt_addFile(){
            //     $("#nt_file").append("<br>" + "<input type='file' name='upfile'  style='display:none;'/>");
               
            // }     
  
        </script>
          
          <!-- 파일 업로드 스크립트 -->
          <script>
            $(document).ready(function()
                    // input file 파일 첨부시 fileCheck 함수 실행
                    {
                        $("#input_file").on("change", fileCheck);
                    });
            
            /**
             * 첨부파일로직
             */
            $(function () {
                $('#btn-upload').click(function (e) {
                    e.preventDefault();
                    $('#input_file').click();
                });
            });
            
            // 파일 현재 필드 숫자 totalCount랑 비교값
            var fileCount = 0;
            // 해당 숫자를 수정하여 전체 업로드 갯수를 정한다.
            var totalCount = 3;
            // 파일 고유넘버
            var fileNum = 0;
            // 첨부파일 배열
            var content_files = new Array();
            
            function fileCheck(e) {
                var files = e.target.files;
                
                // 파일 배열 담기
                var filesArr = Array.prototype.slice.call(files);
                
                // 파일 개수 확인 및 제한
                if (fileCount + filesArr.length > totalCount) {
                    $.alert('파일은 최대 '+totalCount+'개까지 업로드 할 수 있습니다.');
                    return;
                } else {
                    fileCount = fileCount + filesArr.length;
                }
                
                // 각각의 파일 배열담기 및 기타
                filesArr.forEach(function (f) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                    content_files.push(f);
                    $('#articlefileChange').append(
                            '<div id="file' + fileNum + '" onclick="fileDelete(\'file' + fileNum + '\')">'
                            + '<font style="font-size:12px">' + f.name + '</font>'  
                            + '&nbsp'
                            + '<img src="${pageContext.request.contextPath}/resources/images/fileDelete.png" style="width:8px; height:auto; vertical-align: middle; cursor: pointer;"/>' 
                            + '<div/>'
                    );
                    fileNum ++;
                    };
                    reader.readAsDataURL(f);
                });
                console.log(content_files);
                //초기화 한다.
                $("#input_file").val("");
                }
            
            // 파일 부분 삭제 함수
            function fileDelete(fileNum){
                var no = fileNum.replace(/[^0-9]/g, "");
                content_files[no].is_delete = true;
                $('#' + fileNum).remove();
                fileCount --;
                console.log(content_files);
            }
            
            /*
            * 폼 submit 로직
            */
            function registerAction(){
                
            var form = $("form")[0];        
            var formData = new FormData(form);
                for (var x = 0; x < content_files.length; x++) {
                    // 삭제 안한것만 담아 준다. 
                    if(!content_files[x].is_delete){
                        formData.append("article_file", content_files[x]);
                    }
                }
            /*
            * 파일업로드 multiple ajax처리
            */    
            $.ajax({
                    type: "POST",
                        enctype: "multipart/form-data",
                    url: "/file-upload",
                    data : formData,
                    processData: false,
                    contentType: false,
                    success: function (data) {
                        if(JSON.parse(data)['result'] == "OK"){
                            alert("파일업로드 성공");
                    } else
                        alert("서버내 오류로 처리가 지연되고있습니다. 잠시 후 다시 시도해주세요");
                    },
                    error: function (xhr, status, error) {
                        alert("서버오류로 지연되고있습니다. 잠시 후 다시 시도해주시기 바랍니다.");
                    return false;
                    }
                    });
                    return false;
                }
          </script>

        


    </div>

    <div style="height: 30px;"></div>

</body>
</html>