

<html>
<head>
	<title>Untitled</title>
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
<div align="center">
<strong>Are you sure you want to permanently delete this Category?</strong>
<br><br>
<cfoutput>
<a href="Category_Delete.cfm?SID=#SID#&catID=#catID#"><strong>Yes, Continue</strong></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="##" onClick="window.close();"><strong>No, Cancel</strong></a>
</cfoutput>
</div>
</body>
</html>
