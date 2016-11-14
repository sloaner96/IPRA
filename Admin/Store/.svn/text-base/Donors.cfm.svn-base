<cfmodule template="#Application.header#" section="0" sectiontitle="Site Admin">
  <cfoutput>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="160"><br>
		    <cfmodule template="#Application.tagdir#/adminnav.cfm" level="4">
		   </td>
		   <td valign="top"><br>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>IPRF Donations</h3></td>
		        </tr>
		      </table>
			  <table border="0" cellpadding="6" cellspacing="0" width="100%">
		        <tr>
		           <td class="RegText">
				      <table border="0" cellpadding="0" cellspacing="0" width="100%">
                          <tr>
                            <td>Use the form Below to search for Contributions in the system.</td>
                          </tr> 
                      </table>
					  
					  <cfform name="search" action="Donors.cfm" Method="POST" scriptsrc="/scripts/cfform.js">
						  <table border="0" cellpadding="0" cellspacing="1" bgcolor="eeeeee">
	                        <tr>
	                           <td>
								  <table border="0" cellpadding="4" cellspacing="0" width="100%" bgcolor="ffffff">
			                         <tr bgcolor="eeeeee">
			                            <td colspan=2><strong>Search</strong></td>
			                         </tr>
									 <cfset LastThirty = DateAdd('d', -30, now())>
									 <tr>
									   <td>Date Range:</td>
									   <td>BEGIN <input Type="text" name="BeginDate" <cfif IsDefined("form.BeginDate")>value="#DateFormat(form.beginDate, 'MM/DD/YYYY')#"<cfelse>value="#DateFormat(LastThirty, 'MM/DD/YYYY')#"</cfif> size="15" maxlength="15">&nbsp;&nbsp;END <input Type="text" name="EndDate" <cfif IsDefined("form.endDate")>value="#DateFormat(form.enddate, 'MM/DD/YYYY')#"<cfelse>value="#DateFormat(now(), 'MM/DD/YYYY')#"</cfif> size="15" maxlength="15"></td>
									 </tr>
									 <tr>
									   <td colspan=2><input type="submit" name="submit" value="Search >>"></td>
									 </tr>
			                      </table>
						        </td>
							  </tr>
							</table>
						</cfform>
					  <cfif Not IsDefined("form.submit")>
						  <br>
						  
						  <table border="0" cellpadding="3" cellspacing="0" width="100%">
	                         <tr bgcolor="##003366">
	                           <td><strong style="color:ffffff">Contributions (Last 30 Days)</strong></td>
	                         </tr> 
	                      </table>
						   <cfquery name="GetContrib" datasource="#Application.dsn#">
							   Select DonorID, DonorName, DonationAmt, DonationDate
							   From Donors
							   Where DonationDate >= #DateAdd('d', -30, now())#
		                   </cfquery>
						  <table border="0" cellpadding="3" cellspacing="1" width="100%" bgcolor="eeeeee">
                             <tr>
                               <td>Donation Date</td>
							   <td>Donor</td>
							   <td>Donation</td>
                            </tr>
						<cfif GetContrib.recordcount Gt 0>	
							<cfset TotalDonation = 0.00>
							 <cfloop query="GetContrib">
							   <tr bgcolor="ffffff">
                                    <td><a href="ViewDonor.cfm?DonorID=#GetContrib.DonorID#">#DateFormat(GetContrib.DonationDate, 'MM/DD/YYYY')#</a></td>
							     <td>#GetContrib.DonorName#</td>
							     <td>#Dollarformat(GetContrib.DonationAmt)#</td>
                               </tr>
								<cfset TotalDonation = TotalDonation +GetContrib.DonationAmt>  
							 </cfloop>
							  <tr bgcolor="eeeeee">
				                 <td colspan=3 align="right"><strong>GRAND TOTAL:</strong> #DollarFormat(TotalDonation)#</td>
				               </tr>
                             </table>
							
						 <cfelse>
						   <p syle="color:757575;"><strong>There are currently no Contributions that are less than 30 days old</strong></p> 
						 </cfif> 
					 <cfelse>
					     <br>
						 <cfif Form.begindate EQ "" AND Form.EndDate EQ "">
						    <p class="errortext"><strong>Error! Your search must contain at least 1 criteria.</strong></p> 
						 <cfelse>   
						 
						 
							  <cfquery name="GetContrib" datasource="#Application.dsn#">
							    Select *
								From Donors
								 Where 1 = 1
								<cfif form.enddate NEQ "" AND form.BeginDate NEQ "">
								 AND DonationDate Between #Createodbcdate(form.begindate)# AND #Createodbcdate(form.enddate)#
								<cfelseif form.endDate NEQ "" AND form.BeginDate EQ "">
								 AND  DonationDate <= #Createodbcdate(form.enddate)#
								<cfelseif form.endDate EQ "" AND form.BeginDate NEQ "">  
								  AND DonationDate >= #Createodbcdate(form.begindate)#
								</cfif>
								Order By DonationDate, DonationAmt, DonorName
							  </cfquery>
							  
							  <table border="0" cellpadding="3" cellspacing="0" width="100%">
		                         <tr bgcolor="##666666">
		                           <td><strong style="color:ffffff">Contribution Search</strong></td>
		                         </tr> 
		                      </table>
							  <cfif GetContrib.recordcount GT 0>
								 <table border="0" cellpadding="3" cellspacing="1" width="100%" bgcolor="eeeeee">
		                             <tr>
		                               <td>Donation Date</td>
									   <td>Donor</td>
									   <td>Donation</td>
		                            </tr>
									<cfset TotalDonation = 0.00>
									 <cfloop query="GetContrib">
									   <tr bgcolor="ffffff">
		                                    <td><a href="ViewDonor.cfm?DonorID=#GetContrib.DonorID#">#DateFormat(GetContrib.DonationDate, 'MM/DD/YYYY')#</a></td>
									     <td>#GetContrib.DonorName#</td>
									     <td align="right">#Dollarformat(GetContrib.DonationAmt)#</td>
		                               </tr>
										<cfset TotalDonation = TotalDonation + GetContrib.DonationAmt>  
									 </cfloop>
									  <tr bgcolor="eeeeee">
						                 <td colspan=3 align="right"><strong>GRAND TOTAL:</strong> #DollarFormat(TotalDonation)#</td>
						               </tr>
		                             </table>
							 <cfelse>
							   <p syle="color:757575;"><strong>Your Search Returned no matches. Please try again with a different criteria.</strong></p> 
							 </cfif> 	
						 </cfif> 
					 </cfif>
				   </td>
		        </tr>
		       </table>
			   <br><br>
		 </td>
     </tr>
</table>  
</cfoutput>
<cfmodule template="#Application.footer#">