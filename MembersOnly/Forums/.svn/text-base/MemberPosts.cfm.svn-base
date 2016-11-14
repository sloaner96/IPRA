<cfparam name="URL.GID" default="0">
<cfparam name="URL.CID" default="0">
<cfparam name="URL.MemberID" default="0">

<cfset GetMember = request.forumComponent.GetMemberInfo(URL.MemberID)>

<cfset getCat = request.forumComponent.GetCategoryInfo(URL.CID)>

<cfset getPosts = request.forumComponent.getMemberMessages(GetMember.MemberID)>

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
		          <td><h3>#GetMember.Firstname# #GetMember.Lastname#'s Postings</h3></td>
		        </tr>
		      </table><br>
			  <table border="0" cellpadding="4" cellspacing="1" width="100%" bgcolor="##cecece">
					  <tr bgcolor="##cc9900">
	                     <td colspan="5"><strong style="color:##003366;font-size:12px;">Topics</strong></td>
	                  </tr>
					  <tr bgcolor="##eeeeee">
	                      <td><strong style="color:##828282;">Thread</strong></td>
						  <td><strong style="color:##828282;">Categories</strong></td>
	                      <td><strong style="color:##828282;">Last Post</strong></td>
						  <td><strong style="color:##828282;">Replies</strong></td>
						  <td><strong style="color:##828282;">Views</strong></td>
					  </tr>
					  <cfloop query="getPosts">
					    <cfset MessageBody = REReplaceNoCase(getPosts.MsgBody, "<[^>]*>", "", "ALL")>
						<tr bgcolor="##ffffff">
						  <td><a href="Threads.cfm?PID=<cfif getPosts.ParentID NEQ "">#getPosts.ParentID#<cfelse>#getPosts.PostingID#</cfif>&CID=#getPosts.CategoryID#"><strong>#getPosts.MsgSubject#</strong></a><br><span style="font-size:10px;color:##727272;">#Left(MessageBody,40)#<cfif Len(MessageBody) GT 40>...</cfif></span></td>
						  <td>#getPosts.CatName#</td>
						  <td>#DateFormat(getPosts.DateAdded, 'MM/DD/YYYY')# at #TimeFormat(getPosts.DateAdded, 'hh:mm TT')#</td>
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