<cfmodule template="#Application.Header#" >  
<cfparam name="url.e" default="0">

 <cfoutput>
	  <table border="0" cellpadding="8" cellspacing="0" width="100%">
	    <tr>
		  <td>&nbsp;</td>
		</tr>
		<tr>
	      <td align="center">
		
		    
			   <cfif url.e NEQ 0>
			    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <cfif url.e EQ 1>
					 <tr>
                       <td class="errortext" align="center"><img src="/images/Error.gif" width="26" height="26" alt="" border="0">ERROR! You must enter a username to login.</td>
                     </tr>
					<cfelseif url.e EQ 2>
					  <tr>
                        <td class="errortext" align="center"><img src="/images/Error.gif" width="26" height="26" alt="" border="0">ERROR! You must enter a password to login.</td>
                      </tr>
					<cfelseif url.e EQ 3>
					  <tr>
                        <td class="errortext" align="center"><img src="/images/Error.gif" width="26" height="26" alt="" border="0">ERROR! Your username or password could not be found.</td>
                      </tr>  
					</cfif>
                </table><br>
			   </cfif>
			   <cfform name="login" action="/admin/Authorize.cfm" method="POST" scriptsrc="/scripts/cfform.js"> 
			    <table border="0" cellpadding="1" cellspacing="1" width="200" bgcolor="000000">
		           <tr>
		              <td bgcolor="ffffff">
					      <table border="0" cellpadding="3" cellspacing="0" width="200" bgcolor="##003366">
							<tr bgcolor="##003366">
			                   <td colspan=2><img src="/images/AdminLoginHead.jpg" width="109" height="20" alt="" border="0"></td>
			                </tr>
							<tr bgcolor="##003366">
			                   <td colspan=2><img src="#Application.baseurl#/images/username.gif" alt="" border="0"></td>
			                </tr>
							<tr bgcolor="##003366">
							   <td width=10>&nbsp;</td>
			                   <td><cfinput type="text" name="username" size="18" class="logininput" value="" maxlength="75" required="Yes" Message="Your username is required to enter the members only area."></td>
			                </tr>
							<tr bgcolor="##003366">
			                   <td colspan=2><img src="#Application.baseurl#/images/password.gif" alt="" border="0"></td>
			                </tr>
							<tr bgcolor="##003366">
							  <td width=10>&nbsp;</td>
			                   <td><cfinput type="password" name="password" size="18" class="logininput" maxlength="15" required="Yes" Message="A password is required to enter the members only area."></td>
			                </tr>
							<tr bgcolor="##003366">
							   <td align="right" valign="center" colspan=2><input type="image" value="login" src="#Application.baseurl#/images/LoginButton.gif" alt="Login to the IPRA Members only area" border="0" onMouseOver="this.src='#Application.baseurl#/images/login_ovr.gif';" onMouseOut="this.src='#Application.baseurl#/images/loginbutton.gif';"></td>
			                </tr>
			              </table>
					  </td>
		          </tr>
		        </table>  
				</cfform>
		  </td>
	    </tr>
	  </table> 

<cfmodule template="#Application.Footer#"> 
</cfoutput>  