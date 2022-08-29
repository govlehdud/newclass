<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<html>
<head>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body topmargin="0" leftmargin="0">
<form action="company.sc" method="post" enctype="multipart/form-data">
<table style = "width:640; border:0; cellspacing:0; cellpadding:0;">
  <tr> 
    <td width="640">&nbsp;</td>
  </tr>
  <tr> 
    <td height="25"><img src="resources/image/icon.gif" width="9" height="9" align="middle"> 
      <strong>경력 정보 수정</strong></td>
  </tr>
  <tr> 
    <td>
    <table style = "width:640; border:0; cellspacing:0; cellpadding:0;">
        <tr> 
          <td height="15" align="left">
          <table style = "width:640; border:0; cellspacing:0; cellpadding:0;">
              <tr> 
                <td>
                <table style = "width:640; border:0; cellspacing:0; cellpadding:0;">
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
	                    </table>
                    </td>
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
          <td height="7" align="center" valign="top"><table style = "width:600; border:0; cellspacing:0; cellpadding:0;">
              <tr> 
                <td bgcolor="#CCCCCC"><table style = "width:600; border:0; cellspacing:1; cellpadding:0;">
                    <tr> 
                    	<td width="97" height="31" align="center" bgcolor="#E4EBF1">
                    		<strong>사원명</strong>
                    	</td>
                    	<td width="128" align="center" bgcolor="#E4EBF1">
                    		<input type="text"	 name="kname"	value=" ${ scBoard.kname}">
                    		<input type="hidden" name="eId" value="${scBoard.code }">
							<input type="hidden" name="code" value="${scBoard.code }">
                    	</td>
                    	<td width="131" align="center" bgcolor="#E4EBF1">
                    		<strong>주민등록번호</strong>
                    	</td>
                   		<td width="239" align="center" bgcolor="#E4EBF1">
	                    	<input name="inumber1" type="text" size="15" value="${ scBoard.inumber1 }">
	                        -
	                    	<input name="inumber2" type="text" size="15" value="${ scBoard.inumber2 }">
                   		</td>
                    </tr>
                  </table>
                  </td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td height="3" align="center" valign="top">&nbsp;</td>
        </tr>
        <tr>
          <td height="7" align="center" valign="top">
          <table style = "width:600; border:0; cellspacing:0; cellpadding:0;">
            <tr>
              <td bgcolor="#CCCCCC"><table style = "width:600; border:0; cellspacing:1; cellpadding:0;">
                  <tr>
                    <td height="45" align="center" bgcolor="#E4EBF1">
                      <table style = "width:547; border:0; cellspacing:1; cellpadding:1;">
                        <tr align="left">
	                        <td width="49"><strong>회사명</strong></td>
	                        <td width="268">
			                        <strong>
			                        	  <input name="cName1" type="text" size="30" value="${ companyboard.CName1 }">
			                        </strong>
	                        </td>
	                        <td width="78"><strong>직위</strong></td>
	                        <td width="152">
			                        <strong>
			                        	<input name="cSpot1" type="text" size="15" value="${ companyboard.CSpot1 }">
									</strong>
							</td>
                        </tr>
                        <tr align="left">
	                        <td><strong>기간</strong></td>
	                        <td width="268">
	                        <strong>
	                        	<input name="cPeriod11" type="text" size="10" value="${ companyboard.CPeriod11 }">
								~ 
								<input name="cPeriod21" type="text" size="10" value="${ companyboard.CPeriod21 }">
							</strong>
							</td>
							<td width="78"><strong>담당업무</strong></td>
	                         <td width="152">
	                         <strong>
	                            	<input name="cWork1" type="text" size="20" value="${ companyboard.CWork1 }">
	                        </strong>
	                        </td>
                        </tr>
                      </table>                      
                  	</td>
                  </tr>
                    <tr>
                    <td height="45" align="center" bgcolor="#E4EBF1">
                      <table style = "width:547; border:0; cellspacing:1; cellpadding:1;">
                        <tr align="left">
	                        <td width="49"><strong>회사명</strong></td>
	                        <td width="268">
			                        <strong>
			                        	  <input name="cName2" type="text" size="30" value="${ companyboard.CName2 }">
			                        </strong>
	                        </td>
	                        <td width="78"><strong>직위</strong></td>
	                        <td width="152">
			                        <strong>
			                        	<input name="cSpot2" type="text" size="15" value="${ companyboard.CSpot2 }">
									</strong>
							</td>
                        </tr>
                        <tr align="left">
	                        <td><strong>기간</strong></td>
	                        <td width="268">
	                        <strong>
	                        	<input name="cPeriod12" type="text" size="10" value="${ companyboard.CPeriod12 }">
								~ 
								<input name="cPeriod22" type="text" size="10" value="${ companyboard.CPeriod22 }">
							</strong>
							</td>
							<td width="78"><strong>담당업무</strong></td>
	                         <td width="152">
	                         <strong>
	                            	<input name="cWork2" type="text" size="20" value="${ companyboard.CWork2 }">
	                        </strong>
	                        </td>
                        </tr>
                      </table>                      
                  	</td>
                  </tr>
                     <tr>
                    <td height="45" align="center" bgcolor="#E4EBF1">
                      <table style = "width:547; border:0; cellspacing:1; cellpadding:1;">
                        <tr align="left">
	                        <td width="49"><strong>회사명</strong></td>
	                        <td width="268">
			                        <strong>
			                        	  <input name="cName3" type="text" size="30" value="${ companyboard.CName3}">
			                        </strong>
	                        </td>
	                        <td width="78"><strong>직위</strong></td>
	                        <td width="152">
			                        <strong>
			                        	<input name="cSpot3" type="text" size="15" value="${ companyboard.CSpot3 }">
									</strong>
							</td>
                        </tr>
                        <tr align="left">
	                        <td><strong>기간</strong></td>
	                        <td width="268">
	                        <strong>
	                        	<input name="cPeriod13" type="text" size="10" value="${ companyboard.CPeriod13 }">
								~ 
								<input name="cPeriod23" type="text" size="10" value="${ companyboard.CPeriod23 }">
							</strong>
							</td>
							<td width="78"><strong>담당업무</strong></td>
	                         <td width="152">
	                         <strong>
	                            	<input name="cWork3" type="text" size="20" value="${ companyboard.CWork3 }">
	                        </strong>
	                        </td>
                        </tr>
                      </table>                      
                  	</td>
                  </tr>
                    <tr>
                    <td height="45" align="center" bgcolor="#E4EBF1">
                      <table style = "width:547; border:0; cellspacing:1; cellpadding:1;">
                        <tr align="left">
	                        <td width="49"><strong>회사명</strong></td>
	                        <td width="268">
			                        <strong>
			                        	  <input name="cName4" type="text" size="30" value="${ companyboard.CName4 }">
			                        </strong>
	                        </td>
	                        <td width="78"><strong>직위</strong></td>
	                        <td width="152">
			                        <strong>
			                        	<input name="cSpot4" type="text" size="15" value="${ companyboard.CSpot4 }">
									</strong>
							</td>
                        </tr>
                        <tr align="left">
	                        <td><strong>기간</strong></td>
	                        <td width="268">
	                        <strong>
	                        	<input name="cPeriod14" type="text" size="10" value="${ companyboard.CPeriod14 }">
								~ 
								<input name="cPeriod24" type="text" size="10" value="${ companyboard.CPeriod24 }">
							</strong>
							</td>
							<td width="78"><strong>담당업무</strong></td>
	                         <td width="152">
	                         <strong>
	                            	<input name="cWork4" type="text" size="20" value="${ companyboard.CWork4 }">
	                        </strong>
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
          <td height="3" align="center">&nbsp;</td>
        </tr>
        <tr>
          <td height="3" align="center"><table style = "width:107; border:0; cellspacing:1; cellpadding:1;">
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
