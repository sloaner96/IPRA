<cfparam name="url.e" default="0">

<cfset getResume = request.CareersComponent.getFullResume(URL.ResumeID)>
<cfset getWorkHistory = request.CareersComponent.getallWorkHistory(URL.ResumeID)>
<cfset getEducHistory = request.CareersComponent.GetAllEduc(URL.ResumeID)>
<cfset ThisCatName   = request.CareersComponent.getJobCat(getResume.ResumeCat)>
<cfinclude template="#Application.TagDir#/FormatPhone.cfm">

<cfmodule template="#Application.header#" section="0" sectiontitle="Site Admin">
  <style>
  #reason{
     display: none;
  }
</style>
  <script>
    function showReason(targetId){
	   target = document.getElementById( targetId );
	   target.style.display = "block";
	}
	function hideReason(targetId){
	   target = document.getElementById( targetId );
	   target.style.display = "none";  
	 }  
  </script>
  
  <cfoutput>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="160"><br>
		    <cfmodule template="#Application.tagdir#/adminnav.cfm" level="2">
		   </td>
		   <td valign="top"><br>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>Unapproved Resumes</h3></td>
		        </tr>
		      </table>
			  <cfoutput>
			     <cfform name="approve" action="approveResume_action.cfm" scriptsrc="/scripts/" method="POST">
				     <input type="hidden" name="resumeID" value="#URL.ResumeID#">
				      <table border="0" cellpadding="3" cellspacing="0" width="100%">
	                     <tr>
	                        <td colspan="2"><strong>Approval:</strong> <input type="radio" name="Approval" value="1"  onclick="hideReason('reason');">APPROVED &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="Approval" value="2" onclick="showReason('reason');">REJECT</td>
	                     </tr>
						 <tr class="reason" id="reason">
						    <td width="10%"><strong>Rejection Reason:</strong></td>
							<td><textarea name="Reason" rows="5" cols="25"></textarea></td>
						 </tr>
						 <tr>
						   <td colspan="2"><input type="submit" name="submit" value="Save"></td>
						 </tr>
	                  </table>  
				  </cfform>         
				  <table border="0" cellpadding="3" cellspacing="0" width="100%">
					<tr bgcolor="##000066">
					  <td colspan="2"><strong style="color:##fff;">Contact Information</strong></td>
					</tr>
					<tr>
						<td valign="top">#getResume.Firstname# <cfif getResume.MiddleInitial NEQ "">#getResume.MiddleInitial# </cfif>#getResume.lastName#<br>
										    #getResume.Address1#<BR>
											<cfif getResume.Address2 NEQ "">#getResume.Address2#<BR></cfif>
											#getResume.City#, #getResume.State# #getResume.ZipCode#<BR>
						</td>
						<td valign="top">
							<cfif getResume.HomePhone NEQ ""> <strong>Home:</strong> #FormatPhone(getResume.HomePhone)#<br></cfif>
							<cfif getResume.WorkPhone NEQ ""><strong>Work:</strong> #FormatPhone(getResume.WorkPhone)#<br></cfif>
							<cfif getResume.Mobile NEQ ""><strong>Mobile:</strong> #FormatPhone(getResume.Mobile)#<br></cfif>
							<strong>Email:</strong> #getResume.Email#<br>
							<strong>Best Contact:</strong> <cfif getResume.BestContact EQ "H">Home<cfelseif getResume.BestContact EQ "W">Work<cfelseif getResume.BestContact EQ "E">Email<cfelseif getResume.BestContact EQ "M">Mobile</cfif>
						</td>
					</tr>
				  </table>
				  <br>
				  <table border="0" cellpadding="3" cellspacing="0" width="100%">
	                 <tr bgcolor="##000066">
					  <td colspan="2"><strong style="color:##fff;">Job Target</strong></td>
					</tr>
					 <tr>
					   <td>
						 <table border="0" cellpadding="3" cellspacing="0">
							 <tr>
							   <td><strong>Status:</strong></td>
							   <td><cfif getResume.Status EQ 1>Active<cfelse>Not Active</cfif></td>
							 </tr>
							 <tr>
							   <td><strong>Resume Title:</strong></td>
							   <td>#getResume.ResumeTitle#</td>
							 </tr>
							 <tr>
							   <td><strong>Postion Category:</strong></td>
							   <td>#ThisCatName.CatDesc#</td>
							 </tr>
							 <tr>
							   <td><strong>Salary Requirement:</strong></td>
							   <td>#getResume.SalaryRange#</td>
							 </tr>
							 <tr>
						        <td><strong>Objective:</strong></td>
								<td>#trim(getResume.objectivetext)#</td>
						     </tr>
						   </table> 
					    </td>
					 </tr>		   
	              </table>  
				  <br>
				  <table border="0" cellpadding="3" cellspacing="0" width="100%">
	                 <tr bgcolor="##000066">
					  <td colspan="2"><strong style="color:##fff;">Cover Letter</strong></td>
					</tr>
					<cfif Len(Trim(getResume.coverlettertext)) GT 0>
					 <tr>
					   <td>#Replacenocase(Trim(getResume.coverlettertext), "#Chr(13)##Chr(10)#", "<br>", "ALL")#</td>
					 </tr>		 
					 <cfelse>
					   <tr>
					     <td><strong style="color:##ccc;">Nothing Added</strong></td>
					   </tr>  
					</cfif>
	              </table> 
				  <br>
				  <table border="0" cellpadding="3" cellspacing="0" width="100%">
	                 <tr bgcolor="##000066">
					  <td colspan="2"><strong style="color:##fff;">Work History</strong></td>
					</tr>
					<tr>
					  <td>
					     <table border="0" cellpadding="3" cellspacing="1" width="100%">
                           <cfif getWorkHistory.recordcount GT 0>
							<cfloop query="GetWorkHistory">
							  <tr bgcolor="##eeeeee">
							    <td><strong>From: #GetWorkHistory.WorkFrom# - To: #GetWorkHistory.WorkTo#</strong></td>
                                <td><strong>#GetWorkHistory.CompanyName#</strong></td>
								<td><strong>#GetWorkHistory.WorkLocation#</strong></td>
							  </tr>
							  <tr>	
								<td colspan="3"><em>#GetWorkHistory.JobTitle#</em></td>
                              </tr>
							  <tr>
							    <td colspan="3">#Replacenocase(trim(GetWorkHistory.WorkHistory), "#Chr(13)##Chr(10)#", "<br>", "ALL")#</td>
							  </tr>
						    </cfloop>
						   <cfelse>
						      <tr>
						         <td align="center"><hr noshade size="1"><strong style="color:##777777;">No Work History Added</strong></td>
						      </tr>	
						   </cfif>
                         </table>
					  </td>
					</tr>
	              </table> 
				  <br>
				  <table border="0" cellpadding="3" cellspacing="0" width="100%">
	                 <tr bgcolor="##000066">
					  <td colspan="2"><strong style="color:##fff;">Education</strong></td>
					</tr>
					<tr>
					  <td>
					    <table border="0" cellpadding="3" cellspacing="1" width="100%">
							 <cfif GetEducHistory.recordcount GT 0>
								 <cfloop query="GetEducHistory">
								   <tr>
									   <td><strong>#GetEducHistory.GraduationYr#</strong></td>
									   <td><strong>#GetEducHistory.SchoolName#</strong></td>
								   </tr>
								   <cfif GetEducHistory.Degreetext NEQ "">
								     <tr>	   
									    <td colspan="2">#GetEducHistory.Degreetext#</td>
		                             </tr>	 
								   </cfif>
								   <tr>
								     <td colspan="2">#GetEducHistory.EducationComment#</td>
								   </tr>
								 </cfloop>
							 <cfelse>
							   <tr>
							      <td align="center"><hr noshade size="1"><strong style="color:##777777;">You currently do not have any Education History saved. Use the form above to add work history.</strong></td>
							   </tr>	
							 </cfif>
		                 </table> 
					  </td>
					</tr>
	              </table> 
				  <br>
				  <br>
				  <table border="0" cellpadding="3" cellspacing="0" width="100%">
	                 <tr bgcolor="##000066">
					  <td colspan="2"><strong style="color:##fff;">Certifications</strong></td>
					</tr>
					<cfif Len(Trim(getResume.Certifications)) GT 0>
					 <tr>
					   <td>#Replacenocase(Trim(getResume.Certifications), "#Chr(13)##Chr(10)#", "<br>", "ALL")#</td>
					 </tr>		 
					 <cfelse>
					   <tr>
					     <td><strong style="color:##ccc;">Nothing Added</strong></td>
					   </tr>  
					</cfif>
	              </table> 
				  <br>
				  <br>
				  <table border="0" cellpadding="3" cellspacing="0" width="100%">
	                 <tr bgcolor="##000066">
					  <td colspan="2"><strong style="color:##fff;">Additional Info</strong></td>
					</tr>
					<cfif Len(Trim(getResume.AdditionalInfo)) GT 0>
					 <tr>
					   <td>#Replacenocase(Trim(getResume.AdditionalInfo), "#Chr(13)##Chr(10)#", "<br>", "ALL")#</td>
					 </tr>		 
					 <cfelse>
					   <tr>
					     <td><strong style="color:##ccc;">Nothing Added</strong></td>
					   </tr>  
					</cfif>
	              </table> 
				  <br>
			  </cfoutput>        
			   <br><br>
		 </td>
     </tr>
</table>  
</cfoutput>
<cfmodule template="#Application.footer#">
