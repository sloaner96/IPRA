<cfquery name="getS" datasource="#Application.dsn#">
SELECT sName, sIntro FROM Surveys
WHERE SID=#SID#
</cfquery>
<cfquery name="getIndiv" datasource="#Application.dsn#">
SELECT [#user_First#] as respFirst, [#user_Last#] as respLast FROM [#table_users#]
WHERE [#user_ID#]=#respID#
</cfquery>

<cfset Respondent="0">
<cfquery name="getRespondent" datasource="#Application.dsn#">
SELECT srID, srComments FROM Survey_Responses
WHERE srRespID=#respID#
AND srID=#srID#
</cfquery>

<cfloop query="getRespondent">
	<cfset Respondent=#srID#>
</cfloop>

<cfquery name="getQ" datasource="#Application.dsn#">
SELECT qID, qQuestion, qNum, qType, qCatID, qScID FROM Questions
WHERE qSID=#SID#
ORDER BY qNum ASC
</cfquery>



<html>
<head>
	<title>BSO_Surveys v.3.0</title>
	
	<LINK REL=stylesheet HREF="../printstyle.css" TYPE="text/css">
</head>

<body onload="this.window.focus();" bgcolor="C6DFAD">
<table bgcolor="white" border="1" cellpadding="2" cellspacing="0" align="center" width="600">
	<tr>
		<td align="center" colspan="2">
		<cfoutput>
		<strong>- #getS.sName# -</strong><br><br>
		Results for: <strong>#getIndiv.respFirst# #getIndiv.respLast#</strong>
		</cfoutput><br><br>
		<a href="##" onclick="print()"><img src="/images/Surveys/printer_icon.gif" border="0">&nbsp;&nbsp;Print Report</a>
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
					<table bgcolor="white" border="0" cellpadding="2" cellspacing="0" align="center" width="590">
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
							<table bgcolor="white" border="0" cellpadding="1" cellspacing="0" align="center" width="582">
									<tr>
									<td valign="top" align="left" width="20"><strong>#qNum#.</strong></td>
									<td valign="top" align="left" width="570"><strong>#qQuestion#</strong></td>
								</tr>
								<cfif qType eq "TF">
								<!--- get stats --->
								<cfquery name="getresponses" datasource="#Application.dsn#">
								SELECT qrResponse from Question_Responses
								WHERE qrQID=#QID#
								AND qrsrID=#Respondent#
								</cfquery>
								<cfloop query="getresponses">
								<tr>
									<td valign="top" align="left">&nbsp;</td>
									<td valign="top" align="left">
										<table cellpadding="0">
										<tr>
											<td valign="top" align="left">&nbsp;</td>
											<td valign="top" align="left"><input type="radio" name="TF"<CFIF qrResponse eq "1"> checked</CFIF>> True</td>
										</tr>
										<tr>
											<td valign="top" align="left">&nbsp;</td>
											<td valign="top" align="left"><input type="radio" name="TF"<CFIF qrResponse eq "0"> checked</CFIF>> False</td>
										</tr>
										</table>
									</td>
								</tr>
								</cfloop>
								
								
								<cfelseif qType eq "YN">
								<!--- get stats --->
								<cfquery name="getresponses" datasource="#Application.dsn#">
								SELECT qrResponse from Question_Responses
								WHERE qrQID=#QID#								
								AND qrsrID=#Respondent#
								</cfquery>
								
								<cfloop query="getresponses">
								<tr>
									<td valign="top" align="left">&nbsp;</td>
									<td valign="top" align="left">
										<table cellpadding="0">
										<tr>
											<td valign="top" align="left">&nbsp;</td>
											<td valign="top" align="left"><input type="radio" name="YN"<CFIF qrResponse eq 1> checked</CFIF>> Yes</td>
										</tr>
										<tr>
											<td valign="top" align="left">&nbsp;</td>
											<td valign="top" align="left"><input type="radio" name="YN"<CFIF qrResponse eq 0> checked</CFIF>> No</td>
										</tr>
										</table>
									</td>
								</tr>
								</cfloop>
								
								
								<cfelseif qType eq "OE">
								<cfquery name="getresponses" datasource="#Application.dsn#">
								SELECT qrResponse from Question_Responses
								WHERE qrQID=#QID#
								AND qrsrID=#Respondent#
								</cfquery>
								<cfloop query="getresponses">
								<tr>
									<td valign="top" align="left">&nbsp;</td>
									<td valign="top" align="left">#qrResponse#</td>
								</tr>
								</cfloop>
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
										<table cellpadding="0">
									<cfloop query="getpossResp">
										<cfquery name="getResponses" datasource="#Application.dsn#">
										SELECT qrResponse from Question_Responses
										WHERE qrQID=#QID#								
										AND qrsrID=#Respondent#
										</cfquery>
										<tr>
											<td valign="top" align="left">&nbsp;</td>
											<td valign="top" align="left"><input type="checkbox" name="MUL1"<cfset prID=#prID#><cfloop query="getResponses"><cfif qrResponse eq #prID#> checked</cfif></cfloop>> #prResponse#</td>
										</tr>
										</cfloop>
									</table>
								</td>
								</tr>
								<cfelseif qType eq "MUL2">
								<cfquery name="getPossResp" datasource="#Application.dsn#">
									SELECT prID, prResponse FROM Possible_Responses
									WHERE prQID=#qID#
									</cfquery>
									<!--- stats--->
									<cfset QID=#QID#>
									<tr>
									<td valign="top" align="left">&nbsp;</td>
									<td valign="top" align="left">
										<table cellpadding="0">
									<cfloop query="getpossResp">
										<cfquery name="getResponses" datasource="#Application.dsn#">
										SELECT qrResponse from Question_Responses
										WHERE qrQID=#QID#							
										AND qrsrID=#Respondent#
										</cfquery>
										<tr>
											<td valign="top" align="left">&nbsp;</td>
											<td valign="top" align="left"><input type="radio" name="MUL2"<cfif getResponses.qrResponse eq #prID#> checked</cfif>> #prResponse#</td>
										</tr>
									</cfloop>
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
										<table cellpadding="0">
										<tr>
											<td>
											<select name="scale">
												<option value="none selected">
											<cfset QID=#QID#>
											<cfloop query="getscale">
												<cfquery name="getResponses" datasource="#Application.dsn#">
												SELECT qrResponse from Question_Responses
												WHERE qrQID=#QID#		
												AND qrsrID=#Respondent#
												</cfquery>
												<option value=""<cfif getResponses.qrResponse eq #scpID#> selected</cfif>>#scpValue#
											</cfloop>
											</select>
											</td>
										</tr>
								</table>
								</td>
								</tr>
								</cfif>
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
