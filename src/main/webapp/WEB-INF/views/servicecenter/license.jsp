<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body topmargin="0" leftmargin="0">
	<form action="License.sc" method="post" enctype="multipart/form-data">
		<table style="width: 640; border: 0; cellspacing: 0; cellpadding: 0;">
			<tr>
				<td width="640">&nbsp;</td>
			</tr>
			<tr>
				<td height="25"><img src="resources/image/icon.gif" width="9"
					height="9" align="top"> <strong>자격증ㆍ보유기술 정보 수정</strong></td>
			</tr>
			<tr>
				<td><table
						style="width: 640; border: 0; cellspacing: 0; cellpadding: 0;">
						<tr>
							<td height="15" align="left">
								<table
									style="width: 640; border: 0; cellspacing: 0; cellpadding: 0;">
									<tr>
										<td><table
												style="width: 640; border: 0; cellspacing: 1; cellpadding: 0;">
												<tr>
													<td height="2" background="resources/image/bar_bg1.gif"></td>
												</tr>
												<tr align="center" bgcolor="F8F8F8">
													<td height="26" align="center" bgcolor="#E4EBF1"
														style="padding-right: 10">
														<table
															style="width: 640; border: 0; cellspacing: 0; cellpadding: 0;">
															<tr>
																<td align="center">
																	<strong> 
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
													<td height="3" align="right"
														background="resources/image/bar_bg1.gif"></td>
												</tr>
											</table></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td height="6" align="center" valign="top">&nbsp;</td>
						</tr>
						<tr>
							<td height="7" align="center" valign="top">
								<table
									style="width: 600; border: 0; cellspacing: 0; cellpadding: 0;">
									<tr>
										<td bgcolor="#CCCCCC"><table
												style="width: 600; border: 0; cellspacing: 1; cellpadding: 0;">
												<tr>
													<td width="97" height="31" align="center" bgcolor="#E4EBF1">
														<strong>사원명</strong>
													</td>
													<td width="128" align="center" bgcolor="#E4EBF1"><input
														type="text" name="kname" value="${ scBoard.kname }" readonly>
														<input type="hidden" name="eId" value="${scBoard.code }">
														<input type="hidden" name="code" value="${scBoard.code }">
													</td>
													<td width="131" align="center" bgcolor="#E4EBF1"><strong>주민등록번호</strong>
													</td>
													<td width="239" align="center" bgcolor="#E4EBF1">
													<input name="inumber1" type="text" size="15" value="${ scBoard.inumber1 }" readonly> - 
														<input name="inumber2" type="text" size="15" value="${ scBoard.inumber2 }" readonly>
													</td>
												</tr>
											</table></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td height="3" align="center" valign="top">&nbsp;</td>
						</tr>
						<tr>
							<td height="4" align="left" valign="top"><table
									style="width: 526; border: 0; cellspacing: 1; cellpadding: 1;">
									<tr>
										<td width="16" align="right">&nbsp;</td>
										<td><strong>■ 자격증 </strong></td>
									</tr>
								</table></td>
						</tr>
						<tr>
							<td height="7" align="center" valign="top">
							<table style="width: 600; border: 0; cellspacing: 0; cellpadding: 0;">
									<tr>
										<td bgcolor="#CCCCCC">
										<table style="width: 600; border: 0; cellspacing: 1; cellpadding: 0;">
												<tr>
													<td height="26" align="center" bgcolor="#E4EBF1">
														<table style="width: 439; border: 0; cellspacing: 0; cellpadding: 0;">
															<tr align="left">
																<td width="73"><strong>자격증</strong></td>
																<td width="173">
																	<strong> 
																			<input name="license1" type="text" size="20" value="${ LicenseBoard.license1 }">
																	</strong>
																</td>
																<td width="60"><strong>취득일</strong></td>
																<td width="133">
																<strong> 
																		<input name="ACQUISITION1" type="text" size="20" value="${ LicenseBoard.ACQUISITION1 }">
																</strong>
																</td>
															</tr>
													</table>
													</td>
												</tr>
												<tr>
													<td height="26" align="center" bgcolor="#E4EBF1"><strong>
													</strong>
														<table style="width: 439; border: 0; cellspacing: 0; cellpadding: 0;">
															<tr align="left">
																<td width="73"><strong>자격증</strong></td>
																<td width="173">
																	<strong> 
																			<input name="license2" type="text" size="20" value="${ LicenseBoard.license2 }">
																	</strong>
																</td>
																<td width="60"><strong>취득일</strong></td>
																<td width="133">
																<strong> 
																		<input name="ACQUISITION2" type="text" size="20" value="${ LicenseBoard.ACQUISITION2}">
																</strong>
																</td>
															</tr>
													</table>
													</td>
												</tr>
												<tr>
													<td height="26" align="center" bgcolor="#E4EBF1"><strong>
													</strong>
														<table style="width: 439; border: 0; cellspacing: 0; cellpadding: 0;">
															<tr align="left">
																<td width="73"><strong>자격증</strong></td>
																<td width="173">
																	<strong> 
																			<%-- <input name="license3" type="text" size="20" value="${ LicenseBoard.license3 }"> --%>
																			<input name="license3" type="text" size="20" value="${ LicenseBoard.license3 }">
																	</strong>
																</td>
																<td width="60"><strong>취득일</strong></td>
																<td width="133">
																<strong> 
																		<input name="ACQUISITION3" type="text" size="20" value="${ LicenseBoard.ACQUISITION3 }">
																</strong>
																</td>
															</tr>
													</table>
													</td>
												</tr>
												<tr>
													<td height="26" align="center" bgcolor="#E4EBF1"><strong>
													</strong>
														<table style="width: 439; border: 0; cellspacing: 0; cellpadding: 0;">
															<tr align="left">
																<td width="73"><strong>자격증</strong></td>
																<td width="173">
																	<strong> 
																			<input name="license4" type="text" size="20" value="${ LicenseBoard.license4 }">
																	</strong>
																</td>
																<td width="60"><strong>취득일</strong></td>
																<td width="133">
																<strong> 
																		<input name="ACQUISITION4" type="text" size="20" value="${ LicenseBoard.ACQUISITION4 }">
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
							<td height="7" align="center" valign="top">&nbsp;</td>
						</tr>
						<tr>
							<td height="7" align="left" valign="top">
							<table style="width: 526; border: 0; cellspacing: 0; cellpadding: 0;">
									<tr>
										<td width="16" align="right">&nbsp;</td>
										<td><strong>■ 보유기술 </strong></td>
									</tr>
							</table>
							</td>
						</tr>
						<tr>
							<td height="13" align="center">
								<table style="width: 600; border: 0; cellspacing: 0; cellpadding: 0;">
									<tr>
										<td bgcolor="#CCCCCC">
											<table style="width: 600; border: 0; cellspacing: 1; cellpadding: 0;">
												<tr>
													<td height="26" align="center" bgcolor="#E4EBF1">
													<table style="width: 600; border: 0; cellspacing: 0; cellpadding: 0;">
															<tr align="left">
																<td width="97" align="center"><strong>보유기술</strong></td>
																<td width="241">
																<strong> 
																		<input name="tech1" type="text" size="30" value="${ LicenseBoard.tech1}">
																</strong>
																</td>
																<td width="54"><strong>숙련도</strong></td>
																<td width="206">
																<strong>
																		<input type="radio" name="PROFICIENCY1" value="초"
																		<c:if test="${ LicenseBoard.PROFICIENCY1 == '초' }">checked</c:if>>초  
																		     
																		<input type="radio" name="PROFICIENCY1" value="중"
																		<c:if test="${ LicenseBoard.PROFICIENCY1 == '중' }">checked</c:if>>중       
																		
																		<input type="radio" name="PROFICIENCY1" value="고"
																		<c:if test="${ LicenseBoard.PROFICIENCY1 == '고' }">checked</c:if>>고       
																</strong>
																</td>
															</tr>
													</table>
													</td>
												</tr>
												<tr>
													<td height="26" align="center" bgcolor="#E4EBF1">
													<table style="width: 600; border: 0; cellspacing: 0; cellpadding: 0;">
															<tr align="left">
																<td width="97" align="center"><strong>보유기술</strong></td>
																<td width="241">
																<strong> 
																		<input name="tech2" type="text" size="30" value="${LicenseBoard.tech2 }">
																</strong>
																</td>
																<td width="54"><strong>숙련도</strong></td>
																<td width="206">
																<strong>
																		<input type="radio" name="PROFICIENCY2" value="초"
																		<c:if test="${ LicenseBoard.PROFICIENCY2 == '초' }">checked</c:if>>초  
																		     
																		<input type="radio" name="PROFICIENCY2" value="중"
																		<c:if test="${ LicenseBoard.PROFICIENCY2 == '중' }">checked</c:if>>중       
																		
																		<input type="radio" name="PROFICIENCY2" value="고"
																		<c:if test="${ LicenseBoard.PROFICIENCY2 == '고' }">checked</c:if>>고       
																</strong>
																</td>
															</tr>
													</table>
													</td>
												</tr>
												<tr>
													<td height="26" align="center" bgcolor="#E4EBF1">
													<table style="width: 600; border: 0; cellspacing: 0; cellpadding: 0;">
															<tr align="left">
																<td width="97" align="center"><strong>보유기술</strong></td>
																<td width="241">
																<strong> 
																		<input name="tech3" type="text" size="30" value="${LicenseBoard.tech3 }">
																</strong>
																</td>
																<td width="54"><strong>숙련도</strong></td>
																<td width="206">
																<strong>
																		<input type="radio" name="PROFICIENCY3" value="초"
																		<c:if test="${ LicenseBoard.PROFICIENCY3 == '초' }">checked</c:if>>초  
																		     
																		<input type="radio" name="PROFICIENCY3" value="중"
																		<c:if test="${ LicenseBoard.PROFICIENCY3 == '중' }">checked</c:if>>중       
																		
																		<input type="radio" name="PROFICIENCY3" value="고"
																		<c:if test="${ LicenseBoard.PROFICIENCY3 == '고' }">checked</c:if>>고       
																</strong>
																</td>
															</tr>
													</table>
													</td>
												</tr>
												<tr>
													<td height="26" align="center" bgcolor="#E4EBF1">
													<table style="width: 600; border: 0; cellspacing: 0; cellpadding: 0;">
															<tr align="left">
																<td width="97" align="center"><strong>보유기술</strong></td>
																<td width="241">
																<strong> 
																		<input name="tech4" type="text" size="30" value="${LicenseBoard.tech4 }">
																</strong>
																</td>
																<td width="54"><strong>숙련도</strong></td>
																<td width="206">
																<strong>
																		<input type="radio" name="PROFICIENCY4" value="초"
																		<c:if test="${ LicenseBoard.PROFICIENCY4 == '초' }">checked</c:if>>초  
																		     
																		<input type="radio" name="PROFICIENCY4" value="중"
																		<c:if test="${ LicenseBoard.PROFICIENCY4 == '중' }">checked</c:if>>중       
																		
																		<input type="radio" name="PROFICIENCY4" value="고"
																		<c:if test="${ LicenseBoard.PROFICIENCY4 == '고' }">checked</c:if>>고       
																</strong>
																</td>
															</tr>
													</table>
													</td>
												</tr>
												<tr>
													<td height="26" align="center" bgcolor="#E4EBF1">
													<table style="width: 600; border: 0; cellspacing: 0; cellpadding: 0;">
															<tr align="left">
																<td width="97" align="center"><strong>보유기술</strong></td>
																<td width="241">
																<strong> 
																		<input name="tech5" type="text" size="30" value="${LicenseBoard.tech5}">
																</strong>
																</td>
																<td width="54"><strong>숙련도</strong></td>
																<td width="206">
																<strong>
																		<input type="radio" name="PROFICIENCY5" value="초"
																		<c:if test="${ LicenseBoard.PROFICIENCY5 == '초' }">checked</c:if>>초  
																		     
																		<input type="radio" name="PROFICIENCY5" value="중"
																		<c:if test="${ LicenseBoard.PROFICIENCY5 == '중' }">checked</c:if>>중       
																		
																		<input type="radio" name="PROFICIENCY5" value="고"
																		<c:if test="${ LicenseBoard.PROFICIENCY5 == '고' }">checked</c:if>>고       
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
							<td height="3" align="center">
								<table
									style="width: 107; border: 0; cellpadding: 1; cellspacing: 1;">
									<tr>
										<td width="51">
											<button type="submit"
												style="background-color: transparent; border: 0;">
												<img src="resources/image/bt_remove.gif" width="49"
													height="18">
											</button>
										</td>
										<td width="51">
											<button type="reset"
												style="background-color: transparent; border: 0;">
												<img src="resources/image/bt_cancel.gif" width="49"
													height="18" onclick="location.href = 'interpia.sc' ">
											</button>
										</td>
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
