<cfparam name="form.category" default="">

<cfif IsDefined("form.keywords")>
   <cfif form.category EQ "">
     <cfset getposts = request.forumComponent.searchThreads(trim(form.keywords))>
   <cfelse>
     <cfset getposts = request.forumComponent.searchThreads(trim(form.keywords), form.category)>
   </cfif> 
<cfelse>
  <cfset form.keywords = "">   
</cfif>

<cfset getCategories = request.forumComponent.GetCategories()>
<cfmodule template="#Application.header#" section="0" sectiontitle="IPRA FORUMS">
  <cfoutput>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="150"><br>
	         <cfmodule template="#Application.tagdir#/MemberonlyNav.cfm" level="3">
		   </td>
		   <td valign="top"><br>
		     <h3>Search <cfif form.keywords NEQ "">Results</cfif></h3>
			 
			 <cfform name="search" action="search.cfm" methpd="POST" src="/scripts/cfform.js">
		     <table border="0" cellpadding="3" cellspacing="0">
                <cfif form.keywords EQ "">
				  <tr>
				    <td colspan="2">Use the form below to search for forum posts. You can limit your search to a specific category of search all categories.</td>
				  </tr>
				</cfif>
				<tr>
				   <td width="60"><strong>Keywords:</strong></td>
                   <td><cfinput type="text" name="keywords" value="#form.keywords#" required="YES" message="You must include a keyword"> </td>
                </tr>
				<tr>
				   <td><strong>Category:</strong></td>
                   <td><select name="category">
				         <option value="">-- All Categories --</option>
						 <cfloop query="getCategories">
						 <option value="#getCategories.CategoryID#" <cfif getCategories.CategoryID EQ form.category>selected</cfif>>#getCategories.CategoryName#</option>
						 </cfloop>
						 
				       </select></td>
                </tr>
				<tr>
				  <td colspan="2"><input type="submit" name="submit" value="search >>"></td>
				</tr>
             </table>
			 </cfform>
			 <br>
			 <cfif IsDefined("getPosts")>
			 <table border="0" cellpadding="4" cellspacing="0" width="100%">
			   <tr>
				 <td>Your Search Returned <strong>#getposts.recordcount#</strong> possible matches</td>
			   </tr>
		     </table>
			 <br>
			 <cfif getposts.recordcount GT 0>
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
				 <cfelse>
				   <table border="0" cellpadding="0" cellspacing="0" width="100%">
                     <tr>
                       <td><strong>Your Search did not return any matches. Use the form above to refine your search.</strong></td>
                     </tr>
                   </table> 
				 </cfif> 
		   			 
				</cfif> <br><br>	  
		   </td>
        </tr>
   </table>  
 </cfoutput>
<cfmodule template="#Application.footer#">
