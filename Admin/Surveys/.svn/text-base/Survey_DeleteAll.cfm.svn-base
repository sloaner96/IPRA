<cfinclude template="SecurityCheck.cfm">

<cftransaction>
<cfquery name="getRespNum" datasource="#Application.dsn#">
SELECT sWasPublished
FROM Surveys
WHERE sID=#SID#
</cfquery>

<cfif getRespNum.recordcount neq 0>
	<cfquery name="getResp" datasource="#Application.dsn#">
	SELECT srID
	FROM Survey_Responses
	WHERE srSid=#SID#
	</cfquery>
	
	<cfoutput query="getResp">
		<cfquery name="deleteQResponse" datasource="#Application.dsn#">
		DELETE
		FROM Question_Responses
		WHERE qrSrID=#srID#
		</cfquery>	
		
		<cfquery name="deleteResponses" datasource="#Application.dsn#">
		DELETE
		FROM Survey_Responses
		WHERE srID=#srID#
		</cfquery>
	</cfoutput>
</cfif>

<cfquery name="getQ" datasource="#Application.dsn#">
SELECT QID
FROM Questions
WHERE QSID=#SID#
</cfquery>

<cfoutput query="getQ">
	<cfquery name="deleteQPossResp" datasource="#Application.dsn#">
	DELETE
	FROM Possible_Responses
	WHERE prQID=#QID#
	</cfquery>
</cfoutput>

<cfquery name="deleteQ" datasource="#Application.dsn#">
DELETE
FROM Questions
WHERE QSID=#SID#
</cfquery>

<cfquery name="deleteCat" datasource="#Application.dsn#">
DELETE
FROM Categories
WHERE catSID=#SID#
</cfquery>

<cfquery name="deleteInvite" datasource="#Application.dsn#">
DELETE
FROM Respondent_SurveyRoster
WHERE rrSID=#SID#
</cfquery>

<cfquery name="deleteS" datasource="#Application.dsn#">
DELETE
FROM Surveys
WHERE sID=#SID#
</cfquery>
</cftransaction>
<cfif pub eq "yes">
	<cfset location="survey_listPublished.cfm">
<cfelse>
	<cfset location="survey_listUnpublished.cfm">
</cfif>

<html>
<head>
	<title>BSO_Surveys v.3.0</title>
	
	<LINK REL=stylesheet HREF="../style.css" TYPE="text/css">
<script language="JavaScript">
		function refresh_orig(){
			window.opener.location.href="<cfoutput>#location#</cfoutput>";
			window.opener.focus();
			window.close();
		}
	</script>
<script language="JavaScript">
		function help(keyword){
		var urlString='help.cfm?q=' + keyword;
			window.open(urlString,'HelpWindow','location=no,scrollbars=yes,menubars=no,toolbars=no,resizable=yes,width=400,height=400');
		}
</script>
</head>

<body onload="this.window.focus();">
<br><br><br>
<strong>Survey Deleted</strong>
<hr><br>
<div align="center">
	<br><br><br>
	Done.
	<br><br>
	<a href="##" onClick="refresh_orig();">Close Window</a></div>
</body>
</html>
