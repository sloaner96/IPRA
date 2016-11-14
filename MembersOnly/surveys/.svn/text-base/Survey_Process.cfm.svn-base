<cfif not isDefined('cookie.ID')>
   <cfoutput> <meta http-equiv="refresh" content="0;url=Respondent_login.cfm?sid=#sid#"></cfoutput>
	<!--- <cflocation url="Respondent_login.cfm?sid=#sid#"> --->
<cfelse>
	<html>
	<head>
		<title>IPRA Surveys</title>
		
		<LINK REL=stylesheet HREF="style.css" TYPE="text/css">
	</head>
	
	<body bgcolor="C6DFAD">
	<br><br>
	<br><br>
	<table bgcolor="black" cellspacing="0" align="center" width="332">
		<tr>
			<td>
	<table bgcolor="white" cellspacing="0" border="0" cellpadding="5" align="center" width="310">
		<tr>
			<td align="center">
	
		<!--- security doublecheck: has respondent already taken survey? (Prevents user from copying survey template to local drive and resubmitting) --->
		<cfset isAuth="yes">
		<cfquery name="verifySR" datasource="#ds#">
		SELECT srID
		FROM survey_Responses
		WHERE srRespID=#cookie.ID#
		AND srSID=#SID#
		</cfquery>
		<cfif verifySR.Recordcount neq 0>
			<cfset isAuth = "no">
		</cfif>
		<!--- security doublecheck: does survey belong to site? (Precautionary measure to help prevent cross-site results) --->
		<cfquery name="verifyS" datasource="#ds#">
		SELECT SID
		FROM surveys
		WHERE SID=#SID#
		AND siteConfigKey=#siteConfigurationKey#
		</cfquery>
		<cfif verifyS.Recordcount eq 0>
			<cfset isAuth = "no">
		</cfif>
		<cfif cookie.ID eq 0>
			<cfset isAuth="yes">
		</cfif>
		<cfif isAuth eq "no">
			<br>
			<strong>Sorry</strong>
			<br><br>
			You have already taken this survey.
			<br><br>
			<a href="index.cfm"><strong>Back to List of Surveys</strong></a>
		<cfelse>
			<!--- insert response record; loop thru reposnes and insert --->
			<cfset today=#DateFormat(CreateODBCDate(now()), 'mm/dd/yyyy')#>
			<cftransaction>
				<cfquery datasource="#ds#" name="getID">
				SELECT MAX(srID) as ID
				FROM Survey_Responses
				</cfquery>
				<cfif getID.ID eq "">
					<cfset responseID=1>
				<cfelse>
					<cfset responseID=#getID.ID#+1>
				</cfif>
				<CFquery datasource="#ds#" name="insertSR">
				INSERT INTO Survey_Responses
				(srID, srSID, srRespID, srDate)
				VALUES(#responseID#, #SID#, #cookie.ID#, '#today#')
				</CFQUERY>
			</cftransaction>
			<CFLOOP ITEM="Field" COLLECTION="#Form#">
				<cfif Field neq 'fieldnames'>
					<cfif form[field] neq "">
						<cfset value=#evaluate("form[field]")#>
						<cfif find('OE', Field) neq 0>
							<cfset qID=RemoveChars(Field, 1, 2)>
						<cfelseif find('YN', Field) neq 0>
							<cfset qID=RemoveChars(Field, 1, 2)>
						<cfelseif find('TF', Field) neq 0>
							<cfset qID=RemoveChars(Field, 1, 2)>
						<cfelseif find('MUL2', Field) neq 0>
							<cfset qID=RemoveChars(Field, 1, 4)>
						<cfelseif find('MUL3', Field) neq 0>
							<cfset qID=RemoveChars(Field, 1, 4)>
						<cfelse>
							<cfset prID=RemoveChars(Field, 1, 4)>
							<cfquery name="getQID" datasource="#ds#">
							SELECT prQID AS QID FROM Possible_Responses
							WHERE prID=#prID#
							</cfquery>
							<cfset QID=#getQID.QID#>
						</cfif>
						<cfset fieldValue=#form[field]#>
						<cfquery datasource="#ds#" name="insert_resp">
						INSERT INTO Question_Responses
						(qrSrID, qrResponse, qrQID)
						VALUES
						(#responseID#, '#fieldValue#', #QID#)
						</cfquery>
					</cfif>
				</cfif>
			</CFLOOP>
			<cfquery name="showResults" datasource="#ds#">
			SELECT sResults_public FROM Surveys
			WHERE sID=#SID#
			AND siteConfigKey=#siteConfigurationKey#
			</cfquery>
			
			<cfquery name="verifyAns" datasource="#ds#">
			SELECT qrID
			FROM Question_Responses
			WHERE qrSrID=#responseID#
			</cfquery>
							
			<!--- has respondent answered at least one question on this survey? --->			
		
			<cfif verifyAns.recordcount neq 0>
				<br>
				<strong>Thank you for participating!</strong>
				<br><br>
				<cfif showResults.sResults_Public eq 'yes'>
					<cfoutput>
						<a href="Report_byGroup.cfm?sid=#SID#&rgID=0">Click here to view up-to-the-minute results for this survey</a>
					</cfoutput>
				</cfif>
				<br><br>
				<a href="##" onclick="window.open('Survey_feedback.cfm?SrID=<cfoutput>#responseID#</cfoutput>','newWindow','location=no,scrollbars=yes,menubars=no,toolbars=no,resizable=yes,width=625,height=425');">Click here to give us your comments, suggestions or feedback</a>
			<cfelse>
				<cfquery name="delete response" datasource="#ds#">
				DELETE FROM survey_responses
				WHERE srID=#responseID#
				</cfquery>
				<br>
				<strong>You did not answer any questions!</strong>
				<br><br>
				You may come back later and <a href="javascript:history.back();"><strong>retake this survey</strong></a>
			</cfif>
	</cfif>
			<br><br><br>
			<cfoutput><a href="#siteHome#"><strong>Back to home page</strong></a></cfoutput>
			<br><br>
			</td>
		</tr>
	</table>
	
	</td>
	</tr>
	</table>
	</body>
	</html>
</cfif>