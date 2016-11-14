<cfquery name="GetProducts" datasource="#Application.dsn#">
  Select ProductID, ProductName, ProductType, ProductCategory, ShortDesc, PerUnitPrice, 
         MemberPrice, NonMemberPrice, ImgThumb, ProductQty, QuantityMeasure,SellInStore,
	(Select CodeDesc
	   From Lookup
	    Where CodeGroup = 'ORDERCAT'
		AND CodeValue = P.ProductCategory) as ProdCatName,
	(Select CodeDesc
	   From Lookup
	    Where CodeGroup = 'PRODCAT'
		AND CodeValue = P.ProductType) as ProdTypeName,
	(Select CodeDesc
	   From Lookup
	    Where CodeGroup = 'PRODMEAS'
		AND CodeValue = P.QuantityMeasure) as ProdUnit	
  From Products P
  Where SellInStore = 1
  AND IsActive = 1

    And ProductID= <cfqueryparam value="#form.PRODID#" cfsqltype="CF_SQL_VARCHAR" maxlength="5">
  
  Order By productType, productCategory, productName, PerUnitPrice
</cfquery>
<cfquery name="CCards" datasource="#Application.DSN#" blockfactor="100">
	SELECT * From Lookup
		WHERE CodeGroup = 'CCTYPE'
		ORDER By Ranking, CodeDesc
</cfquery>
<cfquery name="Months" datasource="#Application.DSN#" blockfactor="100">
	SELECT * From Lookup
		WHERE CodeGroup = 'MONTH'
		ORDER By CodeValue
</cfquery>

<cfquery name="GetPayType" datasource="#Application.dsn#" cachedwithin="#CreateTimeSpan(0,0,10,0)#">
     Select *
      From Lookup
       Where CodeGroup = 'Paytype'
       Order By Ranking, Codevalue, CodeDesc
  </cfquery><br>
 
