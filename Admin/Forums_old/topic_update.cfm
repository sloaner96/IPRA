<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
<LINK REL=stylesheet HREF="../style.css" TYPE="text/css">
</head>

<body>
<br><br>

<CFquery datasource="#ds#" name="update">
UPDATE tblTopics
SET
tName='#form.tName#'
WHERE TID=#TID#
</CFQUERY>

<cfoutput>
<br><br><br>
<div align="center">Topic Updated
<br><br>
<meta http-equiv="refresh" content="0;url=threads.cfm?tid=#tid#">
</div>
</cfoutput>
</body>
</html>
