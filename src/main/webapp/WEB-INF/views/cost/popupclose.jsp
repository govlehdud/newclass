<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content= "text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
<link rel="stylesheet"
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.13/themes/base/jquery-ui.css"
	type="text/css" media="all" />
<style type="text/css">

table {
    width: 100%;
    border: 1px solid #444444;
    border-collapse: collapse;
  }
  tr, td {
    border: 1px solid #444444;
    padding: 10px;
  }

</style>


<title>팝업창</title>
</head>
<body>
<div>
	<form action="insert.co" method="post" enctype="multipart/form-data">
	
		<h1>등록이 완료되었습니다</h1>
		<input type="button" value="닫기" onClick='window.close()'>
		<hr>
		<p id = "demo">
		
	</form>
</div>
<script>
        var time = 3; //기준시간 작성
        var min = ""; //분
        var sec = ""; //초

//setInterval(함수, 시간) : 주기적인 실행
        var x = setInterval(function() {
                //parseInt() : 정수를 반환
                sec = time%60; //나머지를 계산

document.getElementById("demo").innerHTML = "이 창은 "  + sec + "초후에 닫힙니다";
                time--;

//타임아웃 시
                if (time < 0) {
                        clearInterval(x); //setInterval() 실행을 끝냄
                        window.close();
                        document.getElementById("demo").innerHTML = "시간초과";
                }
        }, 1000);
</script>
</body>
</html>