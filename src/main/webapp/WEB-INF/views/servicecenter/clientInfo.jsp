<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>게시판</title>
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
    	<strong>거래처 조회</strong>
    </div>
    	
    	
    <div id="searchArea" align="center" >
			<select id="clientsearch" name="clientsearch">
				<option value="companyName">상호명</option>
				<option value="category">업종</option>
				<option value="state">업태</option>
				<option value="tel">전화번호</option>
				<option value="manager">담당자</option>
				<option value="phone">핸드폰번호</option>
			</select>
			<!-- <input name="q" type="search">
			<button type="submit">검색</button> -->
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
	              	<td width="85" align="center">상호명</td>
	              	<td width="85" align="center">업종</td>
	              	<td width="85" align="center">업태</td>
	              	<td width="85" align="center">전화번호</td>
	              	<td width="65" align="center">담당자</td>
	              	<td width="85" align="center">핸드폰 번호</td>
	              	<td></td>
	              	
	              	
	              <tr> 
              </thead>
				<!-------------------------  리스트 ------------------------------>
			  <tbody id ="listArea">
				<c:forEach var="cb" items="${ clientList }">
				<tr> 
	                      	<td width="35" height="20" align="center">
	                     		<input type="checkbox" name="checkbox" class="checkbox" value="${cb.cId}"/>
	                      	</td>
	                      	<%-- <td width="85" align="center">
	                      		<c:url var="scBoard" value="scBoard.sc">
									<c:param name="bId" value="${ sc.code }"/>
									<c:param name="page" value="${ pi.currentPage }"/>
								</c:url>
								<a href="${ scBoard }">${sc.kname }</a>
	                      	</td> --%>
	                      	<td width="91" align="center">${cb.companyName}</td>
	                      	<td width="91" align="center">${cb.category}</td>
	                      	<td width="91" align="center">${cb.state}</td>
	                      	<td width="153"align="center">
	                      			${cb.tel1 } - ${cb.tel2} - ${cb.tel3}
	                      			<input type="hidden" value="${ cb.tel }">
	                      	</td>
	                      	<td width="153"align="center">${cb.manager}</td>
	                      	<td width="91" align="center">
	                      			${cb.phone1} - ${cb.phone2} - ${cb.phone3}
	                      	<input type="hidden" value="${ cb.phone }">
	                      	</td>
	                   <%--     <td align="center">
									<c:url var="clientEdit" value="clientupdate.sc">
											<c:param name="bId" value="${ cb.cId }"/>
									</c:url>
							</td>  --%>
							
	                    </tr>
				</c:forEach>
	                <c:forEach var="cb" items="${cbList}">
	                    <tr> 
	                      	<td width="35" height="20" align="center">
	                     		<input type="checkbox" name="checkbox" class="checkbox" value="${cb.cId}"/>
	                     		
	                      	</td>
	                
	                      	<td width="91" align="center">${cb.companyName}</td>
	                      	<td width="91" align="center">${cb.category}</td>
	                      	<td width="91" align="center">${cb.state}</td>
	                      	<td width="153"align="center">
	                      			${cb.tel1 } - ${cb.tel2} - ${cb.tel3}
	                      			<input type="hidden" value="${ cb.tel }">
	                      	</td>
	                      	<td width="153"align="center">${cb.manager}</td>
	                      	<td width="91" align="center">
	                      			${cb.phone1} - ${cb.phone2} - ${cb.phone3}
	                      	<input type="hidden" value="${ cb.phone }">
	                      	</td>
	                      	<%-- <td align="center">
									<c:url var="clientEdit" value="clientupdate.sc">
											<c:param name="bId" value="${ cb.cId }"/>
									</c:url>
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
						<c:url var="before" value="clientInfo.sc">
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
							<c:url var="pagination" value="clientInfo.sc">
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
						<c:url var="after" value="clientInfo.sc">
							<c:param name="page" value="${ pi.currentPage + 1 }"/>
						</c:url> 
						<a href="${ after }">[다음]</a>
						</c:if>
						
						
						
						
			</div>
 			</div><!-------------------------  리스트 ------------------------------>
 			<div id="downLoad">
 				<button class="btn btn-primary" id="deleteBtn"onclick="location.href='${ clientdelete }'" >삭제</button>
 				<button class="btn btn-primary" id="updateBtn"onclick="location.href='${ clientupdate }'">수정</button>
    </div><!-- contents end -->          
</div>
<!-- <script type="text/javascript">
		function updateBoard(){
			var checkbox = $("#btn btn-primary").val();
			
			location.href="clientupdate.sc?checkbox="+checkbox;
		}
</script>
 -->


<script type="text/javascript">
// DeleteButton 삭제 버튼 ajax
$('#deleteBtn').on('click', function() {
		if ($('input[name=checkbox]:checked').length < 1) {
			alert('선택한 체크박스가 없습니다.');
		} else {
			var checkbox = [];
			$('input[name=checkbox]:checked').each(function() {
				checkbox.push($(this).val());
			});
			console.log(checkbox);
			$.ajax({
				url : 'clientdelete.sc',
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
//updateBtn 수정 버튼 ajax
$('#updateBtn').on('click', function() {
		if ($('input[name=checkbox]:checked').length < 1) {
			alert('선택한 체크박스가 없습니다.');
		} else if($('input[name=checkbox]:checked').length > 1){
			alert('선택한 체크박스가 너무 많습니다.')
		} else if($('input[name=checkbox]:checked').length = 1){
			var checkbox = [];
			$('input[name=checkbox]:checked').each(function() {
				checkbox.push($(this).val());
			});
			
			
			location.href = "clientupdate.sc?checkbox="+checkbox[0];  
			/* location.href = "clientupdate.sc?checkbox="+checkbox=[0]; */
			
			
			
			
			/* console.log(checkbox);
			$.ajax({
				url : 'clientupdate.sc',
				type : 'POST',
				data : { checkbox : checkbox },
				dataType : 'json',
				success : function(data) {
					
					 window.location.reload(); 
					alert('선택한 정보에 맞춰 수정페이지로 갑니다');
					console.log('성공');
				},
				error : function() {
					console.log('실패하였습니다.');
				}
			}); */
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
	 	
	 	$(".clientInfo.sc").click(function(){
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
			var clientsearch = $("#clientsearch").val();
			var searchValue = $("#searchValue").val();
			
			location.href="clientsearch.sc?clientsearch="+clientsearch+"&searchValue="+searchValue;
		}
</script>
</body>
</html>
