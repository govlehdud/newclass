<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<html>
<head>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body topmargin="0" leftmargin="0">
<form action="client.sc" method="post">

<table style="width:640; border:0; cellspacing:0; cellpadding:0;">
  <tr>
    <td width="640">&nbsp;</td>
  </tr>
  <tr>
    <td height="25"><img src="resources/image/icon.gif" width="9" height="9" align="middle"> 
    	<strong>거래처 정보 등록</strong>
    </td>
  </tr>
  <tr>
    <td>
    <table style="width:640; border:0; cellspacing:0; cellpadding:0;">
        <tr>
          <td height="15" align="left">
          <table style="width:640; border:0; cellspacing:0; cellpadding:0;">
              <tr>
                <td>
                <table style="width:640; border:0; cellspacing:1; cellpadding:0;">
                    <tr>
                      <td height="2" background="resources/image/bar_bg1.gif"></td>
                    </tr>
                    <tr align="center" bgcolor="F8F8F8">
                      <td height="26" align="center" bgcolor="#E4EBF1" style="padding-right:10">
                      <table style="width:600; border:0; cellspacing:0; cellpadding:0;">
                          <tr>
                            <td align="center"><strong>교육정보 | 자격증. 보유기술정보 | 프로젝트 정보 |경력정보 | 근무정보</strong></td>
                          </tr>
                      </table></td>
                    </tr>
                    <tr align="center" bgcolor="F8F8F8">
                      <td height="3" align="right" background="resources/image/bar_bg1.gif"></td>
                    </tr>
                </table>
                </td>
              </tr>
          </table></td>
        </tr>
        <tr>
          <td height="7" align="center" valign="top">
         <table style="width:600; border:0; cellspacing:0; cellpadding:0;">
              <tr>
                <td bgcolor="#CCCCCC">
                <table style="width:600; border:0; cellspacing:1; cellpadding:0;">
                    <tr>
                      <td height="26" align="center" bgcolor="#E4EBF1">
                      <table style="width:560; border:0; cellspacing:1; cellpadding:1;">
                          <tr>
                            <td width="90" align="left" >
                            		<strong>상호명</strong>
                            </td>
                            <td width="130" align="left">
                            		<input name="companyName" type="text" size="15">
                            </td>
                            <td width="140" align="center">
                            		<strong>사업자 등록번호 </strong>
                            </td>
                            <td width="141">
                            		<input name="traderNum" type="text" size="15">
                            </td>
                          </tr>
                      </table></td>
                    </tr>
                    <tr>
                      <td height="26" align="center" bgcolor="#E4EBF1">
                      <table style="width:560; border:0; cellspacing:1; cellpadding:1;">
                          <tr>
                            <td width="126" align="left">
                            	<strong>대표자 이름</strong>
                            </td>
                            <td width="391">
                            	<input name="onerName" type="text" size="15">
                            </td>
                          </tr>
                      </table></td>
                    </tr>
                    <tr>
                      <td height="26" align="center" bgcolor="#E4EBF1">
                      <table style="width:560; border:0; cellspacing:1; cellpadding:1;">
                          <tr>
                            <td width="37" align="left">
                            <strong>업종</strong></td>
                            <td width="245"><input name="category" type="text" size="15">
                            </td>
                            <td width="44" align="center"><strong>업태</strong></td>
                            <td width="221"><input name="state" type="text" size="15"></td>
                          </tr>
                      </table></td>
                    </tr>
                    <tr>
                      <td height="22" align="center" bgcolor="#E4EBF1">
                      <table style="width:560; border:0; cellspacing:1; cellpadding:1;">
                          <tr>
                            <td width="101" align="left"><strong>사업장 주소&nbsp; </strong></td>
                            <td><input name="address1" type="text" size="15">
                                <input name="address2" type="text" size="40">
                            </td>
                          </tr>
                      </table></td>
                    </tr>
                    <tr>
                      <td height="22" align="center" bgcolor="#E4EBF1">
                      <table style="width:560; border:0; cellspacing:1; cellpadding:1;">
                          <tr>
                            <td width="63" align="left"><strong>전화번호 </strong></td>
                            <td width="193">
                            	<input name="tel1" type="text" size="5">
                              -
                                <input name="tel2" type="text" size="8">
                              -
                            	<input name="tel3" type="text" size="8"></td>
                            <td width="83" align="center"><strong>팩스번호</strong></td>
                            <td width="207">
                            	<input name="pax1" type="text" size="5">
                              -
                                <input name="pax2" type="text" size="8">
                              -
                          		<input name="pax3" type="text" size="8">
                          	</td>
                          </tr>
                      </table></td>
                    </tr>
                    <tr>
                      <td height="26" align="center" bgcolor="#E4EBF1">
                      <table style="width:560; border:0; cellspacing:1; cellpadding:1;">
                          <tr>
                            <td width="49" align="left"><strong>담당자&nbsp; </strong></td>
                            <td width="175"><input name="manager" type="text" size="15"></td>
                            <td width="88"><strong>핸드폰번호</strong></td>
                            <td width="235">
                            	<input name="phone1" type="text" size="5">
                              -
                                <input name="phone2" type="text" size="8">
                              -
                                <input name="phone3" type="text" size="8">
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
	          <table style="width:107; border:0; cellspacing:1; cellpadding:1;">
	            <tr>
	            	<td>
			            	<button type="submit" style="background-color: transparent; border: 0;">
									<img src="resources/image/bt_remove.gif" width="49" height="18">
							</button>
					</td>
	            	<td width="51">
	            			 <img src="resources/image/bt_cancel.gif" width="49" height="18">
	            	</td>
	          	</tr>
	          </table>
          </td>
        </tr>
    </table></td>
  </tr>
</table>
</form>
</body>
</html>
