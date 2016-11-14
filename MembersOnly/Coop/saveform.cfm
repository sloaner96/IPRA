<cfif url.l EQ 1>
	  <cfif Len(Trim(form.SecFirstname)) GT 0 OR Len(Trim(form.Seclastname)) GT 0>
		    
			<cfif Len(Trim(Form.Secfirstname)) EQ 0>
			   <cflocation url="Register.cfm?e=1##E1" addtoken="no">
			</cfif>
			
			<cfif Len(Trim(Form.Seclastname)) EQ 0>
			   <cflocation url="Register.cfm?e=2##E1" addtoken="no">
			</cfif>
			
			<cfif Len(Trim(Form.SecEmail)) EQ 0>
			   <cflocation url="Register.cfm?e=3##E1" addtoken="no">
			</cfif>
		
	  <cfelseif Len(Trim(form.SecEmail)) GT 0>
		    
			 <cfif Len(Trim(Form.Secfirstname)) EQ 0>
			   <cflocation url="Register.cfm?e=5##E1" addtoken="no">
			</cfif>
			
			<cfif Len(Trim(Form.Seclastname)) EQ 0>
			   <cflocation url="Register.cfm?e=6##E1" addtoken="no">
			</cfif>
			
			<cfif Len(Trim(Form.SecEmail)) EQ 0>
			   <cflocation url="Register.cfm?e=7##E1" addtoken="no">
			</cfif>
	  </cfif>
  
  <cfif Not IsDefined("form.eav")>
    <cflocation url="Register.cfm?e=4##E2" addtoken="no">
  </cfif>
  
  <cfset Session.CoopForm.LevOne.CoopID = Session.coopConfig.ConfigID>
  <cfset Session.CoopForm.LevOne.SecFirstname = Form.secfirstname>
  <cfset Session.CoopForm.LevOne.Seclastname = Form.Seclastname>
  <cfset Session.CoopForm.LevOne.SecPhone = Form.SecPhone>
  <cfset Session.CoopForm.LevOne.SecFax = Form.SecFax>
  <cfset Session.CoopForm.LevOne.SecEmail = Form.SecEmail>
  <cfset Session.CoopForm.LevOne.Eav = Form.eav>

  <cflocation url="Register2.cfm" addtoken="no">

<cfelseif url.l EQ 2>
    <cfif Not IsDefined("Form.MemoOfUnderstanding")>
	  <cflocation url="Register2.cfm?e=1##E1" addtoken="no">
	</cfif>
    <cfset Session.CoopForm.Levtwo.MOUConfirmation = Form.MemoOfUnderstanding>
	<cfset Session.CoopForm.Levtwo.MOUConfirmDate = now()>

   <cflocation url="Register3.cfm" addtoken="no">
<cfelseif url.l EQ 3>
    <cfmodule template="#Application.header#" section="1" sectiontitle="Cooperative Purchase Program">


    <cfset ErrorList = ArrayNew(1)>

    <cfset Session.CoopForm.Levthree.PayType = Form.PayType>
	<cfset Session.CoopForm.Levthree.PONumber = Form.PONumber>
	<cfset Session.CoopForm.Levthree.CardName = Form.CardName>
	<cfset Session.CoopForm.Levthree.BillAddress = Form.BillAddress>
	<cfset Session.CoopForm.Levthree.BillCity = Form.BillCity>
	<cfset Session.CoopForm.Levthree.BillState = Form.BillState>
	<cfset Session.CoopForm.Levthree.BillZip = Form.BillZip>
	<cfset Session.CoopForm.Levthree.CardType = Form.CardType>
	<cfset Session.CoopForm.Levthree.ExpireMonth = Form.XMonth>
	<cfset Session.CoopForm.Levthree.ExpireYear = Form.XYear>
	
