
<CFMODULE Template="#Application.Header#" Heading="IPRA Commercial Membership Application">

<cfset ErrorList = ArrayNew(1)>
<!--- Check For General Content Errors --->
<!--- Check Agency --->
<CFIF Form.AgencyName is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Agency Name</b> field")>
</CFIF>
<CFIF Form.agaddr1 is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Agency Address</b> field")>
</CFIF>
<CFIF Form.agcity is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Agency City</b> field")>
</CFIF>
<CFIF Form.agState is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Agency State</b> field")>
</CFIF>
<CFIF Form.agZip is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Agency ZipCode</b> field")>
</CFIF>
<CFIF Form.agPhone is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Phone</b> field")>
</CFIF>



<!--- Check Member--->
<CFIF Form.firstname is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Firstname</b> field")>
</CFIF>

<CFIF Form.Lastname is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Lastname</b> field")>
</CFIF>

<CFIF Form.title is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Title</b> field")>
</CFIF>

<CFIF Form.email is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Email</b>e</b> field")>
<cfelse>
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

</CFIF>



<!--- Check Member type  --->
<CFIF Not IsDefined("Form.mbrdues")>
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Membership Dues</b> field")>
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

<cfset TotalCost = DiscountPrice>
<cfset TotalSectionCost = 0.00>

<cfif IsDefined("form.Specialsection")>
	<cfif ListLen(form.specialsection) GT 0>
	   <cfset FreeSection = GetProduct.BonusSection>
	   <cfloop index="i" List="#form.SpecialSection#">
	       <cfquery name="GetSpecSec" datasource="#Application.dsn#">
			  Select *
			  From Products
			  Where ProductID = #i#
			</cfquery>
			
			<cfset TotalSectionCost = TotalSectionCost + GetSpecSec.PerUnitPrice>
			
	   </cfloop>
	   
	    <cfif FreeSection NEQ 0>
	       <cfset TotalSectionCost = (TotalSectionCost - 15.00)>  
		</cfif>  
		
	</cfif>
</cfif>

<cfif TotalSectionCost NEQ 0.00>
  <cfset TotalCost = TotalCost + TotalSectionCost>
</cfif>

<CFIF ArrayLen(ErrorList) is 0>
<!--- Check For Specific Erros Based On Pay Type --->
     <cfset OrderNumber = "MBR-#RandRange(1,9)##RandRange(1,9)##chr(RandRange(65,90))##RandRange(1,9)##chr(RandRange(65,90))#">
	 <cfset GenPassword  = "i#RandRange(1,9)##RandRange(1,9)##chr(RandRange(65,90))#P#RandRange(1,9)#r#chr(RandRange(65,90))#a1">
	 
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
								Transactionamount = "#NumberFormat(TotalCost, 0.00)#" 
								OrderString = "1~IPRA Membership:#GetProduct.ProductName#~#TotalCost#~||" 
								ShipToPhone = "#form.agPhone#">
							
						 <cfif Response.ISApproved EQ "0">
							<cfset x = ArrayAppend(ErrorList, "Your Credit transaction failed with the Reason: '<b>#Response.AuthDeclinedMessage#</b>' (Code #Response.ReturnCode#).  Please review the information you provided on the previous page and try again.")>
<cfmail to="webmaster@ilipra.org" from="webmaster@ilipra.org" bcc="webmaster@x2-interactive.com"  Subject="Credit Authorization Failure on ILIPRA.ORG" server="#Application.mailserver#" username="#Application.MailUser#" password="#Application.MailPassword#">
Date: #DateFormat(now(), 'mm/dd/yyyy')#
Time: #TimeFormat(now(), 'hh:mm:ss TT')#

#Form.CardType# Payment for #form.agencyname#
Name: #Form.CardName#
Card: #Form.CardNbr#  expires: #Form.XMonth#/#Form.XYear#
Amount: #DollarFormat(TotalCost)#

