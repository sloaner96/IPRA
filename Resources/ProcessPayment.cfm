
<CFMODULE Template="#Application.Header#" Heading="IPRA Commercial Membership Application">

<cfset ErrorList = ArrayNew(1)>
<!--- Check For General Content Errors --->

<!--- Check Member--->
<CFIF Form.shipname is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Ship To</b> field")>
</CFIF>

<CFIF Form.email is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>email</b>e</b> field")>
</CFIF>

<!--- <cftry>
<cfinvoke 
 webservice="http://www.webservicex.net/ValidateEmail.asmx?WSDL"
 method="isValidEMail"
 returnvariable="isValidEMailRet">
	<cfinvokeargument name="emailAddress" value="#form.Email#"/>
</cfinvoke>
<cfcatch type="ANY">
  <cfset IsValidEmailRet = true>
</cfcatch>

</cftry> --->
<cfset isValidEMailRet = True>
<CFIF NOT isValidEMailRet>
	<cfset x = ArrayAppend(ErrorList, "The Email you specified is not valid.")>
</CFIF>

<CFIF form.phone is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Phone/b> field")>
</CFIF>

<CFIF Form.addr is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Address</b> field")>
</CFIF>

<CFIF Form.city is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>City</b> field")>
</CFIF>

<CFIF Form.State is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>State</b> field")>
</CFIF>

<CFIF Form.Zip is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>ZipCode</b> field")>
</CFIF>



<!--- Check Product type  --->
<CFIF Not IsDefined("Form.productID")>
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Product ID</b> field")>
</CFIF>

<CFIF Not IsDefined("Form.ProdQty")>
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Product Qunatity</b> field")>
</CFIF>

<!--- Check that PayType Content --->
<CFIF Form.Paytype EQ "C">
       <CFIF Form.BillAddress is "">
			<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Billing Address</b> field")>
		</CFIF>
		
		<CFIF Form.BillCity is "">
			<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Billing City</b> field")>
		</CFIF>
		
		<CFIF Form.BillState is "">
			<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Billing State</b> field")>
		</CFIF>
		
		<CFIF Form.BillZip is "">
			<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Billing Zip</b> field")>
		</CFIF>
		
		<CFIF Form.CardType is "*">
			<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Credit Card</b> field")>
		</CFIF>
		
		<CFIF Form.CardNbr is "">
			<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Card Number</b> field")>
		</CFIF>
		
		<CFIF Form.CardName is "">
			<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Card Holder</b> field")>
		</CFIF>
		
		<CFIF Form.XMonth is "">
			<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Expiration Month</b> field")>
		</CFIF>
		
		<CFIF Form.XYear is "">
			<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Expiration Year</b> field")>
		</CFIF>
	
<cfelseif Paytype EQ "P">
    <CFIF Form.PONumber is "">
			<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Purchase Order</b> field")>
	</CFIF>	
</CFIF>


 <cfset NErrors = ArrayLen(ErrorList)> 




<!--- Get The Cost --->
<cfquery name="GetProduct" datasource="#Application.dsn#">
  Select *
  From Products
  Where ProductID = #form.ProductID#
</cfquery>

<cfset TotalCost = (GetProduct.PerUnitPrice * form.ProdQty)>


