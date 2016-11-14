<cfmodule template="#Application.Header#" >  <br>
<cfparam name="url.e" default="0">

 <cfoutput>
	  <table border="0" cellpadding="4" cellspacing="0" width="100%">
	    <tr>
		  <td><h3>Resume Finder Login</h3></td>
		</tr>
		<tr>
	      <td align="center">
		       <p class="Regtext">Login below with the username and password you recieved via email in order to search resumes.</p>
		       <p class="Regtext"><strong>YOU MUST HAVE A CURRENT JOB POSTED IN ORDER TO SEARCH RESUMES!!!</strong></p>
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
			   <cfform name="login" action="authorize.cfm" method="POST"> 
			    <table border="0" cellpadding="1" cellspacing="1" width="200" bgcolor="000000">
		           <tr>
		              <td bgcolor="ffffff">
					      <table border="0" cellpadding="3" cellspacing="0" width="200" bgcolor="##003366">
							<tr bgcolor="##003366">
			                   <td colspan=2><strong style="color:##ffffff;font-face:arial; font-size:14px;">LOGIN HERE</strong></td>
			                </tr>
							<tr bgcolor="##003366">
			                   <td colspan=2><img src="#Application.baseurl#/images/username.gif" alt="" border="0"></td>
			                </tr>
							<tr bgcolor="##003366">
							   <td width=10>&nbsp;</td>
			                   <td><cfinput type="text" name="username" size="18" class="logininput" value="" maxlength="75" required="Yes" Message="Your username is required to enter the resume bank."></td>
			                </tr>
							<tr bgcolor="##003366">
			                   <td colspan=2><img src="#Application.baseurl#/images/password.gif" alt="" border="0"></td>
			                </tr>
							<tr bgcolor="##003366">
							  <td width=10>&nbsp;</td>
			                   <td><cfinput type="password" name="password" size="18" class="logininput" maxlength="15" required="Yes" Message="A password is required to enter the resume bank"></td>
			                </tr>
							<tr bgcolor="##003366">
							   <td align="right" valign="center" colspan=2><input type="image" value="login" src="#Application.baseurl#/images/LoginButton.gif" alt="Login to the resume bank" border="0" onMouseOver="this.src='#Application.baseurl#/images/login_ovr.gif';" onMouseOut="this.src='#Application.baseurl#/images/loginbutton.gif';"></td>
			                </tr>
			              </table>
					  </td>
		          </tr>
		        </table>  
				</cfform>
				<table border="0" cellpadding="4" cellspacing="0" width="200">
                  <tr>
                    <td align="center"><a href="forgotpassword.cfm">Forgot your password?</a></td>
                  </tr>
                </table> <br><br>          
		  </td>
	    </tr>
	  </table> 

<cfmodule template="#Application.Footer#"> 
</cfoutput> 