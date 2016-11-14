<CFquery datasource="#Application.dsn#" name="insertSc">
UPDATE Surveys
SET
sName='#form.name#'
<cfif form.Intro neq "">, sIntro='#form.Intro#'</cfif>
WHERE sID=#SID#

</CFQUERY>
<cfif pub eq "yes">
	<cfset location="survey_listPublished.cfm?survey=#sid#">
<cfelse>
	<cfset location="survey.cfm?sid=#sid#">
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
<strong>Survey Updated</strong>
<hr><br>
<div align="center">
	<br><br><br>
	Done.
	<br><br>
	<a href="##" onClick="refresh_orig();">Close Window</a></div>
</body>
</html>
