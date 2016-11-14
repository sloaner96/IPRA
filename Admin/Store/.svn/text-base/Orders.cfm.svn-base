<cfmodule template="#Application.header#" section="0" sectiontitle="Site Admin">
  <cfoutput>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="160"><br>
		    <cfmodule template="#Application.tagdir#/adminnav.cfm" level="4">
		   </td>
		   <td valign="top"><br>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>Order History</h3></td>
		        </tr>
		      </table>
			  <table border="0" cellpadding="6" cellspacing="0" width="100%">
		        <tr>
		           <td class="RegText">
				      <table border="0" cellpadding="0" cellspacing="0" width="100%">
                          <tr>
                            <td>Use the form Below to search for orders in the system.</td>
                          </tr> 
                      </table>
					  <cfquery name="GetProd" datasource="#Application.dsn#" cachedwithin="#CreateTimeSpan(0,0,10,0)#">
					    Select ProductID, ProductName 
						From Products 
						Where SellInStore = 1
						Order By ProductName
					  </cfquery>
					  <cfquery name="GetStatus" datasource="#Application.dsn#" cachedwithin="#CreateTimeSpan(0,0,10,0)#">
					    Select CodeValue, CodeDesc
						From Lookup
						Where CodeGroup = 'orderStat'
						Order By CodeValue, CodeDesc
					  </cfquery>
					  <cfform name="search" action="Orders.cfm" Method="POST" scriptsrc="/scripts/cfform.js">
						  <table border="0" cellpadding="0" cellspacing="1" bgcolor="eeeeee">
	                        <tr>
	                           <td>
								  <table border="0" cellpadding="4" cellspacing="0" width="100%" bgcolor="ffffff">
			                         <tr bgcolor="eeeeee">
			                            <td colspan=2><strong>Search</strong></td>
			                         </tr>
									 <tr>
									   <td>Product Type:</td>
									   <td><select name="ProdName">
									         <option value="">-- All --</option>
											 <cfloop query="GetProd">
											   <option value="#GetProd.ProductID#" <cfif IsDefined("Form.ProdName")><cfif form.Prodname EQ GetProd.ProductID>Selected</cfif></cfif>>#GetProd.ProductName#</option>
											 </cfloop>
										   </select>
									   </td>
									 </tr>
									 <tr>
									   <td>Status:</td>
									   <td><select name="Status">
									         <option value="">-- All --</option>
											 <cfloop query="GetStatus">
											   <option value="#GetStatus.Codevalue#" <cfif IsDefined("Form.Status")><cfif form.Status EQ GetStatus.CodeValue>Selected</cfif></cfif>>#GetStatus.CodeDesc#</option>
											 </cfloop>
										   </select>
									   </td>
									 </tr>
									 <cfset LastThirty = DateAdd('d', -30, now())>
									 <tr>
									   <td>Date Range:</td>
									   <td>BEGIN <input Type="text" name="BeginDate" <cfif IsDefined("form.BeginDate")>value="#DateFormat(form.beginDate, 'MM/DD/YYYY')#"<cfelse>value="#DateFormat(LastThirty, 'MM/DD/YYYY')#"</cfif> size="15" maxlength="15">&nbsp;&nbsp;END <input Type="text" name="EndDate" <cfif IsDefined("form.endDate")>value="#DateFormat(form.enddate, 'MM/DD/YYYY')#"<cfelse>value="#DateFormat(now(), 'MM/DD/YYYY')#"</cfif> size="15" maxlength="15"></td>
									 </tr>
									 <tr>
									   <td colspan=2><input type="submit" name="submit" value="Search >>"></td>
									 </tr>
			                      </table>
						        </td>
							  </tr>
							</table>
						</cfform>
					  <cfif Not IsDefined("form.submit")>
						  <br>
						  <cfquery name="Getorders" datasource="#Application.dsn#">
						    Select o.OrderID, o.ContactName, o.orderDate, o.OrderStatus, o.OrderTotal, o.memberid,P.ProductName
							From orders o, Products P
							Where o.ProductID = p.productID 
							AND o.OrderDate >= #DateAdd('d', -30, now())#
							Order By OrderDate, OrderStatus, P.ProductName
						  </cfquery>
						  <table border="0" cellpadding="3" cellspacing="0" width="100%">
	                         <tr bgcolor="##003366">
	                           <td><strong style="color:ffffff">Order History (Last 30 Days)</strong></td>
	                         </tr> 
	                      </table>
						  <cfif Getorders.recordcount GT 0>
						  <table border="0" cellpadding="3" cellspacing="1" width="100%" bgcolor="eeeee">
	                        <tr bgcolor="eeeee">
	                           <td>Order Date</td>
							   <td>Status</td>
							   <td>Product</td>
							   <td>Customer <sup>(* Member)</sup></td>
							   <td>Order Total</td>
	                        </tr>
							<cfset TotalOrdercharge = 0.00>
							<cfloop query="GetOrders">
								<tr bgcolor="ffffff">
		                           <td><a href="ViewOrder.cfm?OrderID=#GetOrders.OrderID#">#DateFormat(GetOrders.OrderDate, 'mm/dd/yyyy')#</a></td>
								   <td><cfif GetOrders.OrderStatus EQ "NEW">NEW<cfelseif GetOrders.OrderStatus EQ "CANI">CANCELLED BY IPRA<cfelseif GetOrders.OrderStatus EQ "CANU">CANCELLED BY USER<cfelseif GetOrders.OrderStatus EQ "SHIP">SHIPPED</cfif></td>
								   <td>#GetOrders.ProductName#</td>
								   <td>#GetOrders.ContactName# <cfif GetOrders.MemberID NEQ "">*</cfif></td>
								   <td align="right">#DollarFormat(GetOrders.OrderTotal)#</td>
		                        </tr>
								<cfset TotalOrdercharge = TotalOrdercharge + GetOrders.OrderTotal>
							</cfloop>
							  <tr bgcolor="eeeeee">
							    <td colspan=5 align="right"><strong>GRAND TOTAL:</strong> #DollarFormat(TotalOrdercharge)#</td>
							  </tr>
	                      </table>
						 <cfelse>
						   <p syle="color:757575;"><strong>There are currently no orders that are less than 30 days old</strong></p> 
						 </cfif> 
					 <cfelse>
					     <br>
						 <cfif form.prodName EQ "" AND form.status EQ "" AND Form.begindate EQ "" AND Form.EndDate EQ "">
						    <p class="errortext"><strong>Error! Your search must contain at least 1 criteria.</strong></p> 
						 <cfelse>   
						 
						 
							  <cfquery name="Getorders" datasource="#Application.dsn#">
							    Select o.OrderID, o.ContactName, o.orderDate, o.OrderStatus, o.OrderTotal, o.memberid,P.ProductName
								From orders o, Products P
								Where o.ProductID = p.productID 
								<cfif form.prodName NEQ "">
								 AND o.productID = #Form.ProdName#
								</cfif>
								<cfif form.Status NEQ "">
								 AND o.OrderStatus = '#Form.Status#'
								</cfif>
								
								<cfif form.enddate NEQ "" AND form.BeginDate NEQ "">
								 AND  OrderDate Between #Createodbcdate(form.begindate)# AND #Createodbcdate(form.enddate)#
								<cfelseif form.endDate NEQ "" AND form.BeginDate EQ "">
								  AND OrderDate <= #Createodbcdate(form.enddate)#
								<cfelseif form.endDate EQ "" AND form.BeginDate NEQ "">  
								  AND OrderDate >= #Createodbcdate(form.begindate)#
								</cfif>
								Order By OrderDate, OrderStatus, P.ProductName
							  </cfquery>
							  
							  <table border="0" cellpadding="3" cellspacing="0" width="100%">
		                         <tr bgcolor="##666666">
		                           <td><strong style="color:ffffff">Order Search</strong></td>
		                         </tr> 
		                      </table>
							  <cfif Getorders.recordcount GT 0>
								  <table border="0" cellpadding="3" cellspacing="1" width="100%" bgcolor="eeeee">
			                        <tr bgcolor="eeeee">
			                           <td>Order Date</td>
									   <td>Status</td>
									   <td>Product</td>
									   <td>Customer <sup>(* Member)</sup></td>
									   <td>Order Total</td>
			                        </tr>
									<cfset TotalOrdercharge = 0.00>
									<cfloop query="GetOrders">
										<tr bgcolor="ffffff">
				                           <td><a href="ViewOrder.cfm?OrderID=#GetOrders.OrderID#">#DateFormat(GetOrders.OrderDate, 'mm/dd/yyyy')#</a></td>
										   <td><cfif GetOrders.OrderStatus EQ "NEW">NEW<cfelseif GetOrders.OrderStatus EQ "CANI">CANCELLED BY IPRA<cfelseif GetOrders.OrderStatus EQ "CANU">CANCELLED BY USER<cfelseif GetOrders.OrderStatus EQ "SHIP">SHIPPED</cfif></td>
										   <td>#GetOrders.ProductName#</td>
										   <td>#GetOrders.ContactName# <cfif GetOrders.MemberID NEQ "">*</cfif></td>
										   <td align="right">#DollarFormat(GetOrders.OrderTotal)#</td>
				                        </tr>
										<cfset TotalOrdercharge = TotalOrdercharge + GetOrders.OrderTotal>
									</cfloop>
									  <tr bgcolor="eeeeee">
									    <td colspan=5 align="right"><strong>GRAND TOTAL:</strong> #DollarFormat(TotalOrdercharge)#</td>
									  </tr>
			                      </table>
							 <cfelse>
							   <p syle="color:757575;"><strong>Your Search Returned no matches. Please try again with a different criteria.</strong></p> 
							 </cfif> 	
						 </cfif> 
					 </cfif>
				   </td>
		        </tr>
		       </table>
			   <br><br>
		 </td>
     </tr>
</table>  
</cfoutput>
<cfmodule template="#Application.footer#">