Error: #Response.ReturnCode# - #Response.AuthDeclinedMessage#
AVS Response Code: #Response.AVSResponseCode# 
Transaction FileID: #Response.TransFileName#
</cfmail>
							
							
							
					     </cfif> 
						 <cfif Response.ReturnCode LT 1>
							   <cfset x = ArrayAppend(ErrorList, "Your Transaction encountered a the following problem: (Error Code: #Response.ReturnCode#) <strong>#Response.AuthDeclinedMessage2#</strong>")> 
							<cfelseif Response.ReturnCode EQ 1 AND (Response.AuthCode EQ "EMPTY" AND Response.AuthDeclinedMessage NEQ "")>
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
										 AdditionalSection,
										 MembershipBegin,
										 MembershipExpire,
										 FirstName,
										 LastName,
										 Title,
										 Designation,
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
										 Homeaddr1,
										 Homeaddr2,
										 HomeCity,
										 HomeState,
										 HomeZip,
										 Password,
										 ReferralPerson,
										 PreferredMailing,
										 BillingType,
										 DateAdded
										)
									VALUES
										('IN',
										 '#Form.Mbrdues#', 
										 <cfif IsDefined("form.specialsection")>'#ListGetAt(form.SpecialSection, 1)#',
										 '#form.SpecialSection#', 
										 <cfelse>
										   NULL,
										   NULL,
										 </cfif>
										 #CreateODBCDate(now())#,
										 #CreateODBCDate(ExpireDate)#,
										 '#form.firstname#',
										 '#form.Lastname#',
										 '#form.title#',
										 <cfif form.CertType NEQ "">'#Form.CertType#'<cfelse>NULL</cfif>,
										 '#form.AgencyName#',
										 '#form.agAddr1#',
										 <cfif form.agaddr2 NEQ "">'#form.agaddr2#'<cfelse>NULL</cfif>,
									     '#form.agCity#',
										 '#form.agstate#',
										 '#form.agZip#',
										 '#form.agphone#',
										 <cfif form.agfax NEQ "">'#form.agfax#'<cfelse>NULL</cfif>,
										 '#form.email#',
										 <cfif form.agwebsite NEQ"">'#form.agwebsite#'<cfelse>NULL</cfif>,
										 <cfif form.homeaddr NEQ "">'#form.homeaddr#'<cfelse>NULL</cfif>,
										 <cfif form.homeaddr2 NEQ "">'#form.homeaddr2#'<cfelse>NULL</cfif>,
									     <cfif form.homeCity NEQ "">'#form.homeCity#'<cfelse>NULL</cfif>,
										 <cfif form.homeState NEQ "">'#form.homestate#'<cfelse>NULL</cfif>,
										 <cfif form.homeZipcode NEQ "">'#form.homeZipcode#'<cfelse>NULL</cfif>,
										 '#genpassword#',
										 <cfif len(trim(form.referral)) GT 0>'#Trim(form.referral)#'<cfelse>NULL</cfif>,
										 '#form.wheremail#',
										 '#form.whopays#',
										 #CreateODBCDATETIME(NOW())#
										)
								</CFQUERY>
								
								<cfquery name="GetID" datasource="#Application.DSN#">
									SELECT TOP 1 * From Members
									Where MemberType = 'IN'
									AND Firstname = '#form.firstname#'
									AND lastname = '#form.Lastname#'
									AND company = '#form.agencyname#'
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
										 'MBR',
										 '#OrderNumber#', 
										 '#Form.CardName#',
										 '#form.Billaddress#',
										 '#Form.BillCity#',
										 '#Form.BillState#',
										 '#Form.BillZip#',
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
								
<cfmail to="polly@ilipra.org" from="Webmaster@ilipra.org" subject="New IPRA Individual Membership Via CreditCard" server="#Application.mailserver#" username="#Application.MailUser#" password="#Application.MailPassword#">
   The following information was received via the ILIPRA.org website. The user submitted a request for membership with a payment type of Credit Card.
   
   Registration Information:
   Contact: #form.firstname# #form.Lastname#
   Email:#form.email#
   
   Company: #form.agencyname#
   #form.agaddr1#
   #form.agaddr2#
   #form.agcity#, #form.agState# #form.agZip#
   Prefers Mail to be sent to: #form.wheremail#
   
   #form.agphone#
   #form.agfax#
   
   #form.agwebsite#
   
   Dues Paid by: <cfif form.whopays EQ "ind">Individual<cfelseif form.whopays EQ "Agency">Agency<cfelseif form.whopays EQ "agencyPortion">Agency Pays Portion</cfif>
   <cfif len(trim(form.referral)) GT 0>Referred By: #Trim(form.referral)#</cfif>
   
   PAYMENT VIA Credit Card: #Form.CardType#
   Total Cost: #DollarFormat(TotalCost)#
