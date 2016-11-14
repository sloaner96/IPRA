	<!---
    $Id: ,v 1.0 2005/12/21 rsloan Exp $
    Copyright (c) 2006 X2 Interactive

    Description: This is the Main Resume editing screen.  
        
    Parameters: Session.ResBuilder.Contact or Session.UserInfo
        
    Usage: This Page will act as the main view and Edit Screen, it will have 
	       includes in it that will be the edit screens. the user will click 
		   Edit on a section and they will be able to edit that Area.
     
---> 
	
	<!--- check to see if the Session Exists --->
	   <cfif Not IsDefined("Session.resBuilder.Contact")>
	      <!--- Check to see if they are logged in as a member --->
	       <cfif IsDefined("Session.userinfo")>
		      <cfset checkContact = request.CareersComponent.getMbrContact(Session.UserInfo.MemberID)>
              
			  <cfif CheckContact.recordcount GT 0>  				 
			     <cfset session.ResBuilder.Contact = CheckContact>
			  <cfelse> 
			     <cflocation url="index.cfm?e=3" addtoken="NO">
			  </cfif> 
		   <cfelse>
		   	  <cflocation url="index.cfm?e=3" addtoken="NO">  
		   </cfif>
	   </cfif>
	  
	 
	<cfparam name="url.edit" default="">
	
	<!---GetResume Info--->
	  <cfset getResume = request.CareersComponent.getResume(Session.ResBuilder.Contact.ContactID)>
	<!--- Get Job Categories for Pull down --->
	  <cfset getJobCategory = request.CareersComponent.getJobCat()>
	  
      <cfinclude template="#Application.TagDir#/FormatPhone.cfm">
	<SCRIPT>
		function checkMaxLength (textarea, evt, maxLength) {
		  if (textarea.selected && evt.shiftKey) 
		    // ignore shift click for select
		    return true;
		  var allowKey = false;
		  if (textarea.selected && textarea.selectedLength > 0)
		    allowKey = true;
		  else {
		    var keyCode = 
		      document.layers ? evt.which : evt.keyCode;
		    if (keyCode < 32 && keyCode != 13)
		      allowKey = true;
		    else           
		      allowKey = textarea.value.length < maxLength;
		  }
		  textarea.selected = false;
		  return allowKey;
		}
		function storeSelection (field) {
		  if (document.all) {
		    field.selected = true;
		    field.selectedLength = 
		      field.createTextRange ?
		        document.selection.createRange().text.length : 1;
		  }
		}
		function checkthisfieldlength(formname, fieldname, maxlen){
		   var thisform = formname;
		   var thisfield = fieldname;
		   if (document.thisform.thisfield.value.length > maxlen){
		      var q = eval("document."+formname+"."+fieldname+".value.length");
              var removed = q - maxlen;

		      alert("The form only allows a maximum of 200 characters. Please return to the form and remove '+removed+' characters"); 
		     return false;
		   } else{
		     return true;
		   }
		}
</SCRIPT>
  
	<cfmodule template="#Application.Header#" sectiontitle="Resume Builder: Edit Resume">
    <cfoutput>
		<table border="0" cellpadding="3" cellspacing="0" width="100%">
		   <tr>
		      <td valign="top" width="150">
				<br>
				    <cfmodule template="#Application.tagdir#/aboutusnav.cfm" level="3">
			  </td>
			  <td valign="top"><br>
			    <table border="0" cellpadding="4" cellspacing="0" width="100%">
		          <tr>
				    <td><h3>Create/Modify your Resume</h3></td>
				  </tr>
		        </table>  
				<div style="padding-bottom:5px;" align="right"><a href="../logout.cfm?type=1"><img src="/images/btn_logout.gif" width="90" height="20" alt="[Log Out]" border="0"></a></div>
				 <table border="0" cellpadding="4" cellspacing="0" width="100%">
                   <tr>
                     <td>The Sections below will be used to build your resume. Each section can be maintained separately and should be saved that way. You can view your resume the way employers view your resume at anytime by clicking the [Preview Resume] link. When you are complete, You should make the resume <strong>ACTIVE</strong>, This will alert the IPRA administrator to approve or reject your resume. Once approved your reusme will be included in our resume bank.
