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
			<strong>경비조회</strong>
		</div>
		<BR> 
		<div id="searchArea" align="center">
			<input type="text" value="등록연월" readonly size="4" style="background-color:#FF99FF"> 
			<input type="text" class="datetype" name="datetype" id="datetype"/>
			<input type="text" value="사용내역" readonly size="4" style="background-color:#FF99FF"> 
			<select id="searchCondition2" name="searchCondition2" >
				<option value="all">전체</option>
				<option value="mealns">식대(야근)</option>
				<option value="taxins">택시비(야근)</option>
				<option value="taxidt">택시비(회식)</option>
				<option value="office">사무용품</option>
				<option value="edu">교육비</option>
				<option value="enter">접대비</option>
			</select> 
							
			<input type="text" value="처리상태" readonly size="4" style="background-color:#FF99FF">
			<select id="searchCondition3" name="searchCondition3">
				<option value="all">전체</option>
				<option value="receipt">접수</option>
				<option value="recognize">승인</option>
				<option value="payment">지급완료</option>
				<option value="companion">반려</option>
			</select>
			<br>
			<hr>
			<input type="reset" value="초기화">
			<button type="submit" onclick="searchBoard2();">검색</button>
			<br>
			<HR>
		</div>
		<div id="">
		<TABLE>
			<TR>
				<td>
					총 &nbsp;${pi.listCount}건
				</td>
				<TD>
				        <button type="button" id="videoPlay" onclick="excelwindow()">
					        <img src="resources/image/all_icon.gif" width="11" height="11">엑셀다운로드
				        </button>
						<button type="button" id="videoPlay" onclick="nwindow()">등록</button>
				</TD>
				
			</TR>
		</TABLE>
		</div> 
		<div id="row">
			<!-- <form id="form_ex" action="excellDown.co" method="post"> -->
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
							<th width="153" align="center" class ="numberdata">${co.BNo }</th> 
							<td width="153" align="center">
								<fmt:formatDate pattern = "yyyy/MM/dd" value="${co.BDate }"/>
							</td>
							<td width="153" align="center">${co.BHistory }</td>
							<%-- <td width="91" 	align="center">
								${co.bAmount }
							</td> --%>
							<td width="91" 	align="center">
								<fmt:formatNumber value="${co.BAmount }" pattern="#,###.##"/>	
							</td>
							<%-- <td width="91" 	align="center">${co.bRecognize }</td> --%>
							<td width="91" 	align="center">
								<fmt:formatNumber value="${co.BRecognize }" pattern="#,###.##"/>
							</td>
							<td width="91" 	align="center">${co.BStatus }</td>
							<td width="91" 	align="center">${co.BRegistration }</td>
							<td align="center" >
									<c:url var="codetail" value="codetail.co">
									 	<c:param name="bId" value="${ co.BNo }"/>
									</c:url>
									
									<button class="numberdata value= ${co.BNo}" 
											onclick="popup(' ${co.BNo} ')">수정
									</button>
							</td> 

						</tr>
					</c:forEach>
				</tbody>
			</table>
			<br> <br>
		</div>
		<!-------------------------  리스트 ------------------------------>

	</div>
<script type="text/javascript">
	// popup 버튼
	function popup(BNo){
		/* 게시글 제목 클릭 상세보기 */
			// var word = $("#numberdata").text();
			
			
			// number 가공하기위해 문자열로 받기
			/* var array = $(".numberdata").text();
			console.log("array 배열길이 :  " + array.length);      
			console.log("array 배열값? :  " + array);      
			
			// 첫번쨰 문자열값 받기
			var result1 = array.substr(0,3);
			console.log("result1 값 :  " + result1);  
			
			// 두번째 문자열값 받기
			var result2 = array.substr(13,3);
			console.log("result2 값 :  " + result2);  
			
			// 세번째 문자열값 받기
 			var result3 = array.substr(26,3);
			console.log("result3 값 :  " + result3);  
			
			// 네번째 문자열값 받기
 			var result4 = array.substr(39,3);
			console.log("result4 값 :  " + result4);  
			
			// 다섯번째 문자열값 받기
 			var result5 = array.substr(52,3);
			console.log("result5 값 :  " + result5);  
			
			var reslist = [];
			reslist.push(result1);
			reslist.push(result2);
			reslist.push(result3);
			reslist.push(result4);
			reslist.push(result5);
		    console.log(reslist); */
		 
			
		
		var word = BNo; 
		var popUrl = "codetail.co?bId="+word;	//팝업창에 출력될 페이지 URL
		
		/* console.log("클릭한 Row의 모든 데이터 : "+ word);    
		console.log("클릭한 Row의 모든 데이터 : "+popUrl);     */
		
		var popOption = "width=1000, height=600, resizable=no, scrollbars=yes, status=no;";    //팝업창 옵션(optoin)
		
		window.open(popUrl,"_blank",popOption);
		
		
		
		
		
		
		
			                    
	}
</script>

	
	
	
	
	
	
	
	
	
	
	<script>
		$(document).ready(function(){
		 	//데이트피커 초기화
			 dateTypeIns();
		}); // document ready function
		
		
		//datepicker 날짜 입력함수
		function dateTypeIns(){
		 	$(".datetype").datepicker({
		  	dateFormat : "yy-mm-dd",
		  	changeYear: true, 
		  	changeMonth: true,
		  	yearRange : 'c-80:c+10',
		    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		  	monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
		 });  
		}
		</script>
	
	
	
	
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
					data : {
						checkbox : checkbox
					},
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
		$("#allCheck").click(function() {
			var chk = $("#allCheck").prop("checked");
			if (chk) {
				$(".checkbox").prop("checked", true);
			} else {
				$(".checkbox").prop("checked", false);
			}
		});

		$(".interpia.sc").click(function() {
			$("#allCheck").prop("checked", false);
		});
	</script>
	<script type="text/javascript">
		// 게시글 상세보기
		$(function() {
			$('#listArea td').on({
				'mouseenter' : function() {
					$(this).parent().css({
						'background' : 'lightgray',
						'cursor' : 'pointer'
					});
				},
				'mouseout' : function() {
					$(this).parent().css({
						'background' : 'none'
					});
				}
			});
		});
	</script>
	<script type="text/javascript">
		//게시글 검색
		function searchBoard2() {
			var searchCondition2 = $("#searchCondition2").val();
			var searchCondition3 = $("#searchCondition3").val();
			var datetype = $("#datetype").val();
			
			location.href = "search.co?searchCondition2=" + searchCondition2+
					"&datetype="+datetype +
					"&searchCondition3="+searchCondition3;
					;
			
			}
			
	</script>



<script type="text/javascript">
	// popup 버튼
	function nwindow(){
		var myForm = document.popup;

		window.open("cost/popup", "_blank", "toolbar=yes, menubar=yes, width=1000, height=300, scrollbars=yes").focus();

	}
</script>
<script type="text/javascript">
	// popup 버튼
	function excelwindow(){
		var myForm = document.popup;

		window.open("cost/excel", "_blank", "toolbar=yes, menubar=yes, width=1300, height=500, scrollbars=yes").focus();

	}
</script>

</body>
</html>