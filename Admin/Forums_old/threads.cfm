
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
<LINK REL=stylesheet HREF="../style.css" TYPE="text/css">
</head>

<body>
<br>
<cfinclude template="../Queries/qry_topic.cfm">
<cfinclude template="../Queries/qry_threads.cfm">
<cfoutput>
<table cellpadding="5" cellspacing="0" border="1">
<cfloop query="topic">
<tr>
	<td colspan="3" bgcolor="lightgrey" align="center"><br><font class="bigfont"><strong>#tName#</strong></font></td>
</tr>
</cfloop>
<tr bgcolor="lightgrey">
	<td colspan="3" align="right">
		<table cellpadding="5" cellspacing="2">
		<tr>
			<td align="center" bgcolor="gray"><a href="topic_edit.cfm?tid=#tid#"><font class="lightfont"><strong>edit topic</strong></font></a></td>
			<td align="center" bgcolor="gray"><a href="topic_delete.cfm?tid=#tid#" onClick="return confirm('Are you sure you want to permanently delete this topic?');"><font class="lightfont"><strong>delete topic</strong></font></a></td>
			<td align="center" bgcolor="gray"><a href="topics.cfm"><strong><font class="lightfont">back</font></strong></a></td>
			<td align="center" bgcolor="gray"><a href="thread_add.cfm?tID=#tID#"><strong><font class="lightfont">new thread</font></strong></a></td>
		</tr>
		</table>
	</td>
</tr>
<tr>
	<td colspan="3"><br></td>
</tr>
<tr bgcolor="lightgrey">
	<td><strong>thread</strong></td>
	<td><strong>messages</strong></td>
	<td><strong>most recent post</strong></td>
</tr>
<cfif threads.recordcount eq 0>
<tr>
	<td colspan="3" align="center"><br>No Threads Posted<br><br></td>
</tr>
</cfif>
<cfloop query="threads">
<cfset thID="#thID#">
<cfinclude template="thread_stats.cfm">
<tr>
	<td><a href="messages.cfm?thID=#thID#&tid=#tid#"><strong>#thName#</strong></a></td>
	<td align="center"><strong>#thMC#</strong>&nbsp;</td>
	<td align="center"><strong>#dRM# #tRM#</strong>&nbsp;</td>
</tr>
</cfloop>
<tr bgcolor="lightgrey">
	<td colspan="3" align="right">
		<table cellpadding="5" cellspacing="2">
		<tr>
			<td align="center" bgcolor="gray"><a href="topic_edit.cfm?tid=#tid#"><font class="lightfont"><strong>edit topic</strong></font></a></td>
			<td align="center" bgcolor="gray"><a href="topic_delete.cfm?tid=#tid#" onClick="return confirm('Are you sure you want to permanently delete this topic?');"><font class="lightfont"><strong>delete topic</strong></font></a></td>
			<td align="center" bgcolor="gray"><a href="topics.cfm"><strong><font class="lightfont">back</font></strong></a></td>
			<td align="center" bgcolor="gray"><a href="thread_add.cfm?tID=#tID#"><strong><font class="lightfont">new thread</font></strong></a></td>
		</tr>
		</table>
	</td>
</tr>
</table>
</cfoutput>
</body>
</html>
