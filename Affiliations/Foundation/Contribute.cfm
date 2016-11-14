<cfmodule template="#Application.header#" section="0" sectiontitle="Foundation Contributions">

<cfquery name="GetState" datasource="#Application.dsn#" cachedwithin="#CreateTimeSpan(0,0,10,0)#">
   Select CodeDesc, CodeValue
   From Lookup
   Where CodeGroup = 'STATE'
   Order BY CodeDesc
</cfquery>
  <cfoutput>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top"><br>
		    <cfmodule template="#Application.tagdir#/affilnav.cfm" level="3">
		   </td>
		   <td><br>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>Contribute to the IPRF</h3></td>
		        </tr>
		      </table>
			  <table border="0" cellpadding="6" cellspacing="0" width="100%">
		        <tr>
		           <td class="RegText">
				    <table border="0" cellpadding="6" cellspacing="0" width="100%" class="RegText">
		              <tr> 
		                <td><img border="0" src="/images/IPRFLogo.gif" alt="Illinois Park & Recration Foundation (IPRF)" align="right" border="0">
		                  <strong>Please count me in, and accept my tax-deductible contribution to the
		                  IPRF Annual Campaign in support of parks and recreation in
		                  Illinois!</strong><br><br>
						  
		                  </td>
		              </tr>
		            </table> 
					<cfquery name="GetContrib" datasource="#Application.dsn#">
					   Select ProductID, ProductName, PerUnitPrice
					    From Products
						Where ProductType = '05'
					    Order By PerUnitPrice desc
					</cfquery>
					<cfform name="contribute" action="ContributeProcess.cfm?action=Confirm" Method="POST" onSubmit="return disableForm(this);" scriptsrc="/scripts/cfform.js">
					<table border="0" cellpadding="4" cellspacing="0" class="regtext" width="100%">
                      <tr bgcolor="##003366">
					    <td><strong style="color:##ffffff;">Donor Information:</strong></td>
					  </tr>
					  <tr>
					    <td>
						  <table border="0" cellpadding="4" cellspacing="0" class="regtext">
                             <tr>
                               <td>Name:</td>
							   <td><cfinput type="text" name="donorname" value="" size="30" maxlength="100" required="Yes"></td>
                             </tr>
							 <tr>
                               <td>Address 1:</td>
							   <td><cfinput type="text" name="donoraddr" value="" size="40" maxlength="100" required="Yes"></td>
                             </tr>
							 <tr>
                               <td>Address 2:</td>
							   <td><input type="text" name="donoraddr2" value="" size="40" maxlength="100" > <font color="##838383">(Optional</font>)</td>
                             </tr>

                             <tr>
                              <td>City:</td>
							  <td><cfinput type="text" name="donorcity" value="" size="15" maxlength="40" required="Yes"></td>
						     </tr>
							 <tr>
							  <td>State:</td>
							  <td><select name="DonorState">
							       <cfloop query="GetState">
							         <option value="#CodeValue#">#CodeValue#</option>
							       </cfloop>
								  </select></td>
							 </tr>
							 <tr>	  
							  <td>Zip:</td>
							  <td><cfinput type="text" name="donorzip" value="" size="10" maxlength="10" required="Yes"></td>
                             </tr>
                
							 <tr>
                               <td>Phone:</td>
							   <td><input type="text" name="donorPhone" value="" size="12" maxlength="12" required="Yes"> <font size="-2" face="arial" color="757575">(555-555-5555)</font></td>
                             </tr>
							  <tr>
                               <td>Email:</td>
							   <td><cfinput type="text" name="donorEmail" value="" size="20" maxlength="90" required="Yes"> <font size="-2" face="arial" color="757575">(you@email.com)</font></td>
                             </tr>
							 <tr>
							   <td colspan=2>Individual / Firm To Be Recognized: (If other than above)<br><input type="text" name="donorRecognize" value="" size="40" maxlength="75"></td>
							 </tr>
                          </table>
						</td>
					  </tr>
					  <tr bgcolor="##003366">
				        <td><strong style="color:##ffffff;">I would like to make a contribution of:</strong></td>
				      </tr>
					  
					   <tr>
					      <td>
						    <table border="0" cellpadding="0" cellspacing="0" width="100%" class="regtext">
                              <cfloop query="GetContrib">
							    <tr>
                                   <td><input type="Radio" name="Contribution" value="#GetContrib.ProductID#"></td>
								   <td>#DollarFormat(GetContrib.PerUnitPrice)# #GetContrib.ProductName#</td>
                                </tr>
							  </cfloop>
							   <tr>
							     <td><input type="Radio" name="Contribution" value="0"></td>
								 <td>Other Gift: $ <input type="text" name="otheramt" value="" size="6" maxlength="25"> Supporter of IPRF</td>
							   </tr>
                            </table>
						  </td>
					   </tr>
					   <tr bgcolor="##003366">
					     <td><strong style="color:##ffffff;">Payment Information:</strong></td>
					   </tr>
					   <tr>
					     <td>
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
						   <table border="0" cellpadding="4" cellspacing="0" width="100%">

                            <tr>
								<td bgcolor="##eeeeee" colspan=2><B>Billing Information</B></td>
							</tr>
							
							<tr>
								<td width=105 align=left><b>Card Holder</b>:</td>
								<td width=* align=left><cfinput name="CardName" type="text" size=30 maxlength=40 required="Yes"></td>
							</tr>
							
							<tr>
								<td width=105 align=left><b>Address</b>:</td>
								<td width=* align=left><cfinput type="Text" name="BillAddress" required="Yes" size="35" maxlength="40" message="Please enter the Billing Address"></td>
							</tr>
							
							<tr>
								<td width=105 align=left><b>City</b>:</td>
								<td width=* align=left><cfinput type="Text" name="BillCity" required="Yes" size="25" maxlength="30" message="Please enter the Billing City"></td>
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
								<td width=* align=left><cfinput type="Text" name="BillZip" required="Yes" size="5" maxlength="5" message="Please enter the Billing Zip Code"></td>
							</tr>
							
							<tr valign=top>
								<td colspan=2>
								<font face="Arial" size="-1"><i>Note: the <b>billing address</b> for your credit card <b>must match</b> the information you have entered here in order for the transaction to be successful.</i></font><br>&nbsp;
								</td>
							</tr>
							
							<tr>
								<td bgcolor="##eeeeee" colspan=2><B >Credit Card Information</B></td>
							</tr>
							
							<tr>
								<td width=105 align=left><b>Credit Card</b>:</td>
								<td width=* align=left><cfselect name="CardType"  query="CCards" value="CodeValue" display="CodeDesc" size="1" message="Please select the Credit Card you wish to use for this transaction" required="Yes"><option selected value="*">--- Select Card ---</option></cfselect></td>
							</tr>
							
							<tr>
								<td width=105 align=left><b>Card Number</b>:</td>
								<td width=* align=left><cfinput type="Text" name="CardNbr" validate="creditcard" required="Yes" size="25" maxlength="20"></td>
							</tr>
							
							<tr>
								<td width=105 align=left><b>Expires on</b>:</td>
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
                                  <td align="center"><input type="submit" name="submit" value="Donate Now >>" onclick="return disableForm(this);"></td>
                                </tr>
                              </table>
							
							
							
							<br clear=all>
							
							<script src=https://seal.verisign.com/getseal?host_name=www.ilipra.org&size=S&use_flash=YES&use_transparent=YES&lang=en></script>
							<p>This will initiate a <b>secured</b> transaction to the bank which will validate the credit information you provided and authorize the transfer of funds.  The authorization process may take up to 1 minute to complete so please be patient.</p>
							
							<center><img src="/images/credit_card_bar.gif" alt="" border="0"></center>

						 </td>
					   </tr>
					 
				    </table>
				   </CFFORM>
				   </td>
		        </tr>
		       </table>
			   <br><br>
		 </td>
     </tr>
</table>  
</cfoutput>
<cfmodule template="#Application.footer#">