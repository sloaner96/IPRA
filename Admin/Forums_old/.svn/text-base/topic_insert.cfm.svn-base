<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
<LINK REL=stylesheet HREF="../style.css" TYPE="text/css">
</head>

<body>
<br><br>
<cfset user = Session.AdminInfo.UserID>
<cftransaction>

<cfquery datasource="#ds#" name="getID">
SELECT MAX(tID) as maxID
FROM tblTopics
</cfquery>

<cfif getID.maxID eq "">
	<cfset newID=1>
<cfelse>
	<cfset newID=#getID.maxID#+1>
</cfif>

<CFquery datasource="#ds#" name="insertQ">
INSERT INTO tblTopics
(tName,tUsrID,tDateTime)
VALUES
('#form.tName#',#user#,#CreateODBCDateTime(now())#)
</CFQUERY>

</cftransaction>
<br><br><br>
<div align="center">Topic Added
<br><br>
<meta http-equiv="refresh" content="0;url=topics.cfm">
</div>
</body>
</html>
