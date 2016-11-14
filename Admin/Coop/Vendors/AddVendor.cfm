<cfparam name="URL.E" default="0">
<cfset ProductTypes = request.CoopComponent.GetItemGroups()>
<cfset getStates = request.PaymentComponent.GetState()>
<cfset getCosts = request.CoopAdminComponent.getVendorCosts()>
<cfset getpayType = request.PaymentComponent.GetPayType()>

<cfmodule template="#Application.header#" section="0" sectiontitle="Coop Maintenance: Add Vendor">
  <cfoutput>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="160"><br>
		    <cfmodule template="#Application.tagdir#/adminnav.cfm" level="5">
		   </td>
		   <td valign="top"><br>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>Cooperative Purchase Program: Add New Vendor</h3></td>
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
			  <cfelseif url.E EQ 10>
			   <p class="Errortext"><strong>Error! The Payment Date is not in the correct format (MM/DD/YYYY)</strong></p>  
			  </cfif>
			  
			  <cfform name="coopvendorsignup" action="vendor_action.cfm?action=Add" method="POST">
				  <table border="0" cellpadding="6" cellspacing="0">
			        <tr bgcolor="##003366">
					  <td colspan="2"><strong style="font-family:Arial, verdana, tahoma; font-size:12px; color:##ffffff;">Contact Information</strong></td>
					</tr>
				    <tr>
			           <td class="regtext"><strong>Company Name:</strong></td>
					   <td><cfinput type="text" name="VendorName" size="40" maxlength="200" required="YES" message="You must include your Company Name"> <strong style="color:##CC0000; font-size:10px;">*</strong></td>
			        </tr>
					<tr>
					  <td class="RegText"><strong>Contact Prefix:</strong></td>
					   <td><select name="VendorPrefix">
					         <option value=""></option>
					         <option value="Mr">Mr</option>
							 <option value="Mrs">Mrs</option>
							 <option value="Ms">Ms</option>
							 <option value="Dr">Dr</option>
						   </select>
					   </td>
					</tr>
					<tr>
			           <td class="RegText"><strong>Contact Firstname:</strong></td>
					   <td><cfinput type="text" name="VendorFirstname" size="30" maxlength="100" required="YES" message="You must include a contact for your company"> <strong style="color:##CC0000; font-size:10px;">*</strong></td>
			        </tr>
					<tr>
			           <td class="RegText"><strong>Contact Middle Initial:</strong></td>
					   <td><cfinput type="text" name="VendorMI" size="4" maxlength="5"></td>
			        </tr>
					<tr>
			           <td class="RegText"><strong>Contact Lastname:</strong></td>
					   <td><cfinput type="text" name="VendorLastname" size="30" maxlength="100" required="YES" message="You must include a contact for your company"> <strong style="color:##CC0000; font-size:10px;">*</strong></td>
			        </tr>
					<tr>
			           <td class="RegText"><strong>Title/Position:</strong></td>
					   <td><cfinput type="text" name="Vendortitle" size="30" maxlength="50"></td>
			        </tr>
					<tr>
			           <td class="RegText"><strong>Email Address:</strong></td>
					   <td><cfinput type="text" name="Email" size="30" maxlength="80" required="YES" message="You must include a email address for your Contact"> <strong style="color:##CC0000; font-size:10px;">*</strong></td>
			        </tr>
					<tr bgcolor="##003366">
					  <td colspan="2"><strong style="font-family:Arial, verdana, tahoma; font-size:12px; color:##ffffff;">Address Information</strong></td>
					</tr>
					<tr>
			           <td class="RegText"><strong>Company Address:</strong></td>
					   <td><cfinput type="text" name="Addr" size="35" maxlength="75" required="YES" message="You must include a address for your Company"> <strong style="color:##CC0000; font-size:10px;">*</strong></td>
			        </tr>
					<tr>
			           <td class="RegText"><strong>Mailstop/Suite:</strong></td>
					   <td><cfinput type="text" name="Addr2" size="35" maxlength="75"></td>
			        </tr>
					
					<tr>
			           <td class="RegText"><strong>City:</strong></td>
					   <td><cfinput type="text" name="City" size="25" maxlength="50" required="YES" message="You must include a city for your Company"> <strong style="color:##CC0000; font-size:10px;">*</strong></td>
			        </tr>
					<tr>
			           <td class="RegText"><strong>State:</strong></td>
					   <td><select name="State">
					        <option value="">-- Choose One --</option>
					        <cfloop query="getStates">
					         <option value="#getStates.CodeValue#">#getStates.CodeDesc#</option>
							</cfloop>
						   </select> <strong style="color:##CC0000; font-size:10px;">*</strong></td>
			        </tr>
					<tr>
			           <td class="RegText"><strong>Zip Code:</strong></td>
					   <td><cfinput type="text" name="Zipcode" size="9" maxlength="11" required="YES" message="You must include a zipcode for your Company"> <strong style="color:##CC0000; font-size:10px;">*</strong></td>
			        </tr>
					<tr>
			           <td class="RegText"><strong>Company Phone:</strong></td>
					   <td><cfinput type="text" name="Phone" size="12" maxlength="12" required="YES" message="You must include a phone number for your Company"> <strong style="color:##CC0000; font-size:10px;">*</strong> Extension: <cfinput type="text" name="PhoneExt" size="5" maxlength="6"></td>
			        </tr>
					<tr>
			           <td class="RegText"><strong>Fax:</strong></td>
					   <td><input type="text" name="Fax" size="12" maxlength="12"></td>
			        </tr>
					<tr>
			           <td class="RegText"><strong>Website:</strong></td>
					   <td><input type="text" name="Website" size="40" maxlength="75"></td>
			        </tr>
					<tr>
			           <td class="RegText"><strong>Product Interest:</strong></td>
					   <td><select name="ProductInterest">
					        <option value="">--Select One --</option>
							<cfloop query="ProductTypes">
					        <option value="#ProductTypes.CodeValue#">#ProductTypes.CodeDesc# Products</option>
							</cfloop>
							<option value="B">Both Products</option>
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
					  <td><input type="text" name="SpecSent" value="" size="12" maxlength="12"></td>
					</tr>
					<tr>
					  <td><strong>Bond Received:</strong></td>
					  <td><input type="checkbox" name="BondRcvd" value="1"></td>
					</tr>
					<tr>
					  <td><strong>Contract Received:</strong></td>
					  <td><input type="checkbox" name="ContractRcvd" value="1"></td>
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
					  <td colspan="2"><textarea name="VendorNotes" rows="8" cols="45"></textarea></td>
					</tr>
					<tr>
					  <td colspan="2" align="center"><input type="submit" name="submit" value="Add Vendor"></td>
					</tr>
					
			       </table>
				 </cfform>  
		 </td>
     </tr>
</table>  
</cfoutput>
<cfmodule template="#Application.footer#">