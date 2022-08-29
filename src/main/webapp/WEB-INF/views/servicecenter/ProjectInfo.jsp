<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<style>
/* 
	다크 모드 실험

 */
.themed {
  display: block;
  width: 30em;
  height: 30em;
  background: black;
  color: white;
}

@media (prefers-color-scheme: light) {
  .themed {
    background: white;
    color: black;
  }
}
</style>
<head>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body topmargin="0" leftmargin="0">
<form action="project.sc" method="post" enctype="multipart/form-data">
<table style = "width:640; border:0; cellspacing:0; cellpadding:0;">
  <tr> 
    <td width="640">&nbsp;</td>
  </tr>
  <tr> 
    <td height="25"><img src="resources/image/icon.gif" width="9" height="9" align="top"> 
      <strong>프로젝트 정보 수정</strong></td>
  </tr>
  <tr> 
    <td><table style = "width:640; border:0; cellspacing:0; cellpadding:0;">
        <tr> 
          <td height="15" align="left">
          <table style = "width:640; border:0; cellspacing:0; cellpadding:0;">
              <tr> 
                <td>
                <table style = "width:640; border:0; cellspacing:1; cellpadding:0;">
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
                      <td height="3" align="right" background="resources/image/bar_bg1.gif"/>
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
          <table style = "width:600; border:0; cellspacing:0; cellpadding:0;">
              <tr> 
                <td bgcolor="#CCCCCC">
                <table style = "width:600; border:0; cellspacing:0; cellpadding:0;">
                    <tr> 
                      <td width="97" height="31" align="center" bgcolor="#E4EBF1">
                      <strong>사원명</strong></td>
                      <td width="128" align="center" bgcolor="#E4EBF1">
                      		<input type="text"	 name="kname"	value=" ${ scBoard.kname}">
                      		<input type="hidden" name="eId"		value="	${ scBoard.code	}">
							<input type="hidden" name="code"	value=" ${ scBoard.code }">
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
          <td height="7" align="center" valign="top"><table style = "width:600; border:0; cellspacing:0; cellpadding:0;">
            <tr>
              <td bgcolor="#CCCCCC"><table style = "width:600; border:0; cellspacing:0; cellpadding:0;">
                  <tr>
					  <td height="26" align="center" bgcolor="#E4EBF1">
                      <table style = "width:494; border:0; cellspacing:0; cellpadding:0;">
                        	<tr align="left">
                          	<td width="86"><strong>프로젝트명</strong></td>
                          	<td width="160">
	                          	<strong>
	                            		<input name="proName" type="text" size="20" value="${ projectBoard.proName }">
	                          	</strong>
                          	</td>
                          	<td width="75"><strong>참여기간</strong></td>
                          	<td width="173"><strong>
                          	</strong>
                          	<strong>
	                          	<input name="proPeriod1" type="text" size="10" value="${ projectBoard.proPeriod1 }">~ 
								<input name="proPeriod2" type="text" size="10" value="${ projectBoard.proPeriod2 }">
							</strong>
							</td>
                          </tr>
                      </table>                      </td>
                    </tr>
                  <tr>
                    <td height="26" align="center" bgcolor="#E4EBF1">
                    <table style = "width:494; border:0; cellspacing:0; cellpadding:0;">
                      <tr align="left">
                        <td width="60"><strong>고객사</strong></td>
                        <td width="162"><strong>
                          <input name="proCustomer" type="text" size="20" value="${ projectBoard.proCustomer }">
                        </strong></td>
                        <td width="65"><strong>근무회사</strong></td>
                        <td width="207">
	                        <strong>
	                        		<input name="proCompany" type="text" size="20" value="${ projectBoard.proCompany }">
	                        </strong>
                        </td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td height="26" align="center" bgcolor="#E4EBF1"><table style = "width:494; border:0; cellspacing:0; cellpadding:0;">
                      <tr align="left">
                        <td width="60"><strong>개별분야</strong></td>
                        <td width="162">
	                        <strong>
	                        	<select name="proArea">
	                            		<option>선택하세요</option>
	                        	</select>
                        	</strong>
                       	</td>
                        <td width="65"><strong>역할</strong></td>
                        <td width="207"><strong> </strong><strong>
                          <input name="proPart" type="text" size="30" value="${ projectBoard.proPart }">
                        </strong></td>
                      </tr>
                    </table></td>
                  </tr>
              </table></td>
            </tr>
          </table></td>
        </tr>
        <tr>
          <td height="7" align="center" valign="top">&nbsp;</td>
        </tr>
        <tr>
          <td height="7" align="left" valign="top"><table style = "width:526; border:0; cellspacing:1; cellpadding:1;">
            <tr>
              <td width="16" align="right">&nbsp;</td>
              <td><strong>■ 개발환경 </strong></td>
            </tr>
          </table></td>
        </tr>
        <tr> 
          <td height="13" align="center">
          <table style = "width:600; border:0; cellspacing:0; cellpadding:0;">
              <tr> 
                <td bgcolor="#CCCCCC">
                <table style = "width:600; border:0; cellspacing:0; cellpadding:0;">
                    <tr> 
                      <td height="26" align="center" bgcolor="#E4EBF1">
                      <table style = "width:480; border:0; cellspacing:0; cellpadding:0;">
                        <tr align="left">
                          <td width="54"><strong>기종</strong></td>
                          <td width="198">
                          	<strong>                            
                            	<input name="proProduct" type="text" size="25" value="${ projectBoard.proProduct }">
                            </strong></td>
                          <td width="38"><strong>OS</strong></td>
                          <td width="190">
                          	<strong>
                            	<input name="proOs" type="text" size="25" value="${ projectBoard.proOs }">
                            </strong></td>
                        </tr>
                      </table></td>
                    </tr>
                    <tr> 
                      <td height="26" align="center" valign="middle" bgcolor="#E4EBF1">
                      <table style = "width:480; border:0; cellspacing:0; cellpadding:0;">
                        <tr align="left">
                          <td width="54"><strong>언어</strong></td>
                          <td width="198">
	                          <strong>
	                            	<input name="proLanguage" type="text" size="25" value="${ projectBoard.proLanguage }">
	                          </strong>
                          </td>
                          <td width="60"><strong>DBMS</strong></td>
                          <td width="168">
	                          <strong>
	                            	<input name="proDbms" type="text" size="25" value="${ projectBoard.proDbms }">
	                          </strong>
                          </td>
                        </tr>
                      </table>
                      </td>
                    </tr>
                    <tr> 
                      <td height="26" align="center" bgcolor="#E4EBF1">
                      <table style = "width:480; border:0; cellspacing:0; cellpadding:0;">
                        <tr align="left">
                          <td width="54"><strong>TOOL</strong></td>
                          <td width="202">
	                          <strong>
	                            <input name="proTool" type="text" size="25" value="${ projectBoard.proTool }">
	                          </strong>
	                      </td>
                          <td width="44"><strong>통신</strong></td>
                          <td width="185">
	                          <strong>
	                            <input name="proCommunication" type="text" size="25" value="${ projectBoard.proCommunication }">
	                          </strong>
                          </td>
                        </tr>
                      </table>
                      </td>
                    </tr>
                    <tr>
                      <td height="26" align="center" bgcolor="#E4EBF1">
                      <table style = "width:480; border:0; cellspacing:0; cellpadding:0;">
                        <tr align="left">
                          <td width="54"><strong>기타</strong></td>
                          <td width="429">
		                          <strong>
		                          		<input name="proEtc" type="text" size="50" value="${ projectBoard.proEtc }">
		                          </strong>
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
          <td height="3" align="center">
	          <table style = "width:107; border:0; cellspacing:1; cellpadding:1;">
		            <tr>
			        		<td width="49">
			        		<button type="submit" style="background-color:transparent; border:0;">
	              					<img src="resources/image/bt_remove.gif" width="49" height="18">
	            			</button>
			              <td width="51"><img src="resources/image/bt_cancel.gif" width="49" height="18"/>
		            </tr>
	          </table>
          </td>
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