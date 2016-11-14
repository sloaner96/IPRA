<cfmodule template="#Application.header#" section="0" sectiontitle="IPRA Commercial Membership Application">
  <cfoutput>
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
	<cfquery name="GetState" datasource="#Application.dsn#" cachedwithin="#CreateTimeSpan(0,0,10,0)#">
	   Select CodeDesc, CodeValue
	   From Lookup
	   Where CodeGroup = 'STATE'
	   Order BY CodeDesc
	</cfquery>
	
	<cfinclude template="#Application.TagDir#/Libraries/ccEscape.cfm">
	
	<cfset Currdate = DayOfYear(now())>
	
	<cfset FiftyPercentStartDate = DayOfYear('7/1/#year(now())#')>
	<cfset FiftyPercentEndDate = DayOfYear('11/30/#year(now())#')>
	
	 <cfif CurrDate GTE FiftyPercentStartDate AND Currdate LTE FiftyPercentEndDate>
	    <cfset Discount = true>
	 <cfelse>
	   <cfset Discount = false>
	 </cfif>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="160"><br>
		    <cfmodule template="#Application.tagdir#/aboutusnav.cfm" level="4">
		   </td>
		   <td valign="top"><br>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>IPRA Commercial Membership Application</h3></td>
		        </tr>
		      </table>
			  <table border="0" cellpadding="6" cellspacing="0" width="100%">
		        <tr>
		           <td class="RegText">
				       <table border="0" cellpadding="0" cellspacing="0" width="100%">
                         <tr>
                           <td><p>IPRA membership expires each year on December 31.
							New members joining IPRA during the membership year
							should prorate their membership fee accordingly:</p>
							
							<strong>Application Dec. 1 - June 30: 100% of membership fee due</strong><br>
							<strong>Application July 1 - Nov. 31: 50% of membership fee due</strong>
							
							</td>
                         </tr>
                       </table>
					   <cfform name="commbr" action="ProcessPayment.cfm" method="POST" scriptsrc="/scripts/cfform.js">
					     <input type="hidden" name="Discount" value="#Discount#"> 
					   <table border="0" cellpadding="4" cellspacing="0" width="100%">
                         <tr bgcolor="##003366">
                            <td><strong style="color:##ffffff;">Member Information</strong></td>
                         </tr>
                       </table>
					   <table border="0" cellpadding="4" cellspacing="0" >
                         <tr>
                            <td><strong>Company</strong></td>
							<td><cfinput type="text" name="Company" size="25" maxlength="70" required="Yes" message="You must include a company name"></td>
                         </tr>
						 <tr>
                            <td><strong>Representative Firstname:</strong></td>
							<td><cfinput type="text" name="Repfname" size="25" maxlength="70" required="Yes" message="You must include a contact representative firstname"></td>
                         </tr>
						 <tr>
                            <td><strong>Representative Lastname:</strong></td>
							<td><cfinput type="text" name="Replname" size="25" maxlength="70" required="Yes" message="You must include a contact representative lastname"></td>
                         </tr>
						  <tr>
                            <td><strong>Representative Email:</strong></td>
							<td><cfinput type="text" name="email" size="25" maxlength="95" required="Yes" message="You must include a contact representative email address"> <font size="-2" face="arial" color="757575">(you@email.com)</font></td>
                         </tr>
						 <tr>
                            <td><strong>Address</strong></td>
							<td><cfinput type="text" name="Addr" size="25" maxlength="70" required="Yes" message="You must include a address"></td>
                         </tr>
						 <tr>
                            <td><strong>Address 2</strong></td>
							<td><cfinput type="text" name="Addr2" size="25" maxlength="70"></td>
                         </tr>
						 <tr>
                            <td><strong>City</strong></td>
							<td><cfinput type="text" name="City" size="25" maxlength="50" required="Yes" message="You must include a Contact City"></td>
                         </tr>
						 <tr>
                            <td><strong>State</strong></td>
							<td><select name="State">
								       <cfloop query="GetState">
								         <option value="#CodeValue#">#CodeValue#</option>
								       </cfloop>
									  </select></td>
                         </tr>
						 <tr>
                            <td><strong>Zip</strong></td>
							<td><cfinput type="text" name="Zipcode" size="9" maxlength="10" required="Yes" message="You must include a zip code"></td>
                         </tr>
						 <tr>
                            <td><strong>Phone</strong></td>
							<td><cfinput type="text" name="Phone" size="12" maxlength="12" required="Yes" message="You must include a phone number"> <font size="-2" face="arial" color="757575">(555-555-5555)</font></td>
                         </tr>
						 <tr>
                            <td><strong>Fax</strong></td>
						    <td><cfinput type="text" name="Fax" size="12" maxlength="12"> <font size="-2" face="arial" color="757575">(555-555-5555)</font></td>
                         </tr>
						 <tr>
                            <td><strong>Toll Free</strong></td>
							<td><cfinput type="text" name="TollFree" size="12" maxlength="12" > <font size="-2" face="arial" color="757575">(555-555-5555)</font></td>
                         </tr>
						 <tr>
                            <td><strong>WebSite</strong></td>
							<td><cfinput type="text" name="Website" size="25" maxlength="50" ></td>
                         </tr>
						 <tr>
                            <td><strong>Product/Services</strong></td>
							<td><cfinput type="text" name="Prodservice" size="40" maxlength="100" required="Yes" message="You must include a Product or Service"></td>
                         </tr> 
                       </table><br>
					   <table border="0" cellpadding="4" cellspacing="0" width="100%">
                         <tr bgcolor="##003366">
                            <td><strong style="color:##ffffff;">Membership Type</strong></td>
                         </tr>
                       </table>
					   <cfquery name="GetProduct" datasource="#Application.dsn#">
					     Select ProductID, ProductName, PerUnitPrice
						 From Products
						 Where ProductType = '07'
						 order By PerUnitPrice
					   </cfquery>
					   <cfquery name="GetMbrSpecialSec" datasource="#Application.dsn#" cachedwithin="#CreateTimeSpan(0,0,10,0)#">
			            Select P.ProductID, P.ProductName, P.PerUnitPrice, L.Codedesc as prodcategory 
				         From Products P, Lookup L
				         Where P.ProductType = '04'
				         AND L.CodeGroup = 'ORDERCAT'
				         AND L.CodeValue = P.ProductCategory
				         Order By productCategory, ProductName
					    </cfquery>
					   <table border="0" cellpadding="0" cellspacing="0">
                         <tr>
                            <td colspan=3><strong>Membership Dues</strong> (choose one)<cfif Discount><font color="##cc0000">* 50% Discount Applied</font></cfif></td>
                         </tr>
						 <cfloop query="GetProduct">
						   <cfif Discount>
						     <cfset DiscountPrice = (GetProduct.PerUnitPrice * .50)>
						   </cfif>
						  <tr> 
						    <td><input type="radio" name="Mbrdues" value="#Getproduct.productID#"></td>
						    <td>#GetProduct.ProductName#</td> 
							<td><cfif Discount>#DollarFormat(DiscountPrice)#<cfelse>#DollarFormat(GetProduct.PerunitPrice)#</cfif></td>
						  </tr>
						 </cfloop>
						 <tr>
						   <td>&nbsp;</td>
						 </tr>
						 <tr>
						   <td colspan=3><strong>Special Interest Section</strong> (one Complimentary - Commerical Voting only)</td>
						 </tr>
						 <cfloop query="GetmbrSpecialSec">
						   <tr class="regtext">
						     <td><input type="radio" name="SpecialSection" value="#GetMbrSpecialSec.ProductID#"></td>
							 <td>#GetMbrSpecialSec.ProductName#</td>
							 <td>&nbsp;</td>
						   </tr>
						</cfloop>
                       </table><br>
					   <table border="0" cellpadding="4" cellspacing="0" width="100%">
                         <tr bgcolor="##003366">
                            <td><strong style="color:##ffffff;">Payment Information</strong></td>
                         </tr>
                       </table>
					   <cfquery name="GetPayType" datasource="#Application.dsn#" cachedwithin="#CreateTimeSpan(0,0,10,0)#">
						      Select *
						       From Lookup
						        Where CodeGroup = 'Paytype'
						        Order By Ranking, Codevalue, CodeDesc
						   </cfquery><br>
						   
						   <cfoutput>
							 <table border="0" cellpadding="3" cellspacing="0" width="100%">
			                    <tr>
			                       <td><b>Payment Type:</b></td>
								   <td><select name="PayType">
										<cfloop query="GetPayType">  
										   <option value="#GetPayType.CodeValue#">#GetPayType.CodeDesc#</option>
									     </cfloop>
									  </select></td>
			                       </tr>
							<tr>
							  <td><b>Purchase Order Number:</b></td>
							  <td><input type="text" name="PONumber" value=""></td>
							</tr>
							<tr>
							  <td>&nbsp;</td>
							</tr>
							
							<tr>
								<td bgcolor="##838383" colspan=2><B style="color:##ffffff;">Credit Card Information</B></td>
							</tr>
							<tr>
								<td width=105 align=left><b>Card Holder</b>:</td>
								<td width=* align=left><cfinput name="CardName" type="text" size=30 maxlength=40></td>
							</tr>
							
							<tr>
								<td width=105 align=left><b>Address</b>:</td>
								<td width=* align=left><cfinput type="Text" name="BillAddress" size="35" maxlength="40"></td>
							</tr>
							
							<tr>
								<td width=105 align=left><b>City</b>:</td>
								<td width=* align=left><cfinput type="Text" name="BillCity" size="25" maxlength="30"></td>
							</tr>
							<cfquery name="GetState" datasource="#Application.dsn#" cachedwithin="#CreateTimeSpan(0,0,10,0)#">
						      Select CodeDesc, CodeValue
						      From Lookup
						      Where CodeGroup = 'STATE'
						      Order BY CodeDesc
						    </cfquery> 
							<tr>
								<td width=105 align=left><b>State</b>:</td>
								<td width=* align=left><select name="BillState">
																       <cfloop query="GetState">
																         <option value="#CodeValue#">#CodeValue#</option>
																       </cfloop>
																	  </select></td>
							</tr>
							
							<tr valign=top>
								<td width=105 align=left><b>Zip</b>:</td>
								<td width=* align=left><cfinput type="Text" name="BillZip" size="5" maxlength="5"></td>
							</tr>
							
							<tr valign=top>
								<td colspan=2>
								<font face="Arial" size="-1"><i>Note: the <b>billing address</b> for your credit card <b>must match</b> the information you have entered here in order for the transaction to be successful.</i><br>&nbsp;
								</td>
							</tr>
							<tr>
							  <td width="40%" align="center" colspan=2><hr noshade size="1"></td>
							</tr>
							<tr>
								<td width=105 align=left><b>Credit Card</b>:</td>
								<td width=* align=left><cfselect name="CardType"  query="CCards" value="CodeValue" display="CodeDesc" size="1"><option selected value="*">--- Select Card ---</option></cfselect></td>
							</tr>
							
							<tr>
								<td width=105 align=left><b>Card Number</b>:</td>
								<td width=* align=left><cfinput type="Text" name="CardNbr" validate="creditcard" size="25" maxlength="20"></td>
							</tr>
							
							<tr>
								<td width=105 align=left><b>Expires on</b>:</td>
								<td width=* align=left>
									<cfselect name="XMonth" query="Months" value="Codevalue" display="codeDesc" size="1" selected="#NumberFormat(Month(now()), '00')#" message="Please select the Expiration Month of your card"></cfselect>
									<select name="XYear" size=1>
									<cfloop index="Iyr" from="#Year(now())#" to="#Evaluate(Year(now())+6)#"><cfoutput><option value="#IYr#">#IYr#</option></cfoutput></cfloop>
									</select>
								</td>
							</tr>
							</table>
							</cfoutput>
							<br>
							<table border="0" cellpadding="0" cellspacing="0" width="100%">
		                      <tr>
		                        <td align="center">
							       
							         <input type="submit" name="submit" value="Complete Application >>">
							       
							    </td>
		                      </tr>
		                     </table>
							</cfform>
							
							<br clear=all>
							
							<script language=JavaScript src='https://seal.XRamp.com/seal.asp?type=H'></script>
							<p>If you chose a credit card as your method of payment, This will initiate a <b>secured</b> transaction to the bank which will validate the credit information you provided and authorize the transfer of funds.  The authorization process may take up to 1 minute to complete so please be patient.</p>
							
							<center><img src="/images/credit_card_bar.gif" alt="" border="0"></center>
		                  
				   </td>
		        </tr>
		       </table>
			   <br><br>
		 </td>
     </tr>
</table>  
</cfoutput>
<cfmodule template="#Application.footer#">