<cfparam name="url.e" default="0">
<cfinclude template="#Application.TagDir#/Libraries/ccEscape.cfm">
<cfquery name="getJob" datasource="#Application.dsn#">
  Select J.*,
    (Select codeDesc 
		From Lookup L
		  Where L.CodeGroup = 'JOBCAT'
		  AND Codevalue = J.Category) as JobCat,
	(Select codeDesc 
		From Lookup L
		  Where L.CodeGroup = 'OrderCat'
		  AND Codevalue = J.JobType) as JobType,
	(Select ProductName
	  From Products
	  Where ProductID = J.ProductID) as ProdName,
	(Select ProductQty
	  From Products
	  Where ProductID = J.ProductID) as PostingDays
  From JobPostings J
  Where JobID = #Url.JobID#
</cfquery>

<cfquery name="GetCat" datasource="#Application.dsn#">
	Select Codevalue, codeDesc 
	From Lookup L
	Where L.CodeGroup = 'JOBCAT'
	Order By CodeValue, CodeDesc					  
</cfquery>


<cfquery name="GetPricing" datasource="#Application.dsn#">
    Select Distinct P.ProductCategory, L.Codedesc as jobcategory 
    From Products P, Lookup L
    Where P.ProductType = '01'
    AND L.CodeGroup = 'ORDERCAT'
    AND L.CodeValue = P.ProductCategory 
  </cfquery>
							
<cfquery name="GetState" datasource="#Application.dsn#" cachedwithin="#CreateTimeSpan(0,0,10,0)#">
  Select CodeDesc, CodeValue
  From Lookup
  Where CodeGroup = 'STATE'
  Order BY CodeDesc
