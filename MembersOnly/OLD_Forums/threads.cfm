<cfinclude template="queries/qry_topics.cfm">
<cfinclude template="Queries/qry_topic.cfm">
<cfinclude template="Queries/qry_threads.cfm">

<cfmodule template="#Application.header#" section="0" sectiontitle="Members Forum > #topic.tName#">
  <cfoutput>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <!--- <td valign="top"><br>
	         <cfmodule template="#Application.tagdir#/certnav.cfm">
		   </td> --->
		   <td valign="top"><br>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>IPRA Members Forum</h3></td>
		        </tr>
		      </table>
			  <table border="0" cellpadding="6" cellspacing="0" width="100%">
		        <tr>
		           <td align="center" class="regtext">
					
					<table cellpadding="5" cellspacing="0" border="1" class="regtext" width="100%">
					<cfloop query="topic">
					<tr>
						<td colspan="3" bgcolor="##003366">
						<div align="center"><font class="bigfont"><strong>#tName#</strong></font></div>
						<br>
						<font color="##FFFFFF">Please click on the name of a thread to participate in that thread of discussion.
						<br><br>
						To start your own thread, please click "start new thread". After you have started the new thread you will be prompted to post the first message in the new thread.</font>
						</td>
					</tr>
					</cfloop>
					<tr bgcolor="##003366">
						<td colspan="3" align="right">
							<table cellpadding="5" cellspacing="2">
							<tr>
								<td align="center" bgcolor="gray"><a href="topics.cfm"><strong><font class="lightfont">Back to Topics</font></strong></a></td>
								<td align="center" bgcolor="gray"><a href="thread_add.cfm?tID=#tID#"><strong><font class="lightfont">Start New Thread</font></strong></a></td>
							</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td colspan="3"><br></td>
					</tr>
					<tr bgcolor="##003366">
						<td><strong><font color="##FFFFFF">Thread</font></strong></td>
						<td><strong><font color="##FFFFFF">Messages</font></strong></td>
						<td><strong><font color="##FFFFFF">Most Recent Post</font></strong></td>
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
					<tr bgcolor="##003366">
						<td colspan="3" align="right">
							<table cellpadding="5" cellspacing="2">
							<tr>
								<td align="center" bgcolor="gray"><a href="topics.cfm"><strong><font class="lightfont">back to topics</font></strong></a></td>
								<td align="center" bgcolor="gray"><a href="thread_add.cfm?tID=#tID#"><strong><font class="lightfont">start new thread</font></strong></a></td>
							</tr>
							</table>
						</td>
					</tr>
					<tr bgcolor="white">
						<td colspan="3" align="right">
						<table cellpadding="5">
						<tr>
						<!--- <td align="center" bgcolor="gray" border="1"><a href="admin/index.cfm"><strong><font class="lightfont">admin</font></strong></a></td> --->
						<td align="center" bgcolor="gray" border="1"><a href="#home#" target="_top"><strong><font class="lightfont">home</font></strong></a></td>
						</tr>
						</table>
						</td>
					</tr>
					</table>
			   <br><br>
		 </td>
     </tr>
</table>  
</cfoutput>
<cfmodule template="#Application.footer#">
