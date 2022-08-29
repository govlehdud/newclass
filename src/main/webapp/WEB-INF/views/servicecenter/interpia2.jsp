<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>퇴직자 게시판 리스트 출력</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script> 

 <style>
#wrap{
	width:1100px;
	margin:auto;
	min-height: 500px;
}
#siderBar{
	float:left;
	margin-top:60px;
	margin-left:20px;
	margin-right:20px;
	width:200px;
	border:2px solid #5F7294;
	min-height: 300px;
}
#siderBar ul{
	width:200px;
	margin:10px 0;
	padding:0;
}
#siderBar li{
	list-style: none;
	color: black;
	height:30px;
	width:155px;
	padding:0 20px;
	margin-left:5px;
	font-size:12px;
	line-height:30px;
}
#siderBar #currier{
	width:180px;
	height:50px;
	padding:15 15px;
	line-height: 30px;
}
#currier img{
	margin-left:10px;
}
#currier.btn{
	padding:5px;
}
#contents{
	margin-top:20px;
	margin-left:8px;
	width:670px;
	min-height: 250px;
	float:left;
	border-top: 30px solid rgba(161,182,204, 0.9);
	border-bottom: 15px solid rgba(161,182,204, 0.9);
	border-left:5px solid rgba(161,182,204, 0.9);
	border-right: 5px solid rgba(161,182,204, 0.9);
}
#content{
	border:2px solid #fff;
	border-radius: 5px 5px 5px 5px;
	width:776px;
	min-height: 300px;
}
#content .title{
	height:20px;
	margin:10px 15px;
	font-size:14px;
	padding:2px 1px;
	border-bottom: 1px dotted #5F7294;
}
#content #selectBox{
	width:340px;
	margin-left:400px;
}
#selectBox .label{
	margin-left:13px;
	padding:0 10px;
}
#naviBar{
	width:300px;
	height:30px;
	margin-left:700px;
	margin-top:30px;
}
#naviBar a{
	margin-left:10px;
	line-height: 30px;
}
#tableText{
	width:840px;
	margin:30px auto;
}
#downLoad{
	width:150px;
	margin-left:600px;
	margin-bottom:20px;
}
</style>
</head>
<body>
<div id="wrap">
<div id="siderBar">
<div>
	<ul>
		<li><img src="resources/image/left_icon.gif"/><strong>기본정보</strong></li>
		<li>										- <a href="insertform.sc">	직원 등록	</a></li>
		<li><img src="resources/image/left_icon.gif"/><a href="interpia.sc"> 	직원명부	</a></li>
		<li><img src="resources/image/left_icon.gif"/><a href="interpia2.sc">	퇴직자현황	</a></li>
		<li><img src="resources/image/left_icon.gif"/><a href="reserve.sc">		예비인력정보</a></li>
		<li><img src="resources/image/left_icon.gif"/><a href="clientInfo.sc">	거래처정보	</a></li>
		<li>										- <a href="clientinsert.sc">거래처 등록	</a></li>
	</ul>
