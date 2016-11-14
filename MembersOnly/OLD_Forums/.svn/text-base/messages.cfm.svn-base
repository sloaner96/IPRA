<cfmodule template="#Application.header#" section="0" sectiontitle="IPRA Members Forum">
<cfinclude template="Queries/qry_topic.cfm">
<cfinclude template="Queries/qry_thread.cfm">
<cfinclude template="Queries/qry_messages.cfm">
<cfoutput>
<table cellpadding="5" cellspacing="0" border="1" width="100%">
<tr>
	<td colspan="2" bgcolor="##003366" align="center">
	<cfloop query="topic">
	<br><font class="bigfont"><strong>#tName#</strong></font>
	</cfloop>
	<br>
	<cfloop query="thread">
	<br><strong><font color="##FFFFFF">#thName#</font></strong><br>
	</cfloop>
</td>
</tr>
<tr bgcolor="##003366">
	<td colspan="2" align="right">
		<table cellpadding="5" cellspacing="2">
		<tr>
			<td align="center" bgcolor="gray"><a href="threads.cfm?tid=#tid#"><strong><font class="lightfont">Back to Threads</font></strong></a></td>
			<td align="center" bgcolor="gray"><a href="message_add.cfm?thID=#thID#&tid=#tid#"><strong><font class="lightfont">Post New Message</font></strong></a></td>
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
	<table cellpadding="2" cellspacing="2">
		<tr>
			<td align="center" bgcolor="gray"><a href="message_reply.cfm?msgID=#msgID#&thID=#thID#&tid=#tid#"><font class="lightfont">Reply</font></a></a></td>
			<cfset user=Session.UserInfo.MemberID>
			<cfif authorID eq user>
			<td align="center" bgcolor="gray"><a href="message_edit.cfm?msgID=#msgID#&thID=#thID#&tid=#tid#"><font class="lightfont">Edit</font></a></a></td>
			<td align="center" bgcolor="gray"><a href="message_delete.cfm?msgID=#msgID#&thID=#thID#&tid=#tid#" onClick="return confirm('Are you sure you want to permanently delete this message?');"><font class="lightfont">Delete</font></a></td>
			</cfif>
		</tr>
	</table>
	</td>
</tr>
</cfloop>
<tr bgcolor="##003366">
	<td colspan="2" align="right">
		<table cellpadding="5" cellspacing="2">
		<tr>
			<td align="center" bgcolor="gray"><a href="threads.cfm?tid=#tid#"><strong><font class="lightfont">Back to Threads</font></strong></a></td>
			<td align="center" bgcolor="gray"><a href="message_add.cfm?thID=#thID#&tid=#tid#"><strong><font class="lightfont">Post New Message</font></strong></a></td>
		</tr>
		</table>
	</td>
</tr>
<tr bgcolor="white">
	<td colspan="2" align="right">
	<table cellpadding="5">
	<tr>
	<!--- <td align="center" bgcolor="gray" border="1"><a href="admin/index.cfm"><strong><font class="lightfont">admin</font></strong></a></td> --->
	<td align="center" bgcolor="gray" border="1"><a href="#home#" target="_top"><strong><font class="lightfont">Home</font></strong></a></td>
	</tr>
	</table>
	</td>
</tr>
</table>
</cfoutput>
<br><br>
<cfmodule template="#Application.footer#">