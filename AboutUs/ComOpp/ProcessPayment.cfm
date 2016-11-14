
<CFMODULE Template="#Application.Header#" Heading="IPRA Commercial Membership Application">

<cfset ErrorList = ArrayNew(1)>
<!--- Check For General Content Errors --->

<!--- Check Member--->
<CFIF Form.repfname is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Company Representative firstname</b> field")>
</CFIF>

<CFIF Form.replname is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Company Representative lastname</b> field")>
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

<CFIF Form.company is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Company Name</b> field")>
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

<CFIF Form.Zipcode is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>ZipCode</b> field")>
</CFIF>

<CFIF Form.phone is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Phone</b> field")>
</CFIF>
<CFIF Form.Prodservice is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Product Services</b> field")>
</CFIF>


<!--- Check Member type  --->
<CFIF Not IsDefined("Form.mbrdues")>
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Membership Dues</b> field")>
</CFIF>

<CFIF Not IsDefined("Form.SpecialSection")>
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Special Section</b> field")>
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
  Where ProductID = #form.Mbrdues#
</cfquery>

<cfif Form.Discount Is True>
    <cfset DiscountPrice = (GetProduct.PerUnitPrice * .50)>
<cfelse>
    <cfset DiscountPrice = GetProduct.PerUnitPrice> 	
</cfif>


