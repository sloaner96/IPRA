<cfparam name="url.thisaction" default="Add">
<cfset GetCategories= request.forumcomponent.GetCategories()>
<cfset GetGroups= request.forumcomponent.GetGroups()>

<cfmodule template="#Application.header#" section="0" sectiontitle="Forum Maintenance">
  <cfoutput>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="160"><br>
		    <cfmodule template="#Application.tagdir#/adminnav.cfm" level="1">
		   </td>
		   <td valign="top"><br>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>IPRA Member Forums</h3></td>
		        </tr>
		      </table>
			   <cfif url.thisaction EQ "Update">
			      <cfset getCat = request.forumcomponent.GetCategoryInfo(URL.CID)>
				  <cfset thisvalue = getCat.CategoryName>
				  <cfset thisDesc = getCat.CategoryDesc>
				  <cfset thiscatID = getCat.CategoryID>
				  <cfset thisGroupID = getCat.GroupID>
			   <cfelse>
			      <cfset thisvalue = "">
				  <cfset thisDesc = "">
				  <cfset thiscatID = "">
				  <cfset thisGroupID = "">
			   </cfif>
			   <cfform name="name" action="catsaction.cfm?action=#url.thisaction#" method="POST" scriptsrc="/scripts/cfform.js">
			     <input type="hidden" name="categoryID" value="#thiscatID#">
			   <table border="0" cellpadding="4" cellspacing="0" width="100%">
				 <tr bgcolor="##eeeeee">
					<td><strong>#thisaction# Category</strong></td>
			     </tr>
				 <tr>
				    <td><strong>Category Name:</strong> <cfinput type="text" name="catname" value="#ThisValue#" size="40" maxlength="120" required="YES" message="You must add a category name to proceed."></td>
				 </tr>
				 <tr>
				    <td><strong>Category Description:</strong> <cfinput type="text" name="catDesc" value="#ThisDesc#" size="60" maxlength="190" required="YES" message="You must add a category description to proceed."></td>
				 </tr>
				 <tr>
				    <td><strong>Group:</strong> <select name="groupID">
					             <cfloop query="GetGroups">
								   <option value="#getGroups.GroupID#" <cfif getGroups.GroupID EQ thisGroupID>Selected</cfif>>#getGroups.GroupName#</option>
								 </cfloop>
							   </select>
					</td>
				 </tr>
				 <tr>
				   <td><input type="submit" name="submit" value="#url.ThisAction# >>"></td>
				 </tr>
			   </table> 
			   </cfform>
			   <cfif url.thisaction EQ "Update"><a href="maintainCats.cfm">[ADD NEW CATEGORY]</a><br></cfif>
			   <table border="0" cellpadding="4" cellspacing="1" width="100%" bgcolor="##eeeeee">
				 <tr bgcolor="##003366">
				    <td></td>
					<td><strong style="color:##ffffff;">Group</strong></td>
					<td><strong style="color:##ffffff;">CategoryName</strong></td>
					<td><strong style="color:##ffffff;">Number of Postings</strong></td>
					<td><strong style="color:##ffffff;">Number of Threads</strong></td>
				 </tr>
				 <cfloop query="GetCategories">
				    <cfset getGroupInfo = request.forumcomponent.GetGroups(GetCategories.groupID)>
					 <tr bgcolor="##ffffff">
					    <td><a href="maintaincats.cfm?thisaction=Update&CID=#GetCategories.CategoryID#">EDIT</a>&nbsp;|&nbsp;<a href="catsaction.cfm?action=Delete&CID=#GetCategories.CategoryID#" onclick="if (! confirm('Are you sure you would like to delete this Category? Doing this will delete all threads under this category.')) return false;">DELETE</a></td>
						<td>#getGroupInfo.GroupName#</td>
						<td>#GetCategories.CategoryName#</td>
						<td>#GetCategories.PostingCount#</td>
						<td>#GetCategories.ThreadCount#</td>
					 </tr>
				 </cfloop>
			   </table> <br><br>
		 </td>
     </tr>
</table>  
</cfoutput>
<cfmodule template="#Application.footer#">