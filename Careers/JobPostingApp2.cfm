<SCRIPT LANGUAGE="JavaScript">
<!-- Begin
function disableForm(theform) {
if (document.all || document.getElementById) {
for (i = 0; i < theform.length; i++) {
var tempobj = theform.elements[i];
if (tempobj.type.toLowerCase() == "submit")
tempobj.disabled = true;
}

setTimeout(2000);
return true;
} else {
   return false;
   }
}
//  End -->
</script>
<cfquery name="CCards" datasource="#Application.DSN#" blockfactor="100">
	SELECT * From Lookup
		WHERE CodeGroup = 'CCTYPE'
		ORDER By Ranking, CodeDesc
</cfquery>
<cfquery name="Months" datasource="#Application.DSN#" blockfactor="100">
	SELECT * From Lookup
		WHERE CodeGroup = 'MONTH'
		ORDER By CodeValue
</cfquery>
<cfmodule template="#Application.Header#" sectiontitle="Job Opportunities Bulletin">

	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top">
		     <br>
		    <cfmodule template="#Application.tagdir#/aboutusnav.cfm" level="3">
		   </td>
		   <td valign="top">
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>Job Opportunities Bulletin: Post a Job</h3></td>
		        </tr>
		      </table>
			  <table border="0" cellpadding="6" cellspacing="0" width="100%" class="regtext">
                 <tr>
				   <td>Below you may request a job opening be included in the IPRA Job Opportunities Bulletin. If you are an IPRA member the cost of this is discounted.</td>
				 </tr>
				 <cfif Not IsDefined("Session.UserInfo.MemberID")>
				 <tr>
				   <td>&nbsp;</td>
				 </tr>
				 <tr>
				   <td><strong>Are you an IPRA Member?</strong> If so please <a href="/MembersOnly/Login.cfm">login</a> to receive your member discount.</td>
				 </tr>
				 <tr>
				   <td><strong>Not an IPRA Member Yet?</strong> If you would like to find out more about the benefits of membership <a href="/Members/index.cfm">click here</a>.</td>
				 </tr>
				</cfif> 
		       </table>
			   <cfform name="theform" action="/Careers/processPayment.cfm" method="POST" scriptsrc="/scripts/cfform.js">
			      <table border="0" cellpadding="6" cellspacing="0" width="100%">
				     <tr bgcolor="#003366">
					    <td><strong style="color:#ffffff;">Agency/Company Information:</strong></td>
					 </tr>
				  </table><br>
				  <cfquery name="GetState" datasource="#Application.dsn#" cachedwithin="#CreateTimeSpan(0,0,10,0)#">
					   Select CodeDesc, CodeValue
					   From Lookup
					   Where CodeGroup = 'STATE'
					   Order BY CodeDesc
					</cfquery>
					
			        <cfif IsDefined("Session.UserInfo.IPRACOID") OR IsDefined("form.AgencyFind")>
					  <cfquery name="MyAgencySearch" datasource="#Application.dsn#">
							  Select *
							  from Agencies
							  <cfif IsDefined("form.agencyFind")>
							  Where AgencyID = #form.agencyFind#
							  <cfelse>
							  Where IPRAAgencyID = #Session.UserInfo.IPRACOID#
							  </cfif>
						</cfquery>
						
						
					  <cfset Session.JobPosting.AgencyInfo.AgencyID ="#MyAgencySearch.AgencyID#">
				      <cfset Session.JobPosting.Agencyinfo.AgencyName = "#MyAgencySearch.AgencyName#">
					  <cfset Session.JobPosting.Agencyinfo.Addr1 = "#MyAgencySearch.Addr1#">
					  <cfset Session.JobPosting.Agencyinfo.Addr2 = "#MyAgencySearch.Addr2#">
					  <cfset Session.JobPosting.Agencyinfo.City = "#MyAgencySearch.City#">
					  <cfset Session.JobPosting.Agencyinfo.State = "#MyAgencySearch.State#">
					  <cfset Session.JobPosting.Agencyinfo.Zip = "#MyAgencySearch.Zip#">
					  <cfset Session.JobPosting.Agencyinfo.WebSite = "#MyAgencySearch.WebSite#">
					  
				   <cfelseif Not IsDefined("Session.JobPosting.AgencyInfo") AND Not IsDefined("Session.UserInfo.IPRACOID")>
				      <cfset Session.JobPosting.AgencyInfo.AgencyID ="">
				      <cfset Session.JobPosting.Agencyinfo.AgencyName = "">
					  <cfset Session.JobPosting.Agencyinfo.Addr1 = "">
					  <cfset Session.JobPosting.Agencyinfo.Addr2 = "">
					  <cfset Session.JobPosting.Agencyinfo.City = "">
					  <cfset Session.JobPosting.Agencyinfo.State = "">
					  <cfset Session.JobPosting.Agencyinfo.Zip = "">
					  <cfset Session.JobPosting.Agencyinfo.WebSite = "">
				   </cfif>
				       
				   <cfif IsDefined("form.AgencyFind")>
				         <cfquery name="AgencySearch" datasource="#Application.dsn#" cachedwithin="#CreateTimeSpan(0,0,10,0)#">
							  Select *
							  from Agencies
							  Where AgencyID = #form.AgencyFind#
						  </cfquery>  
				   </cfif>
				   
			      <cfoutput>
				   <table border="0" cellpadding="4" cellspacing="0">
	                 <tr>
	                   <td class="regtext"><cfif Not IsDefined("Session.UserInfo.AgencyID")>Select Agency/School Below or </cfif>Enter Address Information:</td>
	                 </tr>
					 <cfif Not IsDefined("Session.UserInfo.AgencyID")>
					   <tr class="regtext">
					      <td><a href="javascript:void(0);" onclick="window.open('AgencySearchPop.cfm', 'popupwin', 'height=330, width=485, top=200, left=250, scrollbars=yes, resizable=yes');self.name = 'main';"title="Click to search for an Agency">Search for an Agency:</a></td>
					   </tr>
					 </cfif>
	                 </table><br>
					   <input type="hidden" name="AgencyID" value="#Session.JobPosting.AgencyInfo.AgencyID#"> 
					   <table border="0" cellpadding="3" cellspacing="0">
		                  <tr>
				           <td class="RegText"><strong>Agency/School:</strong></td>
						   <td><input type="text" name="AgencyName" value="#Session.JobPosting.Agencyinfo.AgencyName#" size="35" maxlenth="75"></td>
				          </tr>
						  <tr>
				           <td class="RegText"><strong>Agency/Campus Address:</strong></td>
						   <td><input type="text" name="AGAddr1" value="#Session.JobPosting.Agencyinfo.Addr1#" size="30" maxlenth="75"></td>
				          </tr>
						  <tr>
				           <td class="RegText"><strong>Additional<br>Agency/Campus Address:</strong></td>
						   <td><input type="text" name="AGAddr2" value="#Session.JobPosting.Agencyinfo.Addr2#" size="30" maxlenth="75"></td>
				          </tr>
						  <tr>
				           <td class="RegText"><strong>City:</strong></td>
						   <td><input type="text" name="AGCity" value="#Session.JobPosting.Agencyinfo.City#" size="30" maxlenth="75"></td>
				          </tr>
						  <tr>
				           <td class="RegText"><strong>State:</strong></td>
						   <td>
						     <table border="0" cellpadding="1" cellspacing="0" width="100%">
		                        <tr>
		                          <td><select name="AGState">
								       <cfloop query="GetState">
								         <option value="#CodeValue#" <cfif session.JobPosting.AgencyInfo.State EQ Codevalue>Selected</cfif>>#CodeValue#</option>
								       </cfloop>
									  </select>
								  </td>
		                          <td class="RegText"><strong>ZipCode:</strong></td>
						          <td><input type="text" name="AGZip" value="#Session.JobPosting.Agencyinfo.Zip#" size="10" maxlenth="10"></td>
								</tr>
		                     </table>
						   </td>
				          </tr>
						  <tr>
				           <td class="RegText"><strong>Agency Web Site:</strong></td>
						   <td><input type="text" name="AgWebSite" value="#Session.JobPosting.Agencyinfo.WebSite#" size="30" maxlenth="125"></td>
				          </tr>
						  <tr>
						    <td colspan=2>&nbsp;</td>
						  </tr>
					  </table>			  
				      <table border="0" cellpadding="6" cellspacing="0" width="100%">
					     <tr bgcolor="##003366">
						    <td><strong style="color:##ffffff;">Contact Information:</strong></td>
						 </tr>
					  </table><br>
					  <cfif IsDefined("Session.UserInfo.MemberID")>
					     <cfset Session.JobPosting.Contact.MemberID = "#Session.UserInfo.MemberID#">
						 <cfset Session.JobPosting.Contact.Name = "#Session.UserInfo.Firstname# #Session.UserInfo.lastname#">
						 <cfset Session.JobPosting.Contact.Email = "#Session.UserInfo.Email#">
						 <cfset Session.JobPosting.Contact.Phone = "#Session.UserInfo.MainPhone#">
						 <cfset Session.JobPosting.Contact.Fax = "#Session.UserInfo.Fax#">
					  <cfelseif Not IsDefined("Session.JobPosting.Contact") and Not IsDefined("Session.Userinfo.MemberID")>	
					     <cfset Session.JobPosting.Contact.MemberID = "">
						 <cfset Session.JobPosting.Contact.Name = "">
						 <cfset Session.JobPosting.Contact.Email = "">
						 <cfset Session.JobPosting.Contact.Phone = "">
						 <cfset Session.JobPosting.Contact.Fax = ""> 
					  </cfif>
					  <input type="hidden" name="MemberID" value="#Session.JobPosting.Contact.MemberID#">
					  <table border="0" cellpadding="3" cellspacing="0" width="100%">
	                    <tr>
	                        <td><font face="Verdana,Arial" size="-1"><b>Contact:</b></font></td>
							<td><input type="text" name="Contact" value="#Session.JobPosting.Contact.Name#" size="30" maxlenth="125"></td>
	                    </tr>
						<tr>
	                        <td><font face="Verdana,Arial" size="-1"><b>Email:</b></font></td>
							<td><input type="text" name="Email" value="#Session.JobPosting.Contact.Email#" size="30" maxlenth="80"> <font size="-2" face="arial" color="757575">(you@email.com)</font></td>
	                    </tr>
						<tr>
	                        <td><font face="Verdana,Arial" size="-1"><b>Phone:</b></font></td>
							<td><input type="text" name="Phone" value="#Session.JobPosting.Contact.Phone#" size="15" maxlenth="15"> <font size="-2" face="arial" color="757575">(555-555-5555)</font></td>
	                    </tr>
						<tr>
	                        <td><font face="Verdana,Arial" size="-1"><b>Fax:</b></font></td>
							<td><input type="text" name="Fax" value="#Session.JobPosting.Contact.Fax#" size="15" maxlenth="15"> <font size="-2" face="arial" color="757575">(555-555-5555)</font></td>
	                    </tr>
	                  </table><br>
				  </cfoutput>
			      <table border="0" cellpadding="6" cellspacing="0" width="100%">
				     <tr bgcolor="#003366">
					    <td><strong style="color:#ffffff;">Job Posting Information:</strong></td>
					 </tr>
				  </table><br>
				  <table border="0" cellpadding="4" cellspacing="0" width="100%">
                     <tr>
                        <td valign="top" align="center"><strong class="errortext">Please note all Job Postings must be approved prior to being displayed on the IPRA site.</strong></td>
                     </tr>
					 <tr>
					    <td>
						   <cfquery name="GetPricing" datasource="#Application.dsn#">
				              Select P.ProductID, P.ProductName, P.MemberPrice, P.NonMemberPrice, P.ProductCategory, L.Codedesc as jobcategory 
				              From Products P, Lookup L
				              Where P.ProductType = '01'
				              AND L.CodeGroup = 'ORDERCAT'
				              AND L.CodeValue = P.ProductCategory
				              Order By L.Ranking, P.ProductQty 
				            </cfquery>
							
				             <cfquery name="GetCat" datasource="#Application.dsn#">
				              Select codeDesc, Codevalue
				              From Lookup L
				              Where L.CodeGroup = 'JOBCAT'
				              Order By CodeValue, CodeDesc
							  
				            </cfquery>
						   <table border="0" cellpadding="4" cellspacing="0" width="100%">
                              <tr>
							    <td><font face="Verdana,Arial" size="-1"><b>Type of Posting:</b></font><br><font color="#959595" size="-2">(<cfif IsDefined("Session.Userinfo.MemberID")>Member Pricing<cfelse>Non-Member Pricing</cfif>)</font></td>
								<td><select name="JobType">
								       <cfoutput query="GetPricing" group="ProductCategory">
								        <optgroup label="#JobCategory#"></optgroup>
									      <cfoutput>
									        <option Value="#ProductID#">#ProductName# - <cfif IsDefined("Session.Userinfo.MemberID")>#DollarFormat(MemberPrice)#<cfelse>#DollarFormat(NonMemberPrice)#</cfif></option>
									      </cfoutput>
									   </cfoutput>
									</select>
								</td>
							 </tr>
							 <tr>
							    <td><font face="Verdana,Arial" size="-1"><b>Job Category:</b></font></td>
								<td><select name="JobCategory">
								       <cfoutput query="GetCat" Group="CodeDesc">
								          
									        <option Value="#GetCat.codeValue#">#GetCat.CodeDesc#</option>
									      <cfoutput></cfoutput>
									   </cfoutput>
									</select>
								</td>
							 </tr>
							  <tr>
                                <td><font face="Verdana,Arial" size="-1"><b>Job Title:</b></font></td>
								<td><input type="text" name="JobTitle" value="" size="40" maxlenth="100"></td>
                              </tr>
							  <tr>
                                <td><font face="Verdana,Arial" size="-1"><b>Salary:</b></font></td>
								<td><input type="text" name="Salary" value="" size="25" maxlenth="40"></td>
                              </tr>
							  <tr>
                                <td><font face="Verdana,Arial" size="-1"><b>Closing Date:</b></font></td>
								<td><input type="text" name="ClosingDate" value="" size="10" maxlenth="10"> <font size="-2" face="arial" color="757575">(MM/DD/YYYY)</font></td>
                              </tr>
							  <tr>
                                <td><font face="Verdana,Arial" size="-1"><b>Qualifications:</b></font></td>
								<td><textarea name="Qualifications" rows="5" cols="50"></textarea></td>
                              </tr>
							  <tr>
                                <td><font face="Verdana,Arial" size="-1"><b>Job Duties:</b></font></td>
								<td><textarea name="JobDuties" rows="5" cols="50"></textarea></td>
                              </tr>
							  
                           </table>
						</td>
					 </tr> 
                  </table>
				  
				  <table border="0" cellpadding="6" cellspacing="0" width="100%">
				     <tr bgcolor="#003366">
					    <td><strong style="color:#ffffff;">Billing Information:</strong></td>
					 </tr>
				  </table>
				   <cfquery name="GetPayType" datasource="#Application.dsn#" cachedwithin="#CreateTimeSpan(0,0,10,0)#">
				      Select *
				       From Lookup
				        Where CodeGroup = 'Paytype'
				        Order By Ranking, Codevalue, CodeDesc
				   </cfquery><br>
				   
				   <cfoutput>
					 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	                    <tr>
	                       <td><font face="Verdana,Arial" size="-1"><b>Payment Type:</b></font></td>
						   <td><select name="PayType">
								<cfloop query="GetPayType">  
								   <option value="#GetPayType.CodeValue#">#GetPayType.CodeDesc#</option>
							     </cfloop>
							  </select></td>
	                       </tr>
					<tr>
					  <td><font face="Verdana,Arial" size="-1"><b>Purchase Order Number:</b></font></td>
					  <td><input type="text" name="PONumber" value=""></td>
					</tr>
					<tr>
					  <td>&nbsp;</td>
					</tr>
					
					<tr>
						<td bgcolor="##838383" colspan=2><B style="color:##ffffff;">Credit Card Information</B></td>
					</tr>
					<tr>
						<td width=105 align=left><font face="Verdana,Arial" size="-1"><b>Card Holder</b></font>:</td>
						<td width=* align=left><cfinput name="CardName" type="text" size=30 maxlength=40 required="Yes"></td>
					</tr>
					
					<tr>
						<td width=105 align=left><font face="Verdana,Arial" size="-1"><b>Address</b></font>:</td>
						<td width=* align=left><cfinput type="Text" name="BillAddress" required="Yes" size="35" maxlength="40" message="Please enter the Billing Address"></td>
					</tr>
					
					<tr>
						<td width=105 align=left><font face="Verdana,Arial" size="-1"><b>City</b></font>:</td>
						<td width=* align=left><cfinput type="Text" name="BillCity" required="Yes" size="25" maxlength="30" message="Please enter the Billing City"></td>
					</tr>
					<cfquery name="GetState" datasource="#Application.dsn#" cachedwithin="#CreateTimeSpan(0,0,10,0)#">
				      Select CodeDesc, CodeValue
				      From Lookup
				      Where CodeGroup = 'STATE'
				      Order BY CodeDesc
				    </cfquery> 
					<tr>
						<td width=105 align=left><font face="Verdana,Arial" size="-1"><b>State</b></font>:</td>
						<td width=* align=left><select name="BillState">
														       <cfloop query="GetState">
														         <option value="#CodeValue#">#CodeValue#</option>
														       </cfloop>
															  </select></td>
					</tr>
					
					<tr valign=top>
						<td width=105 align=left><font face="Verdana,Arial" size="-1"><b>Zip</b></font>:</td>
						<td width=* align=left><cfinput type="Text" name="BillZip" required="Yes" size="5" maxlength="5" message="Please enter the Billing Zip Code"></td>
					</tr>
					
					<tr valign=top>
						<td colspan=2>
						<font face="Arial" size="-1"><i>Note: the <b>billing address</b> for your credit card <b>must match</b> the information you have entered here in order for the transaction to be successful.</i></font><br>&nbsp;
						</td>
					</tr>
					<tr>
					  <td width="40%" align="center" colspan=2><hr noshade size="1"></td>
					</tr>
					<tr>
						<td width=105 align=left><font face="Verdana,Arial" size="-1"><b>Credit Card</b></font>:</td>
						<td width=* align=left><cfselect name="CardType"  query="CCards" value="CodeValue" display="CodeDesc" size="1" message="Please select the Credit Card you wish to use for this transaction" required="Yes"><option selected value="*">--- Select Card ---</option></cfselect></td>
					</tr>
					
					<tr>
						<td width=105 align=left><font face="Verdana,Arial" size="-1"><b>Card Number</b></font>:</td>
						<td width=* align=left><cfinput type="Text" name="CardNbr" validate="creditcard" required="Yes" size="25" maxlength="20"></td>
					</tr>
					
					<tr>
						<td width=105 align=left><font face="Verdana,Arial" size="-1"><b>Expires on</b></font>:</td>
						<td width=* align=left>
							<cfselect name="XMonth" query="Months" value="Codevalue" display="codeDesc" size="1" selected="#NumberFormat(Month(now()), '00')#" message="Please select the Expiration Month of your card" required="Yes"></cfselect>
							<select name="XYear" size=1>
							<cfloop index="Iyr" from="#Year(now())#" to="#Evaluate(Year(now())+6)#"><cfoutput><option value="#IYr#">#IYr#</option></cfoutput></cfloop>
							</select>
						</td>
					</tr>
					</table>
					</cfoutput>
					<br>
					<table border="0" cellpadding="0" cellspacing="0" width="100%">
                      <tr>
                        <td align="center">
					       <font face="Verdana,Arial" size="-1">
					         <input type="submit" name="submit" value="Complete Posting >>" onclick="javascript:disableForm(this);">
					       </font>
					    </td>
                      </tr>
                     </table>
					</cfform>
					
					<br clear=all>
					<font face="Verdana,Arial" size="-1">
					<script src=https://seal.verisign.com/getseal?host_name=www.ilipra.org&size=S&use_flash=YES&use_transparent=YES&lang=en></script>
					<p>If you chose a credit card as your method of payment, This will initiate a <b>secured</b> transaction to the bank which will validate the credit information you provided and authorize the transfer of funds.  The authorization process may take up to 1 minute to complete so please be patient.</p>
					</font>
					<center><img src="/images/credit_card_bar.gif" alt="" border="0"></center>
                  
			   <br><br>
		 </td>
     </tr>
</table>  

<cfmodule template="#Application.Footer#">