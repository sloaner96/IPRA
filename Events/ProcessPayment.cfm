<cfif Not IsDefined("Form.EventID")>
  <meta http-equiv="refresh" content="0;url=ListEvents.cfm?E=2">
  <!--- <cflocation url="ListEvents.cfm?E=2" addtoken="No"> --->
</cfif>

<cfquery name="GetEvent" datasource="#Application.dsn#">
  Select *
  From Events
  Where EventID = #form.EventID#
</cfquery>

<cfif GetEvent.RecordCount is 0>
    <meta http-equiv="refresh" content="0;url=ListEvents.cfm?E=1">
	<!--- <cflocation url="ListEvents.cfm?E=1" addtoken="No"> --->
</cfif>

<CFMODULE Template="#Application.Header#" Heading="Online Event Registration" section="2">

<cfset ErrorList = ArrayNew(1)>

<cfif GetEvent.recordcount GT 0>
  <cfif ListLen(form.EventCost) GT 0>
	   <cfset TotalCost = 0.00>
	   
	   <cfloop index="x" list="#Form.EventCost#" delimiters=",">
	      <cfquery name="getCosts" datasource="#Application.dsn#">
		     Select DetailLabel, DetailCost
			 From dbo.EventDetail
			 Where EventDetailID = #x#
		  </cfquery>
		  
		  <cfif GetCosts.RecordCount GT 0>
		    <cfif Evaluate("Form.EvtQty_#x#") GTE 1>
		      <cfset TotalCost = TotalCost + (GetCosts.DetailCost * Evaluate("Form.EvtQty_#x#"))> 
			<cfelse>
			  <cfset x = ArrayAppend(ErrorList, "You Must Enter a Quantity for #GetCosts.DetailLabel#")>
			</cfif> 
		  <cfelse>
		     <cfset x = ArrayAppend(ErrorList, "There was a problem locating a cost for this event. Please contact the <a href='mailto:webmaster@ilipra.org?subject=Cost Error #GetEvent.EventID#'>administrator</a>.")>
		  </cfif>
	   </cfloop>
	   
	   <cfif GetEvent.AdminFee NEQ "">
	     <cfset TotalCost = TotalCost + GetEvent.AdminFee>
	   </cfif>
  <cfelse>
  
  </cfif>
  
   

<cfelse>
   <cfset x = ArrayAppend(ErrorList, "There was a problem locating this event. Please contact the <a href='mailto:webmaster@ilipra.org'>administrator</a>.")>
</cfif>


<CFIF Form.FirstName is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>First Name</b> field")>
</CFIF>

<CFIF Form.LastName is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Last Name</b> field")>
</CFIF>

<CFIF Form.Company is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Company</b> field")>
</CFIF>
<CFIF Form.Email is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Email</b> field")>
</CFIF>
<CFIF Form.Phone is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Phone</b> field")>
</CFIF>

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

<cfif Form.PayType EQ "C">
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

<cfset AuthResponse = "">
<cfset AuthReasonText = "">
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
<cfset OrderNumber = "EVT-#RandRange(1,9)##RandRange(1,9)##chr(RandRange(65,90))##RandRange(1,9)##chr(RandRange(65,90))#">
		<cfif Form.PayType EQ "C">
		
				<CFIF ArrayLen(ErrorList) is 0>
				
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
								OrderString = "1~IPRA Event:#Form.EventName#~#TotalCost#~||" 
								ShipToPhone = "#form.Phone#">
								
						 <cfif Response.ISApproved EQ "0">
							<cfset x = ArrayAppend(ErrorList, "Your Credit transaction failed with the Reason: '<b>#Response.AuthDeclinedMessage#</b>' (Code #Response.ReturnCode#).  Please review the information you provided on the previous page and try again.")>
<cfmail to="webmaster@ilipra.org" from="webmaster@ilipra.org" bcc="webmaster@x2-interactive.com"  Subject="Credit Authorization Failure on ILIPRA.ORG for Event Registration" server="#Application.mailserver#" username="#Application.MailUser#" password="#Application.MailPassword#">
Date: #DateFormat(now(), 'mm/dd/yyyy')#
Time: #TimeFormat(now(), 'hh:mm:ss TT')#

#Form.CardType# Payment for #Form.Company#
Name: #Form.CardName#
Card: #Form.CardNbr#  expires: #Form.XMonth#/#Form.XYear#
Amount: #DollarFormat(TotalCost)#

