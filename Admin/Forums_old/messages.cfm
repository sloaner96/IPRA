<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
<LINK REL=stylesheet HREF="../style.css" TYPE="text/css">
</head>

<body>
<cfinclude template="../Queries/qry_topic.cfm">
<cfinclude template="../Queries/qry_thread.cfm">
<cfinclude template="../Queries/qry_messages.cfm">
<cfoutput>
<table cellpadding="5" cellspacing="0" border="1" width="100%">
<tr>
	<td colspan="2" bgcolor="lightgrey" align="center">
	<cfloop query="topic">
	<br><font class="bigfont"><strong>#tName#</strong></font>
	</cfloop>
	<br>
	<cfloop query="thread">
	<br><strong>#thName#</strong><br>
	</cfloop>
</td>
</tr>
<tr bgcolor="lightgrey">
	<td colspan="2" align="right">
		<table cellpadding="5" cellspacing="2">
		<tr>
			<td align="center" bgcolor="gray"><a href="thread_edit.cfm?thID=#thID#&tid=#tid#"><strong><font class="lightfont">edit thread</font></strong></a></td>
			<td align="center" bgcolor="gray"><a href="thread_delete.cfm?thID=#thID#&tid=#tid#" onClick="return confirm('Are you sure you want to permanently delete this thread?');"><font class="lightfont"><strong>delete thread</strong></font></a></td>
			<td align="center" bgcolor="gray"><a href="threads.cfm?tid=#tid#"><strong><font class="lightfont">back</font></strong></a></td>
			<td align="center" bgcolor="gray"><a href="message_add.cfm?thID=#thID#&tid=#tid#"><strong><font class="lightfont">post message</font></strong></a></td>
		</tr>
		</table>
	</td>
</tr>
<cfif messages.recordcount eq 0>
<tr>
	<td colspan="2" align="center"><br>No Messages Posted<br><br></td>
</tr>
</cfif>

<cfloop query="messages">
<!--- msgID is already set from query output --->
<cfinclude template="message_detail.cfm">
<tr>
	<td valign="top">
	<a href="mailto:#authorEmail#"><strong>#author#</strong></a>
	<br><br>
	#d#
	<br>
	#t#
	<br>
	</td>
	<td>
	<strong>#title#</strong>
	<br><br>
	<font class="regfont">#message#</font><br><br>
	<table cellpadding="5" cellspacing="2">
		<tr>
			<td align="center" bgcolor="gray"><a href="message_reply.cfm?msgID=#msgID#&thID=#thID#&tid=#tid#"><font class="lightfont">reply</font></a></a></td>
			<td align="center" bgcolor="gray"><a href="message_edit.cfm?msgID=#msgID#&thID=#thID#&tid=#tid#"><font class="lightfont">edit</font></a></a></td>
			<td align="center" bgcolor="gray"><a href="message_delete.cfm?msgID=#msgID#&thID=#thID#&tid=#tid#" onClick="return confirm('Are you sure you want to permanently delete this message?');"><font class="lightfont">delete</font></a></td>
		</tr>
		</table>
	</td>
</tr>
</cfloop>
<tr bgcolor="lightgrey">
	<td colspan="2" align="right">
		<table cellpadding="5" cellspacing="2">
		<tr>
			<td align="center" bgcolor="gray"><a href="thread_edit.cfm?thID=#thID#&tid=#tid#"><strong><font class="lightfont">edit thread</font></strong></a></td>
			<td align="center" bgcolor="gray"><a href="thread_delete.cfm?thID=#thID#&tid=#tid#" onClick="return confirm('Are you sure you want to permanently delete this thread?');"><font class="lightfont"><strong>delete thread</strong></font></a></td>
			<td align="center" bgcolor="gray"><a href="threads.cfm?tid=#tid#"><strong><font class="lightfont">back</font></strong></a></td>
			<td align="center" bgcolor="gray"><a href="message_add.cfm?thID=#thID#&tid=#tid#"><strong><font class="lightfont">post message</font></strong></a></td>
		</tr>
		</table>
	</td>
</tr>
</table>
</cfoutput>
</body>
</html>
