<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
<LINK REL=stylesheet HREF="../style.css" TYPE="text/css">
<script language="JavaScript">
		function help(keyword){
		var urlString='help.cfm?q=' + keyword;
			window.open(urlString,'HelpWindow','location=no,scrollbars=yes,menubars=no,toolbars=no,resizable=yes,width=400,height=400');
		}
</script>
</head>

<body>


<cfquery name="checkorphan" datasource="#Application.dsn#">
SELECT srRespID from Survey_Responses
WHERE srRespID=#respID#
</cfquery>
<cfif checkorphan.recordcount neq 0>
	<br><br><br>
	<div align="center">
	<strong>You cannot delete this Respondent because he or she has responded to an exisiting survey</strong>
	<br><br>
	To delete this Respondent you must first delete the survey.
	<br><br>
	<cfoutput>
	<a href="##" onClick="window.close();"><strong>Close Window</strong></a>
	</cfoutput>
	</div>
<cfelse>
	<br><br><br>
	<div align="center">
	<strong>Are you sure you want to permanently delete this Respondent?</strong>
	<br><br>
	<cfoutput>
	<a href="Respondent_Delete.cfm?respID=#respID#"><strong>Yes, Continue</strong></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="##" onClick="window.close();"><strong>No, Cancel</strong></a>
	</cfoutput>
	</div>
</cfif>


</body>
</html>
