<cfparam name="url.e" default="0">

<cfquery name="GetMember" datasource="#Application.dsn#">
  Select *
  From Members
  Where MemberID = #Url.MbrID#
</cfquery>


<cfinclude template="#Application.TagDir#/Libraries/ccEscape.cfm">
<cfmodule template="#Application.header#" section="0" sectiontitle="Site Admin">
  <cfoutput>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="160"><br>
		    <cfmodule template="#Application.tagdir#/adminnav.cfm" level="3">
		   </td>
		   <td valign="top"><br>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>Membership Admin</h3></td>
		        </tr>
		      </table>
			  <table border="0" cellpadding="6" cellspacing="0" width="100%">
		        <tr>
		           <td class="RegText">
				      <table border="0" cellpadding="0" cellspacing="0" width="100%">
                          <tr>
                            <td>Below is the information for this member.</td>
                          </tr> 
                      </table><br>
					  <cfif url.e EQ 1>
						   <table border="0" cellpadding="0" cellspacing="0" width="100%">
							<tr>
							   <td class="errortext"><strong>Error!</strong> You must enter the IMIS Member ID</td>
							</tr>
						   </table><br>
					   <cfelseif url.e EQ 2>
						   <table border="0" cellpadding="0" cellspacing="0" width="100%">
							<tr>
							   <td class="errortext"><strong>Error!</strong> The IPRA Member ID you entered must be a numeric value only.</td>
							</tr>
						   </table><br> 
					  <cfelseif url.e EQ 3>
						   <table border="0" cellpadding="0" cellspacing="0" width="100%">
							<tr>
							   <td class="errortext"><strong>Error!</strong> The IPRA Member ID you entered already exists in the system.</td>
							</tr>
						   </table><br> 	   
					  </cfif>
					  <cfif GetMember.LastSync NEQ GetMember.LastUpdated>
					    <cfform name="addmbr" action="AddMbrID.cfm?action=Update" method="Post" scriptsrc="/scripts/cfform.js">
						  <input type="hidden" name="MbrID" value="#GetMember.MemberID#"> 
						    <table border="0" cellpadding="4" cellspacing="0">
	                          <tr>
	                            <td><strong>Remove from update list:</strong> <input type="checkbox" name="Resync" value="1"></td>
								<td><input type="Submit" name="submit" value="Update >>"></td>
	                          </tr>
	                        </table>
						</cfform>	
					  </cfif>
					  <table border="0" cellpadding="4" cellspacing="0" width="100%">
                          <tr bgcolor="##003366">
						    <td><strong style="color:ffffff;">Membership Information</strong></td>
						  </tr>
						  <tr>
                            <td>
							 
							  <strong>Website ID:</strong> #GetMember.MemberID#<br> 
							  <cfif getmember.IPRAMemberID EQ 0>
								  <cfform name="addmbr" action="AddMbrID.cfm?action=Add" method="Post" scriptsrc="/scripts/cfform.js">
									  <input type="hidden" name="MbrID" value="#GetMember.MemberID#"> 
									  <strong>IPRA Member ID:</strong> <cfinput type="text" name="NewIPRAID" value="" size="5" maxlength=10 required="Yes" message="You must enter the IPRA Member ID form IMIS">&nbsp;<font face="arial" color="##717171" size="-2">(Please enter the iMIS MemberID)</font><br>
								      <input type="Submit" name="submit" value="Save Member ID >>"><br>
									  <br>
								  </cfform>
							  <cfelse>
							    <strong>IPRA Member ID:</strong> #Getmember.IPRAmemberID#<br>
							  </cfif>
							  <strong>Membership Type:</strong> 
							  <cfswitch expression="#GetMember.MemberType#">
							   <cfcase value="IN">Individual
							   </cfcase>
							   <cfcase value="CO">Commerical
							   </cfcase>
							   <cfcase value="AG">Agency
							   </cfcase>
							   <cfcase value="C">Contact
							   </cfcase>
							   <cfcase value="EX">Exhibitor
							   </cfcase>
							   <cfcase value="NM">Non-Member
							   </cfcase>
							   <cfcase value="NMC">Non-Member Company
							   </cfcase>
							   <cfcase value="NMS">Non-Member Subscriber
							   </cfcase>
							   <cfcase value="NV">Non-Voting
							   </cfcase>
							   <cfcase value="V">Voting
							   </cfcase>
							   
							  </cfswitch>
							   Membership<br>
							  <cfif IsNumeric(GetMember.MbrCategory)>
							  <cfquery name="GetProduct" datasource="#Application.dsn#">
							     Select ProductName
								 From Products
								 Where ProductID = #GetMember.MbrCategory# 
							  </cfquery>
							  <strong>Category:</strong> #GetProduct.ProductName#<br>
							  </cfif>
							  <cfquery name="GetPriSection" datasource="#Application.dsn#">
							   Select CodeDesc
							   From lookup
							   Where Codegroup = 'SECTIONTYPE'
							   AND Codevalue = '#GetMember.PrimarySection#'
							  </cfquery>
							  <strong>Primary Section:</strong> #GetPriSection.CodeDesc#<br>
							  <cfif GetMember.AdditionalSection NEQ "">
							  <strong>Additional Sections:</strong>
							    <cfset AddSections = 0>
							    <cfloop index="x" list="#GetMember.AdditionalSection#">
								   <cfif X NEQ GetMember.PrimarySection>
								
									  <cfquery name="GetAddSection" datasource="#Application.dsn#">
									   Select CodeDesc
									   From lookup
									   Where Codegroup = 'SECTIONTYPE'
									   AND Codevalue = '#X#'
								 	  </cfquery>
									  <cfif GetAddSection.recordcount GT 0>#GetAddSection.CodeDesc#
									     <cfset AddSections = AddSections + 1>
									  </cfif>
									  
								   </cfif>	  
							     </cfloop> 
							     <cfif AddSections EQ 0>None Chosen</cfif> 
							  </cfif>
							  <br>
							   <strong>Membership Begin:</strong> #DateFormat(GetMember.MembershipBegin, 'mm/dd/yyyy')#<br>
							   <strong>Membership Expire:</strong> #DateFormat(GetMember.MembershipExpire, 'mm/dd/yyyy')#<br>
							  <br>
							  <strong>Website Login:</strong> <cfif getmember.email NEQ "">#Getmember.Email#<cfelse>None Provided</cfif><br>
							  <strong>Website Password:</strong> <cfif getmember.email NEQ "">#Getmember.password#<cfelse>None Provided</cfif><br>
							  
							</td>
                          </tr> 
						  <tr>
						    <td>&nbsp;</td>
						  </tr>
						  <tr bgcolor="##003366">
						    <td><strong style="color:ffffff;">Personal Information</strong></td>
						  </tr>
						  <tr>
						    <td>
							  <strong>Name:</strong> #GetMember.Prefix# #GetMember.FirstName# #GetMember.Middlename# #GetMember.LastName#<br> 
							  <strong>Title:</strong> #GetMember.Title#<br>
							  <cfif Getmember.Designation NEQ "">
							  <strong>Designation:</strong> #GetMember.Designation#<br>
							  </cfif>
							  <strong>Company:</strong> 
							  <cfif Getmember.Company EQ "">
							    <cfquery name="GetAgency" datasource="#Application.dsn#">
								   Select Agencyname, Addr1, Addr2, City, State, Zip
								   From Agencies
								   Where IPRAAgencyID = #GetMember.IPRACOID#
								</cfquery>
							  #GetAgency.AgencyName#<br>
							  <strong> Address:</strong><br>
							  #GetAgency.Addr1#<br>
							  <cfif GetAgency.Addr2 NEQ "">#GetAgency.Addr2#<br></cfif>
							  #GetAgency.City#, #GetAgency.State# #GetAgency.Zipcode#<br>
							  <cfelse>
							  #GetMember.Company#<br>
							  <strong> Address:</strong><br>
							  #GetMember.Address1#<br>
							  <cfif getMember.Address2 NEQ "">#GetMember.Address2#<br></cfif>
							  #GetMember.City#, #GetMember.State# #GetMember.Zipcode#<br>
							  </cfif>
							  <br>
							  <strong>Main Phone:</strong> #GetMember.MainPhone#<br>
							  <cfif getmember.MobilePhone EQ ""><strong>Mobile Phone:</strong> #GetMember.MobilePhone#<br></cfif>
							  <strong>Email:</strong> <a href="mailto:#GetMember.Email#">#GetMember.Email#</a><br>
							</td>
						  </tr>
						  <cfif GetMember.Homeaddr1 NEQ "">
						  <tr bgcolor="##666666">
						    <td><strong style="color:ffffff;">Home Address Information</strong></td>
						  </tr>
						  <tr>
						    <td>
							   <strong>Address:</strong><br>
							   #GetMember.Homeaddr1#<br>
							   <cfif GetMember.HomeAddr2 NEQ "">#GetMember.Homeaddr2#<br></cfif>
							   #GetMember.HomeCity#, #GetMember.HomeState# #GetMember.HomeZip#<br>
							   <cfif GetMember.HomePhone NEQ "">
							   <br>
							   <strong>Home Phone:</strong> #Getmember.HomePhone#<br>
							   </cfif>
							</td>
						  </tr>
						  </cfif>
						   <tr>
						    <td>&nbsp;</td>
						  </tr>
						  <cfquery name="GetPayment" datasource="#Application.dsn#">
							 Select Top 1 T.TransID, T.OrderNum, T.TransType, T.CardType, T.PONumber, T.CardNbr, T.CardExpMonth, T.CardExpYear, T.Amount, T.DateAuthorized
							 From Transactions T
							 Where T.MemberID = #GetMember.MemberID#
							 AND PurchaseCode IN ('CMBR','MBR')
						  </cfquery>
						  <cfif GetPayment.recordcount GT 0>
						  <tr bgcolor="##003366">
						    <td><strong style="color:ffffff;">Payment information</strong></td>
						  </tr>
						  <tr>
						    <td><strong>Amount Paid:</strong>#DollarFormat(GetPayment.Amount)# on #DateFormat(GetPayment.DateAuthorized, 'MM/DD/YYYY')#<br>
							    <strong>Paid Via</strong> #GetPayment.TransType#<br>
								 <cfif GetPayment.transType EQ "PO">
								   <strong>Purchase Order Number:</strong> #GetPayment.PONumber#
								 <cfelseif GetPayment.TransType EQ "Credit">
								   #GetPayment.CardType# #ccEscape(GetPayment.CardNbr)# Exp: #GetPayment.CardExpMonth#/#GetPayment.CardExpYear#
								 </cfif>
							</td>
						  </tr>
						  </cfif>
						  <tr bgcolor="##003366">
						    <td><strong style="color:ffffff;">Syncronization</strong></td>
						  </tr>
						  <tr>
						    <td><strong>Date Added:</strong> #DateFormat(GetMember.DateAdded, 'mm/dd/yyyy')# at #TimeFormat(GetMember.DateAdded, 'hh:mm tt')#<br>
							  <strong>Last Updated:</strong> #DateFormat(GetMember.LastUpdated, 'mm/dd/yyyy')# at #TimeFormat(GetMember.LastUpdated, 'hh:mm tt')#<br>
							  <strong>Last Sync w/ iMIS:</strong> <cfif getmember.LastSync NEQ "">#DateFormat(GetMember.LastSync, 'mm/dd/yyyy')# at #TimeFormat(GetMember.LastSync, 'hh:mm tt')#<cfelse><font color="##990000">Never</font></cfif><br>
							</td>
						  </tr>
                      </table><br>
					  
				   </td>
		        </tr>
		       </table>
			   <br><br>
		 </td>
     </tr>
</table>  
</cfoutput>
<cfmodule template="#Application.footer#">