<cfparam name="url.e" default=0> 
<cfmodule template="#Application.Header#">  
 <cfif Not IsDefined("Session.LoginTry")>
   <cflock type="EXCLUSIVE" scope="SESSION" timeout="10">
      <cfset Session.LoginTry = 0>
   </cflock>
 </cfif>
  <cfif IsDefined("cookie.Username")>
	 <cfset MyUsername = cookie.username>
  <cfelse>
	 <cfset MyUsername = "">
  </cfif>
 <cfoutput>
	  <table border="0" cellpadding="8" cellspacing="0" width="100%">
	    <tr>
		  <td>&nbsp;</td>
		</tr>
		<tr>
	      <td align="center">
		      <p align="left">In order to access you personal IPRA Member information or content relevant to IPRA Members, you must login below using your username and password, if you do not have or do not know your username and password, enter your lastname and IPRA Member ID below and you will be instructed on how to create your username and password. If you do not know your IPRA Member ID, contact the <a href="mailto:webmaster@ilipra.org?subject=I Need My Member ID">IPRA Webmaster</a> or call 630-376-1911 x 205.</p>
<!--- <p align="left">Are you clean?  Update your contact information and you’ll be entered into a drawing to win a shiny new iPod. <strong>Five lucky people will be winners</strong>! Please verify that all your contact information is correct as that is how winners will be contacted. Promotional period ends on <strong>October 2, 2006</strong>.</p> --->
		     <cfif Session.LoginTry LTE 4>
			   <cfif url.e NEQ 0>
			    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <cfif url.e EQ 1>
					 <tr>
                       <td class="errortext" align="center"><img src="/images/Error.gif" width="26" height="26" alt="" border="0"> You must enter a username.</td>
                     </tr>
					<cfelseif url.e EQ 2>
					  <tr>
                        <td class="errortext" align="center"><img src="/images/Error.gif" width="26" height="26" alt="" border="0"> You must enter a username.</td>
                      </tr>
					<cfelseif url.e EQ 3>
					  <tr>
                        <td class="errortext" align="center"><img src="/images/Error.gif" width="26" height="26" alt="" border="0"> You are not authorized to login.</td>
                      </tr>  
					<cfelseif url.e EQ 4>
					  <tr>
                        <td class="errortext" align="center"><img src="/images/Error.gif" width="26" height="26" alt="" border="0"> The password you used is invalid for this login type, please try again.</td>
                      </tr>    
					</cfif>
                </table>
			   </cfif>
			   <cfform name="login" action="/MembersOnly/Authorize.cfm" method="POST" scriptsrc="/scripts/cfform.js"> 
			   <cfif isDefined("URL.refer")>
			     <cfoutput><input type="hidden" name="sendto" value="#URL.Refer#"></cfoutput>
			   </cfif>
			 <!--- change cp and cs back to 1 --->   <table border="0" cellpadding="3" cellspacing="3" width="200" bgcolor="000000">
		           <tr>
				   <!--- <!--- remove td section ---><td bgcolor="ffffff"> <img src="/images/messybabyadrev.gif" border="0"> </td> --->
		              <td bgcolor="ffffff">
					      <table border="0" cellpadding="3" cellspacing="0" width="200" bgcolor="##003366">
							<tr bgcolor="##003366">
			                   <td colspan=2><img src="#Application.baseurl#/images/MemberLogin.gif" alt="" border="0"></td>
			                </tr>
							<tr bgcolor="##003366">
			                   <td colspan=2><img src="#Application.baseurl#/images/username.gif" alt="" border="0"></td>
			                </tr>
							<tr bgcolor="##003366">
							   <td width=10>&nbsp;</td>
			                   <td><cfinput type="text" name="user" size="18" class="logininput" value="#MyUsername#" maxlength="75" required="Yes" Message="Your username is required to enter the members only area."></td>
			                </tr>
							<tr bgcolor="##003366">
			                   <td colspan=2><img src="#Application.baseurl#/images/password.gif" alt="" border="0"></td>
			                </tr>
							<tr bgcolor="##003366">
							  <td width=10>&nbsp;</td>
			                   <td><cfinput type="password" name="password" size="18" class="logininput" maxlength="15" required="Yes" Message="A password is required to enter the members only area."></td>
			                </tr>
							<tr bgcolor="##003366">
							  <td width="10">&nbsp;</td>
							  <td valign="center" class="rememberme"><input type="checkbox" class="logininput" name="RememberMe" value="1" <cfif MyUsername NEQ "">Checked</cfif>> Remember my Username</td>
							</tr>
							<tr bgcolor="##003366">
							   <td valign="center" align="right" colspan=2><a href="/sendpassword.cfm" style="color:ffffff; font-family:arial; size:10px;">Forgot Password?</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="image" value="login" src="#Application.baseurl#/images/LoginButton.gif" alt="Login to the IPRA Members only area" border="0" align="middle" onMouseOver="this.src='#Application.baseurl#/images/login_ovr.gif';" onMouseOut="this.src='#Application.baseurl#/images/loginbutton.gif';"></td>
			                </tr>
			              </table>
					  </td>
		          </tr>
		        </table>  <br><br>
				</cfform>
				
			<cfelse>
			  <table width="70%" border="0" cellspacing="0" cellpadding="4">
	              <cfoutput>
					<tr>
	                  <td class="ErrorText"><img src="#Application.baseurl#/Images/Error.gif" width="26" height="26" alt="Error" border="0" vspace=0 hspace=4 align="absmiddle"><strong>Login Lockout:</strong></td>
	                </tr>
				  </cfoutput>
				  <tr>
					<td class="ErrorText">You have unsuccessfully tried to login more than 5 times. As a security precaution you have been locked out of the members only area. If you have forgotten your username or password, click here to have them sent to you via email. If you do not have an email on file with the IPRA you must call the IPRA to receive your username and password</td>
				  </tr>
	            </table><br>	
			</cfif>	
		  </td>
	    </tr>
	  </table>
  <cfmodule template="#Application.Footer#"> 
 </cfoutput>  
