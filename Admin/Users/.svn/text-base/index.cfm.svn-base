<cfparam name="url.e" default="0"> 
<cfmodule template="#Application.header#" section="0" sectiontitle="Site Admin">
  <cfoutput>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="160"><br>
		    <cfmodule template="#Application.tagdir#/adminnav.cfm" level="1">
		   </td>
		   <td valign="top"><br>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>IPRA Admin Security</h3></td>
		        </tr>
		      </table>
			  <table border="0" cellpadding="6" cellspacing="0" width="100%">
		        <tr>
		           <td class="RegText">
						<table border="0" cellpadding="4" cellspacing="0" width="100%">
						   <tr>
								<td valign="top">
										<h3></h3>
										
										<cfquery name="getMembers" datasource="#Application.dsn#">
											SELECT UserID, Lastname, Firstname
											FROM siteusers
											
											ORDER BY lastname, Firstname
										</cfquery>
										
										<table border="0" cellpadding="1" cellspacing="0" width="99%"><tr><td bgcolor="606078"><font face="Arial" size="-2" color="white"><b>&nbsp;<font face="Arial" size="-2"><b>EDIT USER INFORMATION</b></font>&nbsp;&nbsp;&nbsp;</b></font></td></tr></table><br>
										
										<font face="arial" size="-1" color="607C70">
										<cfif getMembers.RecordCount is 0>
										There are no members to edit.
										<cfelse>
										Which member would you like to edit?<br> <br>
										</cfif>
										</font>
										<table border="0" cellpadding="4" cellspacing="0" width="100%">
										<tr>
										<td><form method="POST" action="editUser.cfm">
										<select name="ID">
											<cfloop query="getMembers">
											<option value="#UserID#">#Lastname#, #Firstname#</option>
											</cfloop>
										</select> <input type="submit" value=" Edit ">
										</form></td>
										</tr>
										</table>
										
										 <br>
										<table border="0" cellpadding="1" cellspacing="0" width="99%"><tr><td bgcolor="606078"><font face="Arial" size="-2" color="white"><b>&nbsp;<font face="Arial" size="-2"><b>ADD A NEW USER</b></font>&nbsp;&nbsp;&nbsp;</b></font></td></tr></table><br>
										
										
										<font face="arial" size="-1" color="607C70">
										Use the form below to add a new user. This is required for any user accessing the IPRA Admin website.<br> <br>
										</font>
							        <cfif url.e EQ 1>
									   <p class="errortext">Error! You must include a username for this user.</p>
									<cfelseif url.e EQ 2>
									   <p class="errortext">Error! You must include a password for this user.</p>
									<cfelseif url.e EQ 3>
									   <p class="errortext">Error! You must include a firstname for this user.</p>
									<cfelseif url.e EQ 4>
									   <p class="errortext">Error! You must include a lastname for this user.</p>
									<cfelseif url.e EQ 5>
									  <p class="errortext">Error! You must include a email address for this user.</p>
									<cfelseif url.e EQ 6>
									  <p class="errortext">Error! You must include a check at least one security level below for this user.</p>
									</cfif>
								<cfform method="post" action="UpdateUser.cfm" scriptsrc="/scripts/cfform.js">
								<input type="hidden" name="action" value="add">
								<table border="0" cellpadding="4" cellspacing="0">
									<tr>
										<td><strong>First Name</strong></td>
										<td><cfinput type="Text" name="firstname" message="Please enter the first name of the indivdual you wish to search for." required="Yes" size="20" maxlength="50"></td>
						            </tr>
									<tr>    
										<td><strong>Last Name</strong></td>
										<td><cfinput type="Text" name="lastname" message="Please enter the last name of the indivdual you wish to search for." required="Yes" size="20" maxlength="50"></td>
									</tr>
									  <tr>
									    <td><strong>Title:</strong></td>
										<td><cfinput type="Text" name="Title" message="Please enter the title of the indivdual you wish to search for." required="Yes" size="25" maxlength="50"></td>
									</tr>
									 <tr>
									    <td><strong>Email:</strong></td>
										<td><cfinput type="Text" name="email" value=""  message="Please enter the email address of the indivdual you wish to search for." required="Yes" size="25" maxlength="50"></td>
									</tr>
						            <tr>
									    <td><strong>Username:</strong></td>
										<td><cfinput type="Text" name="Username" message="Please enter the username of the indivdual you wish to search for." required="Yes" size="25" maxlength="50"></td>
									</tr>
						            <tr>
									    <td><strong>Password:</strong></td>
										<td><cfinput type="Text" name="Password" message="Please enter the password of the indivdual you wish to search for." required="Yes" size="25" maxlength="50"></td>
									</tr>
									<tr>
									    <td><strong>Allow in Site Admin:</strong></td>
										<td><input type="checkbox" name="AllowAdmin" value="1" checked></td>
									</tr>
									<tr>
									    <td><strong>Allow in ECommerce:</strong></td>
										<td><input type="checkbox" name="AllowFinance" value="1"></td>
									</tr>
									<tr>
									    <td><strong>Allow in Members:</strong></td>
										<td><input type="checkbox" name="AllowMember" value="1"></td>
									</tr>
									
									<tr>
									
										<td colspan=3>&nbsp;</td>
									</tr>
									<tr>
									  <td><input type="submit" name="submit" value="Add User>>"></td>
									</tr>
								</table>
								</cfform>
						
						
						      <br> <br>
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