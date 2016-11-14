<cfparam name="URL.ReportType" default="HTML">
<cfset GetAllOrderInfo = request.CoopComponent.GetallOrders(url.memID)>
<cfset AgencyInfo = request.CoopAdminComponent.GetAgencyInfo(url.memID)>
<cfif IsDefined("url.OrderID")>
 <cfset getRegistrationInfo = request.CoopAdminComponent.getAgencyRegistrationInfo(url.OrderID)>
</cfif>


<cfsavecontent variable="ReportContent">		      
			  <cfoutput>
				<table border="0" cellpadding="5" cellspacing="0" width="100%">
			       <tr>
			         <td><h3>Agency Maintenance: <cfif IsDefined("URL.OrderID")>#getRegistrationInfo.CoopYear# Coop Order<cfelse>Agency Order History</cfif></h3></td>
			         <cfif URL.ReportType EQ "HTML">
						 <cfif IsDefined("URL.OrderID")>
							 <td align="right">
							    <table border="0" cellpadding="2" cellspacing="0">
							     <tr>
			                       <td align="right"><a href="OrderByAgency.cfm?ORDERID=#URL.OrderID#&MEMID=#URL.MEMID#&reportType=PDF&r=#RandRange(1,10000)#" target="_blank"><img src="/images/pdficon.gif" width="22" height="24" alt="" border="0" align="absmiddle">  Print as PDF</a></td>
			                     </tr>
								</table> 
							 </td>
						 </cfif>
					 </cfif>
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
								   <cfoutput query="GetAllOrderInfo">
								   <tr bgcolor="##ffffff">
	                                  <td><a href="OrderByAgency.cfm?OrderID=#GetAllOrderInfo.OrderID#&MemID=#GetAllOrderInfo.MemberID#">#GetAllOrderInfo.CoopYear#</a></td>
									  <td>#GetAllOrderInfo.TotalItems#</td>
									  <td>#DollarFormat(GetAllOrderInfo.TotalCost)#</td>
	                               </tr>
								   </cfoutput>
	                            </table>
							<cfelse>
							   
							   <cfif URL.ReportType EQ "HTML"><div align="right"><a href="index.cfm"><< Back to Reports Home</a></div></cfif>
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
														 <td><strong>Current Cost</strong></td>
														 <td><strong>Order Quantity</strong></td>
									                   </tr>
													   <cfoutput> 
													     <cfset CategoryTotal = CategoryTotal + (numberformat(MyOrderItems.CurrentCost, 0.00) * Quantity)>
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
												  <td align="center"><strong style="padding-top:5px; padding-bottom:5px;color:#cc0000;">There was a problem retrieving your order.</strong></td>
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
		   </cfsavecontent>

<cfif URL.ReportType EQ "HTML">
	<cfmodule template="#Application.header#" section="0" sectiontitle="Cooperative Purchase Reports">
		 <table border="0" cellpadding="3" cellspacing="0" width="100%">
		    <tr>
			   <cfif Not IsDefined("url.orderID")>
	           <td valign="top" width="160"><br>
			    <cfmodule template="#Application.tagdir#/adminnav.cfm" level="5">
			   </td>
			   </cfif>
			   <td valign="top"><br>
			   <cfoutput>#ReportContent#</cfoutput>
			   </td>
			</tr>
		</table>
	   	
	<cfmodule template="#Application.footer#">
<cfelse>
   <cfdocument  format="PDF" pagetype="letter" orientation="landscape" unit="in" encryption="none" fontembed="Yes" backgroundvisible="NO"><cfoutput>#ReportContent#</cfoutput></cfdocument>
   	
</cfif>