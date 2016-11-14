<cfparam name="url.thisaction" default="Add">
<cfparam name="url.GID" default="0">

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
			      <cfset getGroupInfo = request.forumcomponent.GetGroups(URL.GID)>
				  <cfset thisvalue = getGroupInfo.groupName>
				  <cfset thisgroupID = getGroupInfo.groupID>
			   <cfelse>
			      <cfset thisvalue = "">
				  <cfset thisgroupID = "">
			   </cfif>
			   
			   <cfform name="addgroup" action="groupaction.cfm?action=#url.thisaction#" method="POST" scriptsrc="/scripts/cfform.js">
			      <input type="hidden" name="groupID" value="#thisgroupID#">
				   <table border="0" cellpadding="4" cellspacing="0">
					  <tr bgcolor="##eeeeee">
					    <td><strong>#thisaction# Group</strong></td>
					  </tr>
					  <tr>
	                    <td><strong>Group Name:</strong> <cfinput type="text" name="groupname" value="#ThisValue#" size="40" maxlength="120" required="YES" message="You must add a group name to continue"></td>
						<td><input type="submit" name="submit" value="#url.ThisAction# >>"></td>
	                  </tr>
	               </table>
			   </cfform>
			   <cfif url.thisaction EQ "Update"><a href="maintainGroups.cfm">[ADD NEW GROUP]</a><br></cfif>
			   <table border="0" cellpadding="4" cellspacing="1" width="100%" bgcolor="##eeeeee">
	               <tr bgcolor="##003366">
                       <td><strong style="color:##ffffff;">Maintain</strong></td>
					   <td><strong style="color:##ffffff;">Group Name</strong></td>
					   <td><strong style="color:##ffffff;">Number of Categories Assigned</strong></td>
                   </tr> 			  
 				  <cfloop query="getGroups">
				     <tr bgcolor="##ffffff">
                        <td><a href="maintaingroups.cfm?thisaction=Update&GID=#getGroups.GroupID#">EDIT</a>&nbsp;|&nbsp;<a href="groupaction.cfm?action=Delete&GID=#getGroups.GroupID#" onclick="if (! confirm('Are you sure you would like to delete this group? Doing this will delete all categories & threads under this group.')) return false;">DELETE</a></td>
						<td>#getGroups.GroupName#</td>
						<td>#getGroups.CatCount#</td>
                     </tr>
				  </cfloop>
               </table>
			    <br><br>
		 </td>
     </tr>
</table>  
</cfoutput>
<cfmodule template="#Application.footer#">
