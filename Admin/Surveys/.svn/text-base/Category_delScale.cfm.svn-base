

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

	<cfquery name="catAssoc" datasource="#Application.dsn#">
	UPDATE Categories
	SET catScID=NULL
	WHERE catID=#catID#
	</cfquery>
	
	<cfoutput>
		<div align="center"><br><br><br>
		<strong>Done</strong>
		<hr><br>
		
		<a href="##" onClick="refresh_orig();">Return to Survey</a></div>
		
	</cfoutput>
	

</body>
</html>
