<cfmodule template="#Application.header#" section="0" sectiontitle="Site Admin">
  <cfoutput>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="160"><br>
		    <cfmodule template="#Application.tagdir#/adminnav.cfm" level="1">
		   </td>
		   <td valign="top"><br>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>IPRA Administrative Site</h3></td>
		        </tr>
		      </table>
			  <table border="0" cellpadding="6" cellspacing="0" width="100%">
				<tr>
				  <td class="regtext">Welcome <strong>#Session.AdminInfo.Firstname#!</strong> Your last login was #DateFormat(Session.AdminInfo.LastLogin, 'MM/DD/YY')# at #TimeFormat(Session.AdminInfo.LastLogin,'hh:mm tt')#</td>
				  <td class="regtext" align="right"><a href="/Admin/Logout.cfm" style="color:##990000;">[Logout]</a></td>
				</tr>
              </table>
			  
			  <table border="0" cellpadding="6" cellspacing="0" width="100%">
		        
				<tr>
		           <td class="RegText">
				      <table border="0" cellpadding="3" cellspacing="0" width="100%">
                         <tr>
						   <td valign="Top" width="49%">
						     <table border="0" cellpadding="3" cellspacing="0" width="100%">
                                <cfif Session.AdminInfo.AllowMember EQ 1>
									 <tr bgcolor="##003366">
			                            <td><strong style="color:##ffffff;">New Members (Last 2 Weeks)</strong></td>
			                          </tr> 
									  <tr>
									    <td>
										  <cfset ThisDate = DateAdd('d', -14, now())>
										  <cfquery name="GetNewMbr" datasource="#Application.dsn#">
										    Select m.MemberID, m.Lastname, m.FirstName, m.Company, MembershipBegin, MemberType,
											  (Select AgencyName
											    From Agencies
												Where IPRAAgencyID = M.IPRACOID) as AgencyName
											 From members m
											 Where MembershipBegin >= #ThisDate#
											 AND IPRAMemberID = 0
											 AND LastSync IS NULL
											 Order by m.Lastname, m.FirstName
										  </cfquery>
										  <table border="0" cellpadding="3" cellspacing="1" width="100%" bgcolor="eeeeee">
			                                 <cfif GetNewMbr.recordcount GT 0>
												 <tr>
				                                   <td>Site MemberID</td>
												   <td>Member Name</td>
												   <td>Company</td>
												   <td>Member Type</td>
												   <td>Joined</td>
				                                 </tr>
												 <cfloop query="GetnewMbr">
												   <tr bgcolor="ffffff">
												     <td><a href="Membership/MembershipDetail.cfm?MbrID=#GetNewMbr.MemberID#">#GetNewMbr.MemberID#</a></td>
												     <td>#GetNewMbr.Lastname#, #GetNewMbr.Firstname#</td>
													 <td><cfif GetNewMbr.AgencyName NEQ "">#GetNewMbr.AgencyName#<cfelse>#GetNewMbr.Company#</cfif></td>
													 <td>#MemberType#</td>
												     <td>#DateFormat(GetNewMbr.MembershipBegin, 'mm/dd/yyyy')#</td>
												   </tr>
												 </cfloop>
											 <cfelse>
											  <tr>
											    <td class="regtext"><strong style="color:##969696;">There are no New Members</strong></td>
											  </tr>	 
											 </cfif>
			                              </table>
										</td>
									  </tr>
									     <cfset ThisDate = DateAdd('d', -14, now())>
										  <cfquery name="GetChangeMbr" datasource="#Application.dsn#">
										    Select m.MemberID, m.IPRAMemberID, m.Lastname, m.FirstName, m.Company, MemberType, LastUpdated,
											  (Select AgencyName
											    From Agencies
												Where IPRAAgencyID = M.IPRACOID) as AgencyName
											 From members m
											 Where LastSync <> LastUpdated
											 AND LastUpdated >= #ThisDate#
											 Order by LastUpdated Desc, m.Lastname, m.FirstName
										  </cfquery>
								    <cfif GetChangeMbr.recordcount GT 0>
									   <tr bgcolor="##003366">
			                            <td><strong style="color:##ffffff;">Member Update (Last 2 Weeks)</strong></td>
			                          </tr> 
									  <tr>
									    <td>
										  
										  <table border="0" cellpadding="3" cellspacing="1" width="100%" bgcolor="eeeeee">
			                                 
												 <tr>
												   <td>IPRA ID</td>
												   <td>Member Name</td>
												   <td>Company</td>
												   <td>Changed</td>
				                                 </tr>
												 <cfloop query="GetChangeMbr">
												   <tr bgcolor="ffffff">
												     <td><a href="Membership/MembershipDetail.cfm?MbrID=#GetChangeMbr.MemberID#">#GetChangeMbr.IPRAMemberID#</a></td>
												     <td>#GetChangeMbr.Lastname#, #GetChangeMbr.Firstname#</td>
													 <td><cfif GetChangeMbr.AgencyName NEQ "">#GetChangeMbr.AgencyName#<cfelse>#GetChangeMbr.Company#</cfif></td>
												     <td>#DateFormat(GetChangeMbr.LastUpdated, 'mm/dd/yyyy')#</td>
												   </tr>
												 </cfloop>
											  
											 
			                              </table>
										</td>
									  </tr>
									</cfif>
								  </cfif>
								  <cfif Session.AdminInfo.AllowAdmin EQ 1>
									  <cfquery name="GetNewJobs" datasource="#Application.dsn#">
									    Select JobId, MemberID, JobTitle, DateEntered
										From JobPostings
										where DateApproved is null
										and Approved = 0
										order by dateentered desc
									  </cfquery>
									  <tr>
			                            <td bgcolor="##003366"><strong style="color:##ffffff;">New Job Posting</strong></td>
			                          </tr> 
									  <cfif GetNewJobs.recordcount GT 0>
										  <tr>
										    <td>
											  <strong style="color:##cc0000;size:10px;">* Member Posted</strong>
											  <table border="0" cellpadding="3" cellspacing="1" width="100%" bgcolor="eeeeee">
				                                 <tr>
				                                   <td>Date Posted</td>
												   <td>Job Title</td>
				                                 </tr>
												 <cfloop query="GetNewJobs">
													 <tr bgcolor="ffffff">
					                                   <td><a href="JobPostings/Approvejobs.cfm?jobID=#JobId#">#DateFormat(DateEntered, 'mm/dd/yyyy')#</a></td>
													   <td>#JobTitle# <cfif memberid NEQ ""><strong style="color:##cc0000;">*</strong></cfif></td>
					                                 </tr>
												 </cfloop>
				                              </table>
											</td>
										  </tr>
									 <cfelse>
									  <tr>
									     <td class="regtext"><strong style="color:##969696;">There are no Job Postings to Approve</strong></td>
									  </tr>	  
									 </cfif>
								 </cfif>
								   <tr>
								     <td>&nbsp;</td>
								   </tr>
								   <tr>
			                           <td bgcolor="##003366"><strong style="color:##ffffff;">New Resumes Posted</strong></td>
			                       </tr> 
								   <cfset getResume = request.CareersComponent.GetUnapproved()>
								   <cfif getresume.recordcount GT 0>
									  <tr>
										  <td>
											 <strong style="color:##cc0000;size:10px;">* Member Posted</strong>
											 <table border="0" cellpadding="3" cellspacing="1" width="100%" bgcolor="eeeeee">
				                                 <tr>
												   <td>Date Created</td>
				                                   <td>Name</td>
												   <td>Resume Title</td>
				                                 </tr>
												 <cfloop query="getResume">
													 <tr bgcolor="ffffff">
													   <td>#DateFormat(DateAdded, 'MM/DD/YY')#</td>
					                                   <td><a href="JobPostings/ApproveResume.cfm?resumeID=#getResume.ResumeID#">#getResume.firstname# #getResume.Lastname#</a></td>
													   <td>#getResume.ResumeTitle# <cfif getResume.memberid NEQ ""><strong style="color:##cc0000;">*</strong></cfif></td>
					                                 </tr>
												 </cfloop>
				                              </table>
										  </td>
									  </tr>
								   <cfelse>
									 <tr>
									    <td class="regtext"><strong style="color:##969696;">There are no Resumes to Approve</strong></td>
									 </tr>	  
								  </cfif>
		                      </table>
					       </td>
						   <td width="1%">&nbsp;</td>
						   <td valign="Top" width="49%">
						   <cfset ThisDate = DateAdd('d', -7, now())>
						     <cfif Session.AdminInfo.AllowFinance EQ 1>
						     <table border="0" cellpadding="3" cellspacing="0" width="100%">
                                <!---  <tr bgcolor="##eeeee0">
		                            <td><strong>New Events Awaiting Release</strong></td>
		                          </tr> 
								  <tr>
								    <td>
									  <table border="0" cellpadding="3" cellspacing="0" width="100%">
		                                 <tr>
		                                   <td></td>
		                                 </tr>
		                              </table>
									</td>
								  </tr>--->  
								 <cfif Session.AdminInfo.AllowAdmin>
									  <cfquery name="GetOrder" datasource="#Application.dsn#">
									    Select OrderID, MemberID, OrderDate, OrderTotal,
										  (Select ProductName
										    From Products P
											Where P.ProductID = O.ProductID) as ProductName
										From Orders O
										Where OrderStatus = 'NEW'
										Order By OrderDate Desc 
									  </cfquery>
									  <tr bgcolor="##003366">
			                            <td><strong style="color:##ffffff;">New Store Purchases</strong></td>
			                          </tr> 
									  <cfif GetOrder.Recordcount GT 0>
									  <tr>
									    <td>
										  <strong style="color:##cc0000;size:10px;">* Member Ordered</strong>
										  <table border="0" cellpadding="3" cellspacing="1" width="100%" bgcolor="eeeeee">
			                                 <tr>
			                                   <td>Order Date</td>
											   <td>Product</td>
											   <td>Total</td>
			                                 </tr>
											 <cfloop query="GetOrder">
											   <tr bgcolor="ffffff">
			                                     <td><a href="Store/ViewOrder.cfm?orderID=#Getorder.OrderID#">#DateFormat(GetOrder.OrderDate, 'mm/dd/yyyy')#</a></td>
											     <td>#GetOrder.ProductName#</td>
											     <td>#DollarFormat(GetOrder.OrderTotal)#</td>
			                                   </tr>
											 </cfloop>
			                              </table>
										</td>
									  </tr>
									 <cfelse>
									   <tr>
								    <td class="regtext"><strong style="color:##969696;">There are no New Orders</strong></td>
								  </tr>	 
									 </cfif> 
								  </cfif>
								  <cfquery name="GetEvtReg" datasource="#Application.dsn#">
								   Select R.RegisterID, R.Firstname, R.Lastname, R.RegisterDate, E.EventID, E.EventName 
								   From Registrations R, Events E
								   Where R.EventID = E.EventID 
								   AND R.RegisterDate >= #ThisDate#
								  </cfquery>
								  <tr bgcolor="##003366">
		                            <td><strong style="color:##ffffff;">Event Registrations (Last 7 Days)</strong></td>
		                          </tr> 
								  <cfif GetEvtReg.recordcount GT 0>
								  <tr>
								    <td>
									  <table border="0" cellpadding="3" cellspacing="1" width="100%" bgcolor="eeeeee">
		                                 <tr>
		                                   <td>Date</td>
										   <td>Name</td>
										   <td>Event</td>
		                                 </tr>
										 <cfloop query="GetEvtReg">
										 <tr bgcolor="ffffff">
										   <td><a href="Events/EventsRoster.cfm?EventID=#GetEvtReg.EventID#">#DateFormat(RegisterDate, 'MM/DD/YYYY')#</a></td>
										   <td>#GetEvtReg.firstname# #GetEvtReg.Lastname#</td>
										   <td>#GetEvtReg.EventName#</td>
										 </tr>
										 </cfloop>
		                              </table>
									</td>
								  </tr>  
								  <cfelse>
								  <tr>
								    <td class="regtext"><strong style="color:##969696;">There are no New Registrations</strong></td>
								  </tr>	
								 </cfif>			  
								  <cfquery name="GetContrib" datasource="#Application.dsn#">
								   Select DonorID, DonorName, DonationAmt, DonationDate
								   From Donors
								   Where DonationDate >= #DateAdd('d', -7, now())#
								  </cfquery>
								  <tr bgcolor="##003366">
		                            <td><strong style="color:##ffffff;">Contributions (Last 7 Days)</strong></td>
		                          </tr> 
								  <cfif GetContrib.recordcount GT 0>
								  <tr>
								    <td>
									  <table border="0" cellpadding="3" cellspacing="1" width="100%" bgcolor="eeeeee">
		                                 <tr>
		                                   <td>Donation Date</td>
										   <td>Donor</td>
										   <td>Donation</td>
		                                 </tr>
										 <cfloop query="GetContrib">
										   <tr bgcolor="ffffff">
		                                     <td><a href="Store/ViewDonor.cfm?DonorID=#GetContrib.DonorID#">#DateFormat(GetContrib.DonationDate, 'MM/DD/YYYY')#</a></td>
										     <td>#GetContrib.DonorName#</td>
										     <td>#Dollarformat(GetContrib.DonationAmt)#</td>
		                                   </tr>
										 </cfloop>
		                              </table>
									</td>
								  </tr>
								  <cfelse>
								    <tr>
									   <td class="regtext"><strong style="color:##969696;">There are no New Contributions</strong></td>
									</tr>	
								  </cfif>
		                       </table>
							  </cfif> 
						   </td>
						 </tr>
                      </table>
				   </td>
		        </tr>
		       </table>
			   <br><br>
		 </td>
     </tr>
</table>  
</cfoutput>
<cfmodule template="#Application.footer#">
