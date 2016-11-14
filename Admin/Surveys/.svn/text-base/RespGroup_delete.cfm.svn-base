<cfinclude template="SecurityCheck.cfm">
<cftransaction>
	<CFquery datasource="#Application.dsn#" name="deleteRR">
	DELETE FROM Respondent_SurveyRoster
	WHERE rrRgID=#rgID#
	</CFQUERY>
	
	
	<CFquery datasource="#Application.dsn#" name="deleteRG">
	DELETE FROM Respondent_Groups
	WHERE rgID=#rgID#
	</CFQUERY>
	
	
	<CFquery datasource="#Application.dsn#" name="deleteRG">
	DELETE FROM Respondent_GroupRoster
	WHERE rgrRgID=#rgID#
	</CFQUERY>
</cftransaction>




<html>
<head>
	<title>BSO_Surveys v.3.0</title>
	
	<LINK REL=stylesheet HREF="../style.css" TYPE="text/css">
<script language="JavaScript">
		function refresh_orig(){
			window.opener.location.href="respondents.cfm";
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
<strong>Respondent Group Deleted</strong>
<hr><br>
<div align="center">
	<br><br><br>
	Done.
	<br><br>
	<a href="##" onClick="refresh_orig();">Close Window</a></div>
</body>
</html>
