<cfparam name="URL.GID" default="0">
<cfparam name="URL.CID" default="0">
<cfparam name="URL.PID" default="0">
<cfparam name="URL.AID" default="0">
<cfparam name="url.nstart" default="1">

<cfset getCat = request.forumComponent.GetCategoryInfo(URL.CID)>

<cfif URL.AID EQ 0>
  <cfset MainThread = URL.PID>
<cfelse>
  <cfset MainThread = URL.AID>
</cfif>

<cfset getMainThread = request.forumComponent.getMessage(MainThread)>
<cfset setviewcount = request.forumComponent.IncrementThread(MainThread)>

<cfset getThreads = request.forumComponent.getThreads(MainThread)>

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
		          <td><h3><a href="index.cfm" style="text-decoration:none; color:##003366;">#GetCat.GroupName#</a> > <a href="Postings.cfm?GID=#getCat.GroupID#&CID=#getCat.CategoryID#"  style="text-decoration:none; color:##003366;">#GetCat.CategoryName#</a> > #getMainThread.MsgSubject#</h3></td>
		        </tr>
		      </table><br>
			  
			 
			  <!--- Set the number of rows per page --->
				<cfset RowsPerPage = 10>
				<!--- Set total records pulled --->
				<cfset TotalRows = getThreads.recordcount>
				<!--- Set the endrow --->
				<cfset EndRow = Min(url.Nstart + RowsPerPage - 1, TotalRows)>
				<!--- Set next row to start at --->
				<cfset StartRowNext = EndRow + 1>
				<!--- set back row to start at --->
				<cfset StartRowback = Url.nstart - RowsPerPage> 
				<cfif getThreads.recordcount GT RowsPerPage>  
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
					                     <td align="right"><a href="#CGI.ScriptName#?nstart=#StartRowBack#&PID=#getMainThread.postingID#&CID=#getMainThread.CategoryID#"><font face="verdana" size="-2"><< BACK</font></a></td>
									   </cfif>
									   <cfif StartRowNext LT TotalRows>
										 <td align="right"><a href="#CGI.ScriptName#?nstart=#StartRowNext#&PID=#getMainThread.postingID#&CID=#getMainThread.CategoryID#"><font face="verdana" size="-2">NEXT >></font></a></td>
									   </cfif>	
					                  </tr>
					                </table>
								</td>
						   </tr>
			         </table>  
				 </cfoutput>	
			  </cfif>	
			  <table border="0" cellpadding="0" cellspacing="1" width="100%" bgcolor="##cecece">
				<cfloop query="getMainThread">
				       <!--- Get Person Who Posted --->
				      <cfif getMainThread.AdminPost EQ 0>
					      <cfset GetMember = request.forumComponent.GetMemberInfo(getMainThread.CreatedBy)>
					  <cfelse>
					      <cfset GetAdmin = request.forumComponent.GetAdminInfo(getMainThread.CreatedBy)>
					  </cfif>
					<tr bgcolor="##cc9900">
		                <td style="padding-top:5px; padding-bottom:5px;" colspan="2">
						 <table border="0" cellpadding="0" cellspacing="0" width="100%">
                           <tr>
                             <td><strong style="color:##003366;font-size:12px;"><cfif getMainThread.LastUpdated NEQ "">Updated On #DateFormat(getMainThread.LastUpdated, 'MM/DD/YYYY')# at #TimeFormat(getMainThread.LastUpdated, 'hh:mm tt')#<cfelse>Created on #DateFormat(getMainThread.DateAdded, 'MM/DD/YYYY')# #TimeFormat(getMainThread.DateAdded, 'hh:mm tt')#</cfif></strong></td>
		                       <td align="right">
							      <table border="0" cellpadding="3" cellspacing="0">
					                <tr>
									  <cfif getMainThread.IsSticky EQ 0><td><a href="replypost.cfm?CID=#URL.CID#&PID=#MainThread#&AID=#MainThread#"><img src="/images/btn_reply.gif" width="68" height="18" alt="Reply to Posting" border="0"></a></td></cfif>
									  <cfif getMainThread.CreatedBy EQ Session.UserInfo.MemberID OR IsDefined("Session.AdminInfo")>
									    <td><a href="editmessage.cfm?PID=#getMainThread.postingID#&CID=#getMainThread.CategoryID#"><img src="/images/btn_EditPost.gif" width="68" height="18" alt="Edit Posting"  border="0"></a></td>
										<td><a href="updatemessage.cfm?action=delete&PID=#getMainThread.postingID#" onclick="if (! confirm('Are you sure you would like to delete this post? Doing this will delete all children threads.')) return false;"><img src="/images/btn_deletepost.gif" width="68" height="18" alt="Delete Posting"  border="0"></a></td>
									  </cfif>
					                </tr>
					              </table>
							   </td>
                             </tr>
                          </table>   
			           </td>
		            </tr>
					<tr bgcolor="##ffffff">
						<cfif getMainThread.AdminPost EQ 0> 
							<td width="20%" style="padding-top:5px; padding-bottom:5px;">
							   <table border="0" cellpadding="4" cellspacing="0" width="100%">
		                          <tr>
		                             <td><strong>#GetMember.Firstname# #GetMember.Lastname#</strong></td>
									 <td></td>
		                          </tr>
								  <cfif GetMember.MembershipBegin GT 0>
									  <tr>
			                             <td>Member Since #DateFormat(GetMember.MembershipBegin, 'MM/DD/YYYY')#</td>
										 <td></td>
			                          </tr>
								  </cfif>
								   <tr>
		                             <td><a href="MemberPosts.cfm?memberID=#GetMember.MemberID#">Posts: #GetMember.PostCount#</a></td>
									 <td></td>
		                          </tr>
		                       </table><br><br>
							</td>
						<cfelse>
						  <td width="20%" style="padding-bottom:5px;" valign="top">
						    <table border="0" cellpadding="4" cellspacing="0" width="100%">
	                           <tr>
	                              <td><strong>#GetAdmin.Firstname# #GetAdmin.Lastname#</strong><br>- Forum Admin</td>
	                           </tr>
							   <tr>
	                              <td></td>
	                           </tr>
	                        </table><br><br>
						  </td>
						</cfif>
						<td width="80%" valign="top">
						  <table border="0" cellpadding="4" cellspacing="0" width="100%">
	                         <tr bgcolor="##eeeeee">
	                            <td><strong style="font-size:14px;">#getMainThread.MsgSubject#</strong></td>
	                         </tr>
							 <tr>
	                            <td>#replaceNoCase(getMainThread.MsgBody, "#chr(13)##chr(10)#", "<br>", "ALL")#</td>
	                         </tr>
	                      </table> <br><br>
						</td>
			        </tr>
				</cfloop>
				<cfloop query="getThreads" startrow="#url.nstart#" endrow="#EndRow#">
				       <!--- Get Person Who Posted --->
				      <cfif getThreads.AdminPost EQ 0>
					      <cfset GetThreadMember = request.forumComponent.GetMemberInfo(getThreads.CreatedBy)>
					  <cfelse>
					      <cfset GetThreadAdmin = request.forumComponent.GetAdminInfo(getThreads.CreatedBy)>
					  </cfif>
					<tr bgcolor="##b3cad0">
		                <td style="padding-top:5px; padding-bottom:5px;" colspan="2">
						 <table border="0" cellpadding="0" cellspacing="0" width="100%">
                           <tr>
                             <td><strong style="color:##003366;font-size:12px;"><cfif getThreads.LastUpdated NEQ "">Updated on #DateFormat(getThreads.LastUpdated, 'MM/DD/YYYY')# at #TimeFormat(getThreads.LastUpdated, 'hh:mm tt')#<cfelse>Created on #DateFormat(getThreads.DateAdded, 'MM/DD/YYYY')# #TimeFormat(getThreads.DateAdded, 'hh:mm tt')#</cfif></strong></td>
		                       <td align="right">
							      <table border="0" cellpadding="3" cellspacing="0">
					                <tr>
									  <cfif getThreads.IsSticky EQ 0><td><a href="replypost.cfm?CID=#URL.CID#&PID=#getThreads.PostingID#&AID=#getThreads.ParentID#"><img src="/images/btn_reply.gif" width="68" height="18" alt="Reply to posting" border="0"></a></td></cfif>
									  <cfif getThreads.CreatedBy EQ Session.UserInfo.MemberID OR IsDefined("Session.AdminInfo")>
									    <td><a href="editmessage.cfm?PID=#getThreads.postingID#&CID=#getThreads.CategoryID#"><img src="/images/btn_EditPost.gif" width="68" height="18" alt="Edit Posting"  border="0"></a></td>
										<td><a href="updatemessage.cfm?action=delete&PID=#getThreads.postingID#" onclick="if (! confirm('Are you sure you would like to delete this post?')) return false;"><img src="/images/btn_deletepost.gif" width="68" height="18" alt="Delete Posting"  border="0"></a></td>
									  </cfif>
					                </tr>
					              </table>
							   </td>
                             </tr>
                          </table>   
			           </td>
		            </tr>
					<tr bgcolor="##ffffff">
						<cfif getThreads.AdminPost EQ 0> 
							<td width="20%" style="padding-top:5px; padding-bottom:5px;">
							   <table border="0" cellpadding="4" cellspacing="0" width="100%">
		                          <tr>
		                             <td><strong>#GetThreadMember.Firstname# #GetThreadMember.Lastname#</strong></td>
									 <td></td>
		                          </tr>
								  <cfif GetThreadMember.MembershipBegin GT 0>
									  <tr>
			                             <td>Member Since #DateFormat(GetThreadMember.MembershipBegin, 'MM/DD/YYYY')#</td>
										 <td></td>
			                          </tr>
								  </cfif>
								   <tr>
		                             <td><a href="MemberPosts.cfm?memberID=#GetMember.MemberID#">Posts: #GetThreadMember.PostCount#</a></td>
									 <td></td>
		                          </tr>
		                       </table><br><br>
							</td>
						<cfelse>
						  <td width="20%" style="padding-bottom:5px;" valign="top">
						    <table border="0" cellpadding="4" cellspacing="0" width="100%">
	                           <tr>
	                              <td><strong>#GetThreadAdmin.Firstname# #GetThreadAdmin.Lastname#</strong><br>- Forum Admin</td>
	                           </tr>
							   <tr>
	                              <td></td>
	                           </tr>
	                        </table><br><br>
						  </td>
						</cfif>
						<td width="80%" valign="top">
						  <table border="0" cellpadding="4" cellspacing="0" width="100%">
	                         <tr bgcolor="##eeeeee">
	                            <td><strong style="font-size:14px;">#getThreads.MsgSubject#</strong></td>
	                         </tr>
							 <tr>
	                            <td>#replaceNoCase(getThreads.MsgBody, "#chr(13)##chr(10)#", "<br>", "ALL")#</td>
	                         </tr>
	                      </table> <br><br>
						</td>
			        </tr>
				</cfloop>
	          </table>
			  <br><br>
		   </td>
        </tr>
   </table>  
 </cfoutput>
<cfmodule template="#Application.footer#">