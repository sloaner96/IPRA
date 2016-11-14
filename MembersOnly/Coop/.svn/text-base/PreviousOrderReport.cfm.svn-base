<cfset GetAllOrderInfo = request.CoopComponent.GetallOrders(Session.UserInfo.MemberID)>

<cfmodule template="#Application.header#" section="0" sectiontitle="Cooperative Purchase Program">

	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
          <td valign="top" width="150"><br>
	         <cfmodule template="#Application.tagdir#/MemberonlyNav.cfm" level=1>
		   </td>
		   <td valign="top"><br>
				<table border="0" cellpadding="5" cellspacing="0">
			       <tr>
			         <td><h3>IPRA Cooperative Purchase Program: Order History</h3></td>
			       </tr>
			    </table>
				<table border="0" cellpadding="0" cellspacing="0" width="100%">
				   <tr>
				     <td>Use the form below to view previous orders you have made through the cooperative purchase program.</td>
				   </tr>		   
				</table><br>

				
				<table border="0" cellpadding="4" cellspacing="0" width="100%">
					<tr>
						<td>
						   <cfif IsDefined("Session.MyCoopReg")>
						  	<table border="0" cellpadding="4" cellspacing="2" width="100%" bgcolor="#eeeeee">
							  <tr bgcolor="#003366">
							  
								<td><strong style="color:#ffffff;"><a href="CoopOrder.cfm" style="color:#ffffff;">View Current Order</a></strong></td>
								
								<td bgcolor="#ffffff"><strong style="color:##003366;">View Previous Orders</strong></td>
							  </tr>
			                </table><br>
							</cfif>
							<cfif Not IsDefined("Url.orderID")>
								<table border="0" cellpadding="4" cellspacing="1" width="100%" bgcolor="#666660">
	                               <tr>
									 <td colspan="3" bgcolor="#9dabc4"><strong style="font-family:arial; font-size:16px;padding-left:5px;padding-top:5px;padding-bottom:5px;"></strong></td>
								   </tr>
								   <tr bgcolor="#f7f7f7">
	                                  <td><strong>Cooperative Purchase Year</strong></td>
									  <td><strong>Total Items</strong></td>
									  <td><strong>Total Purchased</strong></td>
	                               </tr>
								   <cfif ISDefined("Session.OrderID")>
								      <cfset Currentorder = Session.OrderID>
								   <cfelse>	   
								      <cfset Currentorder = 0>
								   </cfif>
								   
								   <cfoutput query="GetAllOrderInfo">
								     <cfif GetAllOrderInfo.OrderID NEQ Currentorder>
									   <tr bgcolor="##ffffff">
		                                  <td><a href="PreviousOrderReport.cfm?OrderID=#GetAllOrderInfo.OrderID#">#GetAllOrderInfo.CoopYear#</a></td>
										  <td>#GetAllOrderInfo.TotalItems#</td>
										  <td>#DollarFormat(GetAllOrderInfo.TotalCost)#</td>
		                               </tr>
								     </cfif>
								   </cfoutput>
	                            </table>
							<cfelse>
							   <cfset GetCoopPeriodInfo = request.CoopComponent.getCurrentOrderInfo(URL.OrderID)>
							   <cfoutput>
							   <div align="right"><a href="CoopOrder.cfm"><< Back to Reports Home</a></div>
							   <br>
							   <table border="0" cellpadding="4" cellspacing="0" width="100%">
                                  <tr>
                                    <td><strong style="font-size:14px; font-family: Arial; color:##cc6600;">#GetCoopPeriodInfo.CoopYear# Cooperative Purchase Order</strong></td>
									<td align="right"><a href="PrintOrder.cfm?OrderID=#URL.OrderID#" target="Blank"><img src="/images/pdficon.gif" width="22" height="24" alt="" border="0" align="absmiddle"> Download as PDF</a></td>
                                  </tr>
                               </table>
							   </cfoutput>
							   <cfset MyOrderItems = request.CoopComponent.getAllOrderItems(URL.OrderID)>
								<table border="0" cellpadding="4" cellspacing="0" width="100%">
									<tr>
										<td>
										   <table border="0" cellpadding="3" cellspacing="1" width="100%" bgcolor="#f7f7f7">
										     <cfif MyOrderItems.recordcount GT 0>
											       <cfset ordertotal = 0>
												   
								                  <cfoutput query="MyOrderItems" group="GroupID"> 
												    <cfset Grouptotal = 0>
													<tr>
													  <td colspan="6" bgcolor="##9dabc4"><strong style="font-family:arial; font-size:16px;padding-left:5px;padding-top:5px;padding-bottom:5px;">#MyOrderItems.GroupName#</strong></td>
													</tr>
													 <cfset CategoryTotal = 0>
													 <cfoutput group="CatID">
													   <tr>
													     <td colspan="6" bgcolor="##006699"><strong style="font-family:arial; font-size:14px; color: ##ffffff; padding-left:20px;padding-top:5px;padding-bottom:5px;">#MyOrderItems.CategoryName#</strong></td>
													   </tr>
													   
													   <tr bgcolor="##f7f7f7">
									                     <td><strong>Item ID</strong></td>
														 <td><strong>Product Name</strong></td>
														 <td><strong>Unit of Measure</strong></td>
														 <td><strong>Cost</strong></td>
														 <td><strong>Order Quantity</strong></td>
									                   </tr>
													   <cfoutput> 
													     <cfset CategoryTotal = CategoryTotal + (MyOrderItems.CurrentCost * Quantity)>
													     <tr bgcolor="##ffffff">
									                     <td>#MyOrderItems.ItemCode#</td>
														 <td><strong>#MyOrderItems.ItemName#</strong><br>#MyOrderItems.ItemDesc#</td>
														 <td>#MyOrderItems.UnitofMeasure#</td>
														 <td>#DollarFormat(MyOrderItems.CurrentCost)#</td>
														 <td align="center">#MyOrderItems.Quantity#</td>
									                   </tr> 
													   </cfoutput>
													   <tr bgcolor="##f7f7f7">
													     <td colspan="6" align="right"><strong>Category Total:</strong> #DollarFormat(CategoryTotal)#</td>
													   </tr>
													   <cfset OrderTotal = (OrderTotal + CategoryTotal)>
													   <cfset Grouptotal = (GroupTotal + CategoryTotal)>
												     </cfoutput>	
													 <tr bgcolor="##eeeeee">
													     <td colspan="6" align="right"><strong>Group Total:</strong> #DollarFormat(Grouptotal)#</td>
													   </tr>
													 <tr bgcolor="##ffffff">
													   <td colspan="6">&nbsp;</td>
													 </tr>
												  </cfoutput>
												    	
												  <cfoutput>
													<tr bgcolor="##c6c6c6">
													   <td colspan="6" align="right" style="font-size:14px; font-family:arial, tahoma, verdana;"><strong>Order Total:</strong> #DollarFormat(OrderTotal)#</td>
													</tr>
											   </cfoutput>
											  <cfelse>
											    <tr bgcolor="#eeeeee">
												  <td align="center"><strong style="padding-top:5px; padding-bottom:5px;color:#cc0000;">There was a problem retrieveing your order.</strong></td>
												</tr>
											  </cfif>
							               </table>
										</td>
									</tr>
								</table>	
							</cfif>
						</td>
					</tr>
				</table>   
		   </td>
		</tr>
	</table>
   	
<cfmodule template="#Application.footer#">