<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
<LINK REL=stylesheet HREF="style.css" TYPE="text/css">
</head>

<body>
<br><br>
<cfset user= Session.Userinfo.MemberID>
<cftransaction>

<cfquery datasource="#ds#" name="getID">
SELECT MAX(thID) as maxID
FROM tblThreads
</cfquery>

<cfif getID.maxID eq "">
	<cfset newID=1>
<cfelse>
	<cfset newID=#getID.maxID#+1>
</cfif>

<CFquery datasource="#ds#" name="insert">
INSERT INTO tblThreads
(

thTID,
thName,
thUsrID,
thDateTime
)
VALUES
(

#TID#,
'#form.thName#',
#user#,
#CreateODBCDateTime(now())#
)
</CFQUERY>

</cftransaction>
<cfoutput>
<br><br><br>
<div align="center">Thread Added
<br><br>
<meta http-equiv="refresh" content="0;url=message_th_add.cfm?tid=#TID#&thID=#newID#">
</div>
</cfoutput>
</body>
</html>
