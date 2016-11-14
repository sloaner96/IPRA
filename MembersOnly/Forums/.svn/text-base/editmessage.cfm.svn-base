<cfparam name="URL.GID" default="0">
<cfparam name="URL.CID" default="0">
<cfparam name="URL.PID" default="0">
<cfparam name="URL.AID" default="0">

<cfset getCat = request.forumComponent.GetCategoryInfo(URL.CID)>
<cfset EditThread = request.forumComponent.getMessage(URL.PID)>
<cfset getCategories = request.forumComponent.GetCategories()>
<cfmodule template="#Application.header#" section="0" sectiontitle="IPRA FORUMS" texteditor="True">

  <cfoutput>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="150"><br>
	         <cfmodule template="#Application.tagdir#/MemberonlyNav.cfm" level="3">
		   </td>
		   <td valign="top"><br>
		       <table border="0" cellpadding="5" cellspacing="0">
		         <tr>
		            <td><h3><a href="Postings.cfm?GID=#getCat.GroupID#&CID=#getCat.CategoryID#"  style="text-decoration:none; color:##003366;">#GetCat.CategoryName#</a> > Edit Post</h3></td>
		         </tr>
		       </table>
			   <cfform name="newpost" action="updatemessage.cfm?action=Update" method="POST" scriptsrc="/scripts/cfform.js">
			    <cfoutput>
				  <input type="hidden" name="PostID" value="#EditThread.PostingID#">
				  <input type="hidden" name="parentid" value="#EditThread.ParentID#">
				</cfoutput>
	               <table border="0" cellpadding="4" cellspacing="0">
	                 <tr>
	                   <td><strong>Category:</strong> <select name="category">
							 <cfloop query="getCategories">
							 <option value="#getCategories.CategoryID#" <cfif getCategories.CategoryID EQ EditThread.categoryid>selected</cfif>>#getCategories.CategoryName#</option>
							 </cfloop>
							 
					       </select></td>
                    </tr>
					 <tr>
	                   <td><strong>Subject:</strong></td>
					 </tr>
					 <tr>  
					   <td><cfinput type="text" name="topic" value="#EditThread.msgsubject#" required="YES" size="45" maxlength="200" message="You must include a topic/subject for this message"></td>
	                 </tr>
					 <cfif IsDefined("Session.AdminInfo")>
					   <tr>
					     <td><strong>Make the Post Sticky:</strong> <input type="radio" name="IsSticky" value="1" <cfif EditThread.IsSticky EQ 1>checked</cfif>>YES&nbsp;&nbsp;<input type="radio" name="IsSticky" value="0" <cfif EditThread.IsSticky EQ 0>checked</cfif>>NO</td>
					   </tr>
					 </cfif>
					 <tr>
	                   <td><strong>Message:</strong></td>
					 </tr>  
					 <tr>  
					   <td><textarea name="content" cols="50" rows="15" required="yes" message="You must include a Message for this posting.">#EditThread.msgBody#</textarea></td>
	                 </tr>
					 <tr>
					   <td><input type="submit" name="submit" value="Update Post >>"></td>
					 </tr>
	               </table>
			   </cfform>
			  <br><br>
		   </td>
        </tr>
   </table>  
 </cfoutput>
<cfmodule template="#Application.footer#">