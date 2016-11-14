<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
<LINK REL=stylesheet HREF="../style.css" TYPE="text/css">
</head>

<body>
<br><br>
Edit Topic
<br><hr>
<cfinclude template="../Queries/qry_topic.cfm">
<cfoutput query="topic">
<form name="form1" action="topic_update.cfm?tid=#tid#" method="post">
<input type="text" name="tName" size="45" value="#tName#"><br>
<input type="submit" value="Save Changes >>">
</form>
</cfoutput>
</body>
</html>
