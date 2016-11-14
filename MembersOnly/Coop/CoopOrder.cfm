<cfif Not IsDefined("Session.CoopConfig")>
  <cflocation url="../index.cfm" addtoken="NO">
</cfif>

<cfif Not IsDefined("Session.MyCoopReg")>
  <cflocation url="register.cfm" addtoken="NO">
<cfelse>
   <cfif Session.MyCoopReg.recordcount EQ 0>
      <cflocation url="register.cfm" addtoken="NO">
   </cfif>  
</cfif>
<!--- If they press the Order COmplete button set the order Complete flag 
<cfif IsDefined("form.accept")>
   <cfset CompletedOrder = request.CoopComponent.CompleteOrder(Session.OrderID)>
</cfif>
--->

<cfparam name="url.e" default="0">
<!--- Look up my order ID If this is the first time I am here create one for me, 
      else save my orderID in a session variable --->
  <cfset getorderID = request.CoopComponent.getOrderID(Session.MyCoopReg.RegistrationID, Session.CoopConfig.ConfigID)>
  
  <cfif getOrderID.recordcount EQ 0>
    <cfset createOrderID = request.CoopComponent.CreateOrderID(Session.MyCoopReg.RegistrationID, Session.CoopConfig.ConfigID)>
	<cfset Session.OrderID = createOrderID>
  <cfelse>
    <cfset Session.OrderID = getorderID.orderID>  	 
  </cfif>	  
<!--- Get My Current order information  --->
<cfset MyOrderInfo = request.CoopComponent.getCurrentorderInfo(Session.OrderID)>

<!--- Get My Current order items --->
<cfset MyOrderItems = request.CoopComponent.getAllOrderItems(Session.OrderID)>


<cfset DaysLeftToOrder = DateDiff('d', Now(), Session.CoopConfig.OrderEnd)>

<cfset CoopEndDate = Session.CoopConfig.CoopEndDate>

<cfif DaysleftToOrder GTE 0>
  <cfset AllowMaintenance = true>
  
  <cfif MyOrderInfo.orderComplete NEQ "">
    <cfset AllowMaintenance = false>
  </cfif>
<cfelse>
  <cfset AllowMaintenance = false>
</cfif>

<cfmodule template="#Application.header#" section="0" sectiontitle="Cooperative Purchase Program">

		<script LANGUAGE="JavaScript">
		<!--
	
		function confirmSubmit() 
		{
		var agree=confirm("Are you sure you wish to complete your order?");
		if (agree)
			return true ;
		else
			return false ;
		}
		// -->
		</script>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
          <!---  <td valign="top" width="150"><br>
	         <cfmodule template="#Application.tagdir#/MemberonlyNav.cfm" level=1>
		   </td> --->
		   <td valign="top"><br>
				<cfoutput>
				  <table border="0" cellpadding="5" cellspacing="0" width="100%">
			        <tr>
			          <td><h3>IPRA Cooperative Purchase Program</h3></td>
					  <td><div align="right"><br><img src="/images/pdficon.gif" width="22" height="24" alt="" border="0" align="absmiddle"> <a href="PrintOrder.cfm?OrderID=#Session.OrderID#" target="Blank">Download Your Order as PDF</a></div><br>
<div align="right"><img src="/images/pdficon.gif" width="22" height="24" alt="" border="0" align="absmiddle"> <a href="/forms/cooptimetable0506.pdf" target="Blank">Download COOP Timeline</a></div>
</td>
			        </tr>
				  </table>  
				</cfoutput> 
				<table border="0" cellpadding="5" cellspacing="0" width="100%">
				   <cfoutput>
				   <cfif DaysLeftToOrder GTE 0>
				    <tr>
                       <td align="center" style="font-size:14px;font-family:arial, tahoma, verdana;"><strong style="color:<cfif DaysLeftToOrder LT 5>##ff0000<cfelse>##009900</cfif>">#DaysLeftToOrder#</strong> Days left to complete orders.</td>
                    </tr>
				   <cfelse>
				     <tr>
                        <td align="center" style="font-size:14px;font-family:arial, tahoma, verdana;"><strong style="color:##ff0000;">The ordering period is now over.</strong></td>
                     </tr>	
				   </cfif> 	 
					<!--- <cfif AllowMaintenance>
					<tr>
					  <td align="center"><form name="lockorder" action="index.cfm" Method="POST" >
									      <input type="hidden" name="accept" value="1">
										  <input type="submit" name="submit" value="My Order Is Complete" align="right" onClick="return confirmSubmit()">
									    </form>
					  </td>
					</tr>
					<cfelse>
					  <cfif MyOrderInfo.orderComplete NEQ "">
					    <tr>
						  <td align="center"><strong>Order Completed #DateFormat(MyOrderInfo.orderComplete, 'MM/DD/YYYY')# at #TimeFormat(MyOrderInfo.orderComplete, 'hh:mm tt')#</strong></td>
						</tr>
					  </cfif>
					</cfif> --->
					</cfoutput>
			    </table><br>
				<table border="0" cellpadding="0" cellspacing="0" width="100%">
				   <tr>
				     <td>Welcome to the IPRA Cooperative Purchase Program ordering system. This interactive system will allow you to maintain your coop order utilizing the form below. Click the Add New Items link to add items to your order. Items are automatically saved to your order. <strong>Once you have completed placing your orders, please click on the "Logout" link located on the upper right-hand of your browser.</strong>
