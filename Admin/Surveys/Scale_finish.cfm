<cftransaction>
<cfquery datasource="#Application.dsn#" name="getID">
SELECT MAX(scID) as ID
FROM Scales
</cfquery>
<cfif getID.ID eq "">
	<cfset ID=1>
<cfelse>
	<cfset ID=#getID.ID#+1>
</cfif>
<CFquery datasource="#Application.dsn#" name="insertSc">
INSERT INTO Scales
(scName, siteConfigKey)
VALUES('#form.Name#', #siteConfigurationKey#)
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
<cfoutput>
<meta http-equiv="refresh" content="0;url=ScValues.cfm?ID=#ID#&count=#form.val_num#<cfif isdefined('s')>&s=#s#</cfif><cfif isdefined('q')>&q=#q#&type=MUL3&scID=#ID#</cfif><cfif isdefined('SID')>&SID=#SID#</cfif><cfif isdefined('catID')>&catID=#CatID#</cfif>">
</cfoutput>

</body>
</html>
