<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
<LINK REL=stylesheet HREF="../style.css" TYPE="text/css">
</head>

<body>
<br><br>

<!--- parse message and insert html line breaks --->
<cfset form.msgMessage=#replace(form.msgMessage, chr(10),'<br>','all')#>

<CFquery datasource="#ds#" name="update">
UPDATE tblMessages
SET
msgName='#form.msgName#',
msgMessage='#form.msgMessage#'
WHERE msgID=#msgID#
</CFQUERY>

<cfoutput>
<br><br><br>
<div align="center">Message Updated
<br><br>
<meta http-equiv="refresh" content="0;url=messages.cfm?thid=#ThID#&tid=#tid#">
</div>
</cfoutput>
</body>
</html>