</cfmail>

<cfmail to="#form.email#" from="Webmaster@ilipra.org" subject="Welcome to the IPRA" server="#Application.mailserver#" username="#Application.MailUser#" password="#Application.MailPassword#">
   Thank you for joining the IPRA. You may now login into the ipra website and 
   manage your information, as well as view Members only content:
   
   Login URL: <a href="#Application.baseurl#/MembersOnly/">#Application.baseurl#/MembersOnly/</a>
   Username: #Form.email#
   Password: #GenPassword#
   
   Registration Information:
   Contact: #form.firstname# #form.Lastname#
   Email:#form.email#
   
   Company: #form.agencyname#
   #form.agaddr1#
   #form.agaddr2#
   #form.agcity#, #form.agState# #form.agZip#
   
   PHONE:#form.agphone#
   FAX: #form.agfax#
   
   Website: #form.agwebsite#
   
   PAYMENT VIA Credit Card: #Form.CardType#
   
   Total Cost: #DollarFormat(TotalCost)#
</cfmail>
								
				    <CFMODULE Template="#Application.TagDir#/AuditLog.cfm" Action="MBR" Message="Credit Card Payment of #DollarFormat(TotalCost)# for '#form.agencyname#' has been processed for a Individual Membership">	
					<cfoutput><meta http-equiv="refresh" content="0;url=/members/PaymentConfirmation.cfm?mbrID=#GetID.memberID#&OID=#OrderNumber#"></cfoutput>       
					<!--- <cflocation url="/members/PaymentConfirmation.cfm?mbrID=#GetID.memberID#&OID=#OrderNumber#" addtoken="No"> --->
							</cfif>
						 
				 	 
			<cfelse>
				    <!--- Payment is Via Purchase Order --->	
								<!--- Add Member --->
								<CFQUERY Name="AddRec" Datasource="#Application.DSN#">
									INSERT into members
										(MemberType, 
										 MbrCategory,
										 PrimarySection,
										 AdditionalSection,
										 MembershipBegin,
										 MembershipExpire,
										 FirstName,
										 LastName,
										 Title,
										 Designation,
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
										 Homeaddr1,
										 Homeaddr2,
										 HomeCity,
										 HomeState,
										 HomeZip,
										 Password,
										 ReferralPerson,
										 PreferredMailing,
										 BillingType,
										 DateAdded
										)
									VALUES
										('IN',
										 '#Form.Mbrdues#', 
										  <cfif IsDefined("form.specialsection")>'#ListGetAt(form.SpecialSection, 1)#',
										 '#form.SpecialSection#', 
										 <cfelse>
										   NULL,
										   NULL,
										 </cfif> 
										 #CreateODBCDate(now())#,
										 #CreateODBCDate(ExpireDate)#,
										 '#form.firstname#',
										 '#form.Lastname#',
										 '#form.title#',
										 <cfif form.CertType NEQ "">'#Form.CertType#'<cfelse>NULL</cfif>,
										 '#form.AgencyName#',
										 '#form.agAddr1#',
										 <cfif form.agaddr2 NEQ "">'#form.agaddr2#'<cfelse>NULL</cfif>,
									     '#form.agCity#',
										 '#form.agstate#',
										 '#form.agZip#',
										 '#form.agphone#',
										 <cfif form.agfax NEQ "">'#form.agfax#'<cfelse>NULL</cfif>,
										 '#form.email#',
										 <cfif form.agwebsite NEQ"">'#form.agwebsite#'<cfelse>NULL</cfif>,
										 <cfif form.homeaddr NEQ "">'#form.homeaddr#'<cfelse>NULL</cfif>,
										 <cfif form.homeaddr2 NEQ "">'#form.homeaddr2#'<cfelse>NULL</cfif>,
									     <cfif form.homeCity NEQ "">'#form.homeCity#'<cfelse>NULL</cfif>,
										 <cfif form.homeState NEQ "">'#form.homestate#'<cfelse>NULL</cfif>,
										 <cfif form.homeZipcode NEQ "">'#form.homeZipcode#'<cfelse>NULL</cfif>,
										 '#genpassword#',
										 <cfif len(trim(form.referral)) GT 0>'#Trim(form.referral)#'<cfelse>NULL</cfif>,
										 '#form.wheremail#',
										 '#form.whopays#',
										 #CreateODBCDATETIME(NOW())#
										)
								</CFQUERY>
								
								<cfquery name="GetID" datasource="#Application.DSN#">
									SELECT TOP 1 * From Members
									Where MemberType = 'IN'
									AND Firstname = '#form.firstname#'
									AND lastname = '#form.Lastname#'
									AND company = '#form.agencyname#'
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
										 'MBR',
										 '#OrderNumber#', 
										 '#form.agencyname#',
										 '#form.agaddr1#',
										 '#Form.agCity#',
										 '#Form.agState#',
										 '#Form.agZip#',
										 '#form.PONumber#',
										 #TotalCost#,
										 NULL,
										 NULL,
										 NULL,
										 #now()#
										)
								</CFQUERY>
								
