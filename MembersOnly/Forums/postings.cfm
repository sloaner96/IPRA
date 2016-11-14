<cfparam name="URL.GID" default="0">
<cfparam name="URL.CID" default="0">
 <cfparam name="url.nstart" default="1">
 
<cfset getCat = request.forumComponent.GetCategoryInfo(URL.CID)>

<cfset getPosts = request.forumComponent.getCategoryMessages(URL.CID)>
<cfmodule template="#Application.header#" section="0" sectiontitle="IPRA FORUMS">

  <cfoutput>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="150"><br>
	         <cfmodule template="#Application.tagdir#/MemberonlyNav.cfm" level="3">
		   </td>
		   <td valign="top"><br>
			  <table border="0" cellpadding="5" cellspacing="0">
		        <tr>
		          <td><h3>#getCat.CategoryName#</h3>#getCat.CategoryDesc#</td>
		        </tr>
		      </table><br>
			  <div style="padding-bottom:10px;"><a href="newPost.cfm?CID=#getCat.CategoryID#"><img src="/images/btn_addpost.gif" width="87" height="18" alt="Add New Post" border="0"></a></div>
			 
			  <!--- Set the number of rows per page --->
				<cfset RowsPerPage = 5>
				<!--- Set total records pulled --->
				<cfset TotalRows = getPosts.recordcount>
				<!--- Set the endrow --->
				<cfset EndRow = Min(url.Nstart + RowsPerPage - 1, TotalRows)>
				<!--- Set next row to start at --->
				<cfset StartRowNext = EndRow + 1>
				<!--- set back row to start at --->
				<cfset StartRowback = Url.nstart - RowsPerPage>  
				<cfif getPosts.recordcount GT RowsPerPage> 
			     <cfoutput>
					 <table border="0" cellpadding="4" cellspacing="0" width="100%">
						   <tr bgcolor="##a9a9a9">
						     <td align="center">
						       <table border="0" cellpadding="0" cellspacing="0" width="100%">
				                 <tr>
				                   <td><font face="verdana" size="-2">Displaying <strong>#Url.nstart#</strong> to <strong>#EndRow#</strong> of <strong>#TotalRows#</strong></font></td>
				                 </tr>
				               </table> 
						     </td>
								 <td align="right">
								   <table border="0" cellpadding="3" cellspacing="0" align="right">
					                  <tr>
									   <cfif startrowBack GT 0>
					                     <td align="right"><a href="#CGI.ScriptName#?nstart=#StartRowBack#&CID=#getCat.CategoryID#"><font face="verdana" size="-2"><< BACK</font></a></td>
									   </cfif>
									   <cfif StartRowNext LT TotalRows>
										 <td align="right"><a href="#CGI.ScriptName#?nstart=#StartRowNext#&CID=#getCat.CategoryID#"><font face="verdana" size="-2">NEXT >></font></a></td>
									   </cfif>	
					                  </tr>
					                </table>
								</td>
						   </tr>
			         </table>  
				 </cfoutput>	
			  </cfif>	  
			  <table border="0" cellpadding="4" cellspacing="1" width="100%" bgcolor="##cecece">
					  <tr bgcolor="##cc9900">
	                     <td colspan="5"><strong style="color:##003366;font-size:12px;">Topics</strong></td>
	                  </tr>
					  <tr bgcolor="##eeeeee">
	                      <td><strong style="color:##828282;">Thread</strong></td>
	                      <td><strong style="color:##828282;">Last Post</strong></td>
						  <td><strong style="color:##828282;">Replies</strong></td>
						  <td><strong style="color:##828282;">Views</strong></td>
					  </tr>
					  <cfloop query="getPosts" startrow="#url.nstart#" endrow="#EndRow#">
						  <tr bgcolor="##ffffff">
							  <td width="300">
							     <table border="0" cellpadding="3" cellspacing="0" width="100%">
                                   <tr>
                                      <td width="23" valign="top"><cfif getPosts.IsSticky EQ 1><img src="/images/topic-pinned_notread.gif" width="23" height="23" alt=""><cfelse><img src="/images/topic_notread.gif" width="23" height="23" alt="Unread post"></cfif></td>
									  <cfset MessageBody = REReplaceNoCase(getPosts.MsgBody, "<[^>]*>", "", "ALL")>
									  <td valign="top"><a href="Threads.cfm?PID=#getPosts.PostingID#&CID=#getCat.CategoryID#"><strong>#getPosts.MsgSubject#</strong></a><br><span style="font-size:10px;color:##727272;">#Left(MessageBody,40)#<cfif Len(MessageBody) GT 40>...</cfif></span></td>
                                   </tr>
                                 </table>
							  </td>
							  <td><cfif getPosts.LastPost NEQ "">#DateFormat(getPosts.LastPost, 'MM/DD/YYYY')# at #TimeFormat(getPosts.LastPost, 'hh:mm TT')#<cfelse>None</cfif></td>
							  <td>#getPosts.NumReplies#</td>
							  <td>#getPosts.ViewNum#</td>
		                  </tr>
					  </cfloop>
	              </table>
			   <br><br>
		   </td>
        </tr>
   </table>  
 </cfoutput>
<cfmodule template="#Application.footer#">