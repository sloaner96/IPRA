
<cftransaction>
<cfset today=#DateFormat(CreateODBCDate(now()), 'mm/dd/yyyy')#>
<cfquery datasource="#Application.dsn#" name="getID">
SELECT MAX(sID) as ID
FROM Surveys
</cfquery>

<cfif getID.ID eq "">
	<cfset ID=1>
<cfelse>
	<cfset ID=#getID.ID#+1>
</cfif>

<CFquery datasource="#Application.dsn#" name="insertSc">
INSERT INTO Surveys
(siteConfigKey, sDate, sName, sPublished, sResults_public, sAnonymous, sWasPublished)
VALUES(#siteconfigurationkey#, '#today#', '#form.Name#',0,0,0,0)
</CFQUERY>

</cftransaction>


<html>
<head>
	<title>BSO_Surveys v.3.0</title>
	
	<LINK REL=stylesheet HREF="../style.css" TYPE="text/css">
<script language="JavaScript">
		function help(keyword){
		var urlString='help.cfm?q=' + keyword;
			window.open(urlString,'HelpWindow','location=no,scrollbars=yes,menubars=no,toolbars=no,resizable=yes,width=400,height=400');
		}
</script>
</head>

<body onload="this.window.focus();">
<br><br><br>
<strong>Add a new <a href="##" onclick="help('survey');"><font class="helpfont">survey</font></a></strong>
<hr><br>
<cfoutput>
<meta http-equiv="refresh" content="0;url=survey.cfm?SID=#ID#&renum=no">
</cfoutput>
</body>
</html>
