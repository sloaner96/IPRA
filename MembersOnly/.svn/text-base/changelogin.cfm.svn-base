<cfparam name="url.e" default="0">
<cfmodule template="#Application.Header#">  
 <cfoutput>
	  <table border="0" cellpadding="8" cellspacing="0" width="100%">
	    <tr>
		  <td><h3>Change Login</h3></td>
		</tr>
		<tr>
	      <td align="center">
			   <cfform name="login" action="changelogin_action.cfm" method="POST" scriptsrc="/scripts/cfform.js"> 
			    <table border="0" cellpadding="1" cellspacing="1">
		           <tr>
		              <td bgcolor="ffffff">
					     <table border="0" cellpadding="0" cellspacing="0" width="100%">
                           <tr> 
                             <td class="regtext">You have used your Lastname and your IPRA Member ID to login to the Members only area. We have recently implemented a new security scheme that requires you to choose a new login for the members only area. You must now login with your <strong>email address</strong> and a <strong>password</strong> that you will choose below. We have done this to better secure your personal information and provide or members with a more secure site. If you have any questions about this, please contact Dean Comber at <a href="mailto:dean@ilipra.org">dean@ilipra.org</a>.</td>
                           </tr>
                         </table><br>
						 <cfif url.e EQ 1>
						   <table border="0" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<td class="ErrorText"><strong>ERROR!</strong> You must enter a valid email address for your username</td>
								</tr>
							</table><br>
						<cfelseif url.e EQ 2>
						   <table border="0" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<td class="ErrorText"><strong>ERROR!</strong> You must enter a value for the field password</td>
								</tr>
							</table><br>
						<cfelseif url.e EQ 3>	
						    <table border="0" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<td class="ErrorText"><strong>ERROR!</strong> You must enter a value for the field re-password</td>
								</tr>
							</table><br>
						 <cfelseif url.e EQ 4>	
						    <table border="0" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<td class="ErrorText"><strong>ERROR!</strong> Both password fields must match</td>
								</tr>
							</table><br>	
						 </cfif>
						 <table border="0" cellpadding="4" cellspacing="0">
                           <tr> 
                             <td class="regtext"><strong>New Username:</strong><br><font size="-2">This should be your email address</font></td>
							 <td><cfinput type="text" name="username" value="#Trim(session.userinfo.email)#" size="25" maxlength="50" required="yes" message="You must enter your valid email address"></td>
                           </tr>
						   <tr> 
                             <td class="regtext"><strong>New Password:</strong><br><font size="-2">Should be atleast 5 characters</font></td>
							 <td><cfinput type="password" name="Password1" size="25" maxlength="12" required="yes" message="You must enter a new password"></td>
                           </tr>
						   <tr> 
                             <td class="regtext"><strong>Re-enter Password:</strong></td>
							 <td><cfinput type="password" name="Password2" size="25" maxlength="12" required="yes" message="You must re-enter a new password"></td>
                           </tr>
						   <tr>
						     <td colspan=2>&nbsp;</td>
						   </tr>
						   <tr>
						     <td colspan=2><input type="submit" name="submit" value="Change Login Info >>"</td>
						   </tr>
                         </table><br>
						 
					  </td>
		          </tr>
		        </table>  <br><br>
				</cfform>
		  </td>
	    </tr>
	  </table>
  <cfmodule template="#Application.Footer#"> 
 </cfoutput>  