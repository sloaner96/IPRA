<cfparam name="url.e" default="0">
<cfmodule template="#Application.header#" section="0" sectiontitle="Job Opportunities Bulletin: Apply for Job"> 
<table border="0" cellpadding="4" cellspacing="0" width="100%">
   <tr>
      <td valign="top" width="160"><br>
		    <cfmodule template="#Application.tagdir#/aboutusNav.cfm" level=3></td>
	  <td valign="top"><br>
	    <table border="0" cellpadding="1" cellspacing="0" width="100%">
           <tr>
              <td><h3>Job Opportunities Bulletin: Apply For Job</h3></td>
           </tr>
        </table>
		
	    <cfoutput>
			<cfif Not IsDefined("Session.resBuilder.Contact")>
			     
			    <cfform name="resLogin" action="resume/Authenticate.cfm" method="POST">
				    <input type="hidden" name="srclogin" value="/careers/ApplyforJob.cfm?jobID=#url.JobID#">
					<input type="hidden" name="KickTo" value="/careers/ApplyforJob.cfm?jobID=#url.JobID#">
					
					<table border="0" cellpadding="4" cellspacing="1" width="100%">
                      <tr>
                         <td valign="top">You must Login to the Resume Builder to apply for a job. If you are a IPRA member and you have created a resume simply enter your IPRA Username and password just as you would for the Members Only area. If you are not a member and you have created a resume, use the username and password that you created when you signed up. <br><br>If you have not created a resume yet, <a href="resume/index.cfm">click here</a> to find out more.
						     
						 </td>
						 <td valign="top">
						    <cfif URL.E EQ 1>
							  <p class="ERRORTEXT" align="center"><strong>Error! You must enter your username</strong></p>
							<cfelseif URL.E EQ 2>
							  <p class="ERRORTEXT" align="center"><strong>Error! You must enter your password</strong></p>
							<cfelseif URL.E EQ 3>
							  <p class="ERRORTEXT" align="center"><strong>Error! Your username and password are not valid.</strong></p>
							</cfif>
						   <table border="0" cellpadding="4" cellspacing="0" bgcolor="##003366" width="150" align="right">
		                       <tr>
							    <td colspan="2"><strong style="color:##ffffff;font-face:arial; font-size:14px;">LOGIN HERE</strong></td>
							  </tr>
							  <tr>
		                        <td><strong style="color:##ffffff;">Username:</strong></td>
								<td><input type="TEXT" name="username" size="15" maxlength="40" /></td>
		                      </tr>
							 <tr>
							   <td><strong style="color:##ffffff;">Password:</strong></td>
							   <td><input type="password" name="password" size="15" maxlength="15" /></td>
							 </tr>
							 <tr>
							   <td colspan="2" align="right"><input type="image" value="login" src="/images/LoginButton.gif" alt="Login to the Resume Builder area" border="0" align="middle" onMouseOver="this.src='/images/login_ovr.gif';" onMouseOut="this.src='/images/loginbutton.gif';"></td>
							 </tr>
							 <tr>
							    <td>&nbsp;</td>
							  </tr>
                            </table>
						 </td>
                      </tr>
                    </table>   <br>
					
			  </cfform> 
			<cfelse>
			   <cfset getResume = request.CareersComponent.getResume(Session.ResBuilder.Contact.ContactID)>        
			   <cfset getJobInfo = request.CareersComponent.getJobInfo(URL.JobID)>
			   <cfset checkapplied = request.CareersComponent.checkApplied(URL.JobID, getResume.ResumeID)>
			   <cfif getResume.Viewable NEQ 0 AND getResume.Status EQ 1>
				   <table border="0" cellpadding="0" cellspacing="0" width="100%">
                      <tr>
                        <td><h4 style="color:##cc6600;">Applying for (Job ###getJobInfo.JobID#)-#getJobInfo.JobTitle#</h4></td>
                      </tr>
					  <tr>
					    <td><strong>Posted by:</strong> #getJobInfo.AgencyName#</td>
					  </tr>
                   </table> <br>
				   <cfif checkapplied.recordcount EQ 0>         
						   <cfform name="jobapply" action="ApplyConfirmation.cfm" method="POST">
						      <input type="hidden" name="JobID" value="#URL.JobID#">
							   <table border="0" cellpadding="0" cellspacing="0" width="100%">
					              <tr>
				                      <td background="/images/resu_HeadBG.gif"><img src="/images/resu_CV.gif" width="138" height="20" alt="CoverLetter"></td>
									  <td background="/images/resu_HeadBG.gif" align="right"></td>
				                  </tr>
								  <tr>
								    <td colspan="2">
									   <table border="0" cellpadding="3" cellspacing="0" width="100%">
                                         <tr>
							                 <td width="5"><input type="radio" name="Coverletter" value="0"></td>
											 <td><strong>No Cover letter</strong></td>
							              </tr>
										  <tr>
							                 <td width="5"><input type="radio" name="Coverletter" value="1" checked></td>
											 <td><strong>Use You existing cover letter </strong><img src="/images/pictoInfo.gif" alt="" name="coverletter" id="coverletter" width="15" height="15" border="0" alt="#JSStringFormat(Trim(getResume.coverlettertext))#"></td>
							              </tr>
										  <tr>
							                 <td width="5"><input type="radio" name="Coverletter" value="2"></td>
											 <td><strong>Create new cover letter Below</strong></td>
							              </tr>
										  
										  <tr>
										     <td colspan="2"><textarea cols="70" rows="8" name="cvtext" style="border: 1px ##000 solid;"></textarea></td>
										  </tr>
                                       </table>   
									 
									</td>
								  </tr>
					           </table>
							   <table border="0" cellpadding="0" cellspacing="0" width="100%">
			                      <tr>
				                      <td background="/images/resu_HeadBG.gif"><img src="/images/resu_yourresume.gif" width="138" height="20" alt="Your Resume"></td>
				                   </tr>
								   <tr>
								     <td>&nbsp;</td>
								   </tr>
								  <tr>
								     <td><a href="/careers/resume/viewResume.cfm" target="_blank">[View Resume]</a></td>
								  </tr>
								  <tr>
								     <td>&nbsp;</td>
								   </tr>
								   <tr>
								     <td>&nbsp;</td>
								   </tr>
								  <tr>
								     <td><input type="submit" name="submit" value="Apply for Job"></td>
								  </tr>
			                   </table> 
						   </cfform>  
				   <cfelse>
				      <table border="0" cellpadding="0" cellspacing="0" width="100%">
                         <tr>
                            <td>You applied for this job on #DateFormat(checkapplied.DateSent, 'MM/DD/YYYY')# at #timeFormat(checkapplied.DateSent, 'hh:mm tt')#</td>
                         </tr>
                      </table>           
				      
				   </cfif>        
			   <cfelse>
			      <cfif getResume.Viewable EQ 0>
				    <table border="0" cellpadding="0" cellspacing="0" width="100%">
	                  <tr>
	                     <td><strong style="color:##cc0033;">Your Resume is still pending approval by the IPRA Admin. Please make sure your resume is complete and you marked it as active.</strong></td>
	                  </tr>
	                </table>           
				  </cfif>
				  <cfif getResume.Status EQ 0>
				    <table border="0" cellpadding="0" cellspacing="0" width="100%">
	                  <tr>
	                     <td><strong style="color:##cc0033;">Your Resume is marked as inactive. Please make sure it is active, before applying for a job.</strong></td>
	                  </tr>
	                </table>           
				  </cfif>
				             
			   </cfif>
			</cfif>
		</cfoutput>
	 </td> 
   </tr>
</table>
<br><br>
<cfmodule template="#Application.footer#">	

