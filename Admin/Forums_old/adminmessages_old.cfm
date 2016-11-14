<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
<LINK REL=stylesheet HREF="../style.css" TYPE="text/css">
</head>

<body>
<br>
<cfinclude template="../Queries/qry_topic.cfm">
<cfinclude template="../Queries/qry_thread.cfm">
<cfinclude template="../Queries/qry_messages.cfm">
<cfoutput>
<table cellpadding="5" cellspacing="0">
<tr>
	<td colspan="5" bgcolor="lightgrey" align="center">
	<cfloop query="topic">
	<br><font class="bigfont"><strong>#tName#</strong></font>
	</cfloop>
	<br>
	<cfloop query="thread">
	<br><strong>#thName#</strong><hr>
	</cfloop>
</td>
</tr>
<tr bgcolor="lightgrey">
	<td>&nbsp;</td>
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
<tr>
	<td colspan="3"><br></td>
</tr>
<cfif messages.recordcount eq 0>
<tr>
	<td colspan="5" align="center"><br>No Messages Posted<br><br></td>
</tr>
</cfif>

<cfloop query="messages">
<!--- msgID is already set from query output --->
<cfinclude template="message_detail.cfm">
<tr bgcolor="lightgrey">
	<td><strong>#title#</strong></td>
	<td>|&nbsp;&nbsp;<strong>posted on #d# at #t#</strong></td>
	<td>|&nbsp;&nbsp;<strong>by #author#</strong></td>
</tr>
<tr>
	<td colspan="3"><font class="regfont">#message#</font><br><br></td>
</tr>
<tr>
	<td colspan="3">
		<table cellpadding="5" cellspacing="2">
		<tr>
			<td align="center" bgcolor="gray"><a href="message_reply.cfm?msgID=#msgID#&thID=#thID#&tid=#tid#"><font class="lightfont">reply</font></a></a></td>
			<td align="center" bgcolor="gray"><a href="message_edit.cfm?msgID=#msgID#&thID=#thID#&tid=#tid#"><font class="lightfont">edit</font></a></a></td>
			<td align="center" bgcolor="gray"><a href="message_delete.cfm?msgID=#msgID#&thID=#thID#&tid=#tid#" onClick="return confirm('Are you sure you want to permanently delete this message?');"><font class="lightfont">delete</font></a></td>
		</tr>
		</table>
	</td>
</tr>
<tr>
	<TD COLSPAN="3">&nbsp;</TD>
</tr>
</cfloop>
<tr>
	<td colspan="3"><hr></td>
</tr>
<tr bgcolor="lightgrey">
	<td>&nbsp;</td>
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
