<cfinclude template="#Application.TagDir#/Libraries/ccEscape.cfm">
<cfif ISDefined("form.submit") AND IsDefined("form.Status")>
  <cfquery name="UpdateStatus" datasource="#Application.dsn#">
     Update Orders
	   Set OrderStatus = '#form.Status#',
	   LastUpdated = #CreateODBCDateTime(Now())#
	 Where OrderID = #url.orderID#  
  </cfquery>
</cfif>
<CFQUERY Name="Getorder" Datasource="#Application.DSN#">
	Select O.*, T.TransID, T.TransType, T.PONumber, T.CardType, T.CardNbr, T.CardExpMonth, T.CardExpYear, P.productID, productName, PerUnitPrice
	From Orders O, Transactions T, Products P
	Where O.OrderID = <cfqueryparam value="#URL.OrderID#" cfsqltype="CF_SQL_INTEGER">
	AND O.ProductID = P.ProductID
	AND O.OrderNUM = T.OrderNum
</CFQUERY>
<cfquery name="GetStatus" datasource="#Application.dsn#" cachedwithin="#CreateTimeSpan(0,0,10,0)#">
    Select CodeValue, CodeDesc
	From Lookup
	Where CodeGroup = 'orderStat'
	Order By CodeValue, CodeDesc
  </cfquery>
					  


<cfmodule template="#Application.header#" section="0" sectiontitle="Site Admin">
  <cfoutput query="Getorder">
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="160"><br>
		    <cfmodule template="#Application.tagdir#/adminnav.cfm" level="4">
		   </td>
		   <td valign="top"><br>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>IPRA MarketPlace Order ## #GetOrder.OrderID#</h3></td>
		        </tr>
		      </table>
			  <div align="right"><a href="Orders.cfm">Back to Orders Home</a></div>
			  <table border="0" cellpadding="6" cellspacing="0" width="100%">
		        <tr>
		           <td class="RegText">
				      <table border="0" cellpadding="0" cellspacing="0" width="100%">
                          <tr>
                            <td>
							  <form action="ViewOrder.cfm?OrderID=#URL.OrderID#" method="POST">
							  <table border="0" cellpadding="4" cellspacing="0" width="100%">
		                         <tr bgcolor="##eeeeee">
		                           <td><strong>Order Information</strong></td>
		                        </tr>
								<tr>
								  <td><strong>Status:</strong>&nbsp;
								                                   <cfif GetOrder.Orderstatus NEQ "SHIP">
																   <select name="Status">
																	 <cfloop query="GetStatus">
																	   <option value="#GetStatus.Codevalue#" <cfif Getorder.orderStatus EQ GetStatus.CodeValue>Selected</cfif>>#GetStatus.CodeDesc#</option>
																	 </cfloop>
																   </select>
																   &nbsp;&nbsp;<input type="submit" name="Submit" value="Change Status">
																   <cfelse>
																     SHIPPED #DateFormat(Getorder.LastUpdated, 'MM/DD/YYYY')#
																   </cfif>
								  </td>
								</tr>
								<tr>
								  <td>#Getorder.ProductName#<br> #Getorder.OrderQuantity# X #DollarFormat(PerUnitPrice)#<br>
								      Total Cost: <strong>#DollarFormat(Getorder.OrderTotal)#</strong></td>
								</tr>
								<tr><td>&nbsp;</td></tr>
								 <tr bgcolor="##eeeeee">
		                           <td><strong>Payment Information</strong></td>
		                        </tr>
								<tr>
								  <td>
								    
								    Paid Via: <strong><cfif Getorder.TransType EQ "Credit">Credit Card<cfelse>Purchase Order</cfif></strong><br>
									<cfif Getorder.TransType EQ "Credit">
									  #Getorder.CardType# #ccEscape(Getorder.CardNbr)# Exp: #Getorder.CardExpMonth#/#Getorder.CardExpYear#
									  
									<cfelse>
									  Purchase Order Number: #Getorder.PONumber# 
									</cfif>
									
								  </td>
								</tr>
								<tr><td>&nbsp;</td></tr>
								 <tr bgcolor="##eeeeee">
		                           <td><strong>Shipping Information</strong></td>
		                        </tr>
								<tr>
								  <td>
								    #Getorder.ContactName#<br>
									#Getorder.ContactAddress1#<br> 
									<cfif Getorder.ContactAdress2 NEQ "">#Getorder.ContactAdress2#<br></cfif>
									#Getorder.ContactCity#, #Getorder.ContactState# #Getorder.ContactZip#<br><br>
									
		
									<strong>Email:</strong> <a href="mailto:#Getorder.ContactEmail#">#Getorder.ContactEmail#</a><br><br>
									
					
								  </td>
								</tr>
								
								 
		                      </table>
							  </form>
							</td>
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