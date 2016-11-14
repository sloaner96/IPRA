<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
<LINK REL=stylesheet HREF="../style.css" TYPE="text/css">
</head>

<body>
<br><br>
<strong>Respond to Message</strong>
<br><hr>
<cfinclude template="../Queries/qry_message.cfm">
<cfloop query="message">
	<cfset ReplyTitle=#msgName#>
	<cfset ReplyMessage=#msgMessage#>
</cfloop>
<cfoutput>
<form name="form1" action="message_re_insert.cfm?thID=#thID#&tid=#tid#" method="post">
<input type="hidden" name="replyMessage" value="#ReplyMessage#">
Message Title:<br>
<input type="text" name="msgName" size="45" value="re: #ReplyTitle#"><br><br>
Message:<br>
<textarea name="msgMessage" cols="35" rows="12" wrap="physical"></textarea>
<br>
<input type="submit" value="Post Message >>">
</form>
</cfoutput>
</body>
</html>
