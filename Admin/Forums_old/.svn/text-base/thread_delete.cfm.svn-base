<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
<LINK REL=stylesheet HREF="../style.css" TYPE="text/css">
</head>

<body>
<br><br>

<CFquery datasource="#ds#" name="delete">
DELETE FROM tblMessages
WHERE msgThID=#thID#
</CFQUERY>

<CFquery datasource="#ds#" name="delete">
DELETE FROM tblThreads
WHERE thID=#thID#
</CFQUERY>

<cfoutput>
<br><br><br>
<div align="center">Thread Deleted
<br><br>
<meta http-equiv="refresh" content="0;url=threads.cfm?tid=#tid#">
</div>
</cfoutput>
</body>
</html>
