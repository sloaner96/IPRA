<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
<LINK REL=stylesheet HREF="../style.css" TYPE="text/css">
</head>

<body>
<br><br>

<CFquery datasource="#ds#" name="getThreadIDs">
SELECT thID FROM tblThreads
WHERE thTID=#TID#
</CFQUERY>

<cfoutput query="getThreadIDs">
	<CFquery datasource="#ds#" name="delete">
	DELETE FROM tblMessages
	WHERE msgThID=#thID#
	</CFQUERY>
</cfoutput>

<CFquery datasource="#ds#" name="delete2">
DELETE FROM tblThreads
WHERE thTID=#TID#
</CFQUERY>

<CFquery datasource="#ds#" name="delete3">
DELETE FROM tblTopics
WHERE TID=#TID#
</CFQUERY>

<cfoutput>
<br><br><br>
<div align="center">Topic Deleted
<br><br>
<meta http-equiv="refresh" content="0;url=Topics.cfm">
</div>
</cfoutput>
</body>
</html>