Error: #Response.ReturnCode# - #Response.AuthDeclinedMessage#
AVS Response Code: #Response.AVSResponseCode# 
Transaction FileID: #Response.TransFileName#
</cfmail>
							
							
							
					     </cfif> 
					<cfif Response.ReturnCode NEQ 1>
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
				
					<CFMODULE Template="#Application.TagDir#/AuditLog.cfm" Action="Register" Message="Credit Payment of $#TotalCost# for '#Form.Company#' has been processed for Event Registration (#Form.EventName# #Form.EventID#)">
				
					<CFQUERY Name="AddRec" Datasource="#Application.DSN#">
						INSERT into Registrations
							(EventID,
							 Firstname,
							 Lastname,
							 Company,
							 RegisterDate,
							 ShowedUp
							)
						VALUES
							(#Form.EventID#,
							 '#Form.FirstName#',
							 '#Form.LastName#',
							 '#Form.Company#',
							 #now()#,
							 0
							)
					</CFQUERY>
					
					<cfquery name="GetID" datasource="#Application.DSN#">
						SELECT TOP 1 RegisterID From Registrations
							WHERE EventID = #Form.EventID#
								AND Lastname = '#Form.LastName#'
								AND Company = '#Form.Company#'
							ORDER BY RegisterDate DESC
					</cfquery>
				    
					

  				    <cfif ListLen(Form.EventCost) GT 0> 
						<cfloop index="x" list="#Form.EventCost#" delimiters=",">
						  <cfquery name="UpdateEvtReg" datasource="#Application.DSN#">
							Insert Into RegDetail(RegistrationID, EventDetailID, EvntQty, DateEntered)
							Values(#GetID.RegisterID#, #x#, #Evaluate("Form.EvtQty_#x#")#, #CreateODBCDateTime(Now())#)
						  </cfquery>
						</cfloop> 
					 </cfif> 
					 
					<CFQUERY Name="AddRec" Datasource="#Application.DSN#">
						INSERT into Transactions
							(RegisterID,
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
							(#GetID.RegisterID#,
							 'CREDIT',
							 'REG',
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
							 #TotalCost#,
							 '#Response.ReturnCode#',
							 '#Response.AVSResponseMessage#',
							 '#Response.TransFileName#',
							 #now()#
							)
					</CFQUERY>
				
				<cfmail to="michelle@ilipra.org" from="Webmaster@ilipra.org" subject="New Event Registration Via CreditCard" server="#Application.mailserver#" type="HTML" username="#Application.MailUser#" password="#Application.MailPassword#">
                   The following information was received via the ILIPRA.org website. The user submitted payment for #form.EventName# with a payment type of Credit Card.<br>
                   Name:#form.firstName# #form.lastname#<br>
				   Company:#Form.Company#<br>
				   Email: #Form.Email#<br>
				   Phone: #Form.Phone#<br><br>
				   
				   Event: #form.EventName#<br>
				   Date: #DateFormat(getEvent.Begindate, 'MM/DD/YYYY')#<br>
				   Cost:&nbsp;
				   <cfif ListLen(form.EventCost) GT 0>
				      <cfset TotalCost = 0.00>
				       <blockquote>
					   <cfloop index="x" list="#Form.EventCost#" delimiters=",">
					      <cfquery name="getCosts" datasource="#Application.dsn#">
						     Select DetailLabel, DetailCost
							 From dbo.EventDetail
							 Where EventDetailID = #x#
						  </cfquery>
						  #Evaluate("Form.EvtQty_#x#")# #GetCosts.DetailLabel# X #DollarFormat(GetCosts.DetailCost)# <br>
						  <cfif GetCosts.RecordCount GT 0>
						    <cfif Evaluate("Form.EvtQty_#x#") GTE 1>
						      <cfset TotalCost = TotalCost + (GetCosts.DetailCost * Evaluate("Form.EvtQty_#x#"))> 
							</cfif> 
						     
						  </cfif>
					   </cfloop>
				       </blockquote>
			      </cfif>
				   <cfif GetEvent.AdminFee NEQ "">
				     <br>Admin Fee: #DollarFormat(GetEvent.AdminFee)#
				   </cfif>
				   <strong>Total Cost: #DollarFormat(TotalCost)#</strong><br>
				   
				   PAYMENT VIA Credit Card: #Form.CardType#</cfmail>
				
				<cfmail to="#form.email#" from="Webmaster@ilipra.org" subject="Thank You for Registering for #form.EventName#" server="#Application.mailserver#" type="HTML" username="#Application.MailUser#" password="#Application.MailPassword#">
Thank you for Registering for #Form.EventName#. Below is you reciept for this purchase. If you have any questions please contact the IPRA at webmaster@ilipra.org <br>
				   
				   Name:#form.firstName# #form.lastname#<br>
				   Company:#Form.Company#<br>
				   Email: #Form.Email#<br>
				   Phone: #Form.Phone#<br><br>
				   
				   Event: #form.EventName#<br>
				   Date: #DateFormat(getEvent.Begindate, 'MM/DD/YYYY')#<br>
				   Cost:&nbsp;
				   <cfif ListLen(form.EventCost) GT 0>
				      <cfset TotalCost = 0.00>
				       <blockquote>
					   <cfloop index="x" list="#Form.EventCost#" delimiters=",">
					      <cfquery name="getCosts" datasource="#Application.dsn#">
						     Select DetailLabel, DetailCost
							 From dbo.EventDetail
							 Where EventDetailID = #x#
						  </cfquery>
						  #Evaluate("Form.EvtQty_#x#")# #GetCosts.DetailLabel# X #DollarFormat(GetCosts.DetailCost)# <br>
						  <cfif GetCosts.RecordCount GT 0>
						    <cfif Evaluate("Form.EvtQty_#x#") GTE 1>
						      <cfset TotalCost = TotalCost + (GetCosts.DetailCost * Evaluate("Form.EvtQty_#x#"))> 
							</cfif> 
						     
						  </cfif>
					   </cfloop>
				       </blockquote>
			      </cfif>
				   <cfif GetEvent.AdminFee NEQ "">
				     <br>Admin Fee: #DollarFormat(GetEvent.AdminFee)#<br>
				   </cfif>
				   <strong>Total Cost: #DollarFormat(TotalCost)#</strong><br>
				   
				   PAYMENT VIA Credit Card: #Form.CardType#</cfmail>
				    <cfoutput><meta http-equiv="refresh" content="0;url=/Events/PaymentConfirmation.cfm?RegID=#GetID.RegisterID#&OrderID=#orderNUmber#"></cfoutput>
					<!--- <cflocation url="/Events/PaymentConfirmation.cfm?RegID=#GetID.RegisterID#&OrderID=#orderNUmber#" addtoken="No"> --->
				
				</cfif>
		<cfelse>
		<!--- Purchase Order Payment --->
		<CFMODULE Template="#Application.TagDir#/AuditLog.cfm" Action="Register" Message="Purchase Order Payment of $#TotalCost# for '#Form.Company#' has been processed for Event Registration (#Form.EventName# #Form.EventID#)">
				
					<CFQUERY Name="AddRec" Datasource="#Application.DSN#">
						INSERT into Registrations
							(EventID,
							 Firstname,
							 Lastname,
							 Company,
							 RegisterDate,
							 ShowedUp
							)
						VALUES
							(#Form.EventID#,
							 '#Form.FirstName#',
							 '#Form.LastName#',
							 '#Form.Company#',
							 #now()#,
							 0
							)
					</CFQUERY>
					
					<cfquery name="GetID" datasource="#Application.DSN#">
						SELECT TOP 1 RegisterID From Registrations
							WHERE EventID = #Form.EventID#
								AND Lastname = '#Form.LastName#'
								AND Company = '#Form.Company#'
							ORDER BY RegisterDate DESC
					</cfquery>
				
				 
				    <cfif ListLen(Form.EventCost) GT 0> 
						<cfloop index="x" list="#Form.EventCost#" delimiters=",">
						  <cfquery name="UpdateEvtDetail" datasource="#Application.DSN#">
							Insert Into RegDetail(RegistrationID, EventDetailID, EvntQty, DateEntered)
							Values(#GetID.RegisterID#, #x#, #Evaluate("Form.EvtQty_#x#")#, #CreateODBCDateTime(Now())#)
						  </cfquery>
						</cfloop> 
					 </cfif>
		
					<CFQUERY Name="AddRec" Datasource="#Application.DSN#">
						INSERT into Transactions
							(RegisterID,
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
							(#GetID.RegisterID#,
							 'PO',
							 'REG',
							 '#OrderNumber#', 
							 '#Form.CardName#',
							 '#Form.BillAddress#',
							 '#Form.BillCity#',
							 '#Form.BillState#',
							 '#Form.BillZip#',
							 '#form.PONumber#',
							 #TotalCost#,
							 NULL,
							 NULL,
							 NULL,
							 #now()#
							)
					</CFQUERY>
				
				<cfmail to="michelle@ilipra.org" from="Webmaster@ilipra.org" subject="New Event Registration Via Purchase Order" server="#Application.mailserver#" type="HTML" username="#Application.MailUser#" password="#Application.MailPassword#">
The following information was received via the ILIPRA.org website. The user submitted payment for #form.EventName# with a payment type of Purchase Order.
				   Name:#form.firstName# #form.lastname#<br>
				   Company:#Form.Company#<br>
				   Email: #Form.Email#<br>
				   Phone: #Form.Phone#<br><br>
				   
				   Event: #form.EventName#<br>
				   Date: #DateFormat(getEvent.Begindate, 'MM/DD/YYYY')#<br>
				   Cost:&nbsp;
				   <cfif ListLen(form.EventCost) GT 0>
				      <cfset TotalCost = 0.00>
				       <blockquote>
					   <cfloop index="x" list="#Form.EventCost#" delimiters=",">
					      <cfquery name="getCosts" datasource="#Application.dsn#">
						     Select DetailLabel, DetailCost
							 From dbo.EventDetail
							 Where EventDetailID = #x#
						  </cfquery>
						  #Evaluate("Form.EvtQty_#x#")# #GetCosts.DetailLabel# X #DollarFormat(GetCosts.DetailCost)# <br>
						  <cfif GetCosts.RecordCount GT 0>
						    <cfif Evaluate("Form.EvtQty_#x#") GTE 1>
						      <cfset TotalCost = TotalCost + (GetCosts.DetailCost * Evaluate("Form.EvtQty_#x#"))> 
							</cfif> 
						     
						  </cfif>
					   </cfloop>
				       </blockquote>
			      </cfif>
				   <cfif GetEvent.AdminFee NEQ "">
				     <br>Admin Fee: #DollarFormat(GetEvent.AdminFee)#<br>
				   </cfif>
				   <strong>Total Cost: #DollarFormat(TotalCost)#</strong><br>
				   
				   PAYMENT VIA PURCHASE ORDER: #Form.PONumber#</cfmail>
				
				<cfmail to="#form.email#" from="Webmaster@ilipra.org" subject="Thank You for Registering for #form.EventName#" server="#Application.mailserver#" type="HTML" username="#Application.MailUser#" password="#Application.MailPassword#">
Thank you for Registering for #Form.EventName#. Below is you reciept for this purchase. If you have any questions please contact the IPRA at webmaster@ilipra.org 
				   
				   Name:#form.firstName# #form.lastname#<br>
				   Company:#Form.Company#<br>
				   Email: #Form.Email#<br>
				   Phone: #Form.Phone#<br><br>
				   
				   Event: #form.EventName#<br>
				   Date: #DateFormat(getEvent.Begindate, 'MM/DD/YYYY')#<br>
				   Cost:&nbsp;
				   <cfif ListLen(form.EventCost) GT 0>
				      <cfset TotalCost = 0.00>
				       <blockquote>
					   <cfloop index="x" list="#Form.EventCost#" delimiters=",">
					      <cfquery name="getCosts" datasource="#Application.dsn#">
						     Select DetailLabel, DetailCost
							 From dbo.EventDetail
							 Where EventDetailID = #x#
						  </cfquery>
						  #Evaluate("Form.EvtQty_#x#")# #GetCosts.DetailLabel# X #DollarFormat(GetCosts.DetailCost)# <br>
						  <cfif GetCosts.RecordCount GT 0>
						    <cfif Evaluate("Form.EvtQty_#x#") GTE 1>
						      <cfset TotalCost = TotalCost + (GetCosts.DetailCost * Evaluate("Form.EvtQty_#x#"))> 
							</cfif> 
						     
						  </cfif>
					   </cfloop>
				       </blockquote>
			      </cfif>
				   <cfif GetEvent.AdminFee NEQ "">
				     <br>Admin Fee: #DollarFormat(GetEvent.AdminFee)#<br>
				   </cfif>
				   <strong>Total Cost: #DollarFormat(TotalCost)#</strong><br>
				   
				   PAYMENT VIA PURCHASE ORDER: #Form.PONumber#</cfmail>
				
				<!--- <cflocation url="/Events/PaymentConfirmation.cfm?RegID=#GetID.RegisterID#&OrderID=#orderNUmber#" addtoken="No"> --->
				<cfoutput><meta http-equiv="refresh" content="0;url=/Events/PaymentConfirmation.cfm?RegID=#GetID.RegisterID#&OrderID=#orderNUmber#"></cfoutput>
		</cfif>
	</cfif>
<cfmodule template="#Application.tagdir#/footer.cfm">