</div>
</div><!-- siderBar end --> 
<div id="contents">
	<div class="title"><img src="resources/image/icon.gif" width="9" height="9" > 
    	<strong>퇴직자 현황</strong></div>
    <div id="searchArea" align="center" >
    
		<select id="searchCondition" name="searchCondition">
			<option value="kname">:::::  이 름  :::::</option>
			<option value="inumber1">::: 주민번호 :::</option>
			<option value="gender">::: 성별 :::</option>
			<option value="annual">::: 연차 :::</option>
			<option value="address2">::: 주소 :::</option>
		</select>
		<input id="searchValue" type="search">
		<button onclick="searchBoard();">검색</button>
	</div>
  	 
  </div> 
  <div id="tableText">
        <table>
        	<thead>
	              <tr> 
	              	<th>
	              		<input type="checkbox" name="allCheck" id="allCheck">
	              	</th>
	              	<td width="85" align="center">이름</td>
	              	<td width="85" align="center">주민번호</td>
	              	<td width="85" align="center">성별</td>
	              	<td width="85" align="center">기술등급</td>
	              	<td width="85" align="center">상태</td>
	              	<td width="85" align="center">근무형태</td>
	              <tr> 
              </thead>
				<!-------------------------  리스트 ------------------------------>
			  <tbody id ="listArea">
				<c:forEach var="sc" items="${ list }">
				<tr> 
	                      	<td width="35" height="20" align="center">
	                     		<input type="checkbox" name="checkbox" class="checkbox" value="${sc.code }"/>
	                      	</td>
	                      	<td width="85" align="center">
	                      		<c:url var="scBoard" value="scBoard.sc">
									<c:param name="bId" value="${ sc.code }"/>
									<c:param name="page" value="${ pi.currentPage }"/>
								</c:url>
								<a href="${ scBoard }">${sc.kname }</a>
	                      	</td>
	                      	<td width="85" align="center">
	                      		<c:url var="scBoard" value="scBoard.sc">
									<c:param name="bId" value="${ sc.code }"/>
									<c:param name="page" value="${ pi.currentPage }"/>
								</c:url>
								<a href="${ scBoard }">${sc.inumber1 } - ${sc.inumber2 }</a>
	                      	</td>
	                      	<td width="91" align="center">${sc.gender }</td>
	                      	<td width="91" align="center">${sc.grade }</td>
	                      	<td width="91" align="center">${sc.state }</td>
	                      	<td width="91" align="center">${sc.worktype }</td>
	                      <td align="center">
									<c:url var="scdetail" value="scdetail.sc">
									<c:param name="bId" value="${ sc.code }"/>
									<c:param name="page" value="${ pi.currentPage }"/>
									</c:url>
									<a href=" ${ scdetail }">수정</a> <img src="resources/image/all_icon.gif" width="11" 
									height="11">
							</td>
							
	                    </tr>
				</c:forEach>
	                <c:forEach var="sc" items="${ sclist }">
	                    <tr> 
	                      	<td width="35" height="20" align="center">
	                     		<input type="checkbox" name="checkbox" class="checkbox" value="${sc.code }"/>
	                      	</td>
	                      	<td width="85" align="center">
	                      		<c:url var="scBoard" value="scBoard.sc">
									<c:param name="bId" value="${ sc.code }"/>
									<c:param name="page" value="${ pi.currentPage }"/>
								</c:url>
								<a href="${ scBoard }">${sc.kname }</a>
	                      	</td>
	                      	<td width="85" align="center">
	                      		<c:url var="scBoard" value="scBoard.sc">
									<c:param name="bId" value="${ sc.code }"/>
									<c:param name="page" value="${ pi.currentPage }"/>
								</c:url>
								<a href="${ scBoard }">${sc.inumber1 } - ${sc.inumber2 }</a>
	                      	</td>
	                      	<td width="91" align="center">${sc.gender }</td>
	                      	<td width="91" align="center">${sc.grade } </td>
	                      	<td width="91" align="center">${sc.state } </td>
	                      	<td width="91" align="center">${sc.worktype }</td>
	                      	<%-- <td align="center">
									<c:url var="scdetail" value="scdetail.sc">
									<c:param name="bId" value="${ sc.code }"/>
									<c:param name="page" value="${ pi.currentPage }"/>
									</c:url>
									<a href="${ scdetail }">수정</a> <img src="resources/image/all_icon.gif" width="11" 
									height="11">
							</td> --%>
							
	                    </tr>
	                 </c:forEach>
	                
                    </tbody>
                  </table>
                  <br><br>
				<div align="center" id="buttonTab">
			
					<!-- [이전] -->
					<c:if test="${ pi.currentPage <= 1 }">
						[이전] &nbsp;
					</c:if>
					<c:if test="${ pi.currentPage > 1 }">
						<c:url var="before" value="interpia2.sc">
							<c:param name="page" value="${ pi.currentPage - 1 }"/>
						</c:url>
						<a href="${ before }">[이전]</a> &nbsp;
					</c:if>
					
					<!-- 페이지 -->
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<c:if test="${ p eq pi.currentPage }">
							<font color="red" size="4"><b>[${ p }]</b></font>
						</c:if>
						
						<c:if test="${ p ne pi.currentPage }">
							<c:url var="pagination" value="interpia2.sc">
								<c:param name="page" value="${ p }"/>
							</c:url>
							<a href="${ pagination }">${ p }</a> &nbsp;
						</c:if>
					</c:forEach>
					
					<!-- [다음] -->
					<c:if test="${ pi.currentPage >= pi.maxPage }">
						[다음]
					</c:if>
					<c:if test="${ pi.currentPage < pi.maxPage }">
						<c:url var="after" value="interpia2.sc">
							<c:param name="page" value="${ pi.currentPage + 1 }"/>
						</c:url> 
						<a href="${ after }">[다음]</a>
						</c:if>
						
						
						
						
			</div>
 			</div><!-------------------------  리스트 ------------------------------>
 			<div id="downLoad">
 				<button class="btn btn-primary" id="updateBtn"onclick="location.href='${ nodelete }'" >삭제</button>
 				
    </div><!-- contents end -->          
</div>
<script type="text/javascript">
$('#updateBtn').on('click', function() {
		if ($('input[name=checkbox]:checked').length < 1) {
			alert('선택한 체크박스가 없습니다.');
		} else {
			var checkbox = [];
			$('input[name=checkbox]:checked').each(function() {
				checkbox.push($(this).val());
			});
			console.log(checkbox);
			$.ajax({
				url : 'nodelete.sc',
				type : 'POST',
				data : { checkbox : checkbox },
				dataType : 'json',
				success : function(data) {
					window.location.reload();
					alert('선택한 정보가 삭제되었습니다..');
					console.log('성공');
				},
				error : function() {
					console.log('삭제에 실패하였습니다.');
				}
			});
		}
	});  
</script>
<script type="text/javascript">
	 	// CheckBox allCheck
	 	$("#allCheck").click(function(){
	 		var chk = $("#allCheck").prop("checked");
	 		if(chk){
	 			$(".checkbox").prop("checked", true);
	 		}else{
	 			$(".checkbox").prop("checked", false);
	 		}
	 	});
	 	
	 	$(".interpia.sc").click(function(){
	 		$("#allCheck").prop("checked", false);
	 	});
	</script>
<script type="text/javascript">
			// 게시글 상세보기
			$(function(){
				$('#listArea td').on({'mouseenter':function(){
					$(this).parent().css({'background' : 'lightgray', 'cursor':'pointer'});					
				}, 'mouseout':function(){
					$(this).parent().css({'background' : 'none'});
				}});
			});
</script>
<script type="text/javascript">
	 
	 	
		//게시글 검색
		function searchBoard(){
			var searchCondition = $("#searchCondition").val();
			var searchValue = $("#searchValue").val();
			
			location.href="outsearch.sc?searchCondition="+searchCondition+"&searchValue="+searchValue;
		}
</script>
</body>
</html>
