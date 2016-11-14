

<html>
<head>
	<title>BSO_Surveys v.3.0</title>
	
	<LINK REL=stylesheet HREF="../style.css" TYPE="text/css">

<cfoutput>
<script language="JavaScript">
	function refresh_orig(){
		window.opener.location.href="Scales.cfm";
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

	<CFLOOP ITEM="Field" COLLECTION="#Form#">
		<cfset x=#form[field]#>
		<cfif Field neq 'fieldnames'>
			<cfif form[field] neq "">
				<cfset value=#evaluate("form[field]")#>
				<cfquery datasource="#Application.dsn#" name="insert_resp">
				INSERT INTO Scale_Values
				(scpScID, scpValue)
				VALUES
				(#scID#, '#value#')
				</cfquery>
			</cfif>
		</cfif>
	</CFLOOP>

	<div align="center">
	<br><br><br>
	Done.
	<br><br>
	<a href="##" onClick="refresh_orig();"><strong>Continue</strong></a></div>

</cfoutput>
</body>
</html>
