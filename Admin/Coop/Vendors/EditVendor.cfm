<cfparam name="URL.E" default="0">
<cfset ProductTypes = request.CoopComponent.GetItemGroups()>
<cfset getStates = request.PaymentComponent.GetState()>
<cfset getCosts = request.CoopAdminComponent.getVendorCosts()>
<cfset getpayType = request.PaymentComponent.GetPayType()>
<cfset GetVendor = request.CoopAdminComponent.GetVendorInfo(URL.VendorID)>



<cfmodule template="#Application.header#" section="0" sectiontitle="Coop Maintenance: Update Vendor">
  <cfoutput>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="160"><br>
		    <cfmodule template="#Application.tagdir#/adminnav.cfm" level="5">
		   </td>
		   <td valign="top"><br>
		      <table border="0" cellpadding="4" cellspacing="2" width="100%" bgcolor="##eeeeee">
				<tr bgcolor="##003366">
					<td><strong style="color:##ffffff;"><a href="VendorMaint.cfm" style="color:##ffffff;">Vendor Home</a></strong></td>
					 <td bgcolor="##ffffff"><strong style="color:##003366;">Vendor Detail</strong></td>
					 <td><strong style="color:##ffffff;"><a href="VendorBids.cfm?vendorID=#URL.VendorID#" style="color:##ffffff;">Vendor Bids</a></strong></td>
					 <td><strong style="color:##ffffff;"><a href="VendorHistory.cfm?vendorID=#URL.VendorID#" style="color:##ffffff;">Vendor History</a></strong></td>
					 
				</tr>
	          </table>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>Cooperative Purchase Program: Update Vendor</h3></td>
		        </tr>
		      </table>
			  <strong style="color:##CC0000; font-size:10px;">* Required Fields</strong><br>
			  <cfif url.E EQ 1>
			   <p class="Errortext"><strong>Error! You Must Include Your Company Name</strong></p>
			  <cfelseif url.E EQ 2>
			   <p class="Errortext"><strong>Error! You Must Include A Contact Person</strong></p>
			  <cfelseif url.E EQ 3>
			   <p class="Errortext"><strong>Error! You Must Include A Email Address</strong></p>
			  <cfelseif url.E EQ 4>
			   <p class="Errortext"><strong>Error! You Must Include The Company Address</strong></p>
			  <cfelseif url.E EQ 5>
			   <p class="Errortext"><strong>Error! You Must Include A City</strong></p>
			  <cfelseif url.E EQ 6>
			   <p class="Errortext"><strong>Error! You Must Include A State</strong></p>
			  <cfelseif url.E EQ 7>
			   <p class="Errortext"><strong>Error! You Must Include A ZipCode</strong></p>
			  <cfelseif url.E EQ 8>
			   <p class="Errortext"><strong>Error! You Must Include A Phone Number</strong></p>
			  <cfelseif url.E EQ 9>
			   <p class="Errortext"><strong>Error! You Must Select a Product Interest</strong></p>
			  <cfelseif url.E EQ 10>
			   <p class="Errortext"><strong>Error! This company information already exists in our database</strong></p> 
			  <cfelseif url.E EQ 11>
			   <p class="Errortext"><strong>Error! The Payment Date is not in the correct format (MM/DD/YYYY)</strong></p>  
			  </cfif>
			  
			  <cfform name="coopvendorsignup" action="vendor_action.cfm?action=Update" method="POST">
			    <input type="hidden" name="VendorID" value="#GetVendor.VendorID#">
				  <table border="0" cellpadding="6" cellspacing="0">
			        
					<tr>
					  <td colspan="2"><strong>Active Vendor:</strong> <input type="checkbox" name="ActiveVendor" value="1" <cfif Getvendor.IsActive EQ 1>Checked</cfif>></td>
					</tr>
					<tr bgcolor="##003366">
					  <td colspan="2"><strong style="font-family:Arial, verdana, tahoma; font-size:12px; color:##ffffff;">Contact Information</strong></td>
					</tr>
				    <tr>
			           <td class="regtext"><strong>Company Name:</strong></td>
					   <td><cfinput type="text" name="VendorName" value="#Getvendor.CompanyName#" size="40" maxlength="200" required="YES" message="You must include your Company Name"> <strong style="color:##CC0000; font-size:10px;">*</strong></td>
			        </tr>
					<tr>
					  <td class="RegText"><strong>Contact Prefix:</strong></td>
					   <td><select name="VendorPrefix">
					         <option value=""></option>
					         <option value="Mr" <cfif getVendor.Prefix EQ "MR">Selected</cfif>>Mr</option>
							 <option value="Mrs" <cfif getVendor.Prefix EQ "MRS">Selected</cfif>>Mrs</option>
							 <option value="Ms" <cfif getVendor.Prefix EQ "MS">Selected</cfif>>Ms</option>
							 <option value="Dr" <cfif getVendor.Prefix EQ "DR">Selected</cfif>>Dr</option>
						   </select>
					   </td>
					</tr>
					<tr>
			           <td class="RegText"><strong>Contact Firstname:</strong></td>
					   <td><cfinput type="text" name="VendorFirstname" value="#Getvendor.Firstname#" size="30" maxlength="100" required="YES" message="You must include a contact for your company"> <strong style="color:##CC0000; font-size:10px;">*</strong></td>
			        </tr>
					<tr>
			           <td class="RegText"><strong>Contact Middle Initial:</strong></td>
					   <td><cfinput type="text" name="VendorMI" value="#Getvendor.MI#" size="4" maxlength="5"></td>
			        </tr>
					<tr>
			           <td class="RegText"><strong>Contact Lastname:</strong></td>
					   <td><cfinput type="text" name="VendorLastname" value="#Getvendor.Lastname#" size="30" maxlength="100" required="YES" message="You must include a contact for your company"> <strong style="color:##CC0000; font-size:10px;">*</strong></td>
			        </tr>
					<tr>
			           <td class="RegText"><strong>Title/Position:</strong></td>
					   <td><cfinput type="text" name="Vendortitle" value="#Getvendor.VenPosition#" size="30" maxlength="50"></td>
			        </tr>
					<tr>
			           <td class="RegText"><strong>Email Address:</strong></td>
					   <td><cfinput type="text" name="Email" value="#Getvendor.Email#" size="30" maxlength="80" required="YES" message="You must include a email address for your Contact"> <strong style="color:##CC0000; font-size:10px;">*</strong></td>
			        </tr>
					<tr bgcolor="##003366">
					  <td colspan="2"><strong style="font-family:Arial, verdana, tahoma; font-size:12px; color:##ffffff;">Address Information</strong></td>
					</tr>
					<tr>
			           <td class="RegText"><strong>Company Address:</strong></td>
					   <td><cfinput type="text" name="Addr" value="#Getvendor.Address#" size="35" maxlength="75" required="YES" message="You must include a address for your Company"> <strong style="color:##CC0000; font-size:10px;">*</strong></td>
			        </tr>
					<tr>
			           <td class="RegText"><strong>Mailstop/Suite:</strong></td>
					   <td><cfinput type="text" name="Addr2" value="#Getvendor.Address2#" size="35" maxlength="75"></td>
			        </tr>
					
					<tr>
			           <td class="RegText"><strong>City:</strong></td>
					   <td><cfinput type="text" name="City" value="#Getvendor.City#" size="25" maxlength="50" required="YES" message="You must include a city for your Company"> <strong style="color:##CC0000; font-size:10px;">*</strong></td>
			        </tr>
					<tr>
			           <td class="RegText"><strong>State:</strong></td>
					   <td><select name="State">
					        <option value="">-- Choose One --</option>
					        <cfloop query="getStates">
					         <option value="#getStates.CodeValue#" <cfif GetVendor.State EQ getStates.Codevalue>Selected</cfif>>#getStates.CodeDesc#</option>
							</cfloop>
						   </select> <strong style="color:##CC0000; font-size:10px;">*</strong></td>
			        </tr>
					<tr>
			           <td class="RegText"><strong>Zip Code:</strong></td>
					   <td><cfinput type="text" name="Zipcode" value="#Getvendor.Zip#" size="9" maxlength="11" required="YES" message="You must include a zipcode for your Company"> <strong style="color:##CC0000; font-size:10px;">*</strong></td>
			        </tr>
					<tr>
			           <td class="RegText"><strong>Company Phone:</strong></td>
					   <td><cfinput type="text" name="Phone" value="#Getvendor.Phone#" size="12" maxlength="12" required="YES" message="You must include a phone number for your Company"> <strong style="color:##CC0000; font-size:10px;">*</strong> Extension: <cfinput type="text" name="PhoneExt" value="#GetVendor.Extension#" size="5" maxlength="6"></td>
			        </tr>
					<tr>
			           <td class="RegText"><strong>Fax:</strong></td>
					   <td><input type="text" name="Fax" value="#Getvendor.Fax#" size="12" maxlength="12"></td>
			        </tr>
					<tr>
			           <td class="RegText"><strong>Website:</strong></td>
					   <td><input type="text" name="Website"value="#Getvendor.Website#"  size="40" maxlength="75"></td>
			        </tr>
					<tr>
			           <td class="RegText"><strong>Product Interest:</strong></td>
					   <td><select name="ProductInterest">
					        <option value="">--Select One --</option>
							<cfloop query="ProductTypes">
					        <option value="#ProductTypes.CodeValue#" <cfif getvendor.ProductGroup EQ ProductTypes.CodeValue>Selected</cfif>>#ProductTypes.CodeDesc# Products</option>
							</cfloop>
							<option value="B" <cfif getvendor.ProductGroup EQ "B">Selected</cfif>>Both Products</option>
						   </select> <strong style="color:##CC0000; font-font-size:10px;">*</strong></td>
			        </tr>
					<tr>
					  <td colspan="2">&nbsp;</td>
					</tr>
					<tr bgcolor="##003366">
					  <td colspan="2"><strong style="font-family:Arial, verdana, tahoma; font-size:12px; color:##ffffff;">Coop Information</strong></td>
					</tr>
					<tr>
					  <td><strong>Specification Sent Date:</strong></td>
					  <td><input type="text" name="SpecSent" value="#DateFormat(Getvendor.SpecSent, 'MM/DD/YYYY')#" size="12" maxlength="12"></td>
					</tr>
					<tr>
					  <td><strong>Bond Received:</strong></td>
					  <td><input type="checkbox" name="BondRcvd" value="1" <cfif Getvendor.BondRcvd EQ 1>Checked</cfif>></td>
					</tr>
					<tr>
					  <td><strong>Contract Received:</strong></td>
					  <td><input type="checkbox" name="ContractRcvd" value="1" <cfif Getvendor.ContractRcvd EQ 1>Checked</cfif>></td>
					</tr>
					<tr>
					  <td colspan="2">&nbsp;</td>
					</tr>
					<!--- <tr bgcolor="##003366">
					  <td colspan="2"><strong style="font-family:Arial, verdana, tahoma; font-size:12px; color:##ffffff;">Payment Information</strong></td>
					</tr>
					<tr>
					  <td><strong>Payment Date:</strong></td>
					  <td><input type="text" name="PaymentDate" value="" size="12" maxlength="12"></td>
					</tr>
					<tr>
					  <td><strong>Payment Via:</strong></td>
					  <td><select name="PaidVia">
					       <cfloop query="getpayType">
					        <option value="#getpayType.Codevalue#">#getpayType.CodeDesc#</option>
						   </cfloop>	
						  </select>
					  </td>
					</tr>
					<tr>
					  <td><strong>Payment Amount:</strong></td>
					  <td><select name="PaidAmount">
					       <cfloop query="getCosts">
					        <option value="#getCosts.ProductID#">#getCosts.ProductName#-#DollarFormat(PerUnitPrice)#</option>
						   </cfloop>	
						  </select>
					  </td>
					</tr>
					<tr>
					  <td colspan="2">&nbsp;</td>
					</tr> --->
					<tr bgcolor="##003366">
					  <td colspan="2"><strong style="font-family:Arial, verdana, tahoma; font-size:12px; color:##ffffff;">Vendor Notes</strong></td>
					</tr>
					<tr>
					  <td colspan="2"><textarea name="VendorNotes" rows="8" cols="45">#Trim(GetVendor.VendorNotes)#</textarea></td>
					</tr>
					<tr>
					  <td colspan="2" align="center"><input type="submit" name="submit" value="Update Vendor"></td>
					</tr>
					
			       </table>
				 </cfform>  
				 <cfform name="coopvendorremove" action="vendor_action.cfm?action=REMOVE" method="POST">
				    <input type="hidden" name="VendorID" value="#GetVendor.VendorID#"> 
					<input type="hidden" name="FirstLetter" value="#Left(Getvendor.CompanyName,1)#"> 
					
					 <table border="0" cellpadding="0" cellspacing="0" width="450">
	                   <tr>
						  <td colspan="2">
						    <table border="0" cellpadding="3" cellspacing="1" width="50%" bgcolor="##cc0000" align="center">
			                    <tr bgcolor="##eeeeee">
			                       <td>
								     <table border="0" cellpadding="6" cellspacing="0" width="100%">
			                            <tr>
			                               <td><input type="submit" name="remove" value="REMOVE VENDOR COMPLETELY" style="color:##cc0033;"></td>
			                            </tr>
			                         </table>           
								   </td>
			                    </tr>
			                 </table> 
						  </td>
						</tr>
	                 </table>   
				 </cfform>                  
		 </td>     
     </tr>
</table>  
</cfoutput>
<cfmodule template="#Application.footer#">