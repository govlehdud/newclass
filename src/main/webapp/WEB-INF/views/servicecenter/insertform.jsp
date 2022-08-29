<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script> 
<meta http-equiv="Content-Type" content= "text/html; charset=UTF-8">
<!-- BootStrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title>게시글 작성</title>
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
	margin-top:30px;
	margin-left:10px;
	width:780px;
	min-height: 300px;
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
	margin-left:50px;
}
</style>
</head>
<body>
<form action="insert.sc" method="post" enctype="multipart/form-data">


<div>
	<div id="header">
		
	</div>
	<div id="siderBar">
<div>
	<ul>
		<li><img src="resources/image/left_icon.gif"/> 기본정보</li>
		<li><a href="insertform.sc">직원 등록</a></li>
		<li><img src="resources/image/left_icon.gif"/>	<a href="interpia.sc"> 직원명부  </a></li>
		<li><img src="resources/image/left_icon.gif"/>	<a href="interpia2.sc">퇴직자현황</a></li>
		<li><img src="resources/image/left_icon.gif"/> 예비인력정보</li>
		<li><img src="resources/image/left_icon.gif"/> <a href="clientInfo.sc">거래처정보</a></li>
		<li><a href="clientinsert.sc">거래처 등록</a></li>
	</ul>
</div>
<div>
	<ul>
		<li>진행 프로젝트</li>
		<li>현 황</li>
	</ul>
