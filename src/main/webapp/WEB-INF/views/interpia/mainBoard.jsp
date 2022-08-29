<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>게시판 리스트 출력</title>
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
		<li><img src="resources/image/left_icon.gif"/> 기본정보</li>
		<li><a href="insertform.sc">등록</a></li>
		<li><img src="resources/image/left_icon.gif"/> 직원명부</li>
		<li><img src="resources/image/left_icon.gif"/> 퇴직자현황</li>
		<li><img src="resources/image/left_icon.gif"/> 예비인력정보</li>
		<li><img src="resources/image/left_icon.gif"/> 거래처정보</li>
	</ul>
</div>
<div id="currier">
  <!------------------------------ 경력검색 ---------------------------------->
    <img src="resources/image/left_icon.gif" width="11" height="11" >
        <strong>경력검색</strong><br />
        <input name="textfield" type="text" class="flat" size="15" maxlength="14" /> 
          <button class="btn">검색</button>
  <!------------------------------ 경력검색 ---------------------------------->
</div>
</div><!-- siderBar end --> 
<div id="contents">
	<div class="title"><img src="resources/image/icon.gif" width="9" height="9" > 
    	<strong>사원조회</strong></div>
    <div id="searchArea" align="center" >
		<select id="searchConditionMain" name="searchConditionMain">
			<option value="kname">:::::  이 름  :::::</option>
			<option value="inumber1">::: 주민번호 :::</option>
			<option value="gender">::: 성별 :::</option>
			<option value="annual">::: 연차 :::</option>
			<option value="address2">::: 주소 :::</option>
		</select>
		<input id="searchValue" type="search">
		<button onclick="searchBoardMain();" style="border : none; background: white;">
		<img src="resources/image/search.gif"></button>
	</div>
  	 총 &nbsp;${pi.listCount}건
  </div> 
  <div id="naviBar">
  	<!-- <a href="#">수정</a> <img src="resources/image/all_icon.gif" width="11" height="11" align="absmiddle">
    <a href="#">인사기록카드</a> <img src="resources/image/all_icon.gif" width="11" height="11" align="absmiddle"> -->
    
    <!-- <a href="#">근무정보</a><img src="resources/image/all_icon.gif" width="11" height="11" align="absmiddle">  -->
  </div>
  <div id="tableText">
        <table>
        	<thead>
	              <tr> 
	              	<!-- <td width="35" height="20" align="center"></td> -->
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
				<!-- 검색 사용했을떄 나오는 리스트 -->
			  <tbody id ="listArea">
			  <c:forEach var="ip" items="${ list }">
	                    <tr> 
	                      	<td width="35" height="20" align="center">
	                     		<input type="checkbox" name="checkbox" class="checkbox" value="${ip.code }"/>
	                      	</td>
	                      	<td width="85" align="center">
	                      		<c:url var="IpBoard" value="ipBoard.ip">
									<c:param name="bId" value="${ ip.code }"/>
									<c:param name="page" value="${ pi.currentPage }"/>
								</c:url>
								<a href="${ ipdetail }">${ip.kname }</a>
	                      	</td>
	                      	<td width="153"align="center">${ip.inumber1 } - ${ip.inumber2 }</td>
	                      	<td width="91" align="center">${ip.gender }</td>
	                      	<td width="91" align="center">${ip.grade }</td>
	                      	<td width="91" align="center">${ip.state }</td>
	                      	<td width="91" align="center">${ip.worktype }</td>
	                      	<td align="center">
									<c:url var="ipdetail" value="ipdetail.sc">
									<c:param name="bId" value="${ ip.code }"/>
									<c:param name="page" value="${ pi.currentPage }"/>
									</c:url>
									<a href="${ ipdetail }">수정</a> <img src="resources/image/all_icon.gif" width="11" 
									height="11">
							</td>
							
	                    </tr>
	           </c:forEach>
	                 
	                 <!--  검색 사용없이 목록조회하면 나오는 리스트 -->
	           <c:forEach var="ip" items="${ iplist }">
	                    <tr> 
	                      	<td width="35" height="20" align="center">
	                     		<input type="checkbox" name="checkbox" class="checkbox" value="${ip.code }"/>
	                      	</td>
	                      	
	                      	<td width="85" align="center">
	                      		<c:url var="IpBoard" value="ipdetail.ip">
									<c:param name="bId" value="${ ip.code }"/>
									<c:param name="page" value="${ pi.currentPage }" />
								</c:url>
								<a href="${ IpBoard }">${ip.kname }</a>
	                      	</td>
	                      	
	                      	<td width="153"align="center">${ip.inumber1 }</td>
	                      	<td width="91" align="center">${ip.gender }</td>
	                      	<td width="91" align="center">${ip.grade }</td>
	                      	<td width="91" align="center">${ip.state }</td>
	                      	<td width="91" align="center">${ip.worktype }</td>
	                      	
	                      	<td align="center">
									<c:url var="ipdetail" value="ipBoard.ip">
									<c:param name="bId" value="${ ip.code }"/>
									<c:param name="page" value="${ pi.currentPage }"/>
									</c:url>
									<a href="${ ipBoard }">수정</a> <img src="resources/image/all_icon.gif" width="11" 
									height="11">
							</td>
							
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
						<c:url var="before" value="interpia.sc">
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
							<c:url var="pagination" value="interpia.sc">
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
						<c:url var="after" value="interpia.sc">
							<c:param name="page" value="${ pi.currentPage + 1 }"/>
						</c:url> 
						<a href="${ after }">[다음]</a>
						</c:if>
						
						
						
						
			</div>
 			</div><!-------------------------  리스트 ------------------------------>
 			<div id="downLoad">
 				<button class="btn btn-primary" id="updateBtn"onclick="location.href='${ nodelete }'" >삭제</button>
 				<button><img src="resources/image/all_icon.gif" width="11" height="11">자료다운</button>
 				
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
		function searchBoardMain(){
			var searchConditionMain = $("#searchConditionMain").val();
			var searchValue = $("#searchValue").val();
			
			location.href="search.ip?searchConditionMain="+searchConditionMain+"&searchValue="+searchValue;
		}
</script>
</body>
</html>
