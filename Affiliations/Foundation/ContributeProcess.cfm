<cfinclude template="#Application.TagDir#/Libraries/ccEscape.cfm">

<cfmodule template="#Application.header#" section="0" sectiontitle="Foundation Contributions">
  <cfoutput>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top"><br>
		    <cfmodule template="#Application.tagdir#/affilnav.cfm" level="3">
		   </td>
		   <td><br>
			<cfif action EQ "Confirm">
					<cfset ErrorList = ArrayNew(1)>
					
					<CFIF #Form.DonorName# is "">
						<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Donor Name</b> field")>
					</CFIF>
					
					<CFIF #Form.DonorAddr# is "">
						<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>DonorAddr</b> field")>
					</CFIF>
					
					<CFIF #Form.DonorCity# is "">
						<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>City</b> field")>
					</CFIF>
					
					<CFIF #Form.DonorState# is "">
						<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>State</b> field")>
					</CFIF>
					
					<CFIF #Form.DonorZip# is "">
						<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Zipcode</b> field")>
					</CFIF>
					
					<CFIF #Form.Contribution# is "">
						<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Contribution</b> field")>
					</CFIF>
					
					<CFIF Form.Contribution is 0 AND Form.OtherAmt EQ "">
						<cfset x = ArrayAppend(ErrorList, "You Sepcified another amount to donate, but you did not enter an amount.")>
					</CFIF>
					
					<CFIF #Form.DonorPhone# is "">
						<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Phone</b> field")>
					</CFIF>
					
					<CFIF #Form.DonorEmail# is "">
						<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Email</b> field")>
					</CFIF>
					
					<CFIF #Form.BillAddress# is "">
						<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Billing Address</b> field")>
					</CFIF>
					
					<CFIF #Form.BillCity# is "">
						<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Billing City</b> field")>
					</CFIF>
					
					<CFIF #Form.BillState# is "">
						<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Billing State</b> field")>
					</CFIF>
					
					<CFIF #Form.BillZip# is "">
						<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Billing Zip</b> field")>
					</CFIF>
					
					<CFIF #Form.CardType# is "*">
						<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Credit Card</b> field")>
					</CFIF>
					
					<CFIF #Form.CardNbr# is "">
						<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Card Number</b> field")>
					</CFIF>
					
					<CFIF #Form.CardName# is "">
						<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Card Holder</b> field")>
					</CFIF>
					
					<CFIF #Form.XMonth# is "">
						<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Expiration Month</b> field")>
					</CFIF>
					
					<CFIF #Form.XYear# is "">
						<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Expiration Year</b> field")>
					</CFIF>
					
					<cfset AuthResponse = "">
					<cfset AuthReasonText = "">

				<CFIF ArrayLen(ErrorList) is 0>
				   <cfif form.contribution NEQ 0>
					   <cfquery name="GetProduct" datasource="#Application.dsn#">
						  Select ProductID, ProductName, PerUnitPrice
						  From Products
						  Where ProductID = #form.contribution#
					   </cfquery>
					<cfelse>
					   <cfset GetProduct.PerUnitPrice = Form.otherAmt>
					   <cfset GetProduct.ProductName = "Supporter of IPRF">
					   <cfset GetProduct.ProductID = 0>	
					</cfif>
					
					<cfset FormattedCC = ReplaceList(Form.CardNbr, "-,/, ,\", "")>
					<cfset OrderNumber = "DON-#RandRange(1,9)##RandRange(1,9)##chr(RandRange(65,90))##RandRange(1,9)##chr(RandRange(65,90))#">
					
					<CFMODULE Template="#Application.TagDir#/Skipjack.cfm"
								Server = "#Application.SysInfo.SysURL#" 
								SJName = "#form.CardName#" 
								Email = "#Form.DonorEmail#"
								StreetAddress = "#Form.BillAddress#" 
								City = "#Form.BillCity#" 
								State = "#Form.BillState#" 
								Zipcode = "#form.BillZip#" 
								OrderNumber = "#OrderNumber#" 
								AccountNumber = "#FormattedCC#" 
								Month = "#form.XMonth#" 
								Year = "#Form.XYear#" 
								SerialNumber = "#Application.SysInfo.SerialNumber#" 
								Transactionamount = "#NumberFormat(getproduct.PerUnitPrice, 0.00)#" 
								OrderString = "1~IPRF Donation:#GetProduct.ProductName#~#GetProduct.PerUnitPrice#~||" 
								ShipToPhone = "#form.DonorPhone#">
								
						 <cfif Response.ISApproved EQ "0">
							<cfset x = ArrayAppend(ErrorList, "Your Credit transaction failed with the Reason: '<b>#Response.AuthDeclinedMessage#</b>' (Code #Response.ReturnCode#).  Please review the information you provided on the previous page and try again.")>
							<cfmail to="webmaster@ilipra.org" from="webmaster@ilipra.org" bcc="webmaster@x2-interactive.com"  Subject="Credit Authorization Failure on ILIPRA.ORG" server="#Application.mailserver#"  username="#Application.MailUser#" password="#Application.MailPassword#">
							Date: #DateFormat(now(), 'mm/dd/yyyy')#
							Time: #TimeFormat(now(), 'hh:mm:ss TT')#
					
							#Form.CardType# Payment for IPRF Donation #GetProduct.ProductName#
							Name: #Form.CardName#
							Card: #Form.CardNbr#  expires: #Form.XMonth#/#Form.XYear#
							Amount: #DollarFormat(GetProduct.PerUnitPrice)#
					
							Error: #Response.ReturnCode# - #Response.AuthDeclinedMessage#
							AVS Response Code: #Response.AVSResponseCode# 
							Transaction FileID: #Response.TransFileName#
							</cfmail>
							
							
							
					     </cfif> 
					<cfif Response.ReturnCode LT 1>
							   <cfset x = ArrayAppend(ErrorList, "Your Transaction encountered a the following problem: (Error Code: #Response.ReturnCode#) <strong>#Response.AuthDeclinedMessage2#</strong>")> 
							<cfelseif Response.ReturnCode EQ 1 AND Response.AuthCode EQ "EMPTY" AND Response.AuthDeclinedMessage NEQ "">
							   <cfset x = ArrayAppend(ErrorList, "#Response.AuthDeclinedMessage#")> 
							</cfif>
					
				</CFIF>



                <cfset NErrors = ArrayLen(ErrorList)> 
				
				 <cfif NErrors gt 0>
				
					<font face="Verdana,Arial" size="-1">
					<h4><font color="Maroon">Problem(s) were encountered with your online payment transaction</font></h4>
					<p>Your transaction could not be completed because:</p>
					<ol>
					<cfloop INDEX="i" FROM="1" TO="#NErrors#">
					<cfoutput><li><p>#ErrorList[i]#</p></li></cfoutput>
					</cfloop>
					</ol>
					<div align=center><form><input type="Button" name="" value="Click here to correct Errors Now" align="ABSMIDDLE" onclick="history.back()"></form></div>
					</font>
				
				<cfelse>
				
					<CFMODULE Template="#Application.TagDir#/AuditLog.cfm" Action="Register" Message="Credit Payment of #DollarFormat(GetProduct.PerUnitPrice)# for Donation to IPRF has been processed">
				
					<CFQUERY Name="AddRec" Datasource="#Application.DSN#">
						INSERT into Donors
							(DonorName,
							Addr1,
							Addr2,
							City,
							StAbbr,
							Zip,
							Phone,
							Email,
							ToRecognize,
							DonationAmt,
							DonationDate,
							TransactionID
							)
						VALUES
							('#Form.DonorName#',
							 '#form.donoraddr#',
							 <cfif form.donORADDR2 neq"">'#form.donoraddr2#'<cfelse>NULL</cfif>,
							 '#Form.donorCity#',
							 '#Form.donorState#',
							 '#Form.donorZip#',
							 '#Form.donorPhone#',
							 '#Form.donorEmail#',
							 '#Form.donorRecognize#',
							  #getproduct.PerUnitPrice#,
							  #CreateODBCDate(now())#,
							 0
							)
					</CFQUERY>
					
					<cfquery name="GetID" datasource="#Application.DSN#">
						SELECT TOP 1 DonorID From Donors
							WHERE DonorNAme = '#DonorName#'
							AND City = '#DonorCity#'
							AND DonationDate = #CreateODBCDate(Now())#
							AND DonationAmt = #GetProduct.PerUnitPrice#
					</cfquery>
				
					 
					<CFQUERY Name="AddRec" Datasource="#Application.DSN#">
						INSERT into Transactions
							(InvoiceID,
							 TransType,
							 PurchaseCode,
							 OrderNum,
							 CardHolder,
							 CardAddress,
							 CardCity,
							 CardState,
							 CardZip,
							 CardType,
							 CardNbr,
							 CardExpMonth,
							 CardExpYear,
							 Amount,
							 Status,
							 AuthResponse,
							 AuthTransID,
							 DateAuthorized
							)
						VALUES
							(#GetID.DonorID#,
							 'Credit',
							 'DONOR',
							 '#OrderNumber#', 
							 '#Form.CardName#',
							 '#Form.BillAddress#',
							 '#Form.BillCity#',
							 '#Form.BillState#',
							 '#Form.BillZip#',
							 '#Form.CardType#',
							 '#FormattedCC#',
							 #Form.XMonth#,
							 #Form.XYear#,
							 #getproduct.PerUnitPrice#,
							 '#Response.ReturnCode#',
							 '#Response.AVSResponseMessage#',
							 '#Response.TransFileName#',
							 #now()#
							)
					</CFQUERY>
				     
					 <cfquery name="GetTransID" datasource="#Application.dsn#">
					   Select TransID 
					   From Transactions
					   Where OrderNum = '#OrderNumber#'
					 </cfquery> 
					 
					 <cfquery name="UpdateDonor" datasource="#Application.dsn#">
					   Update Donors
					     Set TransactionID = #GetTransID.TransID#
					   Where DonorID = #GetID.DonorID#
					 </cfquery> 
					 
					 
					 
					 <meta http-equiv="refresh" content="0;url=/Affiliations/Foundation/PaymentConfirmation.cfm?DonID=#GetID.DonorID#&OID=#ordernumber#">
					<!--- <cflocation url="/Affiliations/Foundation/PaymentConfirmation.cfm?DonID=#GetID.DonorID#&OID=#ordernumber#" addtoken="No"> --->
				
				</cfif>

			</cfif>
	   <br><br>
		 </td>
     </tr>
</table>  
</cfoutput>
<cfmodule template="#Application.footer#">