</div>
</div><!-- siderBar end --> 
	<div id="contents">
		<div id="content">
			<table>
  <tr> 
    <td width="640">&nbsp;</td>
  </tr>
  <tr> 
    <td height="25"><img src="resources/image/icon.gif" width="9" height="9"> 
      <strong>사원 기본 정보 수정</strong></td>
  </tr>
  <tr> 
    <td><table>
        <tr> 
          <td height="15" align="left">
	          <table>
	              <tr> 
		              <td><table>
		                    <tr> 
		                      <td height="2" background="resources/image/bar_bg1.gif"></td>
		                    </tr>
		                    <tr align="center" bgcolor="F8F8F8"> 
		                    	<td height="26" align="center" bgcolor="#E4EBF1" style="padding-right:10">
			                      	<table>
			                          <tr> 
			                            <td align="center">
			                            	<strong>교육정보 | 자격증. 보유기술정보 | 프로젝트 정보 |경력정보 | 근무정보</strong>
			                            </td>
			                          </tr>
			                        </table>
		                    	</td>
		                    </tr>
		                    <tr align="center" bgcolor="F8F8F8"> 
		                      <td height="3" align="right" background="resources/image/bar_bg1.gif">
		                  	</tr>
		                  </table>
		              </td>
	              </tr>
	            </table>
            </td>
        </tr>
        <tr> 
          <td height="6" align="center" valign="top">&nbsp;</td>
        </tr>
        <tr>
          <td height="7" align="center" valign="top">
	          <table >
	              <tr> 
	                <td bgcolor="#CCCCCC">
          
		                <table >
		                    <tr> 
		                      <td height="135" align="center" bgcolor="#E4EBF1"><table >
		                        <tr>
		                          <td width="144" height="119" align="center"><table>
		                            <tr>
		                              <td height="112" bgcolor="#CCCCCC"><table>
		                                  <tr>
		                                    <td height="110" bgcolor="#FFFFFF">&nbsp;</td>
		                                  </tr>
		                              </table>
		                              </td>
		                            </tr>
		                          </table></td>
		                          <td width="456"><table>
		                            <tr>
		                              <td height="2" colspan="2"></td>
		                              </tr>
		                            <tr>
		                              <td width="107" height="26" align="right">
		                              	<strong>한글이름 : &nbsp;</strong>
		                              </td>
		                              <td width="310" height="26">
		                                <input type="text" name="kname" korOnly>
		                              </td>
		                            </tr>
		                            <tr>
		                              <td height="26" align="right">
		                              	<strong>영문이름 : &nbsp;</strong>
		                              </td>
		                              <td height="26">
		                              	<input type="text" name="ename" engOnly>
		                              </td>
		                            </tr>
		                            <tr>
		                              <td height="26" align="right">
		                              	<strong>한문이름: &nbsp;</strong>
		                              </td>
		                              <td height="26">
		                              	<input type="text" name="cname">
		                              </td>
		                            </tr>
		                            <tr>
		                              <td height="26" align="right">
		                              	<strong>주민등록번호 : &nbsp;</strong>
		                              </td>
		                              <td>
			                              <input type="text" 	 name="inumber1" id="inum1" size="10" 
			                              maxlength="6" placeholder="ex)970308" numberOnly>-
			                              <input type="password" name="inumber2" id="inum2" size="15" maxlength="7"
			                               placeholder="뒷자리 입력해주세요" numberOnly>
		                              </td>
		                              <!-- <td height="26"><input name="inumber" type="text" size="15">
		   								   -
		       							 <input name="inumber" type="text" size="15"></td> -->
		                            </tr>
		                          </table>
		                          </td>
		                        </tr>
		                      </table>
		                      </td>
		                    </tr>
		                  </table>
	                  </td>
	              </tr>
	            </table>
            </td>
        </tr>
        <tr> 
          <td height="7" align="center" valign="top">&nbsp;</td>
        </tr>
        <tr> 
          <td height="13" align="center"><table>
              <tr> 
                <td bgcolor="#CCCCCC"><table >
                    <tr> 
                      <td bgcolor="#E4EBF1">
                      	<table >
                          <tr> 
                            <td width="150" align="right">
                            	<strong>사진파일명 :&nbsp;</strong>
                            </td>
                            <td width="268">
                            	<input type="file" id="uploadFile" multiple="multiple" 
                            		   name="uploadFile" width="49" height="18">
                            </td>
                            <td width="146">
	                            <img width="49" height="18">
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1"><table >
                          <tr> 
                            <td width="102" align="right">
                            <strong>생년월일 :&nbsp;</strong>
                            </td>
                            <td width="391">
	                            <input name="year"	type="text" size="3"maxlength="4"numberOnly>년 
		                        <input name="month" type="text" size="3"maxlength="2"numberOnly>월 
		                        <input name="day" 	type="text" size="3"maxlength="2"numberOnly>일 ( 
		                        <input type="radio" name="calendar" value="양력">양력 
		                        <input type="radio" name="calendar" value="음력">음력 )
                          	</td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1"><table >
                          <tr> 
                            <td width="102" align="right">
                            	<strong>성별 :&nbsp; </strong>
                            </td>
                            <td width="391"> 
                            	<input type="radio" name="gender" value="남자">남자 
                          		<input type="radio" name="gender" value="여자">여자
                          	</td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1">
                     	 <table >
                          <tr> 
                            <td width="102" align="right">
                            	<strong>결혼유무 :&nbsp;</strong>
                            </td>
                            <td width="391"> 
	                            <input type="radio" name="marry" value="기혼">기혼
	                            <input type="radio" name="marry" value="미혼">미혼
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1">
                      	<table >
                          <tr> 
                            <td width="101" align="right">
                            	<strong>년차 :&nbsp;</strong>
                            </td>
                            <td width="392">
                            	<input name="annual" type="text" size="1"maxlength="2" numberOnly> 
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1">
                      	<table>
                          <tr> 
                            <td width="101" align="right">
                            <strong>급여 지급유형 :&nbsp;</strong>
                            </td>
                            <td width="392"> 
                            	<select name="salary">
	                                <option>월급</option>
	                                <option>주급</option>
                              </select> </td>
                          </tr>
                        </table>
                     </td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1"><table>
                          <tr> 
                            <td width="101" align="right"><strong>희망직무 :&nbsp;</strong></td>
                            <td width="392"> 
                            	<select name="duty">
	                                <option>SI</option>
	                                <option>SM</option>
	                                <option>SOLUTION</option>
                            	</select> 
                            </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1"><table>
                          <tr> 
                            <td width="101" align="right"><strong>입사유형:&nbsp;</strong></td>
                            <td width="392"> <select name="entry">
                                <option>정규직</option>
                                <option>계약직</option>
                              </select> </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1"><table>
                          <tr> 
                            <td width="101" align="right"><strong>상태:&nbsp;</strong></td>
                            <td width="392"> <select name="state">
                                <option>정상</option>
                                <option>비정상</option>
                              </select> </td>
                              
                          </tr>
                        </table></td>
                    </tr>
                    
                    <tr> 
                    	<td bgcolor="#E4EBF1"><table>
	                          <tr> 
	                            <td width="101" align="right">
	                           		<strong>주소:&nbsp;</strong>
	                            </td>
	                            <td width="392">
		                            <input name="address1" type="text" size="10"maxlength="5" numberOnly> 
		                            <input name="address2" type="text" size="40" korOnly> 
	                            </td>
	                          </tr>
	                        </table>
                    	</td>
                    </tr>
                    <tr> 
                   		<td bgcolor="#E4EBF1">
	                    	<table>
		                        <tr> 
			                        <td width="101" align="right">
			                        	<strong>연락처:&nbsp;</strong>
			                        </td>
			                        
			                        <td width="392">
				                        <input name="phone1" type="text" size="2"maxlength="3" numberOnly>
				                        - 
				                        <input name="phone2" type="text" size="3"maxlength="4" numberOnly>
				                        - 
				                        <input name="phone3" type="text" size="3"maxlength="4" numberOnly>
			                        </td>
		                        </tr>
	                        </table>
                    	</td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1"><table>
                          <tr> 
                            <td width="101" align="right"><strong>이메일:&nbsp;</strong></td>
                            <td width="392"><input name="mail" type="text" size="20"> 
                            </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1"><table>
                          <tr> 
                            <td width="101" align="right"><strong>기술등급:&nbsp;</strong></td>
                            <td width="392"><input name="grade" maxlength="1"type="text" size="20"> 
                            </td>
                          </tr>
                        </table></td>
                    </tr>
                  
                        <tr> 
                      <td bgcolor="#E4EBF1"><table>
                          <tr> 
                            <td width="101" align="right"><strong>근무형태:&nbsp;</strong></td>
                            <td width="392"> <select name="worktype">
                                <option>근무</option>
                                <option>비근무</option>
                              </select> </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1"><table>
                          <tr> 
                            <td width="101" align="right"><strong>주량:&nbsp;</strong></td>
                            <td width="392"><input name="alcohol"maxlength="5" type="text" size="20"> 
                            </td>
                          </tr>
                        </table></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td height="3" align="center">&nbsp;</td>
        </tr>
        
        <tr>
          <td height="3" align="center"><table>
            <tr>
            <!-- <td>
            	<input src="resources/image/bt_remove.gif" width="49" height="18"type="submit" name="submit" value="회원 가입">
            	<input src="resources/image/bt_cancel.gif" width="49" height="18" type="reset" name="reset" value="다시 입력">
            </td> -->
              <td width="51">
              		<button type="submit">
              			<img src="resources/image/bt_remove.gif" width="49" height="18">
              		</button>
              </td>
              <td width="51">
              		     <c:if test="${board.status == 'Y'}">
              		<button type="reset">
              			<img src="resources/image/bt_cancel.gif" width="49" height="18"
              			onclick = "location.href = 'interpia.sc' " >
              		</button>
              </c:if>
              
              <c:if test="${board.status == 'N'}">
              		<button type="reset">
              			<img src="resources/image/bt_cancel.gif" width="49" height="18"
              			onclick = "location.href = 'interpia2.sc' " >
              		</button>
              </c:if>
              </td>
            </tr>
          </table>            </td>
        </tr>
        <tr> 
          <td height="7" align="right">&nbsp;</td>
        </tr>
      </table></td>
  </tr>
</table>
		</div>
	</div>
</div>
</form>
<script type="text/javascript">
$(document).ready(function(){    
	$("input:text[numberOnly]").on("keyup",  //숫자만 입력 가능
		function() {       $(this).val($(this).val().replace(/[^0-9]/g,""));});   
		 $("input:text[engOnly]").on("keyup", function() {       $(this).val($(this).val().replace(/[^a-zA-Z]/g,""));  //영어만 입력 가능   
	});    $("input:text[korOnly]").on("keyup", function() {       $(this).val($(this).val().replace(/[^ㄱ-ㅣ가-힣]/g,""));  // 한글만 입력 가능   
	}); 
	});
</script>
</body>
</html>


