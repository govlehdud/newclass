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
	
		<h1>경비 등록/수정</h1>
	<!-- <form name="inputForm" method=POST target="action" > -->
		<input type="button" value="닫기" onClick='window.close()'>
		<button type="submit">저장</button>
		
		<table>
				<tr>
					<td width="85" align="center" style="background-color:#FF99FF">사용내역</td>
					<td width="85" align="center" style="background-color:#FF99FF">사용일</td>
					<td width="85" align="center" style="background-color:#FF99FF">사용금액</td>
					<td width="85" align="center" style="background-color:#FF99FF">영수증</td>
				<tr>
			<!-------------------------  리스트 ------------------------------>
				<tr>
					<td>
						<select name="bHistory">
				            <option>식대(야근)	</option>
				            <option>택시비(야근)</option>
				            <option>택시비(회식)</option>
				            <option>사무용품	</option>
				            <option>교육비		</option>
				            <option>접대비		</option>
		                </select> 
	                </td>
					<td><input type="text" id="bDate" name="bDate"></td>
					<td><input type="text" id="bAmount" name="bAmount"></td>
					<td width="268">
	                            	<input type="file" id="uploadFile" multiple="multiple" 
	                            	name="uploadFile" width="49" height="18"> 
	
	                </td>
				
				
				
				
				</tr>
		</table>
	</form>
</div>

</body>
</html>