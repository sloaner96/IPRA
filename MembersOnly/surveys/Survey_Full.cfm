<cfquery name="getS" datasource="#ds#">
SELECT * FROM Surveys
WHERE SID=#SID#
AND siteConfigKey=#siteConfigurationKey#
</cfquery>

<cfif getS.sAnonymous eq "yes">
	<cfset cookie.ID=0>
<cfelse>
	<cfif not isDefined('cookie.ID')>
	    <cfoutput><meta http-equiv="refresh" content="0;url=Respondent_login.cfm?sid=#sid#"></cfoutput>
		<!--- <cflocation url="Respondent_login.cfm?sid=#sid#"> --->
		<!---<meta http-equiv="refresh" content="1,url=Respondent_login.cfm?sid=#sid#">--->
	</cfif>
</cfif>
	<cfquery name="getQ" datasource="#ds#">
	SELECT qID, qQuestion, qNum, qType, qCatID, qScID FROM Questions
	WHERE qSID=#SID#
	ORDER BY qNum ASC
	</cfquery>

	<html>
	<head>
		<title>IPRA Surveys</title>
		
		<LINK REL=stylesheet HREF="style.css" TYPE="text/css">
	</head>
	<body bgcolor="C6DFAD">
		<!--- start outer table --->
		<table bgcolor="white" border="1" cellpadding="5" cellspacing="0" align="center" width="602">
		<tr>
		<td>
			<cfoutput query="getS">
			<!--- start header table --->
			<form name="form1" action="Survey_Process.cfm?SID=#SID#" method="post">
			<table bgcolor="DAB9B6" border="0" cellpadding="5" cellspacing="0" align="center" width="580">
			<tr>
				<td align="center">
				<font class="surveyTitleFont">#UCase(sName)#</font>
				<br><hr width="300" color="gray"><br>
				#sIntro#
				</td>
			</tr>
			</table>
			<!--- end header table --->
			</cfoutput>
			<br><br>
		</td>
		</tr>
		<!--- end of first outer row --->
		<!--- start second outer row --->
		<tr>
		<td>
			<cfset catMarked=""><!--- list that stores encountered categories --->
			<cfset catCurrent=""><!--- flag for category that current question belongs to --->
			
			<table bgcolor="white" border="0" cellpadding="5" cellspacing="0" align="center" width="100%">
			<cfoutput query="getQ">
			
			<!---## START FINISH CATEGORY CHECK ## --->
		
			<cfif currentrow neq 1 and CatCurrent neq "">
				<cfif CatCurrent neq #qCatID#>
				</table>
				<hr>
				</td>
			</tr>
					<cfset catCurrent="">
					<cfset catScaleFlag="">
				</cfif>
			</cfif> 
			
			<!---## END FINISH CATEGORY CHECK ## --->
			<!---## START NEW CATEGORY CHECK ## --->
			
			<cfif qCatID neq "">
			<!--- question belongs in a category --->
				<cfif ListFind(catMarked, qCatID) eq 0>
				<!--- category is encountered for the first time --->
					<cfset catCurrent=#qCatID#>
					<!--- set current flag to this category --->
					<cfset catMarked=#ListAppend(catMarked, qCatID)#>
					<!--- get category info --->
					<cfquery name="getCat" datasource="#ds#">
					SELECT * FROM Categories
					WHERE catID=#qCatID#
					</cfquery>
					<!--- display category header --->
			<tr>
				<td colspan="2">
					<table bgcolor="white" border="0" cellpadding="5" cellspacing="0" align="center" width="570" bgcolor="lightgrey"><!--- begin category table --->
						<tr>
						<td bgcolor="B5C2DD" colspan="2">
							<div align="center"><font class="hugefont"><strong>#getcat.catName#</strong></font></div>
							<cfif getcat.catAddText neq "">
								<div align="center"><strong>#getcat.catAddText#</strong></div>
							</cfif>				
						</td>
						</tr>
					</cfif>
				</cfif>
			<!---## END NEW CATEGORY CHECK ## --->
				
			<cfif qType eq "TF">
			<tr>
				<td valign="top" align="left" width="5%"><strong>#qNum#.</strong></td>
				<td valign="top" align="left" width="95%"><strong>#qQuestion#</strong></td>
			</tr>
			<tr>
				<td valign="top" align="left">&nbsp;</td>
				<td valign="top" align="left"><input type="radio" name="TF#qID#" value="1"> True</td>
			</tr>
			<tr>
				<td valign="top" align="left">&nbsp;</td>
				<td valign="top" align="left"><input type="radio" name="TF#qID#" value="0"> False</td>
			</tr>
			<cfelseif qType eq "YN">
			<tr>
				<td valign="top" align="left" width="5%"><strong>#qNum#.</strong></td>
				<td valign="top" align="left" width="95%"><strong>#qQuestion#</strong></td>
			</tr>
			<tr>
				<td valign="top" align="left">&nbsp;</td>
				<td valign="top" align="left"><input type="radio" name="YN#qID#" value="1"> Yes</td>
			</tr>
			<tr>
				<td valign="top" align="left">&nbsp;</td>
				<td valign="top" align="left"><input type="radio" name="YN#qID#" value="0"> No</td>
			</tr>
			<cfelseif qType eq "OE">
			<tr>
				<td valign="top" align="left" width="5%"><strong>#qNum#.</strong></td>
				<td valign="top" align="left" width="95%"><strong>#qQuestion#</strong></td>
			</tr>
			<tr>
				<td valign="top" align="left">&nbsp;</td>
				<td valign="top" align="left"><textarea name="OE#qID#" rows="5" cols="40" wrap="physical"></textarea></td>
			</tr>
			<cfelseif qType eq "MUL1">
			<tr>
				<td valign="top" align="left" width="5%"><strong>#qNum#.</strong></td>
				<td valign="top" align="left" width="95%"><strong>#qQuestion#</strong></td>
			</tr>
				<cfquery name="getPossResp" datasource="#ds#">
				SELECT prID, prResponse FROM Possible_Responses
				WHERE prQID=#qID#
				</cfquery>
				<cfloop query="getpossResp">
			<tr>
				<td valign="top" align="left">&nbsp;</td>
				<td valign="top" align="left"><input type="checkbox" name="MUL1#prID#" value="#prID#"> #prResponse#</td>
			</tr>
				</cfloop>
			
			<cfelseif qType eq "MUL2">
			<tr>
				<td valign="top" align="left" width="5%"><strong>#qNum#.</strong></td>
				<td valign="top" align="left" width="95%"><strong>#qQuestion#</strong></td>
			</tr>
			<cfquery name="getPossResp" datasource="#ds#">
				SELECT prID, prResponse FROM Possible_Responses
				WHERE prQID=#qID#
				</cfquery>
				<cfset qID=#qID#>
				<cfloop query="getpossResp">
			<tr>
				<td valign="top" align="left">&nbsp;</td>
				<td valign="top" align="left"><input type="radio" name="MUL2#qID#" value="#prID#"> #prResponse#</td>
			</tr>
				</cfloop>
			
			<cfelse><!--- qType eq "MUL3", scalar --->	
				<cfquery datasource="#ds#" name="getScale">
				SELECT scName, scpID, scpValue, scID
				FROM Scales, Scale_Values
				WHERE scpScID=#qScID#
				AND scpScID=ScID
				</cfquery>	
					<tr>
						<td valign="top" align="left" width="5%"><strong>#qNum#.</strong></td>
						<td valign="top" align="left" width="95%"><strong>#qQuestion#</strong></td>
					</tr>
					<tr>
						<td valign="top" align="left">&nbsp;</td>
						<td valign="top" align="left"><select name="MUL3#qID#">
						<option value="">Please choose below
						<cfloop query="getscale">
						<option value="#scpID#">#scpValue#
						</cfloop>
						</select>
						</td>
					</tr>
			</cfif>
			</cfoutput>
			</table>
			<!---## START FINISH CATEGORY CHECK ## --->
			<cfif CatCurrent neq "">
			</table>
			<hr>
				</td>
			</tr>
				<cfset catCurrent="">
			</cfif> 
			<!---## END FINISH CATEGORY CHECK ## --->
			
		<!--- end of second outer row --->
		<!--- start third outer row --->
		<tr>
		<td colspan="2" align="center">
			<input type="submit" value="Submit Survey"></form>
		</td>
		</tr>
		</table>
		<!--- end outer table --->
	</body>
	</html>