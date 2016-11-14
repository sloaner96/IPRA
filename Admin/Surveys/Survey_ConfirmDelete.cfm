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
<div align="center">
<font class="bigredfont">
<strong>Are you sure you want to delete this survey and all of its' Questions and Responses?</strong>
<br><br>
<cfoutput>
	<a href="Survey_DeleteAll.cfm?SID=#SID#&pub=#pub#"><strong>Yes, Continue</strong></a>&nbsp;&nbsp;&nbsp;<a href="##" onClick="window.close();"><strong>No, Cancel</strong></a>
</cfoutput>
</font>
</div>
</body>
</html>