</cfquery>
<cfmodule template="#Application.header#" section="0" sectiontitle="Site Admin">
  <cfoutput>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="160"><br>
		    <cfmodule template="#Application.tagdir#/adminnav.cfm" level="2">
		   </td>
		   <td valign="top"><br>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>Job Postings</h3></td>
		        </tr>
		      </table>
			  <table border="0" cellpadding="6" cellspacing="0" width="100%">
		        <tr>
		           <td class="RegText">
				      <table border="0" cellpadding="0" cellspacing="0" width="100%">
                          <tr>
                            <td>Below is a job posting awaiting approval.</td>
                          </tr> 
                      </table>
					  <hr noshade size="1">
					  <cfif GetJob.PostingDays NEQ "">
					     <cfset ExpiresOn = DateAdd('d', GetJob.PostingDays, now())>
					  <cfelse>
					     <cfset ExpiresOn = DateAdd('d', 30, now())>
					  </cfif>
					  <cfform name="appjob" action="ApproveJobs_action.cfm" method="POST" scriptsrc="/scripts/cfform.js">
					    <input type="hidden" name="JobID" value="#GetJob.JobID#">
						  <table border="0" cellpadding="4" cellspacing="0" width="100%">
	                        <tr>
							  <td><strong>Job Posting Chosen:</strong> #GetJob.ProdName#</td>
							</tr>
						    <tr>
							  <td><strong>Date Submitted:</strong> #Dateformat(GetJob.DateEntered,'mm/dd/yyyy')#</td>
							</tr>
							<tr>
	                           <td><strong>Approve Job Posting:</strong> <input type="radio" name="ApprovePost" value="1" <cfif getJob.Approved EQ 1>checked</cfif>> YES&nbsp;&nbsp;<input type="radio" name="ApprovePost" value="0" <cfif getJob.Approved EQ 0>checked</cfif>> NO</td>
	                        </tr>
							<tr>
	                           <td><strong>Expires on:</strong> <input type="text" name="expire" value="<cfif getjob.EndDate NEQ "">#DateFormat(getjob.EndDate, 'mm/dd/yyyy')#<cfelse>#DateFormat(ExpiresON, 'mm/dd/yyyy')#</cfif>" size="15" maxlength="15"></td>
	                        </tr>
							
	                      </table><br>
						  <table border="0" cellpadding="4" cellspacing="0" width="100%">
	                         <tr bgcolor="##003366">
							   <td colspan=2><strong style="color:ffffff;">Contact Information</strong></td>
							 </tr>
							 <tr>
							   <td width="20%"><strong>Contact:</strong></td>
							   <td><input type="text" name="Contact" value="#GetJob.ContactName#" size="30" maxlength="125"></td>
							 </tr>
							 <tr>
							   <td><strong>Contact Email:</strong></td>
							   <td><input type="text" name="Email" value="#GetJob.ContactEmail#" size="30" maxlength="90"></td>
							 </tr>
							 <tr>
							   <td><strong>Contact Phone:</strong></td>
							   <td><input type="text" name="Phone" value="#GetJob.ContactPhone#" size="12" maxlength="15"></td>
							 </tr>
							 <tr>
							   <td><strong>Contact Fax:</strong></td>
							   <td><input type="text" name="Fax" value="#GetJob.ContactFax#" size="12" maxlength="15"></td>
							 </tr>
							 <tr>
							   <td><strong>Agency Name:</strong></td>
							   <td><input type="text" name="AgencyName" value="#GetJob.AgencyName#" size="30" maxlength="85"></td>
							 </tr>
							 <tr>
							   <td><strong>Agency Addr:</strong></td>
							   <td><input type="text" name="addr1" value="#GetJob.AgencyAddr#" size="30" maxlength="50"></td>
							 </tr>
							 <tr>
							   <td><strong>Agency Addr 2:</strong></td>
							   <td><input type="text" name="addr2" value="#GetJob.AgencyAddr2#" size="30" maxlength="50"></td>
							 </tr>
							 <tr>
							   <td><strong>Agency City:</strong></td>
							   <td><input type="text" name="City" value="#GetJob.AgencyCity#" size="30" maxlength="75"></td>
							 </tr>
							 <tr>
							   <td><strong>Agency State:</strong></td>
							   <td><select name="State">
									       <cfloop query="GetState">
									         <option value="#CodeValue#" <cfif getJob.AgencyState EQ Codevalue>Selected</cfif>>#CodeValue#</option>
									       </cfloop>
										  </select></td>
							 </tr>
							 <tr>
							   <td><strong>Agency Zipcode:</strong></td>
							   <td><input type="text" name="zipcode" value="#GetJob.AgencyZip#" size="10" maxlength="10"></td>
							 </tr>
							 <tr>
							   <td><strong>Agency URL:</strong></td>
							   <td><input type="text" name="website" value="#GetJob.AgencyURL#" size="30" maxlength="100"></td>
							 </tr>
	                      </table>
						 <br>
						  <table border="0" cellpadding="4" cellspacing="0" width="100%">
	                         <tr bgcolor="##003366">
							   <td colspan=2><strong style="color:ffffff;">Posting Information</strong></td>
							 </tr>
							  <tr>
								<td><b>Job Type:</b></td>
									<td><select name="JobType">
									       <cfloop query="Getpricing">
									        
										        <option Value="#GetPricing.ProductCategory#" <cfif getJob.Category EQ Getpricing.ProductCategory>Selected</cfif>>#GetPricing.jobcategory#</option>
										      
										   </cfloop>
										</select>
									</td>
								 </tr>
							 <tr>
								<td><b>Job Category:</b></td>
									<td><select name="JobCategory">
									       <cfloop query="GetCat">
									        
										        <option Value="#GetCat.codeValue#" <cfif GetJob.JobType EQ GetCat.Codevalue>Selected</cfif>>#GetCat.CodeDesc#</option>
										      
										   </cfloop>
										</select>
									</td>
								 </tr>
							  <tr>
	                            <td><strong>Job Title:</strong></td>
								<td><input type="text" name="JobTitle" value="#GetJob.JobTitle#" size="30" maxlength="150"></td>
	                          </tr> 
							  <tr>
							    <td><strong>Job Salary:</strong></td>
								<td><input type="text" name="Salary" value="#GetJob.JobSalary#" size="50" maxlength="255"></td>
							  </tr>
							  <tr>
							    <td><strong>Job Closing:</strong></td>
								<td><input type="text" name="ClosingDate" value="#GetJob.JobClosing#" size="50" maxlength="90"></td>
							  </tr>
							  <tr>
							    <td><strong>Job Qualifications:</strong></td>
								<td><textarea name="Qualifications" cols="45" rows="10">#GetJob.JobQualifications#</textarea></td>
							  </tr>
							  <tr>
							    <td><strong>Job Duties:</strong></td>
								<td><textarea name="JobDuties" cols="45" rows="10">#GetJob.JobDuties#</textarea></td>
							  </tr>
	                      </table><br>
						  <cfquery name="GetTrans" datasource="#Application.dsn#">
						    Select *
							From Transactions
							Where JobID = #GetJob.JobID#
						  </cfquery>
						  <table border="0" cellpadding="4" cellspacing="0" width="100%">
	                         <tr bgcolor="##003366">
							   <td><strong style="color:ffffff;">Transaction Information</strong></td>
							 </tr>
							  <tr>
	                            <td><strong>Order Number:</strong> #GetTrans.orderNum#<br>
								    <strong>Payment Via:</strong> #Gettrans.TransType#<br><br>
									<cfif GetTrans.transType EQ "Credit">
									  <strong>Card Type:</strong> #Gettrans.CardType#<br>
									  <strong>Card Holder:</strong> #Gettrans.CardHolder#<br>
									  <strong>Card Number:</strong> #CCESCAPE(Gettrans.CardNbr)#<br>
									  <strong>Expiration:</strong> #Gettrans.CardExpMonth#/#Gettrans.CardExpYear#<br>
									  <strong>Authorization Message:</strong> #GetTrans.AuthResponse#
									<cfelse>
									   <strong>Purchase Order Number:</strong> #GetTrans.PONUMBER#<br>
									</cfif>
									<br>
									<strong>Total Amount:</strong> #DollarFormat(GetTrans.Amount)#<br>
								</td>
	                          </tr> 
	                      </table>
						  <table border="0" cellpadding="0" cellspacing="0" width="100%">
	                          <tr>
	                             <td align="center"><input type="submit" name="submit" value="Update Job Posting >>"></td>
	                          </tr>
	                      </table>
					  </cfform>
				   </td>
		        </tr>
		       </table>
			   <br><br>
		 </td>
     </tr>
</table>  
</cfoutput>
<cfmodule template="#Application.footer#">