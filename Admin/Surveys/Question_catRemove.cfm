<cfquery name="getCatQ" datasource="#Application.dsn#">
UPDATE Questions
SET qCatID = NULL
WHERE qID=#QID#
</cfquery>



<html>
<head>
	<title>Untitled</title>
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
<div align="center">
Changes Complete
<br><br>
<a href="##" onClick="refresh_orig();"><strong>Close Window</strong></a>
</div>

</body>
</html>