<cfmodule template="#Application.header#" sectiontitle="IPRA Marketplace">
  <cfoutput>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="160"><br>
	         <cfmodule template="#Application.tagdir#/resourcenav.cfm">
		   </td>
		   <td valign="top"><br>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>IPRA Marketplace: Checkout</h3></td>
		        </tr>
		      </table>
			  <cfform name="checkout" action="/Resources/ProcessPayment.cfm" Method="POST" scriptsrc="/scripts/cfform.js">
			  <input type="hidden" name="ProductID" value="#GetProducts.ProductID#">
			  <input type="hidden" name="ProdQty" value="#form.Quantity#">
			  <table border="0" cellpadding="6" cellspacing="0" width="100%">
		        <tr>
		           <td class="RegText">
					  <table border="0" cellpadding="3" cellspacing="0" width="100%">
                         <tr bgcolor="##003366">
                            <td><strong style="color:##ffffff;">Product Information</strong></td>
                          </tr>
						  <tr>
						    <td>&nbsp;</td>
						  </tr>
						  <tr>
						    <td>
							  <table border="0" cellpadding="4" cellspacing="0" width="100%">
                                 <tr bgcolor="##eeeee">
								   <td width="80%"><strong>Item Number&nbsp;&nbsp;&nbsp;Item Information</strong></td>
								   <td><strong>Quantity</strong></td> 
								   <td align="center"><strong>Total Cost</strong></td>
								 </tr>
								 <tr>
									<td width="80%" valign="top">#GetProducts.ProductType#-#GetProducts.ProductID# - <strong>#GetProducts.productName#</strong>
									                             <cfif Getproducts.ShortDesc NEQ"">
																    <br><strong>Description:</strong> #Getproducts.ShortDesc#
																 </cfif>
								    </td>
									<cfif form.Quantity NEQ "">
									  <cfset ThisQty = form.Quantity>
									<cfelse>
									  <cfset ThisQty = GetProducts.ProductQty>
									</cfif>
									
									<cfset TotalCost = (ThisQty * GetProducts.PerUnitPrice)>
									<td align="center">#ThisQty#</td> 
									<td align="right" bgcolor="##eeeeee"><strong style="size:14px">#DollarFormat(TotalCost)#</strong></td>
                                 </tr>
                             </table><br><br>
							 <table border="0" cellpadding="4" cellspacing="0" width="100%">
                              <tr bgcolor="##003366">
								  <td colspan=2><strong style="color:##ffffff;">Shipping Information</strong></td>
							   </tr>
							   <tr>
									<td width=105 align=left><font face="Verdana,Arial" size="-1"><b>Ship To</b></font>:</td>
									<td width=* align=left><cfinput name="shipName" type="text" size=30 maxlength=40 required="Yes"></td>
								</tr>
								<tr>
									<td width=105 align=left><font face="Verdana,Arial" size="-1"><b>Email</b></font>:</td>
									<td width=* align=left><cfinput name="email" type="text" size=30 maxlength=90 required="Yes"></td>
								</tr>
								<tr>
									<td width=105 align=left><font face="Verdana,Arial" size="-1"><b>Phone</b></font>:</td>
									<td width=* align=left><cfinput name="phone" type="text" size=12 maxlength=12 required="Yes"></td>
								</tr>
								<tr>
									<td width=105 align=left><font face="Verdana,Arial" size="-1"><b>Address</b></font>:</td>
									<td width=* align=left><cfinput type="Text" name="Addr" required="Yes" size="35" maxlength="40" message="Please enter the ship to Address"></td>
								</tr>
								<tr>
									<td width=105 align=left><font face="Verdana,Arial" size="-1"><b>Address 2</b></font>:</td>
									<td width=* align=left><cfinput type="Text" name="Addr2" required="Yes" size="35" maxlength="40"></td>
								</tr>
								<tr>
									<td width=105 align=left><font face="Verdana,Arial" size="-1"><b>City</b></font>:</td>
									<td width=* align=left><cfinput type="Text" name="City" required="Yes" size="25" maxlength="30" message="Please enter the ship to City"></td>
								</tr>
								<cfquery name="GetState" datasource="#Application.dsn#" cachedwithin="#CreateTimeSpan(0,0,10,0)#">
							      Select CodeDesc, CodeValue
							      From Lookup
							      Where CodeGroup = 'STATE'
							      Order BY CodeDesc
							    </cfquery> 
								<tr>
									<td width=105 align=left><font face="Verdana,Arial" size="-1"><b>State</b></font>:</td>
									<td width=* align=left><select name="State">
														       <cfloop query="GetState">
														         <option value="#CodeValue#">#CodeValue#</option>
														       </cfloop>
															  </select></td>
								</tr>
								
								<tr valign=top>
									<td width=105 align=left><font face="Verdana,Arial" size="-1"><b>Zip</b></font>:</td>
									<td width=* align=left><cfinput type="Text" name="Zip" required="Yes" size="5" maxlength="5" message="Please enter the Billing Zip Code"></td>
								</tr>	  
                             </table>
							</td>
						  </tr>
                         </table>
						 
						 
                               <table border="0" cellpadding="6" cellspacing="0" width="100%">
							     <tr bgcolor="##003366">
								    <td><strong style="color:##ffffff;">Billing Information:</strong></td>
								 </tr>
							  </table>
							   
							   
				
								 <table border="0" cellpadding="3" cellspacing="0" width="100%">
				                    <tr>
				                       <td><font face="Verdana,Arial" size="-1"><b>Payment Type:</b></font></td>
									   <td><select name="PayType">
											<cfloop query="GetPayType">  
											   <option value="#GetPayType.CodeValue#">#GetPayType.CodeDesc#</option>
										     </cfloop>
										  </select></td>
				                       </tr>
										<tr>
										  <td><font face="Verdana,Arial" size="-1"><b>Purchase Order Number:</b></font></td>
										  <td><input type="text" name="PONumber" value=""></td>
										</tr>
										<tr>
										  <td>&nbsp;</td>
										</tr>
										
										<tr>
											<td bgcolor="##838383" colspan=2><B style="color:##ffffff;">Credit Card Information</B></td>
										</tr>
										<tr>
											<td width=105 align=left><font face="Verdana,Arial" size="-1"><b>Card Holder</b></font>:</td>
											<td width=* align=left><cfinput name="CardName" type="text" size=30 maxlength=40 required="Yes"></td>
										</tr>
										
										<tr>
											<td width=105 align=left><font face="Verdana,Arial" size="-1"><b>Address</b></font>:</td>
											<td width=* align=left><cfinput type="Text" name="BillAddress" required="Yes" size="35" maxlength="40" message="Please enter the Billing Address"></td>
										</tr>
										
										<tr>
											<td width=105 align=left><font face="Verdana,Arial" size="-1"><b>City</b></font>:</td>
											<td width=* align=left><cfinput type="Text" name="BillCity" required="Yes" size="25" maxlength="30" message="Please enter the Billing City"></td>
										</tr>
							
										<tr>
											<td width=105 align=left><font face="Verdana,Arial" size="-1"><b>State</b></font>:</td>
											<td width=* align=left><select name="BillState">
																			       <cfloop query="GetState">
																			         <option value="#CodeValue#">#CodeValue#</option>
																			       </cfloop>
																				  </select></td>
										</tr>
										
										<tr valign=top>
											<td width=105 align=left><font face="Verdana,Arial" size="-1"><b>Zip</b></font>:</td>
											<td width=* align=left><cfinput type="Text" name="BillZip" required="Yes" size="5" maxlength="5" message="Please enter the Billing Zip Code"></td>
										</tr>
										
										<tr valign=top>
											<td colspan=2>
											<font face="Arial" size="-1"><i>Note: the <b>billing address</b> for your credit card <b>must match</b> the information you have entered here in order for the transaction to be successful.</i></font><br>&nbsp;
											</td>
										</tr>
										<tr>
										  <td width="40%" align="center" colspan=2><hr noshade size="1"></td>
										</tr>
										<tr>
											<td width=105 align=left><font face="Verdana,Arial" size="-1"><b>Credit Card</b></font>:</td>
											<td width=* align=left><cfselect name="CardType"  query="CCards" value="CodeValue" display="CodeDesc" size="1" message="Please select the Credit Card you wish to use for this transaction" required="Yes"><option selected value="*">--- Select Card ---</option></cfselect></td>
										</tr>
										
										<tr>
											<td width=105 align=left><font face="Verdana,Arial" size="-1"><b>Card Number</b></font>:</td>
											<td width=* align=left><cfinput type="Text" name="CardNbr" validate="creditcard" required="Yes" size="25" maxlength="20"></td>
										</tr>
										
										<tr>
											<td width=105 align=left><font face="Verdana,Arial" size="-1"><b>Expires on</b></font>:</td>
											<td width=* align=left>
												<cfselect name="XMonth" query="Months" value="Codevalue" display="codeDesc" size="1" selected="#NumberFormat(Month(now()), '00')#" message="Please select the Expiration Month of your card" required="Yes"></cfselect>
												<select name="XYear" size=1>
												<cfloop index="Iyr" from="#Year(now())#" to="#Evaluate(Year(now())+6)#"><cfoutput><option value="#IYr#">#IYr#</option></cfoutput></cfloop>
												</select>
											</td>
										</tr>
										</table>
										
										<br>
										<table border="0" cellpadding="0" cellspacing="0" width="100%">
					                      <tr>
					                        <td align="center">
										       <font face="Verdana,Arial" size="-1">
										         <input type="submit" name="submit" value="Complete Posting >>" onclick="javascript:disableForm(this);">
										       </font>
										    </td>
					                      </tr>
					                     </table>
										</cfform>
										
										<br clear=all>
										<font face="Verdana,Arial" size="-1">
										<script language=JavaScript src='https://seal.XRamp.com/seal.asp?type=H'></script>
										<p>If you chose a credit card as your method of payment, This will initiate a <b>secured</b> transaction to the bank which will validate the credit information you provided and authorize the transfer of funds.  The authorization process may take up to 1 minute to complete so please be patient.</p>
										</font>
										<center><img src="/images/credit_card_bar.gif" alt="" border="0"></center>
				   </td>
		        </tr>
		       </table>
			   <br>
			   
			   <br><br>
		 </td>
     </tr>
</table>  
</cfoutput>
<cfmodule template="#Application.footer#">