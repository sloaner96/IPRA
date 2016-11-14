<cfinclude template="SecurityCheck.cfm">
<!-- delete possible responses --->

<cfquery datasource="#Application.dsn#" name="insert_resp">
DELETE FROM Possible_Responses
WHERE prQID=#QID#
</cfquery>
		
<!--- delete question --->

<cfquery name="qUpdate" datasource="#Application.dsn#">
DELETE FROM Questions
WHERE qID=#qID#
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
Question Deleted
<br><br>
<a href="##" onClick="refresh_orig();">Close Window</a>
</div>

</body>
</html>
