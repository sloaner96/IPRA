<cfmodule template="#Application.header#" section="0" sectiontitle="IPRA Membership Application">
  <cfoutput>
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
	<cfquery name="GetState" datasource="#Application.dsn#" cachedwithin="#CreateTimeSpan(0,0,10,0)#">
	   Select CodeDesc, CodeValue
	   From Lookup
	   Where CodeGroup = 'STATE'
	   Order BY CodeDesc
	</cfquery>
	
   <!---   <cfset Currdate = DayOfYear(now())>
	
	<cfset FiftyPercentStartDate = DayOfYear('7/1/#year(now())#')>
	<cfset FiftyPercentEndDate = DayOfYear('11/30/#year(now())#')>
	
	 <cfif CurrDate GTE FiftyPercentStartDate AND Currdate LTE FiftyPercentEndDate>
	    <cfset Discount = true>
	 <cfelse>
	   <cfset Discount = false>
	 </cfif>--->
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="160"><br>
		    <cfmodule template="#Application.tagdir#/membersnav.cfm">
		   </td>
		   <td valign="top"><br>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>IPRA Membership Application</h3></td>
		        </tr>
		      </table>
			  <table border="0" cellpadding="6" cellspacing="0" width="100%">
		        <tr>
		           <td class="RegText">
				       <table border="0" cellpadding="0" cellspacing="0" width="100%">
                         <tr>
                           <td>
						   <p><strong><font color="red">This online application is for NEW MEMBERS ONLY!!! If you would like to renew your membership with IPRA, please contact Polly McKee at 630-376-1911. </font></strong></p>
						   <p>IPRA membership expires each year on December 31. <strong><font color="red">Applications in December 2005 receive an extra free month of membership!</font></strong></p>
							
							</td>
                         </tr>
                       </table>
					   <p class="errortext">* Required Fields</p>
					   <cfform name="mbrform" action="ProcessPayment.cfm" method="POST" scriptsrc="/scripts/cfform.js">
					    <!--- <input type="hidden" name="Discount" value="#Discount#">  --->
					    <table border="0" cellpadding="4" cellspacing="0" width="100%">
                         <tr bgcolor="##003366">
                            <td><strong style="color:##ffffff;">Agency Information</strong></td>
                         </tr>
                       </table>
					   <cfif IsDefined("form.AgencyFind")>
						  <cfquery name="MyAgencySearch" datasource="#Application.dsn#">
								  Select *
								  from Agencies
								  Where AgencyID = <cfif IsDefined("form.agencyFind")>#form.agencyFind#</cfif>
							</cfquery>
							
							
							  <cfset Session.MbrApp.AgencyInfo.AgencyID ="#MyAgencySearch.AgencyID#">
						      <cfset Session.MbrApp.Agencyinfo.AgencyName = "#MyAgencySearch.AgencyName#">
							  <cfset Session.MbrApp.Agencyinfo.Addr1 = "#MyAgencySearch.Addr1#">
							  <cfset Session.MbrApp.Agencyinfo.Addr2 = "#MyAgencySearch.Addr2#">
							  <cfset Session.MbrApp.Agencyinfo.City = "#MyAgencySearch.City#">
							  <cfset Session.MbrApp.Agencyinfo.State = "#MyAgencySearch.State#">
							  <cfset Session.MbrApp.Agencyinfo.Zip = "#MyAgencySearch.Zip#">
							  <cfset Session.MbrApp.Agencyinfo.phone = "#MyAgencySearch.phone#">
							  <cfset Session.MbrApp.Agencyinfo.fax = "#MyAgencySearch.fax#">
							  
							  <cfset Session.MbrApp.Agencyinfo.WebSite = "#MyAgencySearch.WebSite#">
						  
					   <cfelseif NOT IsDefined("form.AgencyFind") AND Not IsDefined("Session.MbrApp.AgencyInfo")>
						      <cfset Session.MbrApp.AgencyInfo.AgencyID ="">
						      <cfset Session.MbrApp.Agencyinfo.AgencyName = "">
							  <cfset Session.MbrApp.Agencyinfo.Addr1 = "">
							  <cfset Session.MbrApp.Agencyinfo.Addr2 = "">
							  <cfset Session.MbrApp.Agencyinfo.City = "">
							  <cfset Session.MbrApp.Agencyinfo.State = "">
							  <cfset Session.MbrApp.Agencyinfo.Zip = "">
							  <cfset Session.MbrApp.Agencyinfo.Phone = "">
							  <cfset Session.MbrApp.Agencyinfo.Fax = "">
							  <cfset Session.MbrApp.Agencyinfo.WebSite = "">
					   </cfif>

			    
				   <table border="0" cellpadding="4" cellspacing="0">
	                 <tr>
	                   <td class="regtext">Select Agency/School Below or Enter Address Information in the form below:</td>
	                 </tr>
					
					   <tr class="regtext">
					      <td><a href="javascript:void(0);" onclick="window.open('AgencySearchPop.cfm', 'popupwin', 'height=330, width=485, top=200, left=250, scrollbars=yes, resizable=yes');self.name = 'main';"title="Click to search for an Agency">Search for an Agency:</a></td>
					   </tr>
					 
	                 </table><br>
					   <input type="hidden" name="AgencyID" value="#Session.MbrApp.AgencyInfo.AgencyID#"> 
					   <table border="0" cellpadding="3" cellspacing="0">
		                  <tr>
				           <td class="RegText"><span class="errortext">*</span><strong>Agency/School:</strong><br><font face="arial" size="-2">(Required For Student Members)</font></td>
						   <td><input type="text" name="AgencyName" value="#Session.MbrApp.Agencyinfo.AgencyName#" size="35" maxlenth="75"></td>
				          </tr>
						  <tr>
				           <td class="RegText"><span class="errortext">*</span><strong>Agency/Campus Address:</strong></td>
						   <td><input type="text" name="AGAddr1" value="#Session.MbrApp.Agencyinfo.Addr1#" size="30" maxlenth="75"></td>
				          </tr>
						  <tr>
				           <td class="RegText"><strong>Additional<br>Agency/Campus Address:</strong></td>
						   <td><input type="text" name="AGAddr2" value="#Session.MbrApp.Agencyinfo.Addr2#" size="30" maxlenth="75"></td>
				          </tr>
						  <tr>
				           <td class="RegText"><span class="errortext">*</span><strong>City:</strong></td>
						   <td><input type="text" name="AGCity" value="#Session.MbrApp.Agencyinfo.City#" size="30" maxlenth="75"></td>
				          </tr>
						  <tr>
				           <td class="RegText"><span class="errortext">*</span><strong>State:</strong></td>
						   <td>
						     <table border="0" cellpadding="1" cellspacing="0" width="100%">
		                        <tr>
		                          <td><select name="AGState">
								       <cfloop query="GetState">
								         <option value="#CodeValue#" <cfif Session.MbrApp.AgencyInfo.State EQ Codevalue>Selected</cfif>>#CodeValue#</option>
								       </cfloop>
									  </select>
								  </td>
		                          <td class="RegText"><span class="errortext">*</span><strong>ZipCode:</strong></td>
						          <td><input type="text" name="AGZip" value="#Session.MbrApp.Agencyinfo.Zip#" size="10" maxlenth="10"></td>
								</tr>
		                     </table>
						   </td>
				          </tr>
						  <tr>
				           <td class="RegText"><span class="errortext">*</span><strong>Phone:</strong></td>
						   <td><input type="text" name="AgPhone" value="#Session.MbrApp.Agencyinfo.Phone#" size="12" maxlenth="12"> <font size="-2" face="arial" color="757575">(555-555-5555)</font></td>
				          </tr>
						  <tr>
				           <td class="RegText"><strong>Fax:</strong></td>
						   <td><input type="text" name="AgFax" value="#Session.MbrApp.Agencyinfo.Fax#" size="12" maxlenth="12"> <font size="-2" face="arial" color="757575">(555-555-5555)</font></td>
				          </tr>
						  <tr>
				           <td class="RegText"><strong>Agency Web Site:</strong></td>
						   <td><input type="text" name="AgWebSite" value="#Session.MbrApp.Agencyinfo.WebSite#" size="30" maxlenth="125"></td>
				          </tr>
						  <tr>
						    <td colspan=2>&nbsp;</td>
						  </tr>
					  </table>	
					   <table border="0" cellpadding="4" cellspacing="0" width="100%">
                         <tr bgcolor="##003366">
                            <td><strong style="color:##ffffff;">Member Information</strong></td>
                         </tr>
                       </table>
					   <cfquery name="GetPrefix" datasource="#Application.dsn#" cachedwithin="#createTimespan(0, 0, 30, 0)#">
					      Select Codevalue, codedesc
						  From Lookup
						  Where CodeGroup = 'NAMEPrefix'
						  Order by Ranking. CodeDesc
					   </cfquery>
					   <cfquery name="GetCert" datasource="#Application.dsn#" cachedwithin="#createTimespan(0, 0, 30, 0)#">
					      Select Codevalue, codedesc
						  From Lookup
						  Where CodeGroup = 'Certtype'
						  Order by Ranking. CodeDesc
					   </cfquery>
					   <table border="0" cellpadding="4" cellspacing="0" >
                         <tr>
                            <td><strong>Prefix</strong></td>
							<td><select name="Prefix">
							     <option value="">-- Select One --</option>
							      <cfloop query="GetPrefix">
							         <option value="#GetPrefix.CodeValue#">#GetPrefix.CodeDesc#</option>
							      </cfloop>
								</select>
							 </td>
                         </tr>
						 <tr>
                            <td><span class="errortext">*</span><strong>First name</strong></td>
							<td><cfinput type="text" name="firstname" size="25" maxlength="70"></td>
                         </tr>
						 
						 <tr>
                            <td><span class="errortext">*</span><strong>Last name</strong></td>
							<td><cfinput type="text" name="lastname" size="25" maxlength="70"></td>
                         </tr>
						 <tr>
                            <td><span class="errortext">*</span><strong>Title</strong></td>
							<td><cfinput type="text" name="title" size="25" maxlength="70"></td>
                         </tr>
						 <tr>
                            <td><span class="errortext">*</span><strong>Email</strong></td>
							<td><cfinput type="text" name="email" size="35" maxlength="90"> <font size="-2" face="arial" color="757575">(you@email.com)</font></td>
                         </tr>
						 <tr>
						   <td><span class="errortext"></span><strong>Certification:</strong></td>
						   <td><select name="CertType">
							      <option value="">-- None --</option>
							      <cfloop query="GetCert">
							         <option value="#GetCert.CodeValue#">#GetCert.CodeDesc#</option>
							      </cfloop>
							    </select>
							</td>
						 </tr>
						 </table>
						 <table border="0" cellpadding="4" cellspacing="0" width="100%">
                            <tr bgcolor="##eeeeee">
						      <td colspan=2><strong>Home Info</strong> (Optional)</td>
						    </tr>
                         </table>
						 <table border="0" cellpadding="4" cellspacing="0">
						 <tr>
                            <td><strong>Address</strong></td>
							<td><cfinput type="text" name="homeaddr" size="25" maxlength="70"></td>
                         </tr>
						 <tr>
                            <td><strong>Address 2</strong></td>
							<td><cfinput type="text" name="homeaddr2" size="25" maxlength="70"></td>
                         </tr>
						 <tr>
                            <td><strong>City</strong></td>
							<td><cfinput type="text" name="homecity" size="25" maxlength="50"></td>
                         </tr>
						 <tr>
                            <td><strong>State</strong></td>
							<td><select name="homeState">
								       <cfloop query="GetState">
								         <option value="#CodeValue#">#CodeValue#</option>
								       </cfloop>
									  </select></td>
                         </tr>
						 <tr>
                            <td><strong>Zip</strong></td>
							<td><cfinput type="text" name="homezipcode" size="9" maxlength="10"></td>
                         </tr>
                       </table><br>
					  		  
					   <table border="0" cellpadding="4" cellspacing="0" width="100%">
                         <tr bgcolor="##003366">
                            <td><strong style="color:##ffffff;">Membership Type</strong></td>
                         </tr>
                       </table>
					   <cfquery name="GetProduct" datasource="#Application.dsn#">
					     Select ProductID, ProductName, PerUnitPrice
						 From Products
						 Where ProductType = '03'
						 order By PerUnitPrice desc
					   </cfquery>
					   <cfquery name="GetMbrSpecialSec" datasource="#Application.dsn#" cachedwithin="#CreateTimeSpan(0,0,10,0)#">
			            Select P.ProductID, P.ProductName, P.PerUnitPrice, L.Codedesc as prodcategory 
				         From Products P, Lookup L
				         Where P.ProductType = '04'
				         AND L.CodeGroup = 'ORDERCAT'
				         AND L.CodeValue = P.ProductCategory
				         Order By productCategory, ProductName
					    </cfquery>
					   <table border="0" cellpadding="0" cellspacing="0">
                         <tr>
                            <td colspan=3><span class="ErrorText">*</span><strong>Membership Dues</strong> (choose one)<!---  <cfif Discount><font color="##cc0000">* 50% Discount Applied</font></cfif>---></td>
                         </tr>
						 <cfloop query="GetProduct">
						   <!---  <cfif Discount>
						     <cfset DiscountPrice = (GetProduct.PerUnitPrice * .50)>
						   </cfif>--->
						  <tr> 
						    <td><input type="radio" name="Mbrdues" value="#Getproduct.productID#"></td>
						    <td>#GetProduct.ProductName#</td> 
							<td><!---  <cfif Discount>#DollarFormat(DiscountPrice)#<cfelse>--->#DollarFormat(GetProduct.PerunitPrice)#<!---  </cfif>---></td>
						  </tr>
						 </cfloop>
						 <tr>
						   <td>&nbsp;</td>
						 </tr>
						 <tr>
						   <td colspan=3><strong>Special Interest Section</strong> (one Complimentary - Additional $15.00)</td>
						 </tr>
						 <cfloop query="GetmbrSpecialSec">
						   <tr class="regtext">
						     <td><input type="checkbox" name="SpecialSection" value="#GetMbrSpecialSec.ProductID#"></td>
							 <td>#GetMbrSpecialSec.ProductName#</td>
							 <td>#DollarFormat(GetMbrSpecialSec.PerUnitPrice)#</td>
						   </tr>
						</cfloop>
                       </table><br>
					   <table border="0" cellpadding="4" cellspacing="0" width="100%">
                         <tr bgcolor="##003366">
                            <td><strong style="color:##ffffff;">Payment Information</strong></td>
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
			                       <td><b>Payment Type:</b></td>
								   <td><select name="PayType">
										<cfloop query="GetPayType">  
										   <option value="#GetPayType.CodeValue#">#GetPayType.CodeDesc#</option>
									     </cfloop>
									  </select></td>
			                       </tr>
							<tr>
							  <td><b>Purchase Order Number:</b></td>
							  <td><input type="text" name="PONumber" value=""></td>
							</tr>
							<tr>
							  <td>&nbsp;</td>
							</tr>
							
							<tr>
								<td bgcolor="##838383" colspan=2><B style="color:##ffffff;">Credit Card Information</B></td>
							</tr>
							<tr>
								<td width=105 align=left><b>Card Holder</b>:</td>
								<td width=* align=left><cfinput name="CardName" type="text" size=30 maxlength=40></td>
							</tr>
							
							<tr>
								<td width=105 align=left><b>Address</b>:</td>
								<td width=* align=left><cfinput type="Text" name="BillAddress" size="35" maxlength="40"></td>
							</tr>
							
							<tr>
								<td width=105 align=left><b>City</b>:</td>
								<td width=* align=left><cfinput type="Text" name="BillCity" size="25" maxlength="30"></td>
							</tr>
							<cfquery name="GetState" datasource="#Application.dsn#" cachedwithin="#CreateTimeSpan(0,0,10,0)#">
						      Select CodeDesc, CodeValue
						      From Lookup
						      Where CodeGroup = 'STATE'
						      Order BY CodeDesc
						    </cfquery> 
							<tr>
								<td width=105 align=left><b>State</b>:</td>
								<td width=* align=left><select name="BillState">
																       <cfloop query="GetState">
																         <option value="#CodeValue#">#CodeValue#</option>
																       </cfloop>
																	  </select></td>
							</tr>
							
							<tr valign=top>
								<td width=105 align=left><b>Zip</b>:</td>
								<td width=* align=left><cfinput type="Text" name="BillZip" size="5" maxlength="5"></td>
							</tr>
							
							<tr valign=top>
								<td colspan=2>
								<font face="Arial" size="-1"><i>Note: the <b>billing address</b> for your credit card <b>must match</b> the information you have entered here in order for the transaction to be successful.</i><br>&nbsp;
								</td>
							</tr>
							<tr>
							  <td width="40%" align="center" colspan=2><hr noshade size="1"></td>
							</tr>
							<tr>
								<td width=105 align=left><b>Credit Card</b>:</td>
								<td width=* align=left><cfselect name="CardType"  query="CCards" value="CodeValue" display="CodeDesc" size="1" message="Please select the Credit Card you wish to use for this transaction" required="Yes"><option selected value="*">--- Select Card ---</option></cfselect></td>
							</tr>
							
							<tr>
								<td width=105 align=left><b>Card Number</b>:</td>
								<td width=* align=left><cfinput type="Text" name="CardNbr" validate="creditcard" size="25" maxlength="20"></td>
							</tr>
							
							<tr>
								<td width=105 align=left><b>Expires on</b>:</td>
								<td width=* align=left>
									<cfselect name="XMonth" query="Months" value="Codevalue" display="codeDesc" size="1" selected="#NumberFormat(Month(now()), '00')#"></cfselect>
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
							         <strong class="errortext">Please click the button only once, Repeated clicks will result in multiple charges.</strong>
							         <input type="submit" name="submit" value="Complete Application >>">
							       
							    </td>
		                      </tr>
		                     </table>
							</cfform>
							
							<br clear=all>
							
							
							<p>If you chose a credit card as your method of payment, This will initiate a <b>secured</b> transaction to the bank which will validate the credit information you provided and authorize the transfer of funds.  The authorization process may take up to 1 minute to complete so please be patient.</p>
							
							<script language=JavaScript src='https://seal.XRamp.com/seal.asp?type=H'></script><center><img src="/images/credit_card_bar.gif" alt="" border="0"></center>
		                  
				   </td>
		        </tr>
		       </table>
			   <br><br>
		 </td>
     </tr>
</table>  
</cfoutput>
<cfmodule template="#Application.footer#">