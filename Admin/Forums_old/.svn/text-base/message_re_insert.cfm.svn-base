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
<cfset form.msgMessage="<blockquote><hr>#form.replyMessage#<hr></blockquote>#form.msgMessage#">

<cfset user= Session.Userinfo.MemberID>
<cftransaction>

<cfquery datasource="#ds#" name="getID">
SELECT MAX(msgID) as maxID
FROM tblMessages
</cfquery>

<cfif getID.maxID eq "">
	<cfset newID=1>
<cfelse>
	<cfset newID=#getID.maxID#+1>
</cfif>

<CFquery datasource="#ds#" name="insert">
INSERT INTO tblMessages
(
msgID,
msgThID,
msgName,
msgMessage,
msgUsrID,
msgDateTime
)
VALUES
(
#newID#,
#thID#,
'#form.msgName#',
'#form.msgMessage#',
#user#,
#CreateODBCDateTime(now())#
)
</CFQUERY>

</cftransaction>
<cfoutput>
<br><br><br>
<div align="center">Message Posted
<br><br>
<meta http-equiv="refresh" content="0;url=messages.cfm?thid=#ThID#&tid=#tid#">
</div>
</cfoutput>
</body>
</html>
