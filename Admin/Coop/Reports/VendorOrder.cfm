
<cfparam name="url.e" default="0">
<cfset AgencyInfo = request.CoopAdminComponent.GetAgencyInfo(url.memID)>
<cfif IsDefined("url.OrderID")>
 <cfset getRegistrationInfo = request.CoopAdminComponent.getAgencyRegistrationInfo(url.OrderID)>
</cfif>
<!--- Get My Current order items --->
<cfset MyOrderItems = request.CoopComponent.getAllOrderItemsByVendor(URL.OrderID)>

<cfmodule template="#Application.header#" section="0" sectiontitle="Cooperative Purchase Program">
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
          <!---  <td valign="top" width="150"><br>
	         <cfmodule template="#Application.tagdir#/MemberonlyNav.cfm" level=1>
		   </td> --->
		   <td valign="top"><br>
		      <cfoutput>
				<table border="0" cellpadding="5" cellspacing="0" width="100%">
			       <tr>
			         <td><h3>Agency Maintenance: <cfif IsDefined("URL.OrderID")>#getRegistrationInfo.CoopYear# Coop Order<cfelse>Agency Order History</cfif></h3></td>
                     <td align="right"><div ><br><a href="PrintVendorOrder.cfm?OrderID=#URL.OrderID#&memid=#URL.MemID#" target="Blank"><img src="/images/pdficon.gif" width="22" height="24" alt="" border="0" align="absmiddle"> Download as PDF</a></div></td>
				   </tr>
			    </table>
				
			        <table border="0" cellpadding="0" cellspacing="1" width="100%" bgcolor="##000000">
	                   <tr>
	                     <td bgcolor="##ffffff">
						    <table border="0" cellpadding="4" cellspacing="1" width="100%" bgcolor="##ffffff">
							  <tr bgcolor="##003366">
							     <td><strong style="color:##ffffff;">Agency Information</strong></td>
								 <cfif ISDefined("url.orderID")>
								  <td><strong style="color:##ffffff;">Registration Information</strong></td>
								 </cfif>
							  </tr>
							  <tr>
							     <td><strong>#AgencyInfo.Company#</strong><br>
								     Contact: #AgencyInfo.FirstName# #AgencyInfo.LastName#<br>
									 #AgencyInfo.Address1#<br>
									 <cfif Len(trim(AgencyInfo.Address2)) GT 0>#AgencyInfo.Address2#<br></cfif>
									 #AgencyInfo.City#, #AgencyInfo.State# #AgencyInfo.Zipcode#<br>
									 Phone: #AgencyInfo.MainPhone#<br>
									 Fax: #AgencyInfo.Fax#<br>
									 Email: <a href="mailto:#AgencyInfo.Email#">#AgencyInfo.Email#</a>
								 </td>
								 <cfif ISDefined("url.orderID")>
								   
								   <td valign="top"><strong>Registered on:</strong> #DateFormat(getRegistrationInfo.RegistrationDate, 'mm/dd/yyyy')# at #TimeFormat(getRegistrationInfo.RegistrationDate,'hh:mm tt')#<br>
								    <strong>EAV:</strong> #getRegistrationInfo.AgencyEAV#<br>
									
									<br>
									<strong>Secondary Contact:</strong><br>
									#getRegistrationInfo.SecFirstname# #getRegistrationInfo.SecLastname#<br>
									#getRegistrationInfo.SecEmail#<br>
									Phone: #getRegistrationInfo.SecPhone#<br>
									Fax: #getRegistrationInfo.SecFax#<br>
									<cfif getRegistrationInfo.LastEntered NEQ "">
									<strong>Last Login:</strong> #DateFormat(getRegistrationInfo.LastEntered, 'MM/DD/YYYY')#<br>
									</cfif>
								   </td>
								 </cfif>
							  </tr>
							</table>
						 </td>
	                   </tr>
	                </table>  <br><br> 
				</cfoutput>   
				<table border="0" cellpadding="4" cellspacing="0" width="100%">
					<tr>
					   <td>
							<table border="0" cellpadding="4" cellspacing="0" width="100%">
								<tr>
									<td>
									   <table border="0" cellpadding="3" cellspacing="1" width="100%" bgcolor="#f7f7f7">
									     <cfif MyOrderItems.recordcount GT 0>
										       <cfset ordertotal = 0>
											    
							                  <cfoutput query="MyOrderItems" group="CompanyName"> 
											    <cfset CompanyTotal = 0>
				                                <cfset CompanyItems = 0>    
												   <tr bgcolor="##ffffff">
												     <td colspan="8">
													    <table border="0" cellpadding="4" cellspacing="0" width="100%"> 
                                                           <tr>
														     <td><strong>VENDOR</strong></td>
															 <td><strong>PHONE</strong></td>
															 <td><strong>FAX</strong></td>
														   </tr>
														   <tr>
														     <td>#MyOrderItems.VendorID# - #MyOrderItems.CompanyName#<br>
															     #MyOrderItems.Address#<br>
																 <cfif Len(Trim(MyOrderItems.Address2)) GT 0>
																 #MyOrderItems.Address2#<br>
																 </cfif>
																 #MyOrderItems.City#, #MyOrderItems.State# #MyOrderItems.Zip#<br>
																 <cfif Len(Trim(MyOrderItems.Email)) GT 0>EMAIL - #MyOrderItems.Email#<br></cfif>
																 <cfif Len(Trim(MyOrderItems.Website)) GT 0>WebSite - #MyOrderItems.Website#</cfif>
															 </td>
															 <td><cfif Len(trim(MyOrderItems.Firstname)) GT 0>#MyOrderItems.Firstname# #MyOrderItems.Lastname#<br></cfif>#MyOrderItems.Phone# <cfif Len(Trim(MyOrderItems.Extension)) GT 0>X-#MyOrderItems.Extension#</cfif></td>
															 <td>#MyOrderItems.Fax#</td>
														   </tr>
														</table>
													 </td>
												   </tr>
												   <tr bgcolor="##f7f7f7">
								                     <td><strong>Item ID</strong></td>
													 <td><strong>Product Name</strong></td>
													 <td><strong>Brand</strong></td>
													 <td><strong>Unit of Measure</strong></td>
													 <td align="center"><strong>Previous Cost</strong></td>
													 <td align="center"><strong>Current Cost</strong></td>
													 <td align="center"><strong>Order Quantity</strong></td>
													 <td align="center"><strong>Item Total</strong></td>
								                   </tr>
												   <tr bgcolor="##ffffff">
												     <td colspan="8"><hr noshade size="1"></td>
												   </tr>
												   <cfoutput> 
												     <cfset CompanyTotal = CompanyTotal + (MyOrderItems.Cost * Quantity)>
													 <cfset CompanyItems = CompanyItems + 1>
													 <cfset ItemTotal = (MyOrderItems.Cost * MyOrderItems.Quantity)>
													 
												     <tr bgcolor="##ffffff">
								                     <td valign="top">#MyOrderItems.ItemCode#</td>
													 <td valign="top"><strong>#MyOrderItems.ItemName#</strong><br>#MyOrderItems.ItemDesc#</td>
													 <td valign="top">#MyOrderItems.VendorProdName#</td>
													 <td valign="top">#MyOrderItems.UnitofMeasure#</td>
													 <td align="right"  valign="top">#DollarFormat(MyOrderItems.PreviousCost)#</td>
													 <td align="right" valign="top">#DollarFormat(MyOrderItems.Cost)#</td>
													 <td align="center" valign="top">#MyOrderItems.Quantity#</td>
													 <td align="right" valign="top">#Dollarformat(ItemTotal)#</td>
								                   </tr> 
												   </cfoutput>
												   <cfset OrderTotal = (OrderTotal + CompanyTotal)>
												 <tr bgcolor="##eeeeee">
												     <td colspan="8" align="right"><strong>Vendor Amount:</strong> #DollarFormat(CompanyTotal)#</td>
												   </tr>
												 <tr bgcolor="##ffffff">
												   <td colspan="8"><hr noshade size="3"></td>
												 </tr>
											  </cfoutput>
											    	
											  <cfoutput>
												<tr bgcolor="##c6c6c6">
												   <td colspan="8" align="right" style="font-size:14px; font-family:arial, tahoma, verdana;"><strong>Order Total:</strong> #DollarFormat(OrderTotal)#</td>
												</tr>
										   </cfoutput>
										  <cfelse>
										    <tr bgcolor="#eeeeee">
											  <td align="center"><strong style="padding-top:5px; padding-bottom:5px;color:#cc0000;">You do not currently have any products in your order.<br><br>Click "Add New Items" above to Add items to your order</strong></td>
											</tr>
										  </cfif>
						               </table>
									</td>
								</tr>
							    
							</table>
						</td>
					</tr>
				</table>   
		   </td>
		</tr>
	</table>
	   	<br><br>
<cfmodule template="#Application.footer#">
