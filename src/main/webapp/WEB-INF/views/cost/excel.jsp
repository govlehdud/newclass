<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>경비관리 목록 화면</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script> 
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
<link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.13/themes/base/jquery-ui.css" type="text/css" media="all" />
<style>
	input[type=text].datetype{
 			padding:4px 2px 5px 25px; width:95px; border:1px solid #CACACA;
      font-size:11px; color:#666; 
      background:url('http://cfile23.uf.tistory.com/image/26100D4F5864C76827F535') no-repeat 2px 2px; background-size:15px
    } 










#wrap {
	width: 1300px;
	margin: auto;
	min-height: 500px;
}

#currier img {
	margin-left: 10px;
}

#currier.btn {
	padding: 5px;
}

#contents {
	margin-top: 20px;
	margin-left: 8px;
	width: 900px;
	min-height: 250px;
	float: left;
	border-top: 30px solid rgba(161, 182, 204, 0.9);
	border-bottom: 15px solid rgba(161, 182, 204, 0.9);
	border-left: 5px solid rgba(161, 182, 204, 0.9);
	border-right: 5px solid rgba(161, 182, 204, 0.9);
}

#content {
	border: 2px solid #fff;
	border-radius: 5px 5px 5px 5px;
	width: 776px;
	min-height: 300px;
}

#content .title {
	height: 20px;
	margin: 10px 15px;
	font-size: 14px;
	padding: 2px 1px;
	border-bottom: 1px dotted #5F7294;
}

#content #selectBox {
	width: 340px;
	margin-left: 400px;
}

#selectBox .label {
	margin-left: 13px;
	padding: 0 10px;
}

#naviBar {
	width: 300px;
	height: 30px;
	margin-left: 700px;
	margin-top: 30px;
}

#naviBar a {
	margin-left: 10px;
	line-height: 30px;
}

#tableText {
	width: 840px;
	margin: 30px auto;
}

#downLoad {
	width: 70px;
	margin-left: 600px;
	margin-bottom: 40px;
}
</style>
</head>
<body>
	<div id="contents">
		<div class="title">
			<img src="resources/image/icon.gif" width="9" height="9"> 
			<strong>사원조회</strong>
		</div>
		<BR> 
		<div id="row">
			<form id="form_ex" action="excellDown.co" method="post">
			<input type="submit" value="엑셀다운로드">
			<table id="example-table-1" class="table table-bordered table-hover text-center">
				<thead>
					<tr>
						<td width="85" align="center">순번</td>
						<td width="85" align="center">사용일</td>
						<td width="85" align="center">사용내역</td>
						<td width="85" align="center">사용금액</td>
						<td width="85" align="center">승인금액</td>
						<td width="85" align="center">처리상태</td>
						<td width="85" align="center">등록일</td>
					<tr>
				</thead>
				<!-------------------------  리스트 ------------------------------>
				<tbody id="listArea">
					<c:forEach var="co" items="${ colist }" >
							<c:if test="${ empty colist }">
								<tr>
									<td colspan="6">작성된 게시물이 없습니다.</td>
								</tr>
							</c:if>
						<tr>
							<th width="153" align="center" class ="numberdata" id="bId">${co.bNo }</th> 
							<td width="153" align="center">
								<fmt:formatDate pattern = "yyyy/MM/dd" value="${co.bDate }"/>
							</td>
							<td width="153" align="center">${co.bHistory }</td>
							<%-- <td width="91" 	align="center">
								${co.bAmount }
							</td> --%>
							<td width="91" 	align="center">
								<fmt:formatNumber value="${co.bAmount }" pattern="#,###.##"/>	
							</td>
							<%-- <td width="91" 	align="center">${co.bRecognize }</td> --%>
							<td width="91" 	align="center">
								<fmt:formatNumber value="${co.bRecognize }" pattern="#,###.##"/>
							</td>
							<td width="91" 	align="center">${co.bStatus }</td>
							<td width="91" 	align="center">${co.bRegistration }</td>
							<td align="center" >
									<c:url var="codetail" value="codetail.co">
									 	<c:param name="bId" value="${ co.bNo }"/>
									</c:url>
							</td> 

						</tr>
					</c:forEach>
				</tbody>
			</table>
			</form>
		</div>
		<!-------------------------  리스트 ------------------------------>

	</div>
<script type="text/javascript">

	// popup 버튼
	function nwindow(){
		var myForm = document.popup;

		window.open("cost/popup", "_blank", "toolbar=yes, menubar=yes, width=1000, height=300, scrollbars=yes").focus();

	}
</script>

</body>
</html>