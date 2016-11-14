<cfif rgID eq 0>
	<cfinclude template="qry_Report_All.cfm">
<cfelse>
	<cfinclude template="qry_Report_Group.cfm">
</cfif>
<html>
<head>
	<title>BSO_Surveys v.3.0</title>
	
	<LINK REL=stylesheet HREF="../printstyle.css" TYPE="text/css">
</head>

<body onload="this.window.focus();" bgcolor="C6DFAD">
<table bgcolor="white" border="1" cellpadding="2" cellspacing="0" align="center" width="600">
	<tr>
		<td align="center" colspan="2"><strong>- <cfoutput>#getS.sName#</cfoutput> -</strong><br><br>
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
						<td align="center" bgcolor="lightgrey">
						<font class="bigfont"><strong>#catName#</strong></font>
						<cfif catAddText neq ""><br>
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
								<cfset pctYes = #DecimalFormat(100 * numYes/numTotal)#>
								<cfset pctNo = #DecimalFormat(100 * numNo/numTotal)#>
								<tr>
									<td valign="top" align="left">&nbsp;</td>
									<td valign="top" align="left">
										<table cellpadding="0">
										<tr>
											<td>True</td>
											<td>#numYes#</td>
											<td align="right">#pctYes#%</td>
											<td><img src="/images/Surveys/bluebar.gif" height="10" <cfif pctYes LTE 1>width="1"<cfelse>width=#pctYes#</cfif>></td>
										</tr>
										<tr>
											<td>False</td>
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
								<cfset pctYes = #DecimalFormat(100 * numYes/numTotal)#>
								<cfset pctNo = #DecimalFormat(100 * numNo/numTotal)#>
								<tr>
									<td valign="top" align="left">&nbsp;</td>
									<td valign="top" align="left">
										<table cellpadding="0">
										<tr>
											<td>Yes</td>
											<td>#numYes#</td>
											<td align="right">#pctYes#%</td>
											<td><img src="/images/Surveys/bluebar.gif" height="10" <cfif pctYes LTE 1>width="1"<cfelse>width=#pctYes#</cfif>></td>
										</tr>
										<tr>
											<td>No</td>
											<td>#numNo#</td>
											<td align="right">#pctNo#%</td>
											<td><img src="/images/Surveys/bluebar.gif" height="10" <cfif pctNo LTE 1>width="1"<cfelse>width=#pctNo#</cfif>></td>
										</tr>
										</table>
									</td>
								</tr>
								<cfelseif qType eq "OE">
								
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
										<cfset pctYes = #DecimalFormat(100 * numYes/numTotal)#>							
										<tr>
											<td>#prResponse#</td>
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
										<table cellpadding="0">
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
										<cfset pctYes = #DecimalFormat(100 * numYes/numTotal)#>
										<tr>
											<td>#prResponse#</td>
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
										<table cellpadding="0">
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
										<cfset pctYes = #DecimalFormat(100 * numYes/numTotal)#>
										<tr>
											<td>#scpValue#</td>
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
	</table><br><br>
	<div align="center"><form>
	<input type="button" value="  - Close Window -  " onClick="window.close();">
	</form></div>
	</td>
	</TR>
	</table>
</body>
</html>