<P>It is <strong>YOUR</strong> responsibility to keep your resume updated and active. Due to the amount of resume's in the system, IPRA <strong>STRONGLY</strong> suggests that you apply for jobs online vs. waiting for an employer to search for your resume. By applying for jobs online, your resume is directly sent to the contact person for the job posting. Please also note that not all jobs allow for the ability to apply online. This is not IPRA's decision, but that of the employer/agency posting the job. If your are interested in a job that does not allow for applying online, simply send your resume to the contact email address listed on the job posting.</P>
<p><strong>ALL RESUMES MUST BE APPROVED BY IPRA BEFORE BEING ACTIVE. THIS USUALLY IS DONE ONCE EVERY 24 HOURS</strong>.</p>
</td>
                   </tr>
				   <tr>
				     <td><a href="ViewResume.cfm">[PREVIEW YOUR RESUME]</a></td>
				   </tr>
                 </table>           
				 <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                      <td background="/images/resu_HeadBG.gif"><img src="/images/resu_contact.gif" width="138" height="20" alt="Contact Information"></td>
					  <td background="/images/resu_HeadBG.gif" align="right"><cfif url.edit NEQ "contact"><a href="EditResume.cfm?edit=Contact" style="color:##fff;font-weight:bold;padding-right:10px;">EDIT</a></cfif></td>
                    </tr>
					<tr>
					  <td colspan="2">
					    <table border="0" cellpadding="4" cellspacing="1" width="100%" bgcolor="##7088A2">
                          <tr>
                            <td bgcolor="##F5F8FA"><a name="contact" title="contact" id="contact"></a>
							   <cfif url.edit NEQ "Contact">
							   <table border="0" cellpadding="3" cellspacing="0" width="100%">
							     <tr>
							        <td valign="top">#Session.ResBuilder.Contact.Firstname# <cfif Session.ResBuilder.Contact.MiddleInitial NEQ "">#Session.ResBuilder.Contact.MiddleInitial# </cfif>#Session.ResBuilder.Contact.lastName#<br>
									    #Session.ResBuilder.Contact.Address1#<BR>
										<cfif Session.ResBuilder.Contact.Address2 NEQ "">#Session.ResBuilder.Contact.Address2#<BR></cfif>
										#Session.ResBuilder.Contact.City#, #Session.ResBuilder.Contact.State# #Session.ResBuilder.Contact.ZipCode#<BR>
									</td>
									<td valign="top">
									    <cfif Session.ResBuilder.Contact.HomePhone NEQ ""> <strong>Home:</strong> #FormatPhone(Session.ResBuilder.Contact.HomePhone)#<br></cfif>
									    <cfif Session.ResBuilder.Contact.WorkPhone NEQ ""><strong>Work:</strong> #FormatPhone(Session.ResBuilder.Contact.WorkPhone)#<br></cfif>
									   <cfif Session.ResBuilder.Contact.Mobile NEQ ""><strong>Mobile:</strong> #FormatPhone(Session.ResBuilder.Contact.Mobile)#<br></cfif>
									   <strong>Email:</strong> #Session.ResBuilder.Contact.Email#<br>
									   <strong>Best Contact:</strong> <cfif Session.ResBuilder.Contact.BestContact EQ "H">Home<cfelseif Session.ResBuilder.Contact.BestContact EQ "W">Work<cfelseif Session.ResBuilder.Contact.BestContact EQ "E">Email<cfelseif Session.ResBuilder.Contact.BestContact EQ "M">Mobile</cfif>
									</td>
							     </tr>
							   </table>
							  <cfelse>
							      <cfset getStates = request.PaymentComponent.GetState()>
								  
							      <cfset CoFirstname = Session.ResBuilder.Contact.Firstname>
								  <cfset CoMiName    = Session.ResBuilder.Contact.MiddleInitial>
								  <cfset CoLastname  = Session.ResBuilder.Contact.lastName>
								  <cfset CoAddr1     = Session.ResBuilder.Contact.Address1>
								  <cfset CoAddr2     = Session.ResBuilder.Contact.Address2>
								  <cfset CoCity      = Session.ResBuilder.Contact.City>
								  <cfset CoState     = Session.ResBuilder.Contact.State>
								  <cfset CoZipCode   = Session.ResBuilder.Contact.ZipCode>
								  <cfset CoHomePhone = Session.ResBuilder.Contact.HomePhone>
								  <cfset CoWorkPhone = Session.ResBuilder.Contact.WorkPhone>
								  <cfset CoMobile    = Session.ResBuilder.Contact.Mobile>
								  <cfset CoEmail     = Session.ResBuilder.Contact.Email>
								  <cfset CoBestContact = Session.ResBuilder.Contact.BestContact>  
								<a name="contact"></a>  
							    Use the form below to update your contact information. This information will be conveyed to prospective employers.  
							   <cfform name="editContact" action="UpdateResume.cfm?type=CI">
							     <input type="hidden" name="ContactID" value="#Session.ResBuilder.Contact.ContactID#">	
								   
							    <table border="0" cellpadding="4" cellspacing="0">
						            <tr>
								       <td><strong>Firstname:</strong></td>
									   <td><input type="text" name="firstname" value="#trim(CoFirstname)#" size="25" maxlength="50"><strong class="errortext">*</strong></td>
								    </tr>
									<tr>
								       <td><strong>Middle Initial:</strong></td>
									   <td><input type="text" name="middleName" value="#Trim(CoMiName)#" size="2" maxlength="2"></td>
								    </tr>
									<tr>
								       <td><strong>Lastname:</strong></td>
									   <td><input type="text" name="Lastname" value="#Trim(CoLastname)#" size="25" maxlength="75"><strong class="errortext">*</strong></td>
								    </tr>
									<tr>
								       <td><strong>Home Address:</strong></td>
									   <td><input type="text" name="HomeAddr1" value="#Trim(coAddr1)#" size="45" maxlength="75"></td>
								    </tr>
									<tr>
								       <td><strong>Home Apt/Suite Number:</strong></td>
									   <td><input type="text" name="HomeAddr2" value="#Trim(coAddr2)#" size="20" maxlength="50"></td>
								    </tr>
									<tr>
								       <td><strong>City:</strong></td>
									   <td><input type="text" name="City" value="#Trim(coCity)#" size="25" maxlength="50"></td>
								    </tr>
									<tr>
								       <td><strong>State:</strong></td>
									   <td><select name="State">
									         <option value="">-- Select One --</option>
									         <cfloop query="getStates">
									           <option value="#getStates.CodeValue#" <cfif getStates.Codevalue EQ coState>Selected</cfif>>#getStates.codeDesc#</option>
											 </cfloop> 
										   </select>
									   </td>
								    </tr>
									<tr>
								       <td><strong>ZipCode:</strong></td>
									   <td><input type="text" name="ZipCode" value="#Trim(coZipCode)#" size="10" maxlength="10"></td>
								    </tr>
									<tr>
								       <td><strong>Home Phone:</strong></td>
									   <td><cfinput type="Text" name="homephone" mask="(999) 999-9999" validateat="onSubmit" validate="telephone" value="#Trim(CoHomePhone)#" required="Yes" message="you must include a valid telephone number" size="14" maxlength="14"><strong class="errortext">*</strong></td>
								    </tr>
									<tr>
								       <td><strong>Work Phone:</strong></td>
									   <td><cfinput type="text" name="workphone" mask="(999) 999-9999" validateat="onSubmit" validate="telephone" value="#Trim(CoWorkPhone)#" size="14" maxlength="14"></td>
								    </tr>
									<tr>
								       <td><strong>Mobile Phone:</strong></td>
									   <td><cfinput type="text" name="mobilephone" mask="(999) 999-9999" validateat="onSubmit" validate="telephone" value="#Trim(CoMobile)#" size="14" maxlength="14"></td>
								    </tr>
									<tr>
									  <td><strong>Best to Contact:</strong></td>
									  <td><select name="BestContact">
									       <option value="">-- Select One --</option>
									       <option value="H" <cfif CoBestContact EQ "H">Selected</cfif>>Home Phone</option>
									       <option value="W" <cfif CoBestContact EQ "W">Selected</cfif>>Work Phone</option>
									       <option value="M" <cfif CoBestContact EQ "M">Selected</cfif>>Mobile Phone</option>
									       <option value="E" <cfif CoBestContact EQ "E">Selected</cfif>>Email</option>
									      </select>
										  <strong class="errortext">*</strong>
									  </td> 
									</tr>
									
									<tr>
								       <td><strong>Email Address:</strong></td>
									   <td><cfinput type="Text" 
									          name="Email" 
											  value="#Trim(CoEmail)#"
											  validateat="onSubmit"
											  message="You must enter a valid email address formatted (you@email.com)" 
											  validate="email" required="No" onKeyup="setusername(this.value);"><strong class="errortext">*</strong></td>
								    </tr>
									<tr>
								       <td align="center" colspan="2"><input type="image" src="/images/resu_save.gif" alt="Save contact info" align="center"></td>
								    </tr>
						         </table> 
								 </cfform> 
							  </cfif>   
							</td>
                          </tr>
                        </table>   
					  </td>
					</tr>
				<cfif getResume.recordcount GT 0>
				   <!--- Get the Data for Work History --->
				   <cfset GetWorkHistory = request.CareersComponent.getallWorkHistory(getResume.ResumeID)>
				   <!--- Get the Data for Education History --->
				   <cfset GetEducHistory = request.CareersComponent.GetAllEduc(getResume.ResumeID)>
				   <!--- Get the Data for Degree DropDown --->
				   <cfset GetDegree = request.CareersComponent.getDegree()>
				    <tr>
					  <td colspan="2">&nbsp;</td>
					</tr>
					<tr>
                      <td background="/images/resu_HeadBG.gif"><img src="/images/resu_Stats.gif" width="151" height="20" alt="Job Target"></td>
					  <td background="/images/resu_HeadBG.gif" align="right">&nbsp;</td>
                    </tr>
					<tr>
					  <td colspan="2">
					  <a name="jobtarget" id="jobtarget" title="jobtarget"></a>
					    <table border="0" cellpadding="4" cellspacing="1" width="100%" bgcolor="##7088A2">
                          <tr>
                            <td bgcolor="##F5F8FA">
							   <table border="0" cellpadding="3" cellspacing="0">
							      <tr>
								    <td><strong>IPRA Approval:</strong> <cfif getResume.Status EQ 0>PENDING<cfelse>APPROVED</cfif></td>
								  </tr>
								  <tr>
								    <td><strong>Times Viewed:</strong> #getResume.TimesViewed#</td>
								  </tr>
								  <tr>
								    <td><strong>Job Applications Submitted:</strong></td>
								  </tr>
								  
							   </table> 
							</td>
                          </tr>
                        </table>   
					  </td>
					</tr>
					<tr>
					  <td colspan="2">&nbsp;</td>
					</tr>
					<tr>
                      <td background="/images/resu_HeadBG.gif"><img src="/images/resu_JobTarget.gif" width="138" height="20" alt="Job Target"></td>
					  <td background="/images/resu_HeadBG.gif" align="right"></td>
                    </tr>
					<tr>
					  <td colspan="2">
					    <table border="0" cellpadding="4" cellspacing="1" width="100%" bgcolor="##7088A2">
                          <tr>
                            <td bgcolor="##F5F8FA">
							  <cfform name="jobtarget" action="UpdateResume.cfm?type=JT" method="Post">
							    <input type="hidden" name="ResumeID" value="#getResume.ResumeID#">
							   <table border="0" cellpadding="3" cellspacing="0">
							     <tr>
							        <td colspan="2">Update your resume's demographic information below.</td>
							     </tr>
								 <tr>
								   <td><strong>Status:</strong></td>
								   <td><input type="radio" name="ResStatus" value="1" <cfif getResume.viewable EQ 1>checked</cfif>> Active <input type="radio" name="ResStatus" value="0" <cfif getResume.viewable EQ 0>checked</cfif>> Not Active</td>
								 </tr>
								 <tr>
								   <td><strong>Resume Title:</strong></td>
								   <td><input type="type" name="resTitle" value="#getResume.ResumeTitle#" size="30" maxlength="50"></td>
								 </tr>
								 <tr>
								   <td><strong>Postion Category:</strong></td>
								   <td><select name="Category">
								           <option value="">--Select One--</option> 
								         <cfloop query="getJobCategory">
								           <option value="#getJobCategory.CatID#" <cfif getResume.ResumeCat EQ getJobCategory.CatID>Selected</cfif>>#getJobCategory.CatDesc#</option>
										 </cfloop>
									   </select>
								   </td>
								 </tr>
								 <tr>
								   <td><strong>Salary Requirement:</strong></td>
								   <td><input type="type" name="salary" value="#getResume.SalaryRange#" size="25" maxlength="25"></td>
								 </tr>
								 <tr>
							        <td colspan="2"><strong>Objective:</strong><br>Your objective should convey what you are looking for in a career or from an employer for yourself. To remove your objective, clear the textbox and click the save button.</td>
							     </tr>
								 <tr>
							        <td colspan="2"><textarea cols="50" rows="4" name="Objective" style="border: 1px ##000 solid;" ONKEYDOWN="return checkMaxLength(this, event, 150)" ONSELECT="storeSelection(this)">#trim(getResume.objectivetext)#</textarea> <em>(Max 150 Characters)</em></td>
							     </tr>
								 <tr>
								   <td align="center" colspan="2"><input type="image" src="/images/resu_save.gif" alt="Save" align="center"></td>
								 </tr>
							   </table> 
							  </cfform> 
							</td>
                          </tr>
                        </table>   
					  </td>
					</tr>
                    <tr>
					  <td colspan="2">&nbsp;</td>
					</tr>
					<tr>
                      <td background="/images/resu_HeadBG.gif"><img src="/images/resu_CV.gif" width="138" height="20" alt="CoverLetter"></td>
					  <td background="/images/resu_HeadBG.gif" align="right"></td>
                    </tr>
					<tr>
					  <td colspan="2">
					    <a name="coverletter" id="coverletter" title="coverletter"></a>
					    <table border="0" cellpadding="4" cellspacing="1" width="100%" bgcolor="##7088A2">
                          <tr>
                            <td bgcolor="##F5F8FA">
							   <cfform name="addCV" action="UpdateResume.cfm?Type=CV" method="POST">
								  <input type="hidden" name="ResumeID" value="#getResume.ResumeID#"> 
								   <table border="0" cellpadding="3" cellspacing="0">
								     <tr>
								        <td>Enter a cover letter in the box below. A cover letter should be used to introduce yourself to a prospective employer. To remove your cover letter, clear the box and click the save button below.</td>
								     </tr>
									 <tr>
								        <td><textarea cols="70" rows="8" name="coverLetter" style="border: 1px ##000 solid;">#Trim(getResume.coverlettertext)#</textarea></td>
								     </tr>
									 <tr>
									   <td align="center"><input type="image" src="/images/resu_save.gif" alt="Save Cover Letter" align="center"></td>
									 </tr>
								   </table>   
							   </cfform>
							</td>
                          </tr>
                        </table>   
					  </td>
					</tr>
					<tr>
					  <td colspan="2">&nbsp;</td>
					</tr>
					<!--- <tr>
                      <td background="/images/resu_HeadBG.gif"><img src="/images/resu_objective.gif" width="138" height="20" alt="Objective"></td>
					  <td background="/images/resu_HeadBG.gif" align="right"><a href="EditResume.cfm?edit=Objective" style="color:##fff;font-weight:bold;padding-right:10px;">EDIT</a></td>
                    </tr>
					<tr>
					  <td colspan="2">
					    <table border="0" cellpadding="4" cellspacing="1" width="100%" bgcolor="##7088A2">
                          <tr>
                            <td bgcolor="##F5F8FA">
							   <table border="0" cellpadding="3" cellspacing="0">
							     <tr>
							        <td>Your objective should convey what you are looking for in a career or from an employer for yourself.</td>
							     </tr>
								 <tr>
							        <td><textarea cols="70" rows="2" name="Objective" style="border: 1px ##000 solid;" ONKEYDOWN="return checkMaxLength(this, event, 150)" ONSELECT="storeSelection(this)"></textarea></td>
							     </tr>
								 <tr>
								   <td ><input type="image" src="/images/resu_save.gif" alt="Save Objective" align="right"></td>
								 </tr>
							   </table>
							      
							</td>
                          </tr>
                        </table>   
					  </td>
					</tr>
					<tr>
					  <td colspan="2">&nbsp;</td>
					</tr> --->
					<tr>
                      <td background="/images/resu_HeadBG.gif"><img src="/images/resu_WorkHistory.gif" width="138" height="20" alt="Work History"></td>
					  <td background="/images/resu_HeadBG.gif" align="right"></td>
                    </tr>
					<tr>
					  <td colspan="2">
					    <a name="work" id="work" title="work"></a>
					    <table border="0" cellpadding="4" cellspacing="1" width="100%" bgcolor="##7088A2">
                          <tr>
                            <td bgcolor="##F5F8FA">
							   <cfif Not IsDefined("URL.WHID")>
								   <h3 style="color:##cc9900;font-weight:bold;font-size:14px;">Add New Work Experience</h3>
								   <strong style="color:##CC0000;">* Required Fields</strong>
								   <cfform name="addWH" action="UpdateResume.cfm?Type=WH&action=Add" method="POST">
								       <input type="hidden" name="ResumeID" value="#getResume.ResumeID#">
									   <table border="0" cellpadding="3" cellspacing="0">
									     <tr>
									        <td><strong style="color:##CC0000;">*</strong> <strong>Company:</strong></td>
									        <td><cfinput type="text" name="Company" size="45" maxlength="90" required="YES" message="You must include a Company Name"></td>
										 </tr>
										 <tr>
									        <td><strong style="color:##CC0000;">*</strong> <strong>Job Title:</strong></td>
									        <td><cfinput type="text" name="JobTitle" size="40" maxlength="60" required="YES" message="You must include a Job Title"></td>
										 </tr>
										 <tr>
									        <td><strong style="color:##CC0000;">*</strong> <strong>Location:</strong></td>
									        <td><cfinput type="text" name="Location" size="25" maxlength="50" required="YES" message="You must include a Location"></td>
										 </tr>
										 <tr>
									        <td><strong style="color:##CC0000;">*</strong> <strong>Worked From:</strong></td>
									        <td><cfinput type="text" name="WorkFrom" size="8" maxlength="8" required="YES" message="You must include a Start Date"> <strong style="color:##444; font-family:arial; font-size:10px;">Format: mm/yyyy</strong></td>
										 </tr>
										 <tr>
									        <td><strong style="color:##CC0000;">*</strong> <strong>Worked To:</strong></td>
									        <td><cfinput type="text" name="WorkTo" size="8" maxlength="8" required="YES" message="You must include a Completion Date. If you are currently working at this company enter Current"> <strong style="color:##444; font-family:arial; font-size:10px;">Format: mm/yyyy</strong></td>
										 </tr>
										 <tr>
									        <td valign="top"><strong style="color:##CC0000;">*</strong> <strong>Responsibilities:</strong></td>
									        <td><textarea name="WorkText" cols="50" rows="6"></textarea></td>
										 </tr>
										 <tr>
										   <td colspan="2" align="center"><input type="image" src="/images/resu_save.gif" alt="Save Work History" align="center"></td>
										 </tr>
									   </table><br>
								   </cfform>
							   <cfelse>
							        <cfset getThisWorkHistory = request.CareersComponent.getWorkHistory(URL.WHID)>
							      	<h3 style="color:##cc9900;font-weight:bold;font-size:14px;">Modify Work Experience</h3>
								   <strong style="color:##CC0000;">* Required Fields</strong>
								  <cfform name="addWH" action="UpdateResume.cfm?Type=WH&action=Update" method="POST">
								    <input type="hidden" name="ResumeID" value="#getResume.ResumeID#">
									<input type="hidden" name="WorkHistoryID" value="#getThisWorkHistory.WorkHistoryID#">
									   
								   <table border="0" cellpadding="3" cellspacing="0">
								     <tr>
								        <td><strong style="color:##CC0000;">*</strong> <strong>Company:</strong></td>
								        <td><cfinput type="text" name="Company" size="45" maxlength="90" value="#getThisWorkHistory.CompanyName#" required="YES" message="You must include a Company Name"></td>
									 </tr>
									 <tr>
								        <td><strong style="color:##CC0000;">*</strong> <strong>Job Title:</strong></td>
								        <td><cfinput type="text" name="JobTitle" size="40" maxlength="60" value="#getThisWorkHistory.JobTitle#" required="YES" message="You must include a Job Title"></td>
									 </tr>
									 <tr>
								        <td><strong style="color:##CC0000;">*</strong> <strong>Location:</strong></td>
								        <td><cfinput type="text" name="Location" size="40" maxlength="50" value="#getThisWorkHistory.WorkLocation#" required="YES" message="You must include a Location"></td>
									 </tr>
									 <tr>
								        <td><strong style="color:##CC0000;">*</strong> <strong>Worked From:</strong></td>
								        <td><cfinput type="text" name="WorkFrom" size="8" maxlength="8" value="#getThisWorkHistory.WorkFrom#" required="YES" message="You must include a Start Date"> <strong style="color:##444; font-family:arial; font-size:10px;">Format: mm/yyyy</strong></td>
									 </tr>
									 <tr>
								        <td><strong style="color:##CC0000;">*</strong> <strong>Worked To:</strong></td>
								        <td><cfinput type="text" name="WorkTo" size="8" maxlength="8" value="#getThisWorkHistory.WorkTo#"  required="YES" message="You must include a Completion Date. If you are currently working at this company enter Current"> <strong style="color:##444; font-family:arial; font-size:10px;">Format: mm/yyyy</strong></td>
									 </tr>
									 <tr>
								        <td valign="top"><strong style="color:##CC0000;">*</strong> <strong>Responsibilities:</strong></td>
								        <td><textarea name="WorkText" cols="50" rows="6">#Trim(getThisWorkHistory.WorkHistory)#</textarea></td>
									 </tr>
									 <tr>
									   <td colspan="2" align="center"><input type="image" src="/images/resu_save.gif" alt="Save Work History" align="center"></td>
									 </tr>
								   </table><br> 
								  </cfform>    
							   </cfif>
							   <table border="0" cellpadding="3" cellspacing="1" width="100%">
                                 <cfif getWorkHistory.recordcount GT 0>
									 <tr bgcolor="##94b0cd">
									   <td><strong>Action</strong></td>
	                                   <td><strong>Company</strong></td>
									   <td><strong>Title</strong></td>
									   <td><strong>Location</strong></td>
									   <td><strong>Employment Dates</strong></td>
	                                </tr>
									<cfloop query="GetWorkHistory">
									  <tr>
									    <td width="15%"><a href="EditResume.cfm?T=W&WHID=#getWorkHistory.WorkHistoryID#" style="color:##009933;">EDIT</a>&nbsp;|&nbsp;<a href="UpdateResume.cfm?Type=WH&action=Delete&R=#getResume.ResumeID#&WHID=#getWorkHistory.WorkHistoryID#" style="color:##990000;">REMOVE</a></td>
	                                    <td>#GetWorkHistory.CompanyName#</td>
										<td>#GetWorkHistory.JobTitle#</td>
									    <td>#GetWorkHistory.WorkLocation#</td>
									    <td>#GetWorkHistory.WorkFrom# - #GetWorkHistory.WorkTo#</td>
	                                  </tr>
								    </cfloop>
								<cfelse>
								   <tr>
								      <td align="center"><hr noshade size="1"><strong style="color:##777777;">You currently do not have any Work History saved. Use the form above to add work history</strong></td>
								   </tr>	
								</cfif>
                               </table>      
							</td>
                          </tr>
                        </table>   
					  </td>
					</tr>
					<tr>
					  <td colspan="2">&nbsp;</td>
					</tr>
					<tr>
                      <td background="/images/resu_HeadBG.gif"><img src="/images/resu_Education.gif" width="138" height="20" alt="Education"></td>
					  <td background="/images/resu_HeadBG.gif" align="right"></td>
                    </tr>
					<tr>
					  <td colspan="2">
					    <table border="0" cellpadding="4" cellspacing="1" width="100%" bgcolor="##7088A2">
                          <tr>
                            <td bgcolor="##F5F8FA">
							 <a name="EDUC" id="EDUC" title="EDUC"></a> 
							  <cfif IsDefined("URL.EDID")> 
							      <cfset GetThisEduc = request.CareersComponent.GetThisEduc(URL.EDID)>
								   <h3 style="color:##cc9900;font-weight:bold;font-size:14px;">Edit Educational Experience</h3>
								   <strong style="color:##CC0000;">* Required Fields</strong>
								   <cfform name="educ" action="UpdateResume.cfm?Type=ED&Action=Update" value="POST">
								      <input type="hidden" name="ResumeID" value="#getResume.ResumeID#">
									  <input type="hidden" name="EducationID" value="#GetThisEduc.EducationID#">
									  
									   <table border="0" cellpadding="3" cellspacing="0">
									     <tr>
									        <td><strong style="color:##CC0000;">*</strong> <strong>School:</strong></td>
									        <td><input type="text" name="School" value="#GetThisEduc.SchoolName#" size="40" maxlength="125"></td>
										 </tr>
										 <tr>
									        <td><strong style="color:##CC0000;">*</strong> <strong>Degree:</strong></td>
									        <td><select name="Degree">
											      <cfloop query="GetDegree">
											        <option value="#Trim(GetDegree.CodeValue)#" <cfif GetThisEduc.Degree EQ GetDegree.CodeValue>SELECTED</cfif>>#Trim(GetDegree.CodeDesc)#</option>
												  </cfloop>
												</select>
										    </td>
										 </tr>
										 <tr>
									        <td><strong>Graduation Date:</strong></td>
									        <td><input type="text" name="GradDate" value="#GetThisEduc.GraduationYr#" size="4" maxlength="4"> <em>(Format: YYYY)</em></td>
										 </tr>
										 <tr>
									        <td valign="top"><strong>Accomplishments/Comment:</strong></td>
									        <td><textarea name="Comment" cols="50" rows="6">#trim(GetThisEduc.EducationComment)#</textarea></td>
										 </tr>
										 <tr>
										   <td colspan="2" align="center"><input type="image" src="/images/resu_save.gif" alt="Save Education History" align="center"></td>
										 </tr>
									   </table><br>
								   </cfform>
							   <cfelse>
							       <h3 style="color:##cc9900;font-weight:bold;font-size:14px;">Add New Educational Experience</h3>
								   
								   <cfform name="educ" action="UpdateResume.cfm?Type=ED&Action=Add" value="POST">
								      <input type="hidden" name="ResumeID" value="#getResume.ResumeID#">
									  <strong style="color:##CC0000;">* Required Fields</strong>
									   <table border="0" cellpadding="3" cellspacing="0">
									     <tr>
									        <td><strong style="color:##CC0000;">*</strong> <strong>School:</strong></td>
									        <td><input type="text" name="School" size="" maxlength=""></td>
										 </tr>
										 <tr>
									        <td><strong style="color:##CC0000;">*</strong> <strong>Degree:</strong></td>
									        <td><select name="Degree">
											      <cfloop query="GetDegree">
												  <option value="#Trim(GetDegree.CodeValue)#">#Trim(GetDegree.CodeDesc)#</option>
												  </cfloop> 
												</select></td>
										 </tr>
										 <tr>
									        <td><strong>Graduation Date:</strong></td>
									        <td><input type="text" name="GradDate" size="4" maxlength="4"> <em>(Format: YYYY)</em></td>
										 </tr>
										 <tr>
									        <td valign="top"><strong>Accomplishments/Comment:</strong></td>
									        <td><textarea name="Comment" cols="50" rows="6"></textarea></td>
										 </tr>
										 <tr>
										   <td colspan="2" align="center"><input type="image" src="/images/resu_save.gif" alt="Save Education History" align="center"></td>
										 </tr>
									   </table><br>
								   </cfform>
							   </cfif>
							   
							   <table border="0" cellpadding="3" cellspacing="1" width="100%">
								 <cfif GetEducHistory.recordcount GT 0>
									 <tr bgcolor="##94b0cd">
									   <td><strong>Action</strong></td>
	                                   <td><strong>School</strong></td>
									   <td><strong>Degree</strong></td>
									   <td><strong>Graduation Date</strong></td>
	                                 </tr>
									 <cfloop query="GetEducHistory">
									   <tr>
										   <td width="15%"><a href="EditResume.cfm?EDID=#GetEducHistory.EducationID#&##EDUC" style="color:##009933;">EDIT</a>&nbsp;|&nbsp;<a href="UpdateResume.cfm?Type=ED&action=Delete&R=#getResume.ResumeID#&EDID=#GetEducHistory.EducationID#" style="color:##990000;">REMOVE</a></td>
		                                   <td>#GetEducHistory.SchoolName#</td>
										   <td>#GetEducHistory.Degreetext#</td>
										   <td>#GetEducHistory.GraduationYr#</td>
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
					  </td>
					</tr>
					<tr>
					  <td colspan="2">&nbsp;</td>
					</tr>
					<tr>
                      <td background="/images/resu_HeadBG.gif"><img src="/images/resu_Certs.gif" width="151" height="20" alt="Certifications"></td>
					  <td background="/images/resu_HeadBG.gif" align="right"></td>
                    </tr>
					<tr>
					  <td colspan="2">
					    <a name="certification"></a>
					    <table border="0" cellpadding="4" cellspacing="1" width="100%" bgcolor="##7088A2">
                          <tr>
                            <td bgcolor="##F5F8FA">
							  <cfform name="addcert" action="UpdateResume.cfm?Type=CE" method="POST" onsubmit="checkthisfieldlength(addcert, certs, 199);">
								  <input type="hidden" name="ResumeID" value="#getResume.ResumeID#"> 
							   <table border="0" cellpadding="3" cellspacing="0">
							     <tr>
							        <td>Add any certifications that you may hold in the space provided below. To remove all certifications, clear the box and click the save button below.  <em>(MAX. 200 Characters)</em></td>
							     </tr>
								 <tr>
							        <td><textarea cols="70" rows="5" name="certs" style="border: 1px ##000 solid;" ONKEYDOWN="return checkMaxLength(this, event, 199)" ONSELECT="storeSelection(this)">#trim(getResume.Certifications)#</textarea></td>
							     </tr>
								 <tr>
								   <td align="center"><input type="image" src="/images/resu_save.gif" alt="Save" align="center"></td>
								 </tr>
							   </table>
							  </cfform>    
							</td>
                          </tr>
                        </table>   
					  </td>
					</tr>
					<tr>
					  <td colspan="2">&nbsp;</td>
					</tr>
				    <tr>
                      <td background="/images/resu_HeadBG.gif"><img src="/images/resu_additinfo.gif" alt="Additional Info" width="151" height="20" border="0"></td>
					  <td background="/images/resu_HeadBG.gif" align="right"></td>
                    </tr>
					<tr>
					  <td colspan="2">
					    <a name="additional"></a>
					    <table border="0" cellpadding="4" cellspacing="1" width="100%" bgcolor="##7088A2">
                          <tr>
                            <td bgcolor="##F5F8FA">
							  <cfform name="addinfo" action="UpdateResume.cfm?Type=AD" method="POST" onsubmit="javascript:checkthisfieldlength(addinfo, additionalinfo, 199);">
								  <input type="hidden" name="ResumeID" value="#getResume.ResumeID#"> 
							   <table border="0" cellpadding="3" cellspacing="0">
							     <tr>
							        <td>Add any additional information that you would like to convey about yourself or your career. To remove all additional info, clear the box and click the save button below. <em>(MAX. 200 Characters)</em></td>
							     </tr>
								 <tr>
							        <td><textarea cols="70" rows="5" name="additionalinfo" style="border: 1px ##000 solid;" ONKEYDOWN="return checkMaxLength(this, event, 199)" ONSELECT="storeSelection(this)">#trim(getResume.AdditionalInfo)#</textarea></td>
							     </tr>
								 <tr>
								   <td align="center"><input type="image" src="/images/resu_save.gif" alt="Save" align="center"></td>
								 </tr>
							   </table>
							 </cfform> 
							     
							</td>
                          </tr>
                        </table> 
						<br>
						 <cfform name="saveactivate" action="UpdateResume.cfm?Type=AC" method="POST">
						    <input type="hidden" name="ResumeID" value="#getResume.ResumeID#">
							<table border="0" cellpadding="8" cellspacing="1" width="100%" bgcolor="##993300">
							   <tr bgcolor="##ffffff">
	                              <td align="center">
								    <table border="0" cellpadding="4" cellspacing="0" width="100%">
									   <cfif getResume.viewable EQ 0>
									     <tr>
										   <td>When you have completed your resume click the button below to activate your resume and allow the IPRA admin to approve your resume for inclusion into the resume bank.</td>
										 </tr>
										 <tr>
									       <td align="center"><input type="image" src="/images/btn_savenactivate.gif" alt="Save and Activate your resume" border="0"></td>
									     </tr>
										<cfelse>
										  <tr>
									        <td align="center"><strong>YOUR RESUME IS CURRENTLY ACTIVE IN OUR SYSTEM</strong></td>
									      </tr>
										</cfif>
									 </table>           
								  </td>
	                           </tr>
	                       </table>
						 </cfform>  
					  </td>
					</tr>
					<tr>
					  <td colspan="2">&nbsp;</td>
					</tr>
				<cfelse>
				    <tr>
					  <td colspan="2">&nbsp;</td>
					</tr>
					<tr>
                      <td background="/images/resu_HeadBG.gif"><img src="/images/resu_JobTarget.gif" width="138" height="20" alt="Job Target"></td>
					  <td background="/images/resu_HeadBG.gif" align="right"></td>
                    </tr>
					<tr>
					  <td colspan="2">
					   <cfform name="form1" action="UpdateResume.cfm?Step=1" Method="POST">
						 <table border="0" cellpadding="4" cellspacing="1" width="100%" bgcolor="##7088A2">
	                        <tr>
	                           <td bgcolor="##F5F8FA">
								  <table border="0" cellpadding="3" cellspacing="0">
								     <tr>
								        <td colspan="2">To begin the process, please fill out the form below giving us a title for your resume and telling potential employers some demographic information about yourself, such as Salary Range and the type of position you are seeking.</td>
								     </tr>
									 <tr>
									   <td><strong>Resume Title:</strong></td>
									   <td><input type="type" name="resTitle" value="" size="50" maxlength="50"></td>
									 </tr>
									 <tr>
									   <td><strong>Position Category:</strong></td>
									   <td><select name="Category">
	
									         <option value="">--Select One--</option> 
									         <cfloop query="getJobCategory">
									           <option value="#getJobCategory.CatID#">#getJobCategory.CatDesc#</option>
											 </cfloop>
										   </select>
									   </td>
									 </tr>
									 <tr>
									   <td><strong>Salary Requirement:</strong></td>
									   <td colspan="2"><input type="type" name="salary" value="" size="35" maxlength="25"></td>
									 </tr>
									 
									 <tr>
							            <td colspan="2"><strong>Objective:</strong><br>Your objective should convey what you are looking for in a career or from an employer for yourself.</td>
							         </tr>
								     <tr>
							           <td colspan="2"><textarea cols="50" rows="4" name="Objective" style="border: 1px ##000 solid;" ONKEYDOWN="return checkMaxLength(this, event, 150)" ONSELECT="storeSelection(this)"></textarea> <em>(Max 150 Characters)</em></td>
							         </tr>
									 <tr>
									   <td>&nbsp;</td>
									 </tr>
									 <tr>
									   <td align="right" colspan="2"><input type="image" src="/images/resu_save_continue.gif" alt="Save Job Target" align="right"></td>
									 </tr>
								  </table> 
							  </td>
	                        </tr>
	                      </table>   
					   </cfform>	
					             
					  </td>
					</tr>
					<tr>
					  <td colspan="2">&nbsp;</td>
					</tr>
				  </cfif>
				</table>  
			  </td>
		  </tr>
		</table>  	  
	</cfoutput>
<cfmodule template="#Application.Footer#">	