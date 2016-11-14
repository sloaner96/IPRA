<CFquery datasource="#Application.dsn#" name="insertSc">
UPDATE Surveys
SET sPublished=1,
sPublish_Date='#form.date#',
sResults_Public=#form.Public#,
sAnonymous=#form.anonymous#
WHERE sID=#SID#

</CFQUERY>

<cfif form.anonymous eq 'no'>
	<cftransaction>
		<CFquery datasource="#Application.dsn#" name="deleteRR">
			DELETE FROM Respondent_SurveyRoster
			WHERE rrSID=#SID#
		</CFQUERY>
		<cfloop list=#form.group# index="groupID">
			<CFquery datasource="#Application.dsn#" name="insert RR">
			INSERT INTO Respondent_SurveyRoster(rrRgID, rrSID)
			VALUES(#groupID#, #SID#)
			</CFQUERY>
		</cfloop>
	</cftransaction>
</cfif>



<html>
<head>
	<title>BSO_Surveys v.3.0</title>
	
	<LINK REL=stylesheet HREF="../style.css" TYPE="text/css">
<script language="JavaScript">
		function refresh_orig(){
			window.opener.location.href="survey_listPublished.cfm?survey=<cfoutput>#sid#</cfoutput>";
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
<strong>Survey Published.</strong>
<hr><br>
<div align="center">
	<br><br><br>
	Done.
	<br><br>
	<a href="##" onClick="refresh_orig();">Close Window</a></div>
</body>
</html>