<CFIF ArrayLen(ErrorList) is 0>
<!--- Check For Specific Erros Based On Pay Type --->
     <cfset OrderNumber = "CMBR-#RandRange(1,9)##RandRange(1,9)##chr(RandRange(65,90))##RandRange(1,9)##chr(RandRange(65,90))#">
	 <cfset GenPassword  = "i#RandRange(1,9)##RandRange(1,9)##chr(RandRange(65,90))#p#RandRange(1,9)#r#chr(RandRange(65,90))#a">
	 
	 <cfif month(now()) NEQ 12>
	    <cfset currentyear = year(now())>
       	<cfset Currentyear = currentyear + 1 > 
	    <cfset ExpireDate   = CreateDate(#currentyear#, 1, 1)>
	 <cfelse>
	    <cfset currentyear = year(now())>
       	<cfset Currentyear = currentyear + 2 >
	    <cfset ExpireDate   = CreateDate(#currentyear#, 1, 1)>	
     </cfif> 					
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
								Transactionamount = "#NumberFormat(DiscountPrice, 0.00)#" 
								OrderString = "1~IPRA Commercial Membership:#GetProduct.ProductName#~#DiscountPrice#~||" 
								ShipToPhone = "#form.Phone#">
							
						 <cfif Response.ISApproved EQ "0">
							<cfset x = ArrayAppend(ErrorList, "Your Credit transaction failed with the Reason: '<b>#Response.AuthDeclinedMessage#</b>' (Code #Response.ReturnCode#).  Please review the information you provided on the previous page and try again.")>
<cfmail to="webmaster@ilipra.org" from="webmaster@ilipra.org" bcc="webmaster@x2-interactive.com"  Subject="Credit Authorization Failure on ILIPRA.ORG for Commerical Membership" server="#Application.mailserver#" username="#Application.MailUser#" password="#Application.MailPassword#">
Date: #DateFormat(now(), 'mm/dd/yyyy')#
Time: #TimeFormat(now(), 'hh:mm:ss TT')#

#Form.CardType# Payment for #Form.Company#
Name: #Form.CardName#
Card: #Form.CardNbr#  expires: #Form.XMonth#/#Form.XYear#
Amount: #DollarFormat(DiscountPrice)#

Error: #Response.ReturnCode# - #Response.AuthDeclinedMessage#
AVS Response Code: #Response.AVSResponseCode# 
Transaction FileID: #Response.TransFileName#
</cfmail>
							
					     </cfif> 
						 <cfif Response.ReturnCode LT 1>
							   <cfset x = ArrayAppend(ErrorList, "Your Transaction encountered a the following problem: (Error Code: #Response.ReturnCode#) <strong>#Response.AuthDeclinedMessage2#</strong>")> 
							<cfelseif Response.ReturnCode EQ 1 AND Response.AuthCode EQ "EMPTY" AND Response.AuthDeclinedMessage NEQ "">
							   <cfset x = ArrayAppend(ErrorList, "Your Transaction encountered a the following problem: (Error Code: #Response.ReturnCode#) #Response.AuthDeclinedMessage#")> 
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
									INSERT into members
										(MemberType, 
										 MbrCategory,
										 PrimarySection,
										 MembershipBegin,
										 MembershipExpire,
										 FirstName,
										 LastName,
										 Company,
										 Address1,
										 Address2,
										 City,
										 State,
										 Zipcode,
										 MainPhone,
										 Fax,
										 Email,
										 Website,
										 Password,
										 DateAdded
										)
									VALUES
										('CO',
										 '#Form.Mbrdues#', 
										 '#form.SpecialSection#',
										 #CreateODBCDate(now())#,
										 #CreateODBCDate(ExpireDate)#,
										 '#form.RepFname#',
										 '#form.RepLname#',
										 '#form.Company#',
										 '#form.Addr#',
										 <cfif form.addr2 NEQ "">'#form.addr2#'<cfelse>NULL</cfif>,
									     '#form.City#',
										 '#form.state#',
										 '#form.Zipcode#',
										 '#form.phone#',
										 '#form.fax#',
										 '#form.email#',
										 <cfif form.website NEQ "">'#form.website#'<cfelse>NULL</cfif>,
										 '#genpassword#',
										 #CreateODBCDATETIME(NOW())#
										)
								</CFQUERY>
								
								<cfquery name="GetID" datasource="#Application.DSN#">
									SELECT TOP 1 * From Members
									Where MemberType = 'CO'
									AND Firstname = '#form.RepFname#'
									AND lastname = '#form.RepLname#'
									AND company = '#form.Company#'
									AND Password = '#genpassword#'
								</cfquery>
							
								 
								<CFQUERY Name="AddTran" Datasource="#Application.DSN#">
									INSERT into Transactions
										(MemberID,
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
										(#GetID.MemberID#,
										 'CREDIT',
										 'CMBR',
										 '#OrderNumber#', 
										 '#Form.CardName#',
										 '#Form.Addr#',
										 '#Form.City#',
										 '#Form.State#',
										 '#Form.Zipcode#',
										 '#Form.CardType#',
										 '#FormattedCC#',
										 #Form.XMonth#,
										 #Form.XYear#,
										 #DiscountPrice#,
										 '#Response.ReturnCode#',
										 '#Response.AVSResponseMessage#',
										 '#Response.TransFileName#',
										 #now()#
										)
								</CFQUERY>
								
<cfmail to="polly@ilipra.org" from="Webmaster@ilipra.org" subject="New Commercial Membership Via CreditCard" server="#Application.mailserver#" username="#Application.MailUser#" password="#Application.MailPassword#">
   The following information was received via the ILIPRA.org website. The user submitted a request for membership with a payment type of Purchase Order.
   
   Registration Information:
   Contact: #form.Repfname# #form.replname#
   Email:#form.email#
   
   Company: #form.Company#
   #form.addr#
   #form.addr2#
   #form.city#, #form.State# #form.zipcode#
   
   PHONE:#form.phone#
   FAX: #form.fax#
   
   Toll Free#form.tollfree#
   Website: #form.website#
   
   PAYMENT VIA Credit Card: #Form.CardType#
   Total Cost: #DollarFormat(DiscountPrice)#
</cfmail>

<cfmail to="#form.email#" from="Webmaster@ilipra.org" subject="Welcome to the IPRA" server="#Application.mailserver#" username="#Application.MailUser#" password="#Application.MailPassword#">
   Thank you for joining the IPRA as a Commercial member. You will be able to login into the ipra website and 
   manage your information, as well as view Members only content:
   
   Login URL: <a href="#Application.baseurl#/MembersOnly/">#Application.baseurl#/MembersOnly/</a>
   Username: #Form.email#
   Password: #GenPassword#
   
   Registration Information:
   Contact: #form.Repfname# #form.replname#
   Email:#form.email#
   
   Company: #form.Company#
   #form.addr#
   #form.addr2#
   #form.city#, #form.State# #form.zipcode#
   
   PHONE:#form.phone#
   FAX: #form.fax#
   
   Toll Free#form.tollfree#
   Website: #form.website#
   
   PAYMENT VIA Credit Card: #Form.CardType#
   
   Total Cost: #DollarFormat(DiscountPrice)#
</cfmail>
								
				    <CFMODULE Template="#Application.TagDir#/AuditLog.cfm" Action="CMBR" Message="Credit Card Payment of #DollarFormat(DiscountPrice)# for '#Form.Company#' has been processed for a Commercial Membership">	
					<cfoutput>
					<meta http-equiv="refresh" content="0;url=/AboutUS/ComOpp/PaymentConfirmation.cfm?mbrID=#GetID.memberID#&OID=#OrderNumber#">       
					</cfoutput>
					<!--- <cflocation url="/AboutUS/ComOpp/PaymentConfirmation.cfm?mbrID=#GetID.memberID#&OID=#OrderNumber#" addtoken="No"> --->
							</cfif>
						 
				 	 
			<cfelse>
				    <!--- Payment is Via Purchase Order --->	
								<!--- Add Member --->
								<CFQUERY Name="AddRec" Datasource="#Application.DSN#">
									INSERT into members
										(MemberType, 
										 MbrCategory,
										 PrimarySection,
										 MembershipBegin,
										 MembershipExpire,
										 FirstName,
										 LastName,
										 Company,
										 Address1,
										 Address2,
										 City,
										 State,
										 Zipcode,
										 MainPhone,
										 Fax,
										 Email,
										 Website,
										 Password,
										 DateAdded
										)
									VALUES
										('CO',
										 '#Form.Mbrdues#', 
										 '#form.SpecialSection#',
										 #CreateODBCDate(now())#,
										 #CreateODBCDate(ExpireDate)#,
										 '#form.RepFname#',
										 '#form.RepLname#',
										 '#form.Company#',
										 '#form.Addr#',
										 <cfif form.addr2 NEQ "">'#form.addr2#'<cfelse>NULL</cfif>,
									     '#form.City#',
										 '#form.state#',
										 '#form.Zipcode#',
										 '#form.phone#',
										 '#form.fax#',
										 '#form.email#',
										  <cfif form.website NEQ "">'#form.website#'<cfelse>NULL</cfif>,
										 '#genpassword#',
										 #CreateODBCDATETIME(NOW())#
										)
								</CFQUERY>
								
								<cfquery name="GetID" datasource="#Application.DSN#">
									SELECT TOP 1 * From Members
									Where MemberType = 'CO'
									AND Firstname = '#form.RepFname#'
									AND lastname = '#form.RepLname#'
									AND company = '#form.Company#'
									AND Password = '#genpassword#'
								</cfquery>
							
								 
								<CFQUERY Name="AddTran" Datasource="#Application.DSN#">
									INSERT into Transactions
										(MemberID,
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
										(#GetID.MemberID#,
										 'PO',
										 'CMBR',
										 '#OrderNumber#', 
										 '#Form.Company#',
										 '#Form.Addr#',
										 '#Form.City#',
										 '#Form.State#',
										 '#Form.Zipcode#',
										 '#form.PONumber#',
										 #DiscountPrice#,
										 NULL,
										 NULL,
										 NULL,
										 #now()#
										)
								</CFQUERY>
								
<cfmail to="polly@ilipra.org" from="Webmaster@ilipra.org" subject="New Commercial Membership Via PO" server="#Application.mailserver#" username="#Application.MailUser#" password="#Application.MailPassword#">
   The following information was received via the ILIPRA.org website. The user submitted a request for membership with a payment type of Purchase Order.
   
   #form.Repfname# #form.replname#
   #form.Company#
   #form.addr#
   #form.addr2#
   #form.city#, #form.State# #form.zipcode#
   
   #form.phone#
   #form.fax#
   
   #form.tollfree#
   #form.website#
   
   PAYMENT VIA PUCHASE ORDER: #form.PONumber#
   Total Cost: #DollarFormat(DiscountPrice)#
</cfmail>
<cfmail to="#form.email#" from="Webmaster@ilipra.org" subject="Welcome to the IPRA" server="#Application.mailserver#" username="#Application.MailUser#" password="#Application.MailPassword#">
   Thank you for joining the IPRA as a Commercial member. You will be able to login into the ipra website and 
   manage your information, as well as view Members only content:
   
   Login URL: <a href="#Application.baseurl#/MembersOnly/">#Application.baseurl#/MembersOnly/</a>
   Username: #Form.email#
   Password: #GenPassword#
   
   Registration Information:
   Contact: #form.Repfname# #form.replname#
   Email:#form.email#
   
   Company: #form.Company#
   #form.addr#
   #form.addr2#
   #form.city#, #form.State# #form.zipcode#
   
   PHONE:#form.phone#
   FAX: #form.fax#
   
   Toll Free#form.tollfree#
   Website: #form.website#
   
   PAYMENT VIA Purchase order: #Form.PoNumber#
   
   Total Cost: #DollarFormat(DiscountPrice)#

</cfmail>
				    <CFMODULE Template="#Application.TagDir#/AuditLog.cfm" Action="CMBR" Message="Purchase Order Payment (PO NUMBER #Form.PONumber# of #DollarFormat(DiscountPrice)# for '#Form.Company#' has been processed for a Commercial Membership">	
					<cfoutput><meta http-equiv="refresh" content="0;url=/AboutUS/ComOpp/PaymentConfirmation.cfm?mbrID=#GetID.memberID#&OID=#OrderNumber#">  </cfoutput>     
					<!--- <cflocation url="/AboutUS/ComOpp/PaymentConfirmation.cfm?mbrID=#GetID.memberID#&OID=#OrderNumber#" addtoken="No"> --->
							
					
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