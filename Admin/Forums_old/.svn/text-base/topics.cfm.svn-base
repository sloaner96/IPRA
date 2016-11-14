
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
<LINK REL=stylesheet HREF="../style.css" TYPE="text/css">
</head>

<body>
<br>
<cfinclude template="../Queries/qry_topics.cfm">
<cfoutput>
<table cellpadding="5" cellspacing="0" border="1">
<tr bgcolor="lightgrey">
	<td colspan="3" align="Center"><font class="bigfont"><strong>- DISCUSSION TOPICS -</strong></font></td>
	<td align="right">
		<table cellpadding="5" cellspacing="2">
			<tr>
			<td align="right" bgcolor="gray" border="1"><a href="help.pdf" target="_new"><strong><font class="lightfont">help</font></strong></a></td>
			<td align="right" bgcolor="gray" border="1"><a href="topic_add.cfm"><strong><font class="lightfont">new topic</font></strong></a></td>
			</tr>
		</table>
	</td> 
</tr>
<tr>
	<td colspan="4"><br></td>
</tr>
<tr bgcolor="lightgrey">
	<td><strong>topic</strong></td>
	<td><strong>threads</strong></td>
	<td><strong>messages</strong></td>
	<td><strong>most recent post</strong></td>
</tr>
<cfif topics.recordcount eq 0>
<tr>
	<td colspan="4" align="center"><br>No Topics Listed<br><br></td>
</tr>
</cfif>
<cfloop query="topics">
<cfset tid="#tID#">
<cfinclude template="topic_stats.cfm">
<tr>
	<td><a href="threads.cfm?tID=#tID#"><strong>#tName#</strong>&nbsp;</a></td>
	<td align="center"><strong>#tThC#</strong>&nbsp;</td>
	<td align="center"><strong>#tMC#</strong>&nbsp;</td>
	<td align="center"><strong>#dRM# #tRM#</strong>&nbsp;</td>
</tr>
</cfloop>
<tr bgcolor="lightgrey">
	<td colspan="4" align="right">
		<table cellpadding="5" cellspacing="2">
			<tr>
			<td align="right" bgcolor="gray" border="1"><a href="topic_add.cfm"><strong><font class="lightfont">new topic</font></strong></a></td>
			</tr>
		</table>
	</td> 
</tr>
</cfoutput>
</table>
</body>
</html>
