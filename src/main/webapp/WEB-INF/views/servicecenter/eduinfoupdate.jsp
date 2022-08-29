<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body topmargin="0" leftmargin="0">
<form action="edupdate.sc" method="post" enctype="multipart/form-data">
<table style = "width:640; border:0; cellspacing:0; cellpadding:0;">
  <tr> 
    <td width="640">&nbsp;</td>
  </tr>
  <tr> 
    <td height="25"><img src="resources/image/icon.gif" width="9" height="9" > 
      <strong>학력ㆍ교육 정보 수정</strong></td>
  </tr>
  <tr> 
    <td>
    <table style="width:640; border:0; cellspacing:0; cellpadding:0;">
        <tr> 
          <td height="15" align="left"><table style=" width:640; border:0; cellspacing:0; cellpadding:0;">
              <tr> 
                <td>
                <table style=" width:640; border:0; cellspacing:0; cellpadding:0;">
                    <tr> 
                      <td height="2" background="resources/image/bar_bg1.gif"></td>
                    </tr>
                    <tr align="center" bgcolor="F8F8F8"> 
                      <td height="26" align="center" bgcolor="#E4EBF1" style="padding-right:10">
                      <table style=" width:600; border:0; cellspacing:0; cellpadding:0;">
                          <tr> 
                            <td align="center">
                            <strong>| 
                            <input type="submit" value="자격증. 보유기술정보" onclick="javascript: form.action='EDUupdate.sc';" style="background-color:transparent; border:0;">
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
          <td height="7" align="center" valign="top">
          <table style=" width:600; border:0; cellspacing:0; cellpadding:0;">
              <tr> 
                <td bgcolor="#CCCCCC"><table style=" width:600; border:0; cellspacing:0; cellpadding:0;">
                    <tr> 
                      <td width="97" height="31" align="center" bgcolor="#E4EBF1">
                      		<strong>사원명</strong>
                      </td>
                      
                      <td width="128" align="center" bgcolor="#E4EBF1">
                      		<input type="text" name="kname" value="${ scBoard.kname }" readonly>
                      		<input type="hidden" name="eId" value="${scBoard.code }">
                      		<input type="hidden" name="code" value="${scBoard.code }">
                      </td>
                      
                      
                      
                      <td width="131" align="center" bgcolor="#E4EBF1">
                     	 <strong>주민등록번호</strong>
                      </td>
                      <td width="239" align="center" bgcolor="#E4EBF1">
                      		<input name="inumber1" type="text" size="15" value="${ scBoard.inumber1 }" readonly>
                       		-
                      		<input name="inumber2" type="text" size="15" value="${ scBoard.inumber2 }" readonly>
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
          <td height="4" align="left" valign="top">
          <table style=" width:526; border:0; cellspacing:1; cellpadding:1;">
            <tr>
              <td width="16" align="right">&nbsp;</td>
              <td><strong>■ 학력</strong></td>
              </tr>
          </table></td>
        </tr>
        <tr>
          <td height="7" align="center" valign="top">
          <table style=" width:600; border:0; cellspacing:0; cellpadding:0;">
            <tr>
              <td bgcolor="#CCCCCC">
				<table style=" width:600; border:0; cellspacing:0; cellpadding:0;">
                  <tr>
                    <td height="26" align="center" bgcolor="#E4EBF1"><strong>                      </strong>
                      <table style=" width:517; border:0; cellspacing:0; cellpadding:0;">
                        <tr align="left">
                          <td width="109"><strong>
                            <input name="eHigh" type="text" size="15" value="${ eduboard.EHigh }">
                          </strong></td>
                          <td width="70"><strong>고등학교</strong></td>
                          <td width="108"><strong>
                            <input name="eHighClass" type="text" size="15" value="${ eduboard.EHighClass }">
                          </strong></td>
                          <td width="56"><strong>과 졸업</strong></td>
                          <td width="67"><strong>
                            <input name="eHighYear" type="text" size="8" value="${ eduboard.EHighYear }">
                          </strong></td>
                          <td width="32"><strong>년
                            
                          </strong></td>
                          <td width="66"><strong>
                            <input name="eHighMonth" type="text" size="8" value="${ eduboard.EHighMonth }">
                          </strong></td>
                          <td width="18"><strong>월</strong></td>
                        </tr>
                      </table>                      </td>
                    </tr>
                  <tr>
                    <td height="26" align="center" bgcolor="#E4EBF1">
                    <table style=" width:517; border:0; cellspacing:0; cellpadding:0;">
                      <tr align="left">
                        <td width="109"><strong>
                          <input name="eCom" type="text" size="15" value="${ eduboard.ECom }"> 
                        </strong></td>
                        <td width="70"><strong>전산원</strong></td>
                        <td width="108"><strong>
                          <input name="eComClass" type="text" size="15" value="${ eduboard.EComClass }">
                        </strong></td>
                        <td width="56"><strong>과 졸업</strong></td>
                        <td width="67"><strong>
                          <input name="eComYear" type="text" size="8" value="${ eduboard.EComYear }">
                        </strong></td>
                        <td width="32"><strong>년 </strong></td>
                        <td width="66"><strong>
                          <input name="eComMonth" type="text" size="8" value="${ eduboard.EComMonth }"> 
                        </strong></td>
                        <td width="18"><strong>월</strong></td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td height="26" align="center" bgcolor="#E4EBF1">
                    
                   <table style=" width:517; border:0; cellspacing:0; cellpadding:0;">
                      <tr align="left">
                        <td width="109"><strong>
                          <input name="eCollege" type="text" size="15" value="${ eduboard.ECollege }">
                        </strong></td>
                        <td width="70"><strong>전문대학</strong></td>
                        <td width="108"><strong>
                          <input name="eCollegeClass" type="text" size="15" value="${ eduboard.ECollegeClass }">
                        </strong></td>
                        <td width="56"><strong>과 졸업</strong></td>
                        <td width="67"><strong>
                          <input name="eCollegeYear" type="text" size="8" value="${ eduboard.ECollegeYear }">
                        </strong></td>
                        <td width="32"><strong>년 </strong></td>
                        <td width="66"><strong>
                          <input name="eCollegeMonth" type="text" size="8" value="${ eduboard.ECollegeMonth }">
                        </strong></td>
                        <td width="18"><strong>월</strong></td>
                      </tr>
                    </table>                      </td>
                  </tr>
                  <tr>
                    <td height="26" align="center" bgcolor="#E4EBF1"><table style=" width:517; border:0; cellspacing:0; cellpadding:0;">
                      <tr align="left">
                        <td width="109"><strong>
                          <input name="eUniver" type="text" size="15" value="${ eduboard.EUniver }">
                        </strong></td>
                        <td width="70"><strong>대학교(원)</strong></td>
                        <td width="108"><strong>
                          <input name="eUniverClass" type="text" size="15" value="${ eduboard.EUniverClass }">
                        </strong></td>
                        <td width="56"><strong>과 졸업</strong></td>
                        <td width="67"><strong>
                          <input name="eUniverYear" type="text" size="8" value="${ eduboard.EUniverYear }">
                        </strong></td>
                        <td width="32"><strong>년 </strong></td>
                        <td width="66"><strong>
                          <input name="eUniverMonth" type="text" size="8" value="${ eduboard.EUniverMonth }">
                        </strong></td>
                        <td width="18"><strong>월</strong></td>
                      </tr>
                    </table>                      </td>
                  </tr>
              </table></td>
            </tr>
          </table></td>
        </tr>
        <tr>
          <td height="7" align="center" valign="top">&nbsp;</td>
        </tr>
        <tr>
          <td height="7" align="left" valign="top"><table style=" width:526; border:0; cellspacing:0; cellpadding:0;">
            <tr>
              <td width="16" align="right">&nbsp;</td>
              <td><strong>■ 교육 </strong></td>
            </tr>
          </table></td>
        </tr>
        <tr> 
          <td height="13" align="center"><table style=" width:600; border:0; cellspacing:0; cellpadding:0;">
              <tr> 
                <td bgcolor="#CCCCCC"><table style=" width:600; border:0; cellspacing:0; cellpadding:0;">
                    <tr> 
                      <td height="40" align="center" bgcolor="#E4EBF1"><table style=" width:548; border:0; cellspacing:0; cellpadding:0;">
                        <tr align="left">
                          <td width="68" align="center"><strong>교육명</strong></td>
                          <td width="473"><strong>
                            <input name="EDU_NAME1" type="text" size="70" value="${ eduboard.EDU_NAME1 }">
                                                    </strong><strong>                          
                                                    </strong><strong>                          
                                                    </strong></td>
                          </tr>
                        <tr align="left">
                          <td colspan="2"><table style=" width:534; border:17; cellspacing:0; cellpadding:0;">
                            <tr>
                              <td width="72"><strong>교육시작일</strong></td>
                              <td width="102"><strong>
                                <input name="EDU_START1" type="text" size="12" value="${ eduboard.EDU_NAME1 }">
                              </strong></td>
                              <td width="70"><strong>교육종료일</strong></td>
                              <td width="91"><strong>
                                <input name="EDU_END1" type="text" size="12" value="${ eduboard.EDU_END1 }">
                              </strong></td>
                              <td width="60"><strong>교육기간</strong></td>
                              <td width="139"><strong>
                                <input name="EDU_period1" type="text" size="20" value="${ eduboard.EDU_period1 }">
                              </strong></td>
                            </tr>
                          </table></td>
                          </tr>
                      </table></td>
                    </tr>
                      <tr> 
                      <td height="40" align="center" bgcolor="#E4EBF1"><table style=" width:548; border:0; cellspacing:0; cellpadding:0;">
                        <tr align="left">
                          <td width="68" align="center"><strong>교육명</strong></td>
                          <td width="473"><strong>
                            <input name="EDU_NAME2" type="text" size="70" value="${ eduboard.EDU_NAME2 }">
                                                    </strong><strong>                          
                                                    </strong><strong>                          
                                                    </strong></td>
                          </tr>
                        <tr align="left">
                          <td colspan="2"><table style=" width:534; border:17; cellspacing:0; cellpadding:0;">
                            <tr>
                              <td width="72"><strong>교육시작일</strong></td>
                              <td width="102"><strong>
                                <input name="EDU_START2" type="text" size="12" value="${ eduboard.EDU_START2 }">
                              </strong></td>
                              <td width="70"><strong>교육종료일</strong></td>
                              <td width="91"><strong>
                                <input name="EDU_END2" type="text" size="12" value="${ eduboard.EDU_END2 }">
                              </strong></td>
                              <td width="60"><strong>교육기간</strong></td>
                              <td width="139"><strong>
                                <input name="EDU_period2" type="text" size="20" value="${ eduboard.EDU_period2 }">
                              </strong></td>
                            </tr>
                          </table></td>
                          </tr>
                      </table></td>
                    </tr>
                     <tr> 
                      <td height="40" align="center" bgcolor="#E4EBF1"><table style=" width:548; border:0; cellspacing:0; cellpadding:0;">
                        <tr align="left">
                          <td width="68" align="center"><strong>교육명</strong></td>
                          <td width="473"><strong>
                            <input name="EDU_NAME3" type="text" size="70" value="${ eduboard.EDU_NAME3 }">
                                                    </strong><strong>                          
                                                    </strong><strong>                          
                                                    </strong></td>
                          </tr>
                        <tr align="left">
                          <td colspan="2"><table style=" width:534; border:17; cellspacing:0; cellpadding:0;">
                            <tr>
                              <td width="72"><strong>교육시작일</strong></td>
                              <td width="102"><strong>
                                <input name="EDU_START3" type="text" size="12" value="${ eduboard.EDU_START3 }">
                              </strong></td>
                              <td width="70"><strong>교육종료일</strong></td>
                              <td width="91"><strong>
                                <input name="EDU_END3" type="text" size="12" value="${ eduboard.EDU_END3 }">
                              </strong></td>
                              <td width="60"><strong>교육기간</strong></td>
                              <td width="139"><strong>
                                <input name="EDU_period3" type="text" size="20" value="${ eduboard.EDU_period3 }">
                              </strong></td>
                            </tr>
                          </table></td>
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
          <table style=" width:107;border:0; cellspacing:1; cellpadding:1;">
            <tr>
	        	<td width="51">
	              	<button type="submit" style="background-color:transparent; border:0;">
	              		<img src="resources/image/bt_remove.gif" width="49" height="18">
	            	</button>
	            </td>
            	<td width="51">
            		<button type="reset" style="background-color:transparent; border:0;">
              			<img src="resources/image/bt_cancel.gif" width="49" height="18" onclick = "location.href = 'interpia.sc' " >
              		</button>
            	</td>
            </tr>
          </table></td>
        </tr>
        <tr> 
          <td style = "height:7; align:right;">&nbsp;</td>
        </tr>
      </table></td>
  </tr>
</table>
</form>
</body>
</html>
