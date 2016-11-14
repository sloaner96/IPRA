

<html>
<head>
	<title>BSO_Surveys v.3.0</title>
	
	<LINK REL=stylesheet HREF="../style.css" TYPE="text/css">
<script language="JavaScript">
		function refresh_orig(){
			window.opener.location.href="Survey.cfm?SID=<cfoutput>#SID#</cfoutput>";
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
<cfoutput>
<CFLOOP ITEM="Field" COLLECTION="#Form#">
	<cfset x=#form[field]#>
	<cfif Field neq 'fieldnames'>
		<cfif form[field] neq "">
			<cfset value=#evaluate("form[field]")#>
			<cfquery datasource="#Application.dsn#" name="insert_resp">
			INSERT INTO Possible_Responses
			(prQID, prResponse)
			VALUES
			(#QID#, '#value#')
			</cfquery>
		</cfif>
	</cfif>
</CFLOOP>


<br><br><br>
<div align="center">
<strong>Question Complete</strong>
<br><br>
<a href="##" onClick="refresh_orig();">Close Window</a>
</div>

</cfoutput>
</body>
</html>
