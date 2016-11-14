<cfquery name="getS" datasource="#Application.dsn#">
SELECT sName, sIntro FROM Surveys
WHERE SID=#SID#
</cfquery>
<cfset getGroup.rgName="All Respondents">

<cfset RespondentList="0">
<cfquery name="getRespondentList" datasource="#Application.dsn#">
SELECT srID FROM Survey_Responses
WHERE srSID=#SID#
</cfquery>

<cfloop query="getRespondentList">
	<cfset RespondentList=ListAppend(Respondentlist,"#srID#")>
</cfloop>


<cfquery name="getQ" datasource="#Application.dsn#">
SELECT qID, qQuestion, qNum, qType, qCatID, qScID FROM Questions
WHERE qSID=#SID#
ORDER BY qNum ASC
</cfquery>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>BSO_Surveys v.3.0</title>
	
	<LINK REL=stylesheet HREF="../style.css" TYPE="text/css">
</head>

<body onload="this.window.focus();" bgcolor="C6DFAD">
<table bgcolor="white" border="1" cellpadding="5" cellspacing="0" align="center" width="600">
	<tr>
		<td align="center" colspan="2">
		<cfoutput>
		<strong>- #getS.sName# -</strong><br><br>
		Results for Group: <strong>#getGroup.rgName#</strong>
		<br><br>
		<a href="Report_byGroup_pfv.cfm?sid=#sid#&rgID=#rgID#"><img src="/images/Surveys/printer_icon.gif" border="0">&nbsp;&nbsp;Printer-friendly Version</a>
		</cfoutput>
		</td>
	</tr>
	<cfset catMarked="">
	<cfset catCurrent="">
	<cfoutput query="getQ">
	<cfif currentrow neq 1>
		<cfif CatCurrent neq "" and CatCurrent neq #qCatID#>
		</table>
		<cfset catCurrent="">
		</cfif>
	</cfif> 
	
	
	<cfif qCatID neq "">
		<cfif ListFind(catMarked, qCatID) eq 0>	
			<cfset catMarked=#ListAppend(catMarked, qCatID)#>
			<cfset catCurrent=#qCatID#>
			<cfquery name="getCat" datasource="#Application.dsn#">
			SELECT * FROM Categories
			WHERE catID=#qCatID#
			</cfquery>
			<cfloop query="getcat">
			<tr>
				<td colspan="2">
					<table bgcolor="white" border="0" cellpadding="8" cellspacing="0" align="center" width="590">
						<tr>
						<td align="center" bgcolor="B5C2DD">
						<font class="hugefont"><strong>#catName#</strong></font>
						<cfif catAddText neq ""><br><br>
						<strong>#catAddText#</strong>
						</cfif>
						</td>
						</tr>
			</cfloop>	
		</cfif>
	</cfif>
				<tr>
						<td colspan="2">
							<table bgcolor="white" border="0" cellpadding="5" cellspacing="0" align="center" width="582">
									<tr>
									<td valign="top" align="left" width="20"><strong>#qNum#.</strong></td>
									<td valign="top" align="left" width="570"><strong>#qQuestion#</strong></td>
								</tr>
								<cfif qType eq "TF">
								<!--- get stats --->
								<cfquery name="getresponses" datasource="#Application.dsn#">
								SELECT qrResponse from Question_Responses
								WHERE qrQID=#QID#
								AND qrsrID in (#RespondentList#)
								</cfquery>
								<cfset numYes=0>
								<cfset numNo=0>
								<cfloop query="getresponses">
								<cfif qrResponse eq "0">
									<cfset numNo=#numNo#+1>
								<cfelse>
									<cfset numYes=#numYes#+1>
								</cfif>
								</cfloop>
								<cfset numTotal=#numYes#+#numNo#>
								<cfif numTotal neq 0>
									<cfset pctYes = #DecimalFormat(100 * numYes/numTotal)#>
									<cfset pctNo = #DecimalFormat(100 * numNo/numTotal)#>
								<cfelse>
									<cfset pctYes = 0>
									<cfset pctNo = 0>
								</cfif>
								<tr>
									<td valign="top" align="left">&nbsp;</td>
									<td valign="top" align="left">
										<table cellpadding="8">
										<tr>
											<td><strong>True</strong></td>
											<td>#numYes#</td>
											<td align="right">#pctYes#%</td>
											<td><img src="/images/Surveys/bluebar.gif" height="10" <cfif pctYes LTE 1>width="1"<cfelse>width=#pctYes#</cfif>></td>
										</tr>
										<tr>
											<td><strong>False</strong></td>
											<td>#numNo#</td>
											<td align="right">#pctNo#%</td>
											<td><img src="/images/Surveys/bluebar.gif" height="10" <cfif pctNo LTE 1>width="1"<cfelse>width=#pctNo#</cfif>></td>
										</tr>
										</table>
									</td>
								</tr>
								<cfelseif qType eq "YN">
								<!--- get stats --->
								<cfquery name="getresponses" datasource="#Application.dsn#">
								SELECT qrResponse from Question_Responses
								WHERE qrQID=#QID#
								AND qrsrID in (#RespondentList#)
								</cfquery>
								<cfset numYes=0>
								<cfset numNo=0>
								<cfloop query="getresponses">
								<cfif qrResponse eq "0">
									<cfset numNo=#numNo#+1>
								<cfelse>
									<cfset numYes=#numYes#+1>
								</cfif>
								</cfloop>
								<cfset numTotal=#numYes#+#numNo#>
								<cfset numTotal=#numYes#+#numNo#>
								<cfif numTotal neq 0>
									<cfset pctYes = #DecimalFormat(100 * numYes/numTotal)#>
									<cfset pctNo = #DecimalFormat(100 * numNo/numTotal)#>
								<cfelse>
									<cfset pctYes = 0>
									<cfset pctNo = 0>
								</cfif>
								<tr>
									<td valign="top" align="left">&nbsp;</td>
									<td valign="top" align="left">
										<table cellpadding="8">
										<tr>
											<td><strong>Yes</strong></td>
											<td>#numYes#</td>
											<td align="right">#pctYes#%</td>
											<td><img src="/images/Surveys/bluebar.gif" height="10" <cfif pctYes LTE 1>width="1"<cfelse>width=#pctYes#</cfif>></td>
										</tr>
										<tr>
											<td><strong>No</strong></td>
											<td>#numNo#</td>
											<td align="right">#pctNo#%</td>
											<td><img src="/images/Surveys/bluebar.gif" height="10" <cfif pctNo LTE 1>width="1"<cfelse>width=#pctNo#</cfif>></td>
										</tr>
										</table>
									</td>
								</tr>
								<cfelseif qType eq "OE">
								<tr>
									<td valign="top" align="left">&nbsp;</td>
									<td valign="top" align="left">(Open-ended question)</td>
								</tr>
								<cfelseif qType eq "MUL1">
									<cfquery name="getPossResp" datasource="#Application.dsn#">
									SELECT prID, prResponse FROM Possible_Responses
									WHERE prQID=#qID#
									</cfquery>
									<!--- stats--->
									<cfset numTotal=0>
									<cfset QID=#QID#>
									<tr>
									<td valign="top" align="left">&nbsp;</td>
									<td valign="top" align="left">
										<table cellpadding="8">
									<cfloop query="getpossResp">
										<cfset numYes=0>
										<cfset numNo=0>
										<cfquery name="getResponses" datasource="#Application.dsn#">
										SELECT qrResponse from Question_Responses
										WHERE qrQID=#QID#
										AND qrsrID in (#RespondentList#)
										</cfquery>
										<cfset numTotal=#getResponses.recordcount#>
										<cfset prID=#prID#>
										<cfloop query="getResponses">
											<cfif qrResponse eq #prID#>
												<cfset numYes=#numYes#+1>
											</cfif>
										</cfloop>
										<cfif numTotal neq 0>
											<cfset pctYes = #DecimalFormat(100 * numYes/numTotal)#>
										<cfelse>
											<cfset pctYes = 0>
										</cfif>										
										<tr>
											<td><strong>#prResponse#</strong></td>
											<td>#numYes#</td>
											<td align="right">#pctYes#%</td>
											<td><img src="/images/Surveys/bluebar.gif" height="10" <cfif pctYes LTE 1>width="1"<cfelse>width=#pctYes#</cfif>></td>
										</tr>
										</cfloop>
										<tr>
											<td colspan="3">&nbsp;</td>
											<td><img src="/images/Surveys/x_axis.gif" height="10" width="100"></td>
										</tr>
									</table>
								</td>
								</tr>
								<cfelseif qType eq "MUL2">
								<cfquery name="getPossResp" datasource="#Application.dsn#">
									SELECT prID, prResponse FROM Possible_Responses
									WHERE prQID=#qID#
									</cfquery>
									<!--- stats--->
									<cfset numTotal=0>
									<cfset QID=#QID#>
									<tr>
									<td valign="top" align="left">&nbsp;</td>
									<td valign="top" align="left">
										<table cellpadding="8">
									<cfloop query="getpossResp">
										<cfset numYes=0>
										<cfset numNo=0>
										<cfquery name="getResponses" datasource="#Application.dsn#">
										SELECT qrResponse from Question_Responses
										WHERE qrQID=#QID#
										AND qrsrID in (#RespondentList#)
										</cfquery>
										<cfset numTotal=#getResponses.recordcount#>
										<cfset prID=#prID#>
										<cfloop query="getResponses">
											<cfif qrResponse eq #prID#>
												<cfset numYes=#numYes#+1>
											</cfif>
										</cfloop>
										<cfif numTotal neq 0>
											<cfset pctYes = #DecimalFormat(100 * numYes/numTotal)#>
										<cfelse>
											<cfset pctYes = 0>
										</cfif>			
										<tr>
											<td><strong>#prResponse#</strong></td>
											<td>#numYes#</td>
											<td align="right">#pctYes#%</td>
											<td><img src="/images/Surveys/bluebar.gif" height="10" <cfif pctYes LTE 1>width="1"<cfelse>width=#pctYes#</cfif>></td>
										</tr>
									</cfloop>
										<tr>
											<td colspan="3">&nbsp;</td>
											<td><img src="/images/Surveys/x_axis.gif" height="10" width="100"></td>
										</tr>
									</table>
								</td>
								</tr>
								<cfelse><!--- qType eq "MUL3" --->
								<cfquery datasource="#Application.dsn#" name="getScale">
									SELECT scpValue, scpID
									FROM Scales, Scale_Values
									WHERE scpScID=#qScID#
									AND scpScID=ScID
								</cfquery>
								<!--- stats--->
								<tr>
									<td valign="top" align="left">&nbsp;</td>
									<td valign="top" align="left">
										<table cellpadding="8">
									<cfset numTotal=0>
									<cfset QID=#QID#>
									<cfloop query="getscale">
										<cfset numYes=0>
										<cfset numNo=0>
										<cfquery name="getResponses" datasource="#Application.dsn#">
										SELECT qrResponse from Question_Responses
										WHERE qrQID=#QID#
										AND qrsrID in (#RespondentList#)
										</cfquery>
										<cfset numTotal=#getResponses.recordcount#>
										<cfset scpID=#scpID#>
										<cfloop query="getResponses">
											<cfif qrResponse eq #scpID#>
												<cfset numYes=#numYes#+1>
											</cfif>
										</cfloop>
										<cfif numTotal neq 0>
											<cfset pctYes = #DecimalFormat(100 * numYes/numTotal)#>
										<cfelse>
											<cfset pctYes = 0>
										</cfif>			
										<tr>
											<td><strong>#scpValue#</strong></td>
											<td>#numYes#</td>
											<td align="right">#pctYes#%</td>
											<td><img src="/images/Surveys/bluebar.gif" height="10" <cfif pctYes LTE 1>width="1"<cfelse>width=#pctYes#</cfif>></td>
										</tr>
									</cfloop>
										<tr>
											<td colspan="3">&nbsp;</td>
											<td><img src="/images/Surveys/x_axis.gif" height="10" width="100"></td>
										</tr>
								</table>
								</td>
								</tr>
								</cfif>
								<tr>
										<td colspan="2"><br><br></td>
									</tr>
								</table>
						</td>
						</tr>
			
	<cfif currentrow neq 1>
		<cfif CatCurrent neq "" and CatCurrent neq #qCatID#>
				</table>
			</td>
			</tr>
			</table>
		<cfset catCurrent="">
		</cfif>
	</cfif>
	</cfoutput>
	</table>
	</td>
	</TR>
	</table>
	<br><br>
	<div align="center"><form>
	<input type="button" value="  - Close Window -  " onClick="window.close();">
	</form></div>
	</td>
	</TR>
	</table>
</body>
</html>