<p><strong>NOTE</strong>: Please remember to save your work as you go! There is a 20 minute security time-out.</p> </td>
				   </tr>		   
				</table><br>     
				<cfif url.e EQ 1>
				  <p class="ErrorText" style="font-size:14px;"><strong>Error! The Item you attempted to Delete did not have an associated ID.</strong></p>
				<cfelseif url.e EQ 2>
				  <p class="ErrorText"  style="font-size:14px;"><strong>Error! There was a problem while attempting to delete your item. Please contact the IPRA</strong></p>
				<cfelseif url.e EQ 3>
				  <p class="ErrorText"  style="font-size:14px;"><strong>Error! There was a problem while attempting to update this category. Please contact the IPRA</strong></p>  
				</cfif>   
				<table border="0" cellpadding="4" cellspacing="0" width="100%">
					<tr>
						<td>
							<cfmodule template="HeaderTabs.cfm" CoopEndDate="#CoopEndDate#" AllowMaintenance="#AllowMaintenance#" Page="1">
							<table border="0" cellpadding="4" cellspacing="0" width="100%">
								<tr>
									<td>
									   <table border="0" cellpadding="3" cellspacing="1" width="100%" bgcolor="#f7f7f7">
									     <cfif MyOrderItems.recordcount GT 0>
										       <cfset ordertotal = 0>
											   
							                  <cfoutput query="MyOrderItems" group="GroupID"> 
											    <cfset Grouptotal = 0>
												<tr>
												  <td colspan="7" bgcolor="##9dabc4"><strong style="font-family:arial; font-size:16px;padding-left:5px;padding-top:5px;padding-bottom:5px;">#MyOrderItems.GroupName#</strong></td>
												</tr>
												 <cfset CategoryTotal = 0>
												 <cfoutput group="CatID">
												   <tr>
												     <td colspan="7" bgcolor="##006699"><strong style="font-family:arial; font-size:14px; color: ##ffffff; padding-left:20px;padding-top:5px;padding-bottom:5px;">#MyOrderItems.CategoryName#</strong> <cfif AllowMaintenance><a href="EditOrder.cfm?CatID=#MyOrderItems.CatID#&GroupID=#MyOrderItems.GroupID#" style="color:##ffffff;">[Edit]</a></cfif></td>
												   </tr>
												   
												   <tr bgcolor="##f7f7f7">
												     <td></td>
								                     <td><strong>Item ID</strong></td>
													 <td><strong>Product Name</strong></td>
													 <td><strong>Unit of Measure</strong></td>
													 <td align="center"><strong>Previous Cost</strong></td>
													 <td align="center"><strong>Current Cost</strong></td>
													 <td align="center"><strong>Order Quantity</strong></td>
								                   </tr>
												   <cfoutput> 
												     <cfset CategoryTotal = CategoryTotal + (NumberFormat(MyOrderItems.CurrentCost, 9.99) * Quantity)>
												     <tr bgcolor="##ffffff">
													 
												     <td><cfif AllowMaintenance><a href="Order_action.cfm?action=Remove&ID=#MyOrderItems.orderItemID#" style="color:##cc0000;" title="Remove item from order"><img src="/images/btn_remove.gif" border="0" alt="Remove item from order"></a></cfif></td>
								                     <td>#MyOrderItems.ItemCode#</td>
													 <td><strong>#MyOrderItems.ItemName#</strong><br>#MyOrderItems.ItemDesc#</td>
													 <td>#MyOrderItems.UnitofMeasure#</td>
													 <td align="right">#DollarFormat(MyOrderItems.PreviousCost)#</td>
													 <td align="right">#DollarFormat(MyOrderItems.CurrentCost)#</td>
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
												     <td colspan="7" align="right"><strong>Group Total:</strong> #DollarFormat(Grouptotal)#</td>
												   </tr>
												 <tr bgcolor="##ffffff">
												   <td colspan="7">&nbsp;</td>
												 </tr>
											  </cfoutput>
											    	
											  <cfoutput>
												<tr bgcolor="##c6c6c6">
												   <td colspan="7" align="right" style="font-size:14px; font-family:arial, tahoma, verdana;"><strong>Order Total:</strong> #DollarFormat(OrderTotal)#</td>
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
