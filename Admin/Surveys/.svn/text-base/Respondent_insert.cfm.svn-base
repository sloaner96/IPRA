<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>BSO_Surveys v.2.0</title>
	
	<LINK REL=stylesheet HREF="../style.css" TYPE="text/css">
<script language="JavaScript">
		function refresh_orig(){
			window.opener.location.href="respondents.cfm";
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

<body>

<cfquery datasource="#Application.dsn#" name="checkUnique">
SELECT [#user_ID#] FROM [#table_Users#]
WHERE [#user_Email#] like '#form.email#'
AND [#user_PAssword#] like '#form.pass#'
</cfquery>

<cfif checkUnique.recordcount neq 0>
	<br><br><br>
	<div align="center">
	<strong>Sorry</strong>
	<br><br><br>
	That email address and password is already in use. Please go <a href="javascript:history.back();">back</a> and choose a different password.
	<br><br>
	<a href="##" onClick="refresh_orig();">Cancel</a></div>
</cfif>

<cftransaction>
<cfquery datasource="#Application.dsn#" name="getID">
SELECT MAX([#user_ID#]) as maxID
FROM [#table_Users#]
</cfquery>

<cfif getID.maxID eq "">
	<cfset newID=1>
<cfelse>
	<cfset newID=#getID.maxID#+1>
</cfif>

<!--- <CFquery datasource="#Application.dsn#" name="insertResp">
INSERT INTO [#table_Users#]
(#user_ID#, #user_First#, #user_Last#, #user_Email#, #user_Password#, siteConfigKey)
VALUES
(#newID#, '#form.first#', '#form.last#', '#form.Email#', '#form.pass#', #siteConfigurationKey#)
</CFQUERY> --->
</cftransaction>


<br><br><br>
<strong>Respondent Added</strong>
<hr><br>
<div align="center">
	<br><br><br>
	Done.
	<br><br>
	<a href="##" onClick="refresh_orig();">Close Window</a></div>
	
	
	
</body>
</html>
