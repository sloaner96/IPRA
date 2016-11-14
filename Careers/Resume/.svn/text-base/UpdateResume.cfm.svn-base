<cfparam name="URL.Step" default="0" type="numeric">
<cfparam name="URL.Type" default="" type="String">
<cfparam name="URL.action" default="" type="String">

<cfset Error = ArrayNew(1)>
	<cfmodule template="#Application.Header#" sectiontitle="Resume Builder: Edit Resume">
	    <cfoutput>
			<table border="0" cellpadding="3" cellspacing="0" width="100%">
			   <tr>
			      <td valign="top" width="150">
					<br>
					    <cfmodule template="#Application.tagdir#/aboutusnav.cfm" level="3">
				    </td>
					<td valign="top"> 
						<cfif URL.Step EQ 1>
						
						   <!--- Check Form Fields --->
						     <cfif Not IsDefined("Session.ResBuilder")>
							   <cflocation url="index.cfm" addtoken="NO">
							 </cfif>
							 
							 <cfif Len(trim(form.resTitle)) EQ 0>
							    <cflocation url="EditResume.cfm?e=1" addtoken="NO">
							 </cfif>
						     
							 <cfif Len(trim(form.Category)) EQ 0>
							   <cflocation url="EditResume.cfm?e=2" addtoken="NO">
							 </cfif>
							<!--- Everything OK, Start Transaction and Check for Duplicates --->
						    <cfset getResume = request.CareersComponent.getResume(Session.ResBuilder.Contact.ContactID)>
							 
							<cfif getResume.RecordCount EQ 0> 
						      <!--- No Dups, cool lets add the Master Record --->
						         <cfinvoke component="IPRA.Careers" method="CreateMasterRec">
								     <cfinvokeargument name="ContactID" value="#Session.ResBuilder.Contact.ContactID#">
									 <cfinvokeargument name="ResumeTitle" value="#Trim(Form.resTitle)#">
									 <cfinvokeargument name="Category" value="#Trim(form.Category)#">
									 
									 <cfif Len(trim(form.salary)) GT 0>
									   <cfinvokeargument name="SalaryRange" value="#trim(form.salary)#">
									 </cfif>
									 <cfif Len(trim(form.Objective)) GT 0>
									   <cfinvokeargument name="Objective" value="#Left(Trim(form.Objective), 150)#">
									 </cfif>  
								 </cfinvoke>
						      <!--- Kick back to EditResume.cfm --->
							    <cflocation url="EditResume.cfm" addtoken="NO">
						   <cfelse>
						     <cflocation url="EditResume.cfm" addtoken="NO">
						   </cfif>
						<cfelse>
						  <br><strong>There was a problem while attempting to save your record. Please correct the error below and resubmit.</strong>
						  
						  <!--- ***************** CONTACT INFO SECTION ************* ---> 	 
						   <cfif URL.Type EQ "CI">
						      <cfset Error = ArrayNew(1)>
							<!--- Make sure the required fields are here --->
							   <cfif Trim(Len(form.contactID)) EQ 0>
							      <cfset x = ArrayAppend(Error, "Error! We could not find the record to update.")>
							   </cfif>
							   
							   <cfif Trim(Len(form.firstname)) EQ 0>
							      <cfset x = ArrayAppend(Error, "Error! You Must include your Firstname.")>
							   </cfif>
							   
							   <cfif Trim(Len(form.lastname)) EQ 0>
							     <cfset x = ArrayAppend(Error, "Error! You Must include your Lastname.")>
							   </cfif>
							   
							   <cfif Trim(Len(form.Email)) EQ 0>
							     <cfset x = ArrayAppend(Error, "Error! You Must include your Email address.")>
							   </cfif>
							   
							   <cfif Trim(Len(form.BestContact)) EQ 0>
							     <cfset x = ArrayAppend(Error, "Error! You Must select a best way to contact you.")>
							   </cfif>
						      <cfif ArrayLen(Error) EQ 0>
							   <!--- Update ContactInfo --->
							    <cfinvoke component="IPRA.Careers" method="UpdateContact">
							      <cfinvokeargument name="contactid" value="#Trim(form.contactid)#" />
								  <cfinvokeargument name="firstname" value="#Trim(form.firstname)#" />
								  <cfinvokeargument name="lastname" value="#Trim(form.lastname)#" />
								  
								  <cfif Len(Trim(form.middleName)) GT 0>
								     <cfinvokeargument name="MiddleInitial" value="#Trim(form.middleName)#" />
								  </cfif>
								  <cfif Len(Trim(form.HomeAddr1)) GT 0>
								     <cfinvokeargument name="Address1" value="#Trim(form.HomeAddr1)#" />
								  </cfif>	
								  <cfif Len(Trim(form.HomeAddr2)) GT 0>
								     <cfinvokeargument name="Address2" value="#Trim(form.HomeAddr2)#" />
								  </cfif>
								  <cfif Len(Trim(form.City)) GT 0>
								     <cfinvokeargument name="City" value="#Trim(form.City)#" />
								  </cfif>
								  <cfif Len(Trim(form.State)) GT 0>
								     <cfinvokeargument name="State" value="#Trim(form.State)#" />
								  </cfif>
								  <cfif Len(Trim(form.ZipCode)) GT 0>
								     <cfinvokeargument name="ZipCode" value="#Trim(form.ZipCode)#" />
								  </cfif>
								  <cfif Len(Trim(form.HomePhone)) GT 0>
								     <cfinvokeargument name="HomePhone" value="#ReplaceList(Trim(form.HomePhone), '(,), ,-','')#" />
								  </cfif>
								  <cfif Len(Trim(form.WorkPhone)) GT 0>
								     <cfinvokeargument name="WorkPhone" value="#ReplaceList(Trim(form.WorkPhone), '(,), ,-','')#" />
								  </cfif>
								  <cfif Len(Trim(form.MobilePhone)) GT 0>
								     <cfinvokeargument name="Mobile" value="#ReplaceList(Trim(form.MobilePhone), '(,), ,-','')#" />
								  </cfif>
								  <cfinvokeargument name="Email" value="#Trim(form.Email)#" />
								  <cfinvokeargument name="BestContact" value="#Trim(form.BestContact)#" />
							   </cfinvoke> 
							   
							   <cfset checkContact = request.CareersComponent.getContact(Session.ResBuilder.Contact.ContactID)>
							   
                               <cfset session.ResBuilder.Contact = CheckContact>
							   
							   <cflocation url="EditResume.cfm?##contact" addtoken="NO">
							  <cfelse>	 
								  <!--- Throw Error --->
								   <ul>
								   <cfloop index="i" from="1" to="#ArrayLen(Error)#">
								     <li Class="errortext"><strong>#Error[1]#</strong></li>
								   </cfloop>
								  </ul> 
						     </cfif>  
						  <!--- ***************** MASTER RECORD SECTION ************* ---> 		   
						   <cfelseif URL.Type EQ "JT">	   
							   <cfif Not IsDefined("form.ResStatus")>
								    <cfset x = ArrayAppend(Error, "Error! You must select a viewable status")>
							   </cfif>
							   <cfif len(trim(form.resTitle)) EQ 0>
								    <cfset x = ArrayAppend(Error, "Error! You must enter A title for your resume")>
							   </cfif>	  
							   <cfif len(trim(form.Category)) EQ 0>
								    <cfset x = ArrayAppend(Error, "Error! You must select a category for your resume.")>
							   </cfif>		
							   
								  <cfif ArrayLen(Error) EQ 0>
									   <!--- Update JobFocus  --->
									     <cfinvoke component="IPRA.Careers" method="UpdMasterRec">
											<cfinvokeargument name="ResumeID" value="#form.resumeID#">
											<cfinvokeargument name="ResumeStatus" value="#form.ResStatus#">
											<cfinvokeargument name="ResumeTitle" value="#Trim(form.resTitle)#">
											<cfinvokeargument name="Category" value="#trim(form.Category)#">
											<cfif Len(trim(form.salary)) GT 0>
											   <cfinvokeargument name="SalaryRange" value="#trim(form.salary)#">
											</cfif>
											<cfif Len(trim(form.Objective)) GT 0>
											  <cfinvokeargument name="Objective" value="#trim(form.Objective)#">
											</cfif>
										 </cfinvoke>
										 
										 <cflocation url="EditResume.cfm?##jobtarget" addtoken="NO">
								  <cfelse>	 
									  <!--- Throw Error --->
									   <ul>
									   <cfloop index="i" from="1" to="#ArrayLen(Error)#">
									     <li Class="errortext"><strong>#Error[1]#</strong></li>
									   </cfloop>
									  </ul> 
								  </cfif>  
							   
						  <!--- ***************** COVER LETTER SECTION ************* ---> 		   
						   <cfelseif URL.Type EQ "CV">		
									  
								  <cfif len(trim(form.coverLetter)) EQ 0>
								    <cfset x = ArrayAppend(Error, "Error! You must enter coverletter text to save a coverletter")>
								  </cfif>
								  
								  <cfif ArrayLen(Error) EQ 0>
									   <!--- Update Cover Letter  --->
									     <cfset updateCV = request.CareersComponent.UpdCoverLetter(form.resumeID, trim(form.coverLetter))>
										 
										 <cflocation url="EditResume.cfm?##coverletter" addtoken="NO">
								  <cfelse>	 
									  <!--- Throw Error --->
									   <ul>
									   <cfloop index="i" from="1" to="#ArrayLen(Error)#">
									     <li Class="errortext"><strong>#Error[1]#</strong></li>
									   </cfloop>
									  </ul> 
								  </cfif>   
						  <!--- ***************** CERTIFICATION SECTION ************* ---> 		   
						   <cfelseif URL.Type EQ "CE">		    
							   <cfif len(trim(form.certs)) EQ 0>
							       <cfset x = ArrayAppend(Error, "Error! You must enter certification text to save certifications")>
							   </cfif>
							   <cfif len(trim(form.certs)) GT 200>
							       <cfset x = ArrayAppend(Error, "Error! Your certification text can not be longer than 200 characters.")>
							   </cfif>
				
							   <cfif ArrayLen(Error) EQ 0>
								   <!--- Update Certifications --->
								     <cfset updateCert = request.CareersComponent.UpdCerts(form.resumeID, trim(form.certs))>
									 
									 <cflocation url="EditResume.cfm?##certification" addtoken="NO">
							   <cfelse>	 
								  <!--- Throw Error --->
								   <ul>
								   <cfloop index="i" from="1" to="#ArrayLen(Error)#">
								     <li Class="errortext"><strong>#Error[1]#</strong></li>
								   </cfloop>
								  </ul> 
							   </cfif>  
						  <!--- ***************** ADDITIONAL INFORMATION SECTION ************* ---> 		   
						   <cfelseif URL.Type EQ "AD">		    
							  
							   <cfif len(trim(form.additionalinfo)) EQ 0>
								   <cfset x = ArrayAppend(Error, "Error! You must enter text to save additional Information")>
							   </cfif>
							   
							   <cfif len(trim(form.additionalinfo)) GT 200>
								   <cfset x = ArrayAppend(Error, "Error! The text you entered is too long, you can only add 200 characters to the additional information.")>
							   </cfif>
							   		  
							   <cfif ArrayLen(Error) EQ 0>
								   <!--- Update Additional Info --->
								     <cfset updateCert = request.CareersComponent.UpdAdditionalInfo(form.resumeID, trim(form.additionalinfo))>
									 
									 <cflocation url="EditResume.cfm?##additional" addtoken="NO">
							   <cfelse>	 
								  <!--- Throw Error --->
								   <ul>
								   <cfloop index="i" from="1" to="#ArrayLen(Error)#">
								     <li Class="errortext"><strong>#Error[1]#</strong></li>
								   </cfloop>
								  </ul> 
							   </cfif>  
						   <!--- ***************** Activate Resume ************* ---> 	    
						   <cfelseif URL.Type EQ "AC">
						       <cfset updateCert = request.CareersComponent.ActivateResume(form.ResumeID)>
							   <cflocation url="EditResume.cfm" addtoken="NO">   		   
						  <!--- ***************** WORK HISTORY SECTION ************* ---> 	    
						   <cfelseif URL.Type EQ "WH">		    
								 <cfif URL.Action EQ "ADD">
								    
									<!--- Check Form for Problems --->
									   <cfif Len(trim(form.Company)) EQ 0>
									     <cfset x = ArrayAppend(Error, "Error! You must include a Company Name")>
									   </cfif>
									   
									   <cfif Len(trim(form.Location)) EQ 0>
									     <cfset x = ArrayAppend(Error, "Error! You must include a Company Location")>
									   </cfif>
									   
									   <cfif Len(trim(form.JobTitle)) EQ 0>
									     <cfset x = ArrayAppend(Error, "Error! You must include a Job Title")>
									   </cfif>
									   
									   <cfif Len(trim(form.WorkFrom)) EQ 0>
									     <cfset x = ArrayAppend(Error, "Error! You must include a Job Start Date")>
									   </cfif>
									   
									   <cfif Len(trim(form.WorkTo)) EQ 0>
									     <cfset x = ArrayAppend(Error, "Error! You must include a Job End Date")>
									   </cfif>
									   
									   <cfif Len(trim(form.WorkText)) EQ 0>
									     <cfset x = ArrayAppend(Error, "Error! You must include at least one responsibility")>
									   </cfif>
									   
									<cfif ArrayLen(Error) EQ 0>
									   <!--- Update Work History --->
								         <cfinvoke component="IPRA.Careers" method="InsertWorkHistory">
										    
											<cfinvokeargument name="ResumeID" value="#Trim(form.ResumeID)#">
											<cfinvokeargument name="CompanyName" value="#Trim(form.Company)#">
											<cfinvokeargument name="JobTitle" value="#Trim(form.JobTitle)#">
							                <cfinvokeargument name="WorkFrom" value="#Trim(form.WorkFrom)#">
											<cfinvokeargument name="WorkTo" value="#Trim(form.WorkTo)#">
											<cfinvokeargument name="WorkLocation" value="#Trim(form.Location)#">
											<cfinvokeargument name="WorkHistory" value="#Trim(form.WorkText)#">
										 </cfinvoke>
										 
										 <cflocation url="EditResume.cfm?##work" addtoken="NO">
									<cfelse>
									  <!--- Throw Error --->
									   <ul>
									   <cfloop index="i" from="1" to="#ArrayLen(Error)#">
									     <li Class="errortext"><strong>#Error[1]#</strong></li>
									   </cfloop>
									  </ul> 
									</cfif>
								 <cfelseif URL.Action EQ "Update">   
								    <!--- Check Form for Problems --->
									   <cfif Len(trim(form.Company)) EQ 0>
									     <cfset x = ArrayAppend(Error, "Error! You must include a Company Name")>
									   </cfif>
									   
									   <cfif Len(trim(form.Location)) EQ 0>
									     <cfset x = ArrayAppend(Error, "Error! You must include a Company Location")>
									   </cfif>
									   
									   <cfif Len(trim(form.JobTitle)) EQ 0>
									     <cfset x = ArrayAppend(Error, "Error! You must include a Job Title")>
									   </cfif>
									   
									   <cfif Len(trim(form.WorkFrom)) EQ 0>
									     <cfset x = ArrayAppend(Error, "Error! You must include a Job Start Date")>
									   </cfif>
									   
									   <cfif Len(trim(form.WorkTo)) EQ 0>
									     <cfset x = ArrayAppend(Error, "Error! You must include a Job End Date")>
									   </cfif>
									   
									   <cfif Len(trim(form.WorkText)) EQ 0>
									     <cfset x = ArrayAppend(Error, "Error! You must include at least one responsibility")>
									   </cfif>
									   
									<cfif ArrayLen(Error) EQ 0>
									   <!--- Update Work History --->
								         <cfinvoke component="IPRA.Careers" method="UpdWorkHistory">
										    <cfinvokeargument name="WorkHistoryID" value="#Trim(form.WorkHistoryID)#">
										    <cfinvokeargument name="ResumeID" value="#Trim(form.ResumeID)#">
											<cfinvokeargument name="CompanyName" value="#Trim(form.Company)#">
											<cfinvokeargument name="JobTitle" value="#Trim(form.JobTitle)#">
							                <cfinvokeargument name="WorkFrom" value="#Trim(form.WorkFrom)#">
											<cfinvokeargument name="WorkTo" value="#Trim(form.WorkTo)#">
											<cfinvokeargument name="WorkLocation" value="#Trim(form.Location)#">
											<cfinvokeargument name="WorkHistory" value="#Trim(form.WorkText)#">
										 </cfinvoke>
										 
										 <cflocation url="EditResume.cfm?##work" addtoken="NO">
									<cfelse>
									  
									  <!--- Throw Error --->
									   <ul>
									   <cfloop index="i" from="1" to="#ArrayLen(Error)#">
									     <li Class="errortext"><strong>#Error[1]#</strong></li>
									   </cfloop>
									  </ul> 
									</cfif>
								 
								 <cfelseif URL.Action EQ "Delete">  
								    
								      <cfif Not IsDefined("url.WHID")>
									    <cfset x = ArrayAppend(Error, "Error! We could not delete the record")>
									  <cfelse>
									     <cfif Not IsNumeric(url.WHID)>
										    <cfset x = ArrayAppend(Error, "Error! We could not delete the record")>
										 </cfif>	
									  </cfif>
									  
									  <cfif Not IsDefined("url.R")>
									    <cfset x = ArrayAppend(Error, "Error! We could not delete the record")>
									  <cfelse>
									     <cfif Not IsNumeric(url.R)>
										    <cfset x = ArrayAppend(Error, "Error! We could not delete the record")>
										 </cfif>	
									  </cfif>
									  
									  <cfif ArrayLen(Error) EQ 0>
										  <!--- Delete Work History --->
										     <cfset DeleteWH = request.CareersComponent.DelWorkHistory(URL.WHID, URL.R)>
											 
											 <cflocation url="EditResume.cfm?##work" addtoken="NO">
									  <cfelse>	 
										  <!--- Throw Error --->
										   <ul>
										   <cfloop index="i" from="1" to="#ArrayLen(Error)#">
										     <li Class="errortext"><strong>#Error[1]#</strong></li>
										   </cfloop>
										  </ul> 
									  </cfif>
								 </cfif>  
						  <!--- ***************** EDUCATION SECTION ************* ---> 	
						   <cfelseif URL.Type EQ "ED">		    
							     <cfif URL.Action EQ "ADD">
								    <cfif Len(trim(form.School)) EQ 0>
									   <cfset x = ArrayAppend(Error, "Error! You must include the school you attended")>
									</cfif>
									<cfif Len(trim(form.Degree)) EQ 0>
									   <cfset x = ArrayAppend(Error, "Error! You must include the degree attained.")>
									</cfif>
									
									<cfif ArrayLen(Error) EQ 0>
									    <!--- Add Education --->   
										<cfinvoke component="IPRA.Careers" method="InsertEduc">
										    <cfinvokeargument name="ResumeID" value="#form.ResumeID#">
							                <cfinvokeargument name="SchoolName" value="#trim(form.School)#">
							                <cfinvokeargument name="Degree" value="#trim(form.Degree)#">
											
											<cfif Len(trim(form.GradDate)) GT 0>
							                   <cfinvokeargument name="GradYear" value="#trim(form.GradDate)#">
											</cfif>
											
											<cfif Len(trim(form.Comment)) GT 0>
							                  <cfinvokeargument name="EducTxt" value="#trim(form.Comment)#">
											</cfif>
										</cfinvoke>
									    <cflocation url="EditResume.cfm?##EDUC" addtoken="NO">
									<cfelse>
										  
										  <!--- Throw Error --->
										   <ul>
										   <cfloop index="i" from="1" to="#ArrayLen(Error)#">
										     <li Class="errortext"><strong>#Error[1]#</strong></li>
										   </cfloop>
										  </ul> 
									</cfif>
								 <cfelseif URL.Action EQ "Update">   
								    <!--- Update Education --->
								     <cfif Len(trim(form.School)) EQ 0>
									   <cfset x = ArrayAppend(Error, "Error! You must include the school you attended")>
									</cfif>
									<cfif Len(trim(form.Degree)) EQ 0>
									   <cfset x = ArrayAppend(Error, "Error! You must include the degree attained.")>
									</cfif>
									
									<cfif ArrayLen(Error) EQ 0>
									    <!--- Add Education --->   
										<cfinvoke component="IPRA.Careers" method="UpdEduc">
										    <cfinvokeargument name="EducID" value="#form.educationID#">
							                <cfinvokeargument name="SchoolName" value="#trim(form.School)#">
							                <cfinvokeargument name="Degree" value="#trim(form.Degree)#">
											
											<cfif Len(trim(form.GradDate)) GT 0>
							                   <cfinvokeargument name="GradYear" value="#trim(form.GradDate)#">
											</cfif>
											
											<cfif Len(trim(form.Comment)) GT 0>
							                  <cfinvokeargument name="EducTxt" value="#trim(form.Comment)#">
											</cfif>
										</cfinvoke>
									    <cflocation url="EditResume.cfm?##EDUC" addtoken="NO">
									<cfelse>
										  
										  <!--- Throw Error --->
										   <ul>
										   <cfloop index="i" from="1" to="#ArrayLen(Error)#">
										     <li Class="errortext"><strong>#Error[1]#</strong></li>
										   </cfloop>
										  </ul> 
									</cfif>
								 <cfelseif URL.Action EQ "Delete">  
								    <!--- Delete Education --->
								     <cfif Not IsDefined("url.EDID")>
									    <cfset x = ArrayAppend(Error, "Error! We could not delete the record")>
									  <cfelse>
									     <cfif Not IsNumeric(url.EDID)>
										    <cfset x = ArrayAppend(Error, "Error! We could not delete the record")>
										 </cfif>	
									  </cfif>
									  
									  <cfif Not IsDefined("url.R")>
									    <cfset x = ArrayAppend(Error, "Error! We could not delete the record")>
									  <cfelse>
									     <cfif Not IsNumeric(url.R)>
										    <cfset x = ArrayAppend(Error, "Error! We could not delete the record")>
										 </cfif>	
									  </cfif>
									  
									  <cfif ArrayLen(Error) EQ 0>
										  <!--- Delete Work History --->
										     <cfset DeleteWH = request.CareersComponent.DeleteEduc(URL.EDID, URL.R)>
											 
											 <cflocation url="EditResume.cfm?##EDUC" addtoken="NO">
									  <cfelse>	 
										  <!--- Throw Error --->
										   <ul>
										   <cfloop index="i" from="1" to="#ArrayLen(Error)#">
										     <li Class="errortext"><strong>#Error[1]#</strong></li>
										   </cfloop>
										  </ul> 
									  </cfif>
								 </cfif> 
							    	   
						   </cfif>
						   
						</cfif>
	                  <br>
					  <strong><a href="##" onclick="javascript:history.back(-1);">Click Here</a> to go back and Correct your Error(s) </strong>
				  </td>
			  </tr>
			</table>  	  
		</cfoutput>
<cfmodule template="#Application.Footer#">	