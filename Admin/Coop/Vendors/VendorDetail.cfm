<cfset GetVendor = request.CoopAdminComponent.GetVendorInfo(URL.VendorID)>
<cfset GetVendorPayment = request.CoopAdminComponent.GetVendorPayment(URL.VendorID)>
<cfmodule template="#Application.header#" section="0" sectiontitle="Coop Vendor Maintenance">
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
					 <cfif GetVendor.IsActive EQ 1>
					   <td><strong style="color:##ffffff;"><a href="VendorBids.cfm?vendorID=#URL.VendorID#" style="color:##ffffff;">Add Vendor Bids</a></strong></td>
					 <cfelse>
					  <td bgcolor="##d3d3d3"><strong>Add Vendor Bids</strong></td>
					 </cfif>
					 <td><strong style="color:##ffffff;"><a href="VendorHistory.cfm?vendorID=#URL.VendorID#" style="color:##ffffff;">Vendor History</a></strong></td>
					 
				</tr>
	          </table>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>Cooperative Purchase Program: Vendor Detail</h3></td>
		        </tr>
		      </table>
			  <a href="EditVendor.cfm?vendorID=#GetVendor.VendorID#">[EDIT VENDOR INFO]</a>
			  <table border="0" cellpadding="6" cellspacing="0" width="100%">
		        <tr>
		           <td class="RegText">
				      <table border="0" cellpadding="5" cellspacing="0">
                          <tr>
                            <td valign="top"><strong style="color:##006699;">Company:</strong></td>
							<td valign="top"><strong style="font-size:14px; font-family:arial;">#GetVendor.CompanyName#</strong><cfif GetVendor.IsActive EQ 0>&nbsp;&nbsp;&nbsp;- <strong style="color:##cc3300;">INACTIVE</strong></cfif><br>
							    #GetVendor.Address#<br>
								<cfif GetVendor.Address2 NEQ "">#GetVendor.Address2#<br></cfif>
								#GetVendor.City#, #GetVendor.State# #GetVendor.Zip#<br>
								<strong>Phone:</strong> #GetVendor.Phone# <cfif getVendor.Extension NEQ "">ext. #GetVendor.Extension#</cfif><br>
								<strong>Fax:</strong> #GetVendor.Fax#<br>
								<strong>Website:</strong> #GetVendor.Website#<br>
							</td>
                          </tr> 
						  <tr>
						    <td>&nbsp;</td>
						  </tr>
						  <tr>
                            <td valign="top"><strong style="color:##006699;">Contact:</strong></td>
							<td valign="top">
							    <cfif getVendor.Prefix NEQ "">#GetVendor.Prefix# </cfif>#GetVendor.Firstname#<cfif getVendor.MI NEQ ""> #GetVendor.MI#</cfif> #GetVendor.Lastname#<br>
								<cfif GetVendor.VenPosition NEQ "">#GetVendor.VenPosition#<br></cfif>
								<strong>Email:</strong> <a href="mailto:#GetVendor.Email#">#GetVendor.Email#</a>
							</td>
                          </tr> 
						  <tr>
						    <td>&nbsp;</td>
						  </tr>
						  <tr>
						    <td valign="top"><strong style="color:##006699;">Coop<br>Information:</strong></td>
						    <td valign="top">
							  <table border="0" cellpadding="3" cellspacing="0" width="100%">
                                <tr>
								  <td><strong>Vendor Since:</strong> <cfif Getvendor.VendorSince NEQ "">#Dateformat(Getvendor.VendorSince, 'MM/DD/YYYY')#<cfelse><font size="-2" color="##009900">NEW VENDOR</font></cfif></td>
								</tr>
								<tr>
                                    <td><strong>Product Group:</strong> <cfif Getvendor.ProductGroup EQ "R">Recreation<cfelseif Getvendor.ProductGroup EQ "M">Maintenance<cfelseif Getvendor.ProductGroup EQ "B">Recreation & Maintenance</cfif></td>
                                </tr>
								<tr>
                                    <td><strong>Specification Sent:</strong> #DateFormat(Getvendor.SpecSent, 'MM/DD/YYYY')#</td>
                                </tr>
								<tr>
								  <td><strong>Bond Received:</strong> <cfif getVendor.BondRcvd EQ 1>YES<cfelse><font color="##FF0000">NO</font></cfif> &nbsp;&nbsp;&nbsp;<strong>Contract Received:</strong> <cfif getVendor.ContractRcvd EQ 1>YES<cfelse><font color="##FF0000">NO</font></cfif></td>
								</tr>
                              </table>
							</td>
						  </tr>
						  <tr>
						    <td valign="top"><strong style="color:##006699;">Payment<br>History:</strong></td>
						    <td valign="top">
							  <table border="0" cellpadding="3" cellspacing="1" width="100%" bgcolor="##666666">
                                <tr bgcolor="##eeeeee">
								  <td><strong>Payment Date</strong></td>
								  <td><strong>Payment Amount</strong></td>
								  <td><strong>Paid Via</strong></td>
								</tr>
								<cfif GetVendorPayment.recordcount GT 0>
								<cfloop Query="GetVendorPayment">
			                    <tr bgcolor="##ffffff">
								  <td>#DateFormat(GetVendorPayment.PaymentDate, 'MM/DD/YYYY')#</td>
								  <td>#DollarFormat(GetVendorPayment.PaymentAmount)#</td>
								  <td><cfif GetVendorPayment.PaidVia EQ "P">PURCHASE ORDER<cfelseif GetVendorPayment.PaidVia EQ "C">CREDIT CARD<cfelseif GetVendorPayment.PaidVia EQ "K">CHECK</cfif></td>
								</tr>
								</cfloop>
								<tr bgcolor="##ffffff">
								  <td colspan="3" align="center"><a href="javascript:void(0);" onclick="window.open('addPayment.cfm?VendorID=#getvendor.VendorID#', 'popupwin', 'height=350, width=400, top=425, left=450, scrollbars=no, resizable=no');self.name='main';"><strong>Add New Payment</strong></a></td>
								</tr>
								<cfelse>
								 <tr bgcolor="##ffffff">
								   <td colspan="3" align="center">No Payment History<br><a href="javascript:void(0);" onclick="window.open('addPayment.cfm?VendorID=#getvendor.VendorID#', 'popupwin', 'height=350, width=400, top=425, left=450, scrollbars=no, resizable=no');self.name='main';"><strong>Add Payment</strong></a></td>
								 </tr>
								</cfif>
                              </table>
							</td>
						  </tr>
						  <tr>
						    <td colspan=2><hr noshade size="1"></td>
						  </tr>
						  <tr>
						    <td valign="top"><strong style="color:##006699;">Vendor Notes:</strong></td>
							<td valign="top"><cfif Getvendor.VendorNotes NEQ "">#ReplaceNoCase(Getvendor.VendorNotes, '#Chr(13)##Chr(10)#', '<br>', 'ALL')#<cfelse>N/A</cfif></td>
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