<cftransaction>

<cfquery datasource="#Application.dsn#" name="getqnum">
SELECT MAX(qNum) as qNumber from Questions
WHERE qSID=#SID#
</cfquery>

<cfif getqNum.qNumber neq "">
	<cfset Num=#getqNum.qNumber#+1>
<cfelse>
	<cfset Num=1>
</cfif>

<cfquery datasource="#Application.dsn#" name="getID">
SELECT MAX(qID) as ID
FROM Questions
</cfquery>

<cfif getID.ID eq "">
	<cfset ID=1>
<cfelse>
	<cfset ID=#getID.ID#+1>
</cfif>

<CFquery datasource="#Application.dsn#" name="insertQ">
INSERT INTO Questions
(qSID, qNum, qType, qQuestion<cfif isdefined('scID')>, qScID</cfif><cfif isdefined('catID')>, qCatID</cfif>)
VALUES(#SID#, #Num#, '#Type#', '#form.Question#'<cfif isdefined('scID')>, #ScID#</cfif><cfif isdefined('catID')>, #catID#</cfif>)
</CFQUERY>

</cftransaction>


<html>
<head>
	<title>Untitled</title>
<script language="JavaScript">
		function refresh_orig(){
			window.opener.location.href="Survey.cfm?SID=<cfoutput>#SID#</cfoutput>";
			window.opener.focus();
			window.close();
		}
</script>
<LINK REL=stylesheet HREF="../style.css" TYPE="text/css">
<script language="JavaScript">
		function help(keyword){
		var urlString='help.cfm?q=' + keyword;
			window.open(urlString,'HelpWindow','location=no,scrollbars=yes,menubars=no,toolbars=no,resizable=yes,width=400,height=400');
		}
</script>
</head>

<body onload="this.window.focus();">
<cfoutput>
<cfif Type eq "MUL1" or Type eq "MUL2">
<meta http-equiv="refresh" content="0;url=Response_responses.cfm?QID=#ID#&SID=#SID#">
<cfelse>
<br><br><br>
<div align="center">
Question Complete
<br><br>
<a href="##" onClick="refresh_orig();">Close Window</a>
</div>
</cfif>
</cfoutput>

</body>
</html>