<CFIF ArrayLen(ErrorList) is 0>
<!--- Check For Specific Erros Based On Pay Type --->
     <cfset OrderNumber = "STOR-#RandRange(1,9)##RandRange(1,9)##chr(RandRange(65,90))##RandRange(1,9)##chr(RandRange(65,90))#">				
      <!--- Payment Is Via Credit Card --->
	<cfif form.PayType EQ "C">
			
			
			
			<cfset AuthResponse = "">
			<cfset AuthReasonText = "">
			
			
			   
				  <cfset FormattedCC = ReplaceList(Form.CardNbr, "-,/, ,\", "")>
				  
				
					<CFMODULE Template="#Application.TagDir#/Skipjack.cfm"
								Server = "#Application.SysInfo.SysURL#" 
								SJName = "#form.CardName#" 
								Email = "#Form.Email#"
								StreetAddress = "#Form.BillAddress#" 
								City = "#Form.BillCity#" 
								State = "#Form.BillState#" 
								Zipcode = "#form.BillZip#" 
								OrderNumber = "#OrderNumber#" 
								AccountNumber = "#FormattedCC#" 
								Month = "#form.XMonth#" 
								Year = "#Form.XYear#" 
								SerialNumber = "#Application.SysInfo.SerialNumber#" 
								Transactionamount = "#NumberFormat(TotalCost, 0.00)#" 
								OrderString = "1~IPRA Store:#GetProduct.ProductName#~#TotalCost#~||" 
								ShipToPhone = "#form.Phone#">
							
						 <cfif Response.ISApproved EQ 0>
							<cfset x = ArrayAppend(ErrorList, "Your Credit transaction failed with the Reason: '<b>#Response.AuthDeclinedMessage#</b>' (Code #Response.ReturnCode#).  Please review the information you provided on the previous page and try again.")>
<cfmail to="webmaster@ilipra.org" from="webmaster@ilipra.org" bcc="webmaster@x2-interactive.com"  Subject="Credit Authorization Failure on ILIPRA.ORG" server="#Application.mailserver#"  username="#Application.MailUser#" password="#Application.MailPassword#">
Date: #DateFormat(now(), 'mm/dd/yyyy')#
Time: #TimeFormat(now(), 'hh:mm:ss TT')#

#Form.CardType# Payment for #getProduct.ProductName#
Name: #Form.CardName#
Card: #Form.CardNbr#  expires: #Form.XMonth#/#Form.XYear#
Amount: #DollarFormat(TotalCost)#

Error: #Response.ReturnCode# - #Response.AuthDeclinedMessage#
AVS Response Code: #Response.AVSResponseCode# 
Transaction FileID: #Response.TransFileName#
</cfmail>
							
							<cfif Response.ReturnCode LT 1>
							   <cfset x = ArrayAppend(ErrorList, "Your Transaction encountered a the following problem: (Error Code: #Response.ReturnCode#) <strong>#Response.AuthDeclinedMessage2#</strong>")> 
							<cfelseif Response.ReturnCode EQ 1 AND Response.AuthCode EQ "EMPTY" AND Response.AuthDeclinedMessage NEQ "">
							   <cfset x = ArrayAppend(ErrorList, "Your Transaction encountered a the following problem: (Error Code: #Response.ReturnCode#) #Response.AuthDeclinedMessage#")> 
							</cfif>
							
					     </cfif> 
						 <cfif ArrayLen(ErrorList) gt 0>
								<font face="Verdana,Arial" size="-1">
								<h4><font color="Maroon">Problem(s) were encountered with your online payment transaction</font></h4>
								<p>Your transaction could not be completed because:</p>
								<ol>
								<cfloop INDEX="i" FROM="1" TO="#ArrayLen(ErrorList)#">
								<cfoutput><li><p>#ErrorList[i]#</p></li></cfoutput>
								</cfloop>
								</ol>
								<div align=center><form><input type="Button" name="" value="Click here to correct Errors Now" align="ABSMIDDLE" onclick="history.back()"></form></div>
								</font>
							
						 <cfelse>
		                      
							<!--- Add Member --->
								<CFQUERY Name="AddRec" Datasource="#Application.DSN#">
									Insert into Orders ( 
									          MemberID,
											  ContactName,
											  ContactAddress1,
											  ContactCity,
											  ContactState,
											  ContactZip,
											  ContactEmail,
											  TransID,
											  OrderNUm,
											  OrderDate,
											  OrderQuantity,
											  ProductID,
											  OrderTotal,
											  OrderStatus,
											  DateAdded
											  )
									Values (
									          <cfif IsDefined("Session.userinfo.memberid")>#Session.userinfo.memberid#<cfelse>NULL</cfif>,
											  '#form.shipname#',
											  '#form.addr#',
											  '#form.city#',
											  '#form.State#',
											  '#form.Zip#',
											  '#form.email#',
											   0,
											   '#OrderNUMber#',
											  #CreateODBCDateTime(Now())#,
											  #form.ProdQty#,
											  #GetProduct.ProductID#,
											  #TotalCost#,
											  'NEW',
											  #CreateODBCDateTime(Now())#
											  )		  
								</CFQUERY>
								
								<cfquery name="GetID" datasource="#Application.DSN#">
									SELECT TOP 1 * From orders
									Where OrderNUm = '#OrderNumber#'
								</cfquery>
							
								 
								<CFQUERY Name="AddTran" Datasource="#Application.DSN#">
									INSERT into Transactions
										(orderID,
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
										(#GetID.OrderID#,
										 'CREDIT',
										 'STORE',
										 '#OrderNumber#', 
										 '#Form.CardName#',
										 '#Form.Addr#',
										 '#Form.City#',
										 '#Form.State#',
										 '#Form.Zip#',
										 '#Form.CardType#',
										 '#FormattedCC#',
										 #Form.XMonth#,
										 #Form.XYear#,
										 #TotalCost#,
										 '#Response.ReturnCode#',
										 '#Response.AVSResponseMessage#',
										 '#Response.TransFileName#',
										 #now()#
										)
								</CFQUERY>
								
<cfmail to="dean@ilipra.org" from="Webmaster@ilipra.org" subject="New Store Purchase Via PO" server="#Application.mailserver#"  username="#Application.MailUser#" password="#Application.MailPassword#">
   The following information was received via the ILIPRA.org website. The user submitted a request to purchase #getproduct.ProductName# with a Purchase Order.
   
   Shipping Information:
   Contact: #form.shipname#
   Email:#form.email# 
   PHONE:#form.phone#
   Ship To: #form.addr#
            #form.addr2#
            #form.city#, #form.State# #form.zip#
 
 
   #GetProduct.ProductID# #getProduct.ProductName#
   #form.ProdQty# X #DollarFormat(GetProduct.PerUnitPrice)# =  Total Cost: #DollarFormat(TotalCost)#
   
   PAYMENT VIA Credit Card: #Form.CardType#
   
</cfmail>
<cfmail to="#form.email#" from="Webmaster@ilipra.org" subject="Thank You for your Order at ILIPRA.ORG" server="#Application.mailserver#"  username="#Application.MailUser#" password="#Application.MailPassword#">
   Thank you for your purchase at ILIPRA.ORG. Your Item will be shipped shortly.
   
   
   Shipping Information:
   Contact: #form.shipname#
   Email:#form.email# 
   PHONE:#form.phone#
   Ship To: #form.addr#
            #form.addr2#
            #form.city#, #form.State# #form.zip#
 
 
   #getProduct.ProductName#
   #form.ProdQty# X #DollarFormat(GetProduct.PerUnitPrice)# =  Total Cost: #DollarFormat(TotalCost)#
   
   PAYMENT VIA Credit Cardr: #Form.CardType#
   
   

</cfmail>
								
				    <CFMODULE Template="#Application.TagDir#/AuditLog.cfm" Action="STOR" Message="Credit Card Payment of #DollarFormat(TotalCost)# for '#getProduct.ProductName#' has been processed">	
					<cfoutput><meta http-equiv="refresh" content="0;url=/Resources/PaymentConfirmation.cfm?orderID=#GetID.OrderID#"> </cfoutput>      
					<!--- <cflocation url="/Resources/PaymentConfirmation.cfm?orderID=#GetID.OrderID#" addtoken="No"> --->
							</cfif>
						 
				 	 
			<cfelse>
				    <!--- Payment is Via Purchase Order --->	
								<!--- Add Member --->
								<CFQUERY Name="AddRec" Datasource="#Application.DSN#">
									Insert into Orders ( 
									          MemberID,
											  ContactName,
											  ContactAddress1,
											  ContactCity,
											  ContactState,
											  ContactZip,
											  ContactEmail,
											  TransID,
											  OrderNum,
											  OrderDate,
											  OrderQuantity,
											  ProductID,
											  OrderTotal,
											  OrderStatus,
											  DateAdded
											  )
									Values (
									          <cfif IsDefined("Session.userinfo.memberid")>#Session.userinfo.memberid#<cfelse>NULL</cfif>,
											  '#form.shipname#',
											  '#form.addr#',
											  '#form.city#',
											  '#form.State#',
											  '#form.Zip#',
											  '#form.email#',
											   0,
											   '#OrderNUmber#',
											  #CreateODBCDateTime(Now())#,
											  #form.ProdQty#,
											  #GetProduct.ProductID#,
											  #TotalCost#,
											  'NEW',
											  #CreateODBCDateTime(Now())#
											  )		  
								</CFQUERY>
								
								<cfquery name="GetID" datasource="#Application.DSN#">
									SELECT TOP 1 * From orders
									Where OrderNUm = '#OrderNumber#'
								</cfquery>
							
								 
								<CFQUERY Name="AddTran" Datasource="#Application.DSN#">
									INSERT into Transactions
										(orderID,
										 TransType,
										 PurchaseCode,
										 OrderNum,
										 CardHolder,
										 CardAddress,
										 CardCity,
										 CardState,
										 CardZip,
										 PONumber,
										 Amount,
										 Status,
										 AuthResponse,
										 AuthTransID,
										 DateAuthorized
										)
									VALUES
										(#GetID.OrderID#,
										 'PO',
										 'STORE',
										 '#OrderNumber#', 
										 '#form.shipname#',
										 '#Form.Addr#',
										 '#Form.City#',
										 '#Form.State#',
										 '#Form.Zip#',
										 '#form.PONumber#',
										 #TotalCost#,
										 NULL,
										 NULL,
										 NULL,
										 #now()#
										)
								</CFQUERY>
								
<cfmail to="dean@ilipra.org" from="Webmaster@ilipra.org" subject="New Store Purchase Via PO" server="#Application.mailserver#"  username="#Application.MailUser#" password="#Application.MailPassword#">
   The following information was received via the ILIPRA.org website. The user submitted a request to purchase #getproduct.ProductName# with a Purchase Order.
   
   Shipping Information:
   Contact: #form.shipname#
   Email:#form.email# 
   PHONE:#form.phone#
   Ship To: #form.addr#
            #form.addr2#
            #form.city#, #form.State# #form.zip#
 
 
   #GetProduct.ProductID# #getProduct.ProductName#
   #form.ProdQty# X #DollarFormat(GetProduct.PerUnitPrice)# =  Total Cost: #DollarFormat(TotalCost)#
   
   PAYMENT VIA Purchase order: #Form.PoNumber#
   
</cfmail>
<cfmail to="#form.email#" from="Webmaster@ilipra.org" subject="Thank You for your Order at ILIPRA.ORG" server="#Application.mailserver#"  username="#Application.MailUser#" password="#Application.MailPassword#">
   Thank you for your purchase at ILIPRA.ORG. Your Item will be shipped shortly.
   
   
   Shipping Information:
   Contact: #form.shipname#
   Email:#form.email# 
   PHONE:#form.phone#
   Ship To: #form.addr#
            #form.addr2#
            #form.city#, #form.State# #form.zip#
 
 
   #getProduct.ProductName#
   #form.ProdQty# X #DollarFormat(GetProduct.PerUnitPrice)# =  Total Cost: #DollarFormat(TotalCost)#
   
   PAYMENT VIA Purchase order: #Form.PoNumber#
   
   

</cfmail>
	<CFMODULE Template="#Application.TagDir#/AuditLog.cfm" Action="STOR" Message="Purchase Order Payment (PO NUMBER #Form.PONumber# of #DollarFormat(TotalCost)# for '#getProduct.ProductName#' has been processed.">	
	<cfoutput><meta http-equiv="refresh" content="0;url=/Resources/PaymentConfirmation.cfm?OrderID=#GetID.OrderID#"></cfoutput>				       
	<!--- <cflocation url="/Resources/PaymentConfirmation.cfm?OrderID=#GetID.OrderID#" addtoken="No"> --->
							
					
			</cfif>
<cfelse>
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
</cfif>

 

<cfmodule template="#Application.tagdir#/footer.cfm">