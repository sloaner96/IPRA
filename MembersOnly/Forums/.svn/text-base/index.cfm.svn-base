

<cfmodule template="#Application.header#" section="0" sectiontitle="IPRA FORUMS">
<cfset GetGroups = request.forumComponent.GetGroups()>

  <cfoutput>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="150"><br>
	         <cfmodule template="#Application.tagdir#/MemberonlyNav.cfm" level="3">
		   </td>
		   <td valign="top"><br>
			  <table border="0" cellpadding="5" cellspacing="0">
		        <tr>
		          <td><h3>IPRA FORUMS</h3></td>
		        </tr>
				<tr>
				  <td>The NEW and Improved IPRA Forums is a way for members to pose questions to their peers and gain insite into the world of Parks and Recreation from others.</td>
				</tr>
		      </table><br>
			  <cfform name="search" action="search.cfm" method="POST" scriptsrc="/scripts/cfform.js">
				  <table border="0" cellpadding="0" cellspacing="0" width="100%">
	                <tr>
	                   <td align="right">SEARCH: <cfinput type="text" name="keywords" value="" required="YES" message="You must include a keyword"> <input type="submit" name="submit" value="go"/></td>
	                </tr>
	              </table>
			  </cfform>
			  <cfloop query="getGroups">
			     <cfset getCat = request.forumComponent.GetCategories(GetGroups.GroupID)>
				  <table border="0" cellpadding="4" cellspacing="1" width="100%" bgcolor="##cecece">
					  <tr bgcolor="##cc9900">
	                     <td colspan="5"><strong style="color:##003366;font-size:12px;">#getGroups.GroupName#</strong></td>
	                  </tr>
					  <tr bgcolor="##eeeeee">
	                      <td><strong style="color:##828282;">Forums</strong></td>
	                      <td><strong>Last Post</strong></td>
						  <td><strong>Threads</strong></td>
						  <td><strong>Posts</strong></td>
					  </tr>
					  <cfloop query="getCat">
					    <cfif getCat.LastPostID NEQ "">
					     <cfset LastPost = request.forumComponent.getMessage(LastPostID)>
		                </cfif>
						  <tr bgcolor="##ffffff">
							  <td width="300">
							     <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                   <tr>
                                      <td width="40"><img src="/images/forum_status.gif" border="0" align="top"></td>
									  <td><a href="postings.cfm?GID=#getGroups.GroupID#&CID=#getCat.CategoryID#"><strong>#getCat.CategoryName#</strong></a><br><span style="font-size:10px;color:##4e4e4e;">#getCat.CategoryDesc#</span></td>
                                   </tr>
                                 </table>
							  </td>
							  <td width="190"><cfif getCat.LastPostID NEQ ""><a href="Threads.cfm?CID=#LastPost.CategoryID#&<cfif LastPost.ParentID NEQ "">PID=#LastPost.ParentID#<cfelse>PID=#LastPost.PostingID#</cfif>">#Left(LastPost.MsgSubject, 25)#<cfif Len(LastPost.MsgSubject) GT 25>...</cfif></a><br>by #LastPost.MemberName#<br>#DateFormat(LastPost.DateAdded, 'MM/DD/YYYY')# #TimeFormat(LastPost.DateAdded, 'hh:mm tt')#<cfelse>No Posts</cfif></td>
							  <td>#getCat.ThreadCount#</td>
							  <td>#getCat.PostingCount#</td>
		                  </tr>
					  </cfloop>
	              </table><br>
			  </cfloop> 
			   <br><br>
		   </td>
        </tr>
   </table>  
</cfoutput>
<cfmodule template="#Application.footer#">