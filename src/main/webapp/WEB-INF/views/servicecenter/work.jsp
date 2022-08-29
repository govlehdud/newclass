<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body topmargin="0" leftmargin="0">
<form action="work.sc" method="post" enctype="multipart/form-data">
<table style = "width:640; border:0; cellspacing:0; cellpadding:0;">
  <tr> 
    <td width="640">&nbsp;</td>
  </tr>
  <tr> 
    <td height="25"><img src="resources/image/icon.gif" width="9" height="9" align="middle"> 
      <strong>경력 정보 수정</strong></td>
  </tr>
  <tr> 
    <td><table style = "width:640; border:0; cellspacing:0; cellpadding:0;">
        <tr> 
          <td height="15" align="left"><table style = "width:640; border:0; cellspacing:0; cellpadding:0;">
              <tr> 
                <td><table style = "width:640; border:0; cellspacing:1; cellpadding:0;">
                    <tr> 
                      <td height="2" background="resources/image/bar_bg1.gif"></td>
                    </tr>
                    <tr align="center" bgcolor="F8F8F8"> 
                      <td height="26" align="center" bgcolor="#E4EBF1" style="padding-right:10">
                      <table style = "width:600; border:0; cellspacing:0; cellpadding:0;">
                          <tr> 
		                            <td align="center">
		                            	<strong>
		                            	|
										<input type="submit" value="자격증. 보유기술정보" onclick="javascript: form.action='EDUupdate.sc';" style="background-color:transparent; border:0;">		
										| 
										<input type="submit" value="학력/교육 정보" onclick="javascript: form.action='scEDU.sc';" style="background-color:transparent; border:0;">
										| 
										<input type="submit" value="프로젝트정보" onclick="javascript: form.action='LicenseBoard.sc';" style="background-color:transparent; border:0;">
										|
										<input type="submit" value="경력정보" onclick="javascript: form.action='projectBoard.sc';" style="background-color:transparent; border:0;">
										| 
										 <input type="submit" value="근무정보" onclick="javascript: form.action='companyBoard.sc';" style="background-color:transparent; border:0;">
										</strong>
		                            </td>
		                          </tr>
                        </table></td>
                    </tr>
                    <tr align="center" bgcolor="F8F8F8"> 
                      <td height="3" align="right" background="resources/image/bar_bg1.gif"></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td height="6" align="center" valign="top">&nbsp;</td>
        </tr>
        <tr>
          <td height="7" align="center" valign="top"><table style = "width:640; border:0; cellspacing:0; cellpadding:0;">
              <tr> 
                <td bgcolor="#CCCCCC"><table style = "width:640; border:0; cellspacing:1; cellpadding:0;">
                    <tr> 
                      <td width="97" height="31" align="center" bgcolor="#E4EBF1"><strong>사원명</strong></td>
                      <td width="128" align="center" bgcolor="#E4EBF1">
                      			<input name="kname" type="text" size="15" value="${ scBoard.kname }">
                      			<input type="hidden" name="eId" value="${scBoard.code }">
								<input type="hidden" name="code" value="${scBoard.code }">
                      </td>
                      <td width="131" align="center" bgcolor="#E4EBF1"><strong>주민등록번호</strong></td>
                      <td width="239" align="center" bgcolor="#E4EBF1">
                      			<input name="inumber1" type="text" size="15" value="${ scBoard.inumber1 }">
                        -
                        		<input name="inumber2" type="text" size="15" value="${ scBoard.inumber2 }">
                      </td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td height="3" align="center" valign="top">&nbsp;</td>
        </tr>
        <tr>
          <td height="7" align="center" valign="top"><table style = "width:640; border:0; cellspacing:0; cellpadding:0;">
            <tr>
              <td bgcolor="#CCCCCC"><table style = "width:640; border:0; cellspacing:1; cellpadding:0;">
                  <tr>
                    <td height="26" align="center" bgcolor="#E4EBF1">
                    <table style = "width:500; border:0; cellspacing:1; cellpadding:1;">
                      <tr>
                        <td width="102" align="left"><strong>프로젝트명&nbsp; </strong></td>
                        <td width="391"><input name="projectName" type="text" size="40" value="${ workBoard.projectName }">
                          </td>
                      </tr>
                    </table>                      
                      </td>
                    </tr>
                  <tr>
                    <td height="26" align="center" bgcolor="#E4EBF1">
                    <table style = "width:500; border:0; cellspacing:1; cellpadding:1;">
                      <tr>
                        <td width="102" align="left"><strong>근무장소&nbsp; </strong></td>
                        <td width="391"><input name="workPlace" type="text" size="40" value="${ workBoard.workPlace }">
                        </td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td height="26" align="center" bgcolor="#E4EBF1">
                    <table style = "width:500; border:0; cellspacing:1; cellpadding:1;">
                      <tr>
                        <td width="101" align="left"><strong>근무시작일&nbsp; </strong></td>
                        <td width="151"><input name="workStart" type="date" size="15" value="${ workBoard.workStart }">
                        </td>
                        <td width="94"><strong>근무종료일</strong></td>
                        <td width="141"><input name="workEnd" type="date" size="15" value="${ workBoard.workEnd }"></td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td height="22" align="center" bgcolor="#E4EBF1">
                    <table style = "width:500; border:0; cellspacing:1; cellpadding:1;">
                      <tr>
                        <td width="101" align="left"><strong>매출액&nbsp; </strong></td>
                        <td width="151"><input name="sale" type="text" size="15" value="${ workBoard.sale }">
                        </td>
                        <td width="117">&nbsp;</td>
                        <td width="118">&nbsp;</td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td height="22" align="center" bgcolor="#E4EBF1">
                    <table style = "width:500; border:0; cellspacing:1; cellpadding:1;">
                      <tr>
                        <td width="101" align="left"><strong>결제 예정일 &nbsp; </strong></td>
                        <td width="151"><input name="payStart" type="date" size="15" value="${ workBoard.payStart }">
                        </td>
                        <td width="96" align="center"><strong>결제일</strong></td>
                        <td width="139"><input name="payDay" type="date" size="15" value="${ workBoard.payDay }"></td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td height="26" align="center" bgcolor="#E4EBF1">
                    <table style = "width:500; border:0; cellspacing:1; cellpadding:1;">
                      <tr>
                        <td width="101" align="left">
                        		<strong>거래처 &nbsp; </strong>
                        </td>
                        <td width="151">
		                        <select name="client" >
		                          <option>선택하세요</option>
		                          <option value="거래처1"<c:if test="${workBoard.client == '거래처1'}">selected='selected'</c:if> >거래처1</option>
		                          <option value="거래처2"<c:if test="${workBoard.client == '거래처2'}">selected='selected'</c:if> >거래처2</option>
		                          <option value="거래처3"<c:if test="${workBoard.client == '거래처3'}">selected='selected'</c:if> >거래처3</option>
		                        </select>
                        </td>
                        <td width="117">&nbsp;</td>
                        <td width="118">&nbsp;</td>
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
          <td height="3" align="center">
          <table style = "width:107; border:0; cellspacing:1; cellpadding:1;">
            <tr>
              <td width="51">
				<button type="submit" style="background-color: transparent; border: 0;">
						<img src="resources/image/bt_remove.gif" width="49" height="18">
				</button>
			</td>
              <td width="51"><img src="resources/image/bt_cancel.gif" width="49" height="18"></td>
            </tr>
          </table></td>
        </tr>
        <tr> 
          <td height="7" align="right">&nbsp;</td>
        </tr>
      </table></td>
  </tr>
</table>
</form>
</body>
</html>
