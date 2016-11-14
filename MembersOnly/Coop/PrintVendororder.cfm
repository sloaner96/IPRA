
<!--- Get My Current order items --->
<cfset MyOrderItems = request.CoopComponent.getAllOrderItemsByVendor(Session.OrderID)>

<cfsavecontent variable="VendorReportData">
<table width="100%" border="0" cellspacing="0" cellpadding="4" style="font-family: sans-serif; font-size:8pt;">
		 <tr>
   <td align="Center" colspan="7"><strong style="color:##009966; font-family: tahoma; font-size:12pt;">IPRA Cooperative Purchase Program Winning Bidders</strong></td>
 </tr>
		<tr>
			<td>
				<table border="0" cellpadding="3" cellspacing="1" width="100%" bgcolor="#f7f7f7" style="font-family: sans-serif; font-size:8pt;">
					<cfif MyOrderItems.recordcount GT 0>
					  <cfset ordertotal = 0>
					   <cfif MyOrderItems.AgencyName NEQ "">
						 <cfoutput>
						 <tr>
						   <td colspan="8" align="Center" bgcolor="##ffffff;"><h3 style="font-family:Tahoma;">Agency: #MyOrderItems.AgencyName#</h3></td>
						 </tr>
						 </cfoutput>
						</cfif>
						<cfoutput query="MyOrderItems" group="CompanyName"> 
						<cfset CompanyTotal = 0>
						    <cfset CompanyItems = 0>    
							<tr bgcolor="##ffffff">
								<td colspan="8">
									<table border="0" cellpadding="4" cellspacing="0" width="100%" style="font-family: sans-serif; font-size:8pt;"> 
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
									<td valign="top">#MyOrderItems.ItemCode#</td>
									<td><strong>#MyOrderItems.ItemName#</strong><br>#MyOrderItems.ItemDesc#</td>
									<td>#MyOrderItems.VendorProdName#</td>
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
							    <td colspan="8" align="right" style="font-size:10pt; font-family:arial, tahoma, verdana;"><strong>Order Total:</strong> #DollarFormat(OrderTotal)#</td>
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
</cfsavecontent>
<cfdocument  format="PDF" pagetype="letter" marginright="0.5" marginleft="0.5" orientation="landscape" unit="in" encryption="none" fontembed="yes" backgroundvisible="Yes"><cfoutput>#VendorReportData#</cfoutput></cfdocument>