<!--- Validate the User Info --->
 	<cfif form.PayType EQ "P">	
	    <cfif form.PONumber EQ "">
		  <cfset x = ArrayAppend(ErrorList, "You specified Purchase order as a payment type, but did not enter a value for the <b>Purchase Order</b> field")>
		</cfif>
	<cfelseif form.PayType EQ "C">		
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
	</cfif>
	
	<cfif ArrayLen(ErrorList) EQ 0>
	  <cfset GetEav = request.CoopComponent.GetEAVInfo(Session.CoopForm.LevOne.Eav)>
		 
		 <cfset ThisEAVCost = GetEav.MemberPrice>
		 
		   <!--- Create an Password for the User --->
		   <cfset GeneratedPassword = request.CoopComponent.GeneratePassword()>
		 
		<!--- Create an orderNumber --->
		   <cfset AppType = "COO">
		   <cfset orderNumber = request.PaymentComponent.createOrderNumber(AppType)>
		   
		<!--- Set the orderNumber in a session variable, to be used on confirmation page --->
		  
		   <cfset Session.CoopRegOrderNumber = orderNumber>
		   
		   <!--- Set The Name into a variable --->
		   <cfset RegisterName = "#Session.UserInfo.Firstname# #Session.UserInfo.Lastname#">
		      

	    <!--- This is where we will charge the card and Write Everything into the database --->
		<cfif form.PayType EQ "P">
			
			 <!--- Write to the Coop Registration table --->
		      <cfinvoke component="IPRA.Coop" method="InsertRegistration" returnvariable="AddRegistration">
			     <cfinvokeArgument name="MemberID" value="#Session.UserInfo.memberID#">
			     <cfif Session.UserInfo.AgencyID NEQ "">
					<cfinvokeArgument name="AgencyID" value="#Session.UserInfo.AgencyID#">
				 <cfelse>
				    <cfinvokeArgument name="AgencyID" value="#Session.UserInfo.IPRACOID#">
				 </cfif>
			     <cfinvokeArgument name="RegistrationDate" value="#CreateODBCDateTime(now())#">
			     <cfinvokeArgument name="RegEAV" value="#Session.CoopForm.LevOne.Eav#">
			     <cfinvokeArgument name="CoopID" value="#Session.CoopForm.LevOne.CoopID#">
			     <cfinvokeArgument name="SecFirstame" value="#Session.CoopForm.LevOne.SecFirstname#">
			     <cfinvokeArgument name="Seclastname" value="#Session.CoopForm.LevOne.SecLastname#">
			     <cfinvokeArgument name="SecEmail" value="#Session.CoopForm.LevOne.SecEmail#">
			     <cfinvokeArgument name="SecPassword" value="#GeneratedPassword#">
			     <cfinvokeArgument name="SecPhone" value="#Session.CoopForm.LevOne.SecPhone#">
			     <cfinvokeArgument name="SecFax" value="#Session.CoopForm.LevOne.SecFax#">
			     <cfinvokeArgument name="AgreedMOU" value="1">
			  </cfinvoke>
			 
		  <!--- Write to the Transaction Table---> 
		      <cfinvoke component="IPRA.Payment" method="CreateTransaction">
			     <cfinvokeArgument name="MemberID" value="#Session.UserInfo.MemberID#">
				 <cfinvokeArgument name="RegisterID" value="#AddRegistration.RegistrationID#">
				
				 <cfinvokeArgument name="OrderNum" value="#Session.CoopRegOrderNumber#">
				 <cfinvokeArgument name="TransType" value="PO">
				 <cfinvokeArgument name="PurchaseCode" value="COO">
				 <cfinvokeArgument name="CardHolder" value="#RegisterName#">
				 <cfinvokeArgument name="CardAddress" value="#Session.UserInfo.Address1#">
				 <cfinvokeArgument name="CardCity" value="#Session.UserInfo.City#">
				 <cfinvokeArgument name="CardState" value="#Session.UserInfo.State#">
				 <cfinvokeArgument name="CardZip" value="#Session.UserInfo.Zipcode#">
				 <cfinvokeArgument name="TransAmount" value="#ThisEAVCost#">
				
				 <cfinvokeArgument name="PONUmber" value="#form.PONumber#">
				 <cfinvokeArgument name="AuthDate" value="#Now()#">
				 
		      </cfinvoke>
		  
		  <!--- Update the Registration with the RegistrationID  --->
		  <cfset TransID = request.PaymentComponent.GetTransactionID(Session.CoopRegOrderNumber)>
		 
		  <cfset UpdRegistrationWithTransNumber = request.CoopComponent.UpdateRegWTransID(TransID, AddRegistration.RegistrationID)> 
		  
		  <!--- SEND EMAILS --->
			<!--- Send Email To User Thanking for Registration --->
						
			<!--- If the User entered a secondary contact Send the Secondary contact an email with their username and password,--->
		  
		  <!--- Kick the user to the confirmation page ---> 
	        <cflocation url="ConfirmationPage.cfm" addtoken="no"> 
		<cfelseif form.PayType EQ "C">
		     <cfset AuthResponse = "">
			 <cfset AuthReasonText = "">
			 <cfset FormattedCC = ReplaceList(Form.CardNbr, "-,/, ,\", "")>
				  
			 <cftry>	
		     <!--- Call the SkipJack Custom Tag --->
		      <cfinvoke component="IPRA.Payment" method="ProcessSkipJack" returnvariable="CCResponse">
			     <cfinvokeArgument name="server" value="#Application.SysInfo.SysURL#">
				 <cfinvokeArgument name="SJName" value="#form.CardName#">
				 <cfinvokeArgument name="Email" value="#Session.UserInfo.Email#">
				 <cfinvokeArgument name="StreetAddress" value="#Form.BillAddress#">
				 <cfinvokeArgument name="City" value="#Form.BillCity#">
				 <cfinvokeArgument name="state" value="#Form.BillState#">
				 <cfinvokeArgument name="ZipCode" value="#form.BillZip#">
				 <cfinvokeArgument name="OrderNumber" value="#Session.CoopRegOrderNumber#">
				 <cfinvokeArgument name="AccountNumber" value="#FormattedCC#">
				 <cfinvokeArgument name="Month" value="#form.XMonth#">
				 <cfinvokeArgument name="Year" value="#Form.XYear#">
				 <cfinvokeArgument name="SerialNumber" value="#Application.SysInfo.SerialNumber#">
				 <cfinvokeArgument name="TransactionAmount" value="#NumberFormat(ThisEAVCost, 0.00)#">
				 <cfinvokeArgument name="orderString" value="1~IPRA Cooperative Purchase Program~#ThisEAVCost#~||">
				 <cfinvokeArgument name="ShipToPhone" value="630-555-9999">
			 </cfinvoke>
			   <cfcatch type="Any">
				  <cfset CCResponse.ISApproved = 0>
				  <cfset CCResponse.AuthDeclinedMessage = "The Payment Gateway could not be contacted">
				  <cfset CCRepsonse.ReturnCode = "00">
			   </cfcatch>
			 </cftry>
			 
			 <!--- <cfdump var="#CCResponse#"><cfabort> --->
			 <cfif CCResponse.ISApproved EQ "0">
				 <cfset x = ArrayAppend(ErrorList, "Your Credit Card transaction failed with the Reason: '<b>#CCResponse.AuthDeclinedMessage#</b>' (Code #CCResponse.ReturnCode#).  Please review the information you provided on the previous page and try again.")>
			 </cfif>
			 
			 <cfif CCResponse.ReturnCode LT 1>
			     <cfset x = ArrayAppend(ErrorList, "Your Transaction encountered a the following problem: (Error Code: #CCResponse.ReturnCode#) <strong>#CCResponse.AuthDeclinedMessage2#</strong>")> 
			 <cfelseif CCResponse.ReturnCode EQ 1 AND (CCResponse.AuthCode EQ "EMPTY" AND CCResponse.AuthDeclinedMessage NEQ "")>
				 <cfset x = ArrayAppend(ErrorList, "Your Transaction encountered a the following problem: (Error Code: #CCResponse.ReturnCode#) #CCResponse.AuthDeclinedMessage#")> 
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
				  <!--- Write to the Coop Registration table --->
				    <cfinvoke component="IPRA.Coop" method="InsertRegistration" returnvariable="AddRegistration">
					     <cfinvokeArgument name="MemberID" value="#Session.UserInfo.memberID#">
						 <cfif Session.UserInfo.AgencyID NEQ "">
					         <cfinvokeArgument name="AgencyID" value="#Session.UserInfo.AgencyID#">
						 <cfelse>
						     <cfinvokeArgument name="AgencyID" value="#Session.UserInfo.IPRACOID#">
						 </cfif>
					     <cfinvokeArgument name="RegistrationDate" value="#CreateODBCDateTime(now())#">
					     <cfinvokeArgument name="RegEAV" value="#Session.CoopForm.LevOne.Eav#">
					     <cfinvokeArgument name="CoopID" value="#Session.CoopForm.LevOne.CoopID#">
					     <cfinvokeArgument name="SecFirstame" value="#Session.CoopForm.LevOne.SecFirstname#">
					     <cfinvokeArgument name="Seclastname" value="#Session.CoopForm.LevOne.SecLastname#">
					     <cfinvokeArgument name="SecEmail" value="#Session.CoopForm.LevOne.SecEmail#">
					     <cfinvokeArgument name="SecPassword" value="#GeneratedPassword#">
					     <cfinvokeArgument name="SecPhone" value="#Session.CoopForm.LevOne.SecPhone#">
					     <cfinvokeArgument name="SecFax" value="#Session.CoopForm.LevOne.SecFax#">
					     <cfinvokeArgument name="AgreedMOU" value="1">
					  </cfinvoke>
				  <cfset GetRegID = request.CoopComponent.ChkCoopEnrollment(Session.UserInfo.MemberID, Session.CoopForm.LevOne.CoopID)>
				  <!--- Write to the Transaction Table--->
				   	  <cfinvoke component="IPRA.Payment" method="CreateTransaction">
					    <cfinvokeArgument name="MemberID" value="#Session.UserInfo.MemberID#">
						<cfinvokeArgument name="RegisterID" value="#AddRegistration.RegistrationID#">
						
						<cfinvokeArgument name="OrderNum" value="#Session.CoopRegOrderNumber#">
						<cfinvokeArgument name="TransType" value="CREDIT">
						<cfinvokeArgument name="PurchaseCode" value="COO">
						<cfinvokeArgument name="CardHolder" value="#form.CardName#">
						<cfinvokeArgument name="CardAddress" value="#form.BillAddress#">
						<cfinvokeArgument name="CardCity" value="#form.BillCity#">
						<cfinvokeArgument name="CardState" value="#form.BillState#">
						<cfinvokeArgument name="CardZip" value="#form.BillZip#">
						<cfinvokeArgument name="TransAmount" value="#ThisEAVCost#">
						
						<cfinvokeArgument name="CardNbr" value="#FormattedCC#">
						<cfinvokeArgument name="CardType" value="#Form.CardType#">
						<cfinvokeArgument name="CardExpMonth" value="#form.XMonth#">
						<cfinvokeArgument name="CardExpyear" value="#Form.XYear#">
						<cfinvokeArgument name="Status" value="#CCResponse.ReturnCode#">
						<cfinvokeArgument name="AuthResponse" value="#CCResponse.AVSResponseMessage#">
						<cfinvokeArgument name="AuthTransID" value="#CCResponse.TransFileName#">
						<cfinvokeArgument name="AuthDate" value="#Now()#">
					
				  </cfinvoke>
				  
				    <!--- Update the Registration with the RegistrationID  --->
					
				    <cfset TransID = request.PaymentComponent.GetTransactionID(Session.CoopRegOrderNumber)>
		            <cfset UpdRegistrationWithTransNumber = request.CoopComponent.UpdateRegWTransID(TransID, AddRegistration.RegistrationID)> 
					
					<!--- SEND EMAILS --->
						<!--- Send Email To User Thanking for Registration --->
						
						<!--- If the User entered a secondary contact Send the Secondary contact an email with their username and password,--->
					
				   <!--- Kick the user to the confirmation page ---> 
			        <cflocation url="ConfirmationPage.cfm" addtoken="no">  	 
		   </cfif>	
		 </cfif>
		 
	  <cfelse>
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
	 
	</cfif>
	

<cfmodule template="#Application.tagdir#/footer.cfm">

</cfif>
