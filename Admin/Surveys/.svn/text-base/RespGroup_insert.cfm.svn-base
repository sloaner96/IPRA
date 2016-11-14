<cftransaction>
<cfquery datasource="#Application.dsn#" name="getID">
SELECT MAX(rgID) as ID
FROM Respondent_Groups
</cfquery>

<cfif getID.ID eq "">
	<cfset ID=1>
<cfelse>
	<cfset ID=#getID.ID#+1>
</cfif>

<CFquery datasource="#Application.dsn#" name="insertSc">
INSERT INTO Respondent_Groups
(siteConfigKey, rgName<cfif form.notes neq "">, rgNotes</cfif>)
VALUES
(#siteConfigurationKey#, '#form.name#'<cfif form.notes neq "">, '#form.notes#'</cfif>)
</CFQUERY>
</cftransaction>






<html>
<head>
	<title>BSO_Surveys v.3.0</title>
	
	<LINK REL=stylesheet HREF="../style.css" TYPE="text/css">
<script language="JavaScript">
		function refresh_orig(){
			window.opener.location.href="respondents.cfm?group=<cfoutput>#ID#</cfoutput>";
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
<strong>Respondent Group Added</strong>
<hr><br>
<div align="center">
	<br><br><br>
	Done.
	<br><br>
	<a href="##" onClick="refresh_orig();">Close Window</a></div>
</body>
</html>
