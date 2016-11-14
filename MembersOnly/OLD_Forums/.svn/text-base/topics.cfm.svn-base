
<cfinclude template="queries/qry_topics.cfm">
<cfmodule template="#Application.header#" section="0" sectiontitle="IPRA Members Forum">
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
					  <table cellpadding="5" cellspacing="0" border="1" width="100%" class="regtext">
							<tr bgcolor="##003366">
								<td colspan="4">
								<div align="center"><font class="bigfont"><strong>- DISCUSSION TOPICS -</strong></font>
								</div><br>
								<div align="center"><font color="##FFFFFF">Please click on the name of a topic to participate in that discussion</font></div></td>
							</tr>
							<tr>
								<td colspan="4"><br></td>
							</tr>
							<tr bgcolor="##003366">
								<td><strong><font color="##FFFFFF">Topic</font></strong></td>
								<td><strong><font color="##FFFFFF">Threads</font></strong></td>
								<td><strong><font color="##FFFFFF">Messages</font></strong></td>
								<td><strong><font color="##FFFFFF">Most Recent Post</font></strong></td>
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
								<td><a href="threads.cfm?tID=#tID#"><strong>#tName#</strong></a>&nbsp;</td>
								<td align="center"><strong>#tThC#</strong>&nbsp;</td>
								<td align="center"><strong>#tMC#</strong>&nbsp;</td>
								<td align="center"><strong>#dRM# #tRM#</strong>&nbsp;</td>
							</tr>
							</cfloop>
							<tr bgcolor="##003366">
								<td colspan="4" align="right">
									<table cellpadding="5">
										<tr>
										<td>&nbsp;</td>
										<!---<td align="center" bgcolor="gray" border="1"><a href="topic_add.cfm"><strong><font class="lightfont">new topic</font></strong></a></td>--->
										<td>&nbsp;</td>
										</tr>
									</table>
								</td> 
							</tr>
							<tr bgcolor="white">
								<td colspan="4" align="right">
								<table cellpadding="5">
									<tr>
										<!--- <td align="center" bgcolor="gray" border="1"><a href="admin/index.cfm"><strong><font class="lightfont">admin</font></strong></a></td> --->
										<td align="center" bgcolor="gray" border="1"><a href="#home#" target="_top"><strong><font class="lightfont">Home</font></strong></a></td>
									</tr>
								</table>
								</td>
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
