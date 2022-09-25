<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
    	<meta charset="UTF-8">
        <title>WorkPartner!!</title>
    </head>
    <body>
    	
    	<script>
    		window.onload = function () {
	    	/* 	if (confirm("정상적으로 처리되었습니다. 이전 페이지로 돌아가시겠습니까?") == true) { 
	    			history.back();
	    		}else{
	    			opener.parent.location.reload();
	    			window.close();
   				} */
	    	alert("정상적으로 처리되었습니다."); 
	    			opener.parent.location.reload();
	    			window.close();
	    	}
    	</script>
    	
    
    </body>
</html>
