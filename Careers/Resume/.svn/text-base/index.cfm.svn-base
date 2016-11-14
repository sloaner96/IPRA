<cfparam name="URL.E" default="0">
<cfmodule template="#Application.Header#" sectiontitle="Job Opportunities Bulletin">
 
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="150">
		     <br>
		    <cfmodule template="#Application.tagdir#/aboutusnav.cfm" level="3">
		   </td>
		   <td valign="top"><br>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>Resume Builder</h3></td>
		        </tr>
		      </table>
			  <table border="0" cellpadding="6" cellspacing="0" width="100%">
		        <tr>
		           <td class="RegText">
				      <table border="0" cellpadding="3" cellspacing="0" width="100%">
                         <tr>
                            <td valign="top"><img src="/images/ParkRecJobsLogosmall.jpg" alt="" border="0" align="left" vspace="5" hspace="3"><p>Welcome to the IPRA Resume Builder!<br></p>
								<p>IPRA is pleased to offer extended functionality to the Job Opportunities Board in order to post your resume on the IPRA website for review by potential employers. By posting your resume on the IPRA website, your job search will be targeted to employers in the park and recreation industry right here in Illinois. Here's how it works:</p>
                                  <ol>
								   <li>Click on Start Building your resume Today!</li>
								   <li>Agree to the terms of the site</li>
								   <li>Complete your basic contact information</li>
								   <li>Complete and submit your resume</li>
								   <li>Your resume undergoes an approval process</li>
								   <li>If approved, your resume is searchable for employers who have posted jobs!</li> 
								  </ol>	
 								<p>IPRA hopes this tool provides park and recreation professionals the opportunity to expand their careers and allow employers the ability to fill positions with suitable candidates. Advance your career today!<br><br><a href="CreateContact.cfm"><strong>Start Building your Resume Today!</strong></a></td>
							<cfif Not IsDefined("Session.ResBuilder")>
							<cfoutput>
							
							<td valign="top"><h4 style="color:##006699; size:12px;">Already have a resume Saved?</h4> <strong style="font-family:arial; font-size:10px; color:##616161;">(IPRA Member's Please note that you must login to the members only area located <a href="/membersonly/login.cfm?refer=/careers/Resume/EditResume.cfm">here</a> to access your resume.)</strong><br> 
							</cfoutput>
							    <cfif URL.E EQ 1>
								  <p class="ERRORTEXT" align="center"><strong>Error! You must enter your username</strong></p>
								<cfelseif URL.E EQ 2>
								  <p class="ERRORTEXT" align="center"><strong>Error! You must enter your password</strong></p>
								<cfelseif URL.E EQ 3>
								  <p class="ERRORTEXT" align="center"><strong>Error! Your username and password are not valid or you have not signed up.</strong></p>
								</cfif> 
							    <cfform name="resLogin" action="Authenticate.cfm" method="POST">
									<table border="0" cellpadding="4" cellspacing="0" bgcolor="#003366" width="150">
	                                  <tr>
									    <td colspan="2"><strong style="color:#ffffff;font-face:arial; font-size:14px;">LOGIN HERE</strong></td>
									  </tr>
									  <tr>
	                                    <td><strong style="color:#ffffff;">Username:</strong></td>
										<td><input type="TEXT" name="username" size="15" maxlength="45" /></td>
	                                 </tr>
									 <tr>
									   <td><strong style="color:#ffffff;">Password:</strong></td>
									   <td><input type="password" name="password" size="15" maxlength="15" /></td>
									 </tr>
									 <tr>
									   <td colspan="2" align="right"><input type="image" value="login" src="/images/LoginButton.gif" alt="Login to theResume Builder area" border="0" align="middle" onMouseOver="this.src='/images/login_ovr.gif';" onMouseOut="this.src='/images/loginbutton.gif';"></td>
									 </tr>
									 <tr>
									    <td colspan="2" align="center"><a href="forgotpassword.cfm" style="font-size:9px;color:#ffffff">Forgot your password?</a></td>
									  </tr>
									 <tr>
									    <td>&nbsp;</td>
									  </tr>
	                               </table>
							  </cfform>     
							</td>
							<cfelse>
							  <td valign="top">
							    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                       <td><h4 style="color:##006699; size:12px;">Logged In</h4></td>
                                    </tr>
									<tr>
									  <td align="center"><a href="../logout.cfm?type=1"><img src="/images/btn_logout.gif" width="90" height="20" alt="[Log Out]" border="0"></a></td>
									</tr>
									<tr>
									  <td>&nbsp;</td>
									</tr>
									<tr>
									  <td>
									     <table border="0" cellpadding="4" cellspacing="0" width="100%">
                                           <tr>
                                             <td><a href="EditResume.cfm">Click Here to Edit Your Saved Resume</a></td>
                                           </tr>
                                         </table>           
									  </td>
									</tr>
                                </table>           
							  </td>
							</cfif>
                         </tr>
                      </table>   
				   </td>
			     </tr>
			</table>  
		 </td>
     </tr>
</table>  

<cfmodule template="#Application.Footer#">
