<cfif Not IsDefined("Session.CoopConfig")>
  <cflocation url="../index.cfm" addtoken="NO">
</cfif>

<cfif Not IsDefined("Session.MyCoopReg")>
  <cflocation url="register.cfm" addtoken="NO">
</cfif>


<cfparam name="url.e" default="0">
<!--- Get My Current order items --->
<cfset MyOrderItems = request.CoopComponent.getAllOrderItemsByVendor(Session.OrderID)>

<cfset DaysLeftToOrder = DateDiff('d', Now(), Session.CoopConfig.OrderEnd)>

<cfset CoopEndDate = Session.CoopConfig.CoopEndDate>
<!--- Get My Current order information  --->
<cfset MyOrderInfo = request.CoopComponent.getCurrentorderInfo(Session.OrderID)>

<cfif DaysleftToOrder GTE 0>
  <cfset AllowMaintenance = true>
  
  <cfif MyOrderInfo.orderComplete NEQ "">
    <cfset AllowMaintenance = false>
  </cfif>
<cfelse>
  <cfset AllowMaintenance = false>
</cfif>

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
			          <td><h3>IPRA Cooperative Purchase Program: Order By Vendor Report</h3></td>
					  <td><div align="right"><br><a href="PrintVendorOrder.cfm?OrderID=#Session.OrderID#" target="Blank"><img src="/images/pdficon.gif" width="22" height="24" alt="" border="0" align="absmiddle"> Download as PDF</a></div></td>
			        </tr>
				  </table>  
				</cfoutput> 
				<table border="0" cellpadding="0" cellspacing="0" width="100%">
				   <tr>
				     <td>Welcome to the IPRA Cooperative Purchase Program ordering system. This interactive system will allow you to maintain your coop order utilizing the form below. Click the Add New Items link to add items to your order. Items are automatically saved to your order.</td>
				   </tr>		   
				</table><br>     
				<table border="0" cellpadding="4" cellspacing="0" width="100%">
					<tr>
						<td>
						  
						  	<cfmodule template="HeaderTabs.cfm" CoopEndDate="#CoopEndDate#" AllowMaintenance="#AllowMaintenance#" Page="3">
							
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
																 <cfif Len(Trim(MyOrderItems.Email)) GT 0>EMAIL - #MyOrderItems.Email#</cfif>
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
								                     <td>#MyOrderItems.ItemCode#</td>
													 <td><strong>#MyOrderItems.ItemName#</strong><br>#MyOrderItems.ItemDesc#</td>
													 <td></td>
													 <td>#MyOrderItems.UnitofMeasure#</td>
													 <td align="right">#DollarFormat(MyOrderItems.PreviousCost)#</td>
													 <td align="right">#DollarFormat(MyOrderItems.Cost)#</td>
													 <td align="center">#MyOrderItems.Quantity#</td>
													 <td>#Dollarformat(ItemTotal)#</td>
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
