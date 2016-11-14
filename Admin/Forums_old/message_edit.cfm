<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
<LINK REL=stylesheet HREF="../style.css" TYPE="text/css">
</head>

<body>
<br><br>
<strong>Edit Message</strong>
<br><hr>
<cfinclude template="../Queries/qry_message.cfm">
<cfoutput>
<cfloop query="message">
<cfset user= Session.Userinfo.MemberID>
<cfif msgUsrID eq #user#>
	<!--- parse message and replace html line breaks --->
	<cfset Title=#msgName#>
	<cfset Message=#replace(msgMessage,'<br>',chr(10),'all')#>
	<form name="form1" action="message_update.cfm?msgID=#msgID#&thID=#thID#&tid=#tid#" method="post">
	Message Title:<br>
	<input type="text" name="msgName" size="45" value="#Title#"><br><br>
	Message:<br>
	<textarea name="msgMessage" cols="35" rows="12" wrap="physical">#Message#</textarea>
	<br>
	<input type="submit" value="Update Message >>">
	</form>
<cfelse>
<br><br><br>
	<div align="center"><strong>SECURITY ERROR: You may only edit your own messages.</strong></div>
</cfif>
</cfloop>
</cfoutput>
</body>
</html>
