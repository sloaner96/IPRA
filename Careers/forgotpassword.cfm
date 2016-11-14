<cfmodule template="#Application.Header#" >  <br>
<cfparam name="url.e" default="0">

 <cfoutput>
   <table border="0" cellpadding="4" cellspacing="0" width="100%">
   <tr>
      <td valign="top" width="160"><br>
		    <cfmodule template="#Application.tagdir#/aboutusNav.cfm" level=3></td>
	  <td valign="top"><br>
		  <table border="0" cellpadding="4" cellspacing="0" width="100%">
		    <tr>
			  <td><h3>Forgot Password</h3></td>
			</tr>
			<tr>
		      <td>
			       <cfif IsDefined("form.username")>
				     <cfif Len(trim(form.username)) eq 0>
					    <cfset url.E = 1>
					 </cfif>
					 <cfif Len(trim(form.agencyname)) eq 0>
					    <cfset url.E = 2>
					 </cfif>
					 
					 <!--- Call Password Finder --->
	   				    <cfset checklogin = request.CareersComponent.getsearchPassword(Trim(form.username), trim(form.AgencyName))>
					 
					 <cfif checklogin.recordcount GT 0>
					 <!--- Send Email --->
					    <cfset sendtoname = "#Trim(checklogin.contactname)#">
					    <cfset sendPassword = request.CareersComponent.sendPassword(sendtoname, trim(checklogin.username), trim(checklogin.password), trim(checklogin.ContactEmail))>
					 
					 <!--- Say Thank You --->
					   <table border="0" cellpadding="4" cellspacing="0" width="100%">
	                      <tr>
	                        <td>Thank You! Your username and password has been sent to your email address.</td>
	                      </tr>
	                   </table>           
					 <cfelse>
					    <cfset url.E = 3>
					 </cfif>
					 
					 <cfif url.e NEQ 0>
					    <table border="0" cellpadding="0" cellspacing="0" width="100%">
		                    <cfif url.e EQ 1>
							 <tr>
		                       <td class="errortext" align="center"><img src="/images/Error.gif" width="26" height="26" alt="" border="0">ERROR! You must enter a username.</td>
		                     </tr>
							<cfelseif url.e EQ 2>
							  <tr>
		                        <td class="errortext" align="center"><img src="/images/Error.gif" width="26" height="26" alt="" border="0">ERROR! You must your agencies name exactly as it is on your job posting.</td>
		                      </tr>
							<cfelseif url.e EQ 3>
							  <tr>
		                        <td class="errortext" align="center"><img src="/images/Error.gif" width="26" height="26" alt="" border="0">ERROR! Your login information could not be found, please review your information and try again.</td>
		                      </tr>  
							</cfif>
							<tr>
							  <td><a href="forgotpassword.cfm">Click Here</a> to go back and correct this</td>
							</tr>
		                </table><br>
					   </cfif>
				   <cfelse>
					   <p class="Regtext">Use the form below to have your password emailed to you.</p>
				    
					   
					   <cfform name="login" action="forgotpassword.cfm" method="POST"> 
					      <table border="0" cellpadding="3" cellspacing="0" width="200">
							<tr>
			                   <td colspan=2><strong>Username</strong></td>
			                </tr>
							<tr>
							   <td width=10>&nbsp;</td>
			                   <td><cfinput type="text" name="username" size="18" value="" maxlength="75" required="Yes" Message="Your username is required to have you password sent to you."></td>
			                </tr>
							<tr>
			                   <td colspan=2><strong>Agency Name</strong></td>
			                </tr>
							<tr>
							   <td width=10>&nbsp;</td>
			                   <td><cfinput type="text" name="agencyname" size="18" value="" maxlength="75" required="Yes" Message="Your Agency name is required to have your password sent to you."></td>
			                </tr>
							<tr>
							  <td colspan="2" align="center"><input type="submit" name="submit" value="Get password >>"></td>
							</tr>
			              </table> 
						</cfform> 
				 </cfif>	       
			  </td>
		    </tr>
		  </table> 
        </td>
	 </tr>
   </table>
<cfmodule template="#Application.Footer#"> 
</cfoutput> 