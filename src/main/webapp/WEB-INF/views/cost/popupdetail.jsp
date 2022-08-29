<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
a.btn{
    display:block;
    width:40px;
    line-height:30px;
    text-align:center;
    background-color:#222;
    color:#fff;
    text-decoration: none;
}
 
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
	<form action="update.co" method="post" enctype="multipart/form-data">
	
		<h1>경비 등록/수정</h1>
	<!-- <form name="inputForm" method=POST target="action" > -->
		<input type="button" value="닫기" onClick='window.close()'>
		<a href="/delete?bId=${board.bNo }" role="button" class="btn">삭제</a>
		
		<c:if test="${ board.bStatus ne '승인'}">
			<button type="submit">저장</button>
		</c:if>
		<c:if test="${ board.bStatus eq '승인'}">
			<button disabled="disabled">저장</button>
		</c:if>
		
		<hr>
		<strong>청구내역</strong>
		<table>	
				<tr>	
					<td width="85" align="center" style="background-color:#FF99FF">사용내역</td>
					<td width="85" align="center" style="background-color:#FF99FF">사용일</td>
					<td width="85" align="center" style="background-color:#FF99FF">사용금액</td>
					<td width="85" align="center" style="background-color:#FF99FF">영수증</td>
				<tr>
			<!-------------------------  리스트 ------------------------------>
				<tr>
					<td width="85"> 
						<input type="hidden" name="bNo" value="${board.bNo}" readonly> 
						
			            <select name="bHistory">
				            <option value="식대(야근)"<c:if test="${board.bHistory == '식대(야근)'}">selected='selected'</c:if> >식대(야근)</option>
			                <option value="택시비(야근)"<c:if test="${board.bHistory == '택시비(야근)'}">selected='selected'</c:if> >택시비(야근)</option>
				            <option value="택시비(회식)"<c:if test="${board.bHistory == '택시비(회식)'}">selected='selected'</c:if> >택시비(회식)</option>
			                <option value="사무용품"<c:if test="${board.bHistory == '사무용품'}">selected='selected'</c:if> >사무용품</option>
		                    <option value="교육비"<c:if test="${board.bHistory == '교육비'}">selected='selected'</c:if> >교육비</option>
				            <option value="접대비"<c:if test="${board.bHistory == '접대비'}">selected='selected'</c:if> >접대비</option>
			        	</select> 
			        </td>
					<td width="153"align="center">
						<input type="text" name="bDate" 
						value="<fmt:formatDate pattern="yyyy-MM-dd" value="${board.bDate}"/>">
					</td>
					<td width="91" align="center">
						<input type="text" name="bAmount" value="${board.bAmount}"/>
						<%-- value="<fmt:formatNumber value="${board.bAmount}" pattern="#,###.##"/>"> --%>
					</td>
					
					<td width="85">
							
							<c:if test="${ fi.fileName eq null }">
								  <input type="file" id="uploadFile" multiple="multiple" 
		                      		name="uploadFile" width="49" height="18" value="${fi.fileName}"
		                      		onchange="fileUpload()" multiple>
							</c:if>
							<c:if test="${ fi.fileName ne null }">
								      <a href="${ contextPath }/resources/couploadFiles/${fi.changeName}" 
										download="${fi.fileName}">${fi.fileName}</a>
							</c:if>
	                	<div class="image-container">
	                		<img src="${ contextPath }/resources/couploadFiles/${fi.changeName}">
	                	</div>
	                </td>
	                
				</tr>
		</table>
		<br>
				<strong>처리내역내역</strong>
		<table>
			<tr>	
					<td width="85" align="center" style="background-color:#FF99FF">처리상태</td>
					<td width="85" align="center" style="background-color:#FF99FF">처리일시</td>
					<td width="85" align="center" style="background-color:#FF99FF">승인금액</td>
					<td width="85" align="center" style="background-color:#FF99FF">비고</td>
			<tr>
			
			<!--                           리스트                                        -->
			<tr>
				<td width="91" align="center">
						<%-- <input type="text" name="bStatus" value="${board.bStatus}"> --%>
						<select name="bStatus">
				            <option value="접수"<c:if test="${board.bStatus == '접수'}">selected='selected'</c:if> >접수</option>
			                <option value="승인"<c:if test="${board.bStatus == '승인'}">selected='selected'</c:if> >승인</option>
				            <option value="지급완료"<c:if test="${board.bStatus == '지급완료'}">selected='selected'</c:if> >지급완료</option>
			                <option value="반려"<c:if test="${board.bStatus == '반려'}">selected='selected'</c:if> >반려</option>
			        	</select> 
				</td>
				<td width="153"align="center">
					<input type="text" name="bRegistration" 
					value="<fmt:formatDate pattern="yyyy-MM-dd" value="${board.bRegistration}"/>">
				</td>
				<td width="91" align="center">
<%-- 						<input type="text" name="bRecognize" value="<fmt:formatNumber value="${board.bRecognize}" pattern="#,###.##"/>"> --%>
						<input type="text" name="bRecognize" value="${board.bRecognize}">
				</td>
				<td width="91" align="center">
						<input type="text" name="note" value="${board.note}">
				</td>
			</tr>
			
			
		</table>
	</form>
</div>

<script type="text/javascript">
	function fileUpload(){
		var fileInput = document.getElementsByClassName("uploadFile");

		for( var i=0; i<fileInput.length; i++ ){
			if( fileInput[i].files.length > 0 ){
				for( var j = 0; j < fileInput[i].files.length; j++ ){
					console.log(fileInput[i].files[j].name); // 파일명 출력
				}
			}
		}

	}
</script>


</body>
</html>