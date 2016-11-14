<cfif rgID eq 0>
	<cfinclude template="qry_Report_All.cfm">
<cfelse>
	<cfinclude template="qry_Report_Group.cfm">
</cfif>
<html>
<head>
	<title>IPRA Surveys</title>
	
	<LINK REL=stylesheet HREF="style.css" TYPE="text/css">
</head>

<body bgcolor="C6DFAD">
<table bgcolor="white" border="1" cellpadding="5" cellspacing="0" align="center" width="600">
	<tr>
		<td align="center" colspan="2">
		<cfoutput>
		<strong>- #getS.sName# -</strong><br><br>
		Results for Group: <strong>#getGroup.rgName#</strong>
		<br><br>
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
			<cfquery name="getCat" datasource="#ds#">
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
								<cfquery name="getresponses" datasource="#ds#">
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
											<td><img src="images/bluebar.gif" height="10" <cfif pctYes LTE 1>width="1"<cfelse>width=#pctYes#</cfif>></td>
										</tr>
										<tr>
											<td><strong>False</strong></td>
											<td>#numNo#</td>
											<td align="right">#pctNo#%</td>
											<td><img src="images/bluebar.gif" height="10" <cfif pctNo LTE 1>width="1"<cfelse>width=#pctNo#</cfif>></td>
										</tr>
										</table>
									</td>
								</tr>
								<cfelseif qType eq "YN">
								<!--- get stats --->
								<cfquery name="getresponses" datasource="#ds#">
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
											<td><img src="images/bluebar.gif" height="10" <cfif pctYes LTE 1>width="1"<cfelse>width=#pctYes#</cfif>></td>
										</tr>
										<tr>
											<td><strong>No</strong></td>
											<td>#numNo#</td>
											<td align="right">#pctNo#%</td>
											<td><img src="images/bluebar.gif" height="10" <cfif pctNo LTE 1>width="1"<cfelse>width=#pctNo#</cfif>></td>
										</tr>
										</table>
									</td>
								</tr>
								<cfelseif qType eq "OE">
								<cfquery name="getresponses" datasource="#ds#">
								SELECT qrResponse from Question_Responses
								WHERE qrQID=#QID#
								AND qrsrID in (#RespondentList#)
								</cfquery>
								<cfloop query="getresponses">
								<tr>
									<td valign="top" align="left" colspan="2">#qrResponse#</td>
								</tr>
								</cfloop>
								<cfelseif qType eq "MUL1">
									<cfquery name="getPossResp" datasource="#ds#">
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
										<cfquery name="getResponses" datasource="#ds#">
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
											<td><img src="images/bluebar.gif" height="10" <cfif pctYes LTE 1>width="1"<cfelse>width=#pctYes#</cfif>></td>
										</tr>
										</cfloop>
										<tr>
											<td colspan="3">&nbsp;</td>
											<td><img src="images/x_axis.gif" height="10" width="100"></td>
										</tr>
									</table>
								</td>
								</tr>
								<cfelseif qType eq "MUL2">
								<cfquery name="getPossResp" datasource="#ds#">
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
										<cfquery name="getResponses" datasource="#ds#">
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
											<td><img src="images/bluebar.gif" height="10" <cfif pctYes LTE 1>width="1"<cfelse>width=#pctYes#</cfif>></td>
										</tr>
									</cfloop>
										<tr>
											<td colspan="3">&nbsp;</td>
											<td><img src="images/x_axis.gif" height="10" width="100"></td>
										</tr>
									</table>
								</td>
								</tr>
								<cfelse><!--- qType eq "MUL3" --->
								<cfquery datasource="#ds#" name="getScale">
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
										<cfquery name="getResponses" datasource="#ds#">
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
											<td><img src="images/bluebar.gif" height="10" <cfif pctYes LTE 1>width="1"<cfelse>width=#pctYes#</cfif>></td>
										</tr>
									</cfloop>
										<tr>
											<td colspan="3">&nbsp;</td>
											<td><img src="images/x_axis.gif" height="10" width="100"></td>
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