<cfmail to="polly@ilipra.org" from="Webmaster@ilipra.org" subject="New Individual Membership Via PO" server="#Application.mailserver#" username="#Application.MailUser#" password="#Application.MailPassword#">
   The following information was received via the ILIPRA.org website. The user submitted a request for membership with a payment type of Purchase Order.
   
   #form.firstname# #form.Lastname#
   #form.agencyname#
   #form.agaddr1#
   #form.agaddr2#
   #form.agcity#, #form.agState# #form.agZip#
   Prefers Mail to be sent to: #form.wheremail#
   
   #form.agphone#
   #form.agfax#
   
   #form.agwebsite#
   
   Dues Paid by: <cfif form.whopays EQ "ind">Individual<cfelseif form.whopays EQ "Agency">Agency<cfelseif form.whopays EQ "agencyPortion">Agency Pays Portion</cfif>
   <cfif len(trim(form.referral)) GT 0>Referred By: #Trim(form.referral)#</cfif>
   
   PAYMENT VIA PUCHASE ORDER: #form.PONumber#
   Total Cost: #DollarFormat(TotalCost)#
</cfmail>
<cfmail to="#form.email#" from="Webmaster@ilipra.org" subject="Welcome to the IPRA" server="#Application.mailserver#" username="#Application.MailUser#" password="#Application.MailPassword#">
   Thank you for your membership to the Illinois Park and Recreation Association. You will be able to login into the IPRA website and 
   manage your information, as well as view Members only content:
   
   Login URL: <a href="#Application.baseurl#/MembersOnly/">#Application.baseurl#/MembersOnly/</a>
   Username: #Form.email#
   Password: #GenPassword#
   
   Registration Information:
   Contact: #form.firstname# #form.Lastname#
   Email:#form.email#
   
   Company: #form.agencyname#
   #form.agaddr1#
   #form.agaddr2#
   #form.agcity#, #form.agState# #form.agzip#
   
   PHONE:#form.agphone#
   FAX: #form.agfax#
   
   Website: #form.agwebsite#
   
   PAYMENT VIA Purchase order: #Form.PoNumber#
   
   Total Cost: #DollarFormat(TotalCost)#

</cfmail>
				    <CFMODULE Template="#Application.TagDir#/AuditLog.cfm" Action="MBR" Message="Purchase Order Payment (PO NUMBER #Form.PONumber# of #DollarFormat(TotalCost)# for '#form.agencyname#' has been processed for a Individual Membership">	
					<cfoutput><meta http-equiv="refresh" content="0;url=/members/PaymentConfirmation.cfm?mbrID=#GetID.memberID#&OID=#OrderNumber#"></cfoutput>       
					<!--- <cflocation url="/members/PaymentConfirmation.cfm?mbrID=#GetID.memberID#&OID=#OrderNumber#" addtoken="No"> --->
							
					
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