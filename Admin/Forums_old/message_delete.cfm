<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
<LINK REL=stylesheet HREF="../style.css" TYPE="text/css">
</head>

<body>
<br><br>

<CFquery datasource="#ds#" name="update">
DELETE FROM tblMessages
WHERE msgID=#msgID#
</CFQUERY>

<cfoutput>
<br><br><br>
<div align="center">Message Deleted
<br><br>
<meta http-equiv="refresh" content="0;url=messages.cfm?thid=#ThID#&tid=#tid#">
</div>
</cfoutput>
</body>
</html>
