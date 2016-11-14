<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
<LINK REL=stylesheet HREF="../style.css" TYPE="text/css">
</head>

<body>
<br><br>
<strong>Post a new Message</strong>
<br><hr>
<cfoutput>
<form name="form1" action="message_insert.cfm?thID=#thID#&tid=#tid#" method="post">
Message Title:<br>
<input type="text" name="msgName" size="45"><br><br>
Message:<br>
<textarea name="msgMessage" cols="35" rows="12" wrap="physical"></textarea>
<br>
<input type="submit" value="Post Message >>">
</form>
</cfoutput>
</body>
</html>
