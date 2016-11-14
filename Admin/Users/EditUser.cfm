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
				   
				     <cfquery name="GetUser" datasource="#Application.dsn#">
					     Select *
						 From SiteUsers
						 Where UserID = #Form.ID#
					 </cfquery>
										<font face="arial" size="-1" color="607C70">
										Use the form below to add a new user. This is required for any user accessing the IPRA Admin website.<br> <br>
										</font>
						
								<cfform method="post" action="UpdateUser.cfm" scriptsrc="/scripts/cfform.js">
								<input type="hidden" name="action" value="edit">
								<input type="hidden" name="UserID" value="#GetUser.UserID#">
								<table border="0" cellpadding="4" cellspacing="0">
									<tr bgcolor="##f9edec">
									  <td colspan=2><strong>Revoke Login Priveledge:</strong> <input type="checkbox" name="RevokeMbr" value="1"></td>
									</tr>
									<tr>
										<td><strong>First Name</strong></td>
										<td><cfinput type="Text" name="firstname" value="#GetUser.Firstname#" message="Please enter the first name of the indivdual you wish to search for." required="Yes" size="20" maxlength="50"></td>
						            </tr>
									<tr>    
										<td><strong>Last Name</strong></td>
										<td><cfinput type="Text" name="lastname" value="#GetUser.Lastname#" message="Please enter the last name of the indivdual you wish to search for." required="Yes" size="20" maxlength="50"></td>
									</tr>
									  <tr>
									    <td><strong>Title:</strong></td>
										<td><cfinput type="Text" name="Title" value="#GetUser.Title#" message="Please enter the title of the indivdual you wish to search for." required="Yes" size="25" maxlength="50"></td>
									</tr>
									
						            <tr>
									    <td><strong>Email:</strong></td>
										<td><cfinput type="Text" name="email" value="#GetUser.Email#"  message="Please enter the email address of the indivdual you wish to search for." required="Yes" size="25" maxlength="50"></td>
									</tr>
						            
						            <tr>
									    <td><strong>Username:</strong></td>
										<td><cfinput type="Text" name="Username" value="#GetUser.Username#"  message="Please enter the username of the indivdual you wish to search for." required="Yes" size="25" maxlength="50"></td>
									</tr>
						            <tr>
									    <td><strong>Password:</strong></td>
										<td><cfinput type="Text" name="Password" value="#GetUser.Password#"  message="Please enter the password of the indivdual you wish to search for." required="Yes" size="25" maxlength="50"></td>
									</tr>
									<tr>
									    <td><strong>Allow in Site Admin:</strong></td>
										<td><input type="checkbox" name="AllowAdmin" value="1" <cfif GetUser.AllowAdmin EQ 1>checked</cfif>></td>
									</tr>
									<tr>
									    <td><strong>Allow in ECommerce:</strong></td>
										<td><input type="checkbox" name="AllowFinance" value="1" <cfif GetUser.AllowFinance EQ 1>checked</cfif>></td>
									</tr>
									<tr>
									    <td><strong>Allow in Members:</strong></td>
										<td><input type="checkbox" name="AllowMember" value="1" <cfif GetUser.AllowMember EQ 1>checked</cfif>></td>
									</tr>
									
									<tr>
									
										<td colspan=3>&nbsp;</td>
									</tr>
									<tr>
									  <td><input type="submit" name="submit" value="Update User>>"></td>
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