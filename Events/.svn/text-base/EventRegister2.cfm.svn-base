<cfif NOT IsDefined("URL.EventID") OR NOT IsNumeric(URL.EventID)>
	<cflocation url="#Application.baseurl#/Events/ListEvents.cfm?M=#Month(now())#&Y=#Year(now())#&E=1" addtoken="No">
</cfif> 

<cfquery name="EventNfo" datasource="#Application.DSN#">
	SELECT * From Events
		WHERE EventID = #URL.EventID#
			AND CanRegister = 1
			AND BeginDate >= #now()#
</cfquery>
 <cfif EventNfo.RecordCount is 0>
	<cflocation url="#Application.baseurl#/Events/ViewEvent.cfm?EventID=#url.eventID#&E=2" addtoken="No">
</cfif>  

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



<SCRIPT LANGUAGE="JavaScript">
<!-- Begin
function disableForm(theform) {
if (document.all || document.getElementById) {
for (i = 0; i < theform.length; i++) {
var tempobj = theform.elements[i];
if (tempobj.type.toLowerCase() == "submit")
tempobj.disabled = true;
}

setTimeout(2000);
return true;
} else {
   return false;
   }
}
//  End -->
</script>
<cfmodule template="#Application.header#" sectiontitle="Event Registration">
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top"><br>
	         <cfmodule template="#Application.tagdir#/eventsnav.cfm">
		   </td>
		   <td valign="top"><br>
		   <CFFORM Name="AddRec" Action="ProcessPayment.cfm" scriptsrc="/scripts/cfform.js">
          <cfoutput> <h3>Registering for #EventNfo.EventName#</h3></cfoutput>
			<p><font color="#990000"><b>Your registration is not complete until a payment has been processed</b>.</font>
			To complete the registration process, you must process your payment via one of the following credit cards or a Purchase order: MasterCard, VISA, American Express, or Discover.</p>
			Please enter the information requested in the fields below and press the "Complete Registration" button.</p>
			</font>
			<br>
		
		
		<cfoutput>
		<input type="hidden" name="EventID" value="#EventNfo.EventID#">
		<input type="hidden" name="EventName" value="#EventNfo.EventName#">
		<input type="hidden" name="ShowQty" value="#EventNfo.AllowQty#">
		
		
		
		<cfif IsDefined("session.userinfo.memberid")>
		  <cfset firstname = session.userinfo.firstname>
		  <cfset lastname = session.userinfo.lastname>
		  <cfset company = session.userinfo.company>
		  <input type="hidden" name="MemberID" value="#Session.UserInfo.MemberID#">
		<cfelse>
		  <cfset firstname = "">
		  <cfset lastname = "">
		  <cfset company = "">  
		  <input type="hidden" name="MemberID" value="">
		</cfif>
		</cfoutput>
		<p class="errortext">* All Fields Required</p>
		
		<cfquery name="GetChargeDetail" datasource="#Application.dsn#">
		  Select  EventDetailID, IsPrimary, DetailLabel, Description, DetailCost
		  From EventDetail
		  Where EventID = #EventNfo.EventID#
		</cfquery>
		
		<cfoutput query="EventNfo">
		 <table border="0" cellpadding="4" cellspacing="0" width="100%">
				<tr>
				 <td bgcolor="##003366" colspan=2><B style="color:##ffffff;">Attendee Information</B></td>
			   </tr>
				<tr>
					<td><strong>Event Date:</strong> #DateFormat(BeginDate, "mmmm d, yyyy")# at #TimeFormat(BeginDate, "hh:mm TT")#</td>
				</tr>
				<cfif Location neq "">	
				<tr>
					<td><strong>Location:</strong> #Location#</td>
				</tr>
				</cfif>	
				<tr bgcolor="eeeeee">
				  <td><strong>Cost:</strong></td>
				</tr>
				
				<tr>
				  <td>
				    <table border="0" cellpadding="2" cellspacing="0" width="100%">
					  <cfloop Query="GetChargeDetail">
                       <tr>
                          <td width="1"><input type="checkbox" name="EventCost" value="#GetChargeDetail.EventDetailID#" <cfif GetChargeDetail.ISPrimary EQ 1>Checked</cfif>></td>
						  <td width="70%"><strong>#GetChargeDetail.DetailLabel#</strong></td>
						  <td width="15%" align="right">#DollarFormat(DetailCost)# <strong>X</strong></td>
						  <td width="14%" align="right"><strong>Quantity:</strong> <input type="text" name="EvtQty_#GetChargeDetail.EventDetailID#" value="1" size=3 maxlength="3"></td>
                       </tr>
					   <cfif GetChargeDetail.Description NEQ "">
						   <tr>
						     <td></td>
						     <td colspan="2"><font color="##979797">#GetChargeDetail.Description#</font></td>
						   </tr>
					   </cfif>
					  </cfloop>
					  <cfif AdminFee NEQ "" AND AdminFee NEQ 0.00>
					    <tr>
						  <td colspan=4><hr noshade size=1></td>
						</tr>
						<tr>
						    <td></td>
							<td><strong style="color:##cc0000;">Administrative Charge:</strong></td>
							<td align="right"> #DollarFormat(AdminFee)# <strong>X</strong></td>
							<td align="right"><strong>Quantity:</strong><br> 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						</tr>	
					  </cfif>
                    </table>
				  </td>
				</tr>
				
				
		
				
			</table>
		</cfoutput>
		<table width="100%" border=0 cellspacing=4 cellpadding=1>
		<tr>
			<td bgcolor="#003366" colspan=2><B style="color:#ffffff;">Attendee Information</B></td>
		</tr>
		
		<tr>
			<td width=120 align=left><font face="Verdana,Arial" size="-1"><b>First Name</b></font>:</td>
			<td width=* align=left><cfinput type="Text" name="FirstName" required="Yes" size="20" maxlength="35" message="Please enter the Attendee's First Name"></td>
		</tr>
		
		<tr>
			<td width=120 align=left><font face="Verdana,Arial" size="-1"><b>Last Name</b></font>:</td>
			<td width=* align=left><cfinput type="Text" name="LastName" required="Yes" size="25" maxlength="40" message="Please enter the Attendee's Last Name"></td>
		</tr>
		
		<tr valign=top>
			<td width=120 align=left><font face="Verdana,Arial" size="-1"><b>Company</b></font>:</td>
			<td width=* align=left><cfinput type="Text" name="Company" required="Yes" size="35" maxlength="70" message="Please enter the Attendee's Company Name"><br>&nbsp;</td>
		</tr>
		
		<tr valign=top>
			<td width=120 align=left><font face="Verdana,Arial" size="-1"><b>Email Address</b></font>:</td>
			<td width=* align=left><cfinput type="Text" name="Email" required="Yes" size="35" maxlength="100" message="Please enter the Attendee's Email"> <font color="757575">(you@email.com)</font><br>&nbsp;</td>
		</tr>
		<tr valign=top>
			<td width=120 align=left><font face="Verdana,Arial" size="-1"><b>Phone Number</b></font>:</td>
			<td width=* align=left><cfinput type="Text" name="Phone" required="Yes" size="20" maxlength="15" message="Please enter the Attendee's Phone Number"> <font size="-2" face="arial" color="757575">(555-555-5555)</font><br>&nbsp;</td>
		</tr>
		</table>
		 <table border="0" cellpadding="4" cellspacing="0" width="100%">
                         <tr bgcolor="#003366">
                            <td><strong style="color:#ffffff;">Payment Information</strong></td>
                         </tr>
                       </table>
					   <cfquery name="GetPayType" datasource="#Application.dsn#" cachedwithin="#CreateTimeSpan(0,0,10,0)#">
						      Select *
						       From Lookup
						        Where CodeGroup = 'Paytype'
						        Order By Ranking, Codevalue, CodeDesc
						   </cfquery><br>
						   

							 <table border="0" cellpadding="3" cellspacing="0" width="100%">
			                    <tr>
			                       <td><font face="Verdana,Arial" size="-1"><b>Payment Type:</b></font></td>
								   <td><select name="PayType">
										<cfoutput query="GetPayType">  
										   <option value="#GetPayType.CodeValue#">#GetPayType.CodeDesc#</option>
									     </cfoutput>
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
			<td width=120 align=left><font face="Verdana,Arial" size="-1"><b>Payee/Card&nbsp;Holder</b></font>:</td>
			<td width=* align=left><cfinput name="CardName" type="text" size=30 maxlength=40 required="Yes"></td>
		</tr>
		
		<tr>
			<td width=120 align=left><font face="Verdana,Arial" size="-1"><b>Address</b></font>:</td>
			<td width=* align=left><cfinput type="Text" name="BillAddress" required="Yes" size="35" maxlength="40" message="Please enter the Billing Address"></td>
		</tr>
		
		<tr>
			<td width=120 align=left><font face="Verdana,Arial" size="-1"><b>City</b></font>:</td>
			<td width=* align=left><cfinput type="Text" name="BillCity" required="Yes" size="25" maxlength="30" message="Please enter the Billing City"></td>
		</tr>
		<cfquery name="GetState" datasource="#Application.dsn#" cachedwithin="#CreateTimeSpan(0,0,10,0)#">
									      Select CodeDesc, CodeValue
									      From Lookup
									      Where CodeGroup = 'STATE'
									      Order BY CodeDesc
									    </cfquery> 
		<tr>
			<td width=120 align=left><font face="Verdana,Arial" size="-1"><b>State</b></font>:</td>
			<td width=* align=left><select name="BillState">
											       <cfoutput query="GetState">
											         <option value="#CodeValue#">#CodeValue#</option>
											       </cfoutput>
												  </select></td>
		</tr>
		
		<tr valign=top>
			<td width=120 align=left><font face="Verdana,Arial" size="-1"><b>Zip</b></font>:</td>
			<td width=* align=left><cfinput type="Text" name="BillZip" required="Yes" size="5" maxlength="5" message="Please enter the Billing Zip Code"></td>
		</tr>
		
		<tr valign=top>
			<td colspan=2>
			<font face="Arial" size="-1"><i>Note: the <b>billing address</b> for your credit card or purchase order <b>must match</b> the information you have entered here in order for the transaction to be successful.</i></font><br>&nbsp;
			</td>
		</tr>
		
		<tr>
			<td bgcolor="##003366" colspan=2><B style="color:#ffffff;">Credit Card Information</B>></td>
		</tr>
		
		<tr>
			<td width=120 align=left><font face="Verdana,Arial" size="-1"><b>Credit Card</b></font>:</td>
			<td width=* align=left><cfselect name="CardType"  query="CCards" value="CodeValue" display="CodeDesc" size="1" message="Please select the Credit Card you wish to use for this transaction" required="Yes"><option selected value="*">--- Select Card ---</option></cfselect></td>
		</tr>
		
		<tr>
			<td width=120 align=left><font face="Verdana,Arial" size="-1"><b>Card Number</b></font>:</td>
			<td width=* align=left><cfinput type="Text" name="CardNbr" validate="creditcard" required="Yes" size="25" maxlength="20"></td>
		</tr>
		
		<tr>
			<td width=120 align=left><font face="Verdana,Arial" size="-1"><b>Expires on</b></font>:</td>
			<td width=* align=left>
				<cfselect name="XMonth" query="Months" value="Codevalue" display="codeDesc" size="1" selected="#NumberFormat(Month(now()), '00')#" message="Please select the Expiration Month of your card" required="Yes"></cfselect>
				<select name="XYear" size=1>
				<cfloop index="Iyr" from="#Year(now())#" to="#Evaluate(Year(now())+6)#"><cfoutput><option value="#IYr#">#IYr#</option></cfoutput></cfloop>
				</select>
			</td>
		</tr>
		</table>
		
		<br>
		<font face="Verdana,Arial" size="-1">
		<input type="submit" name="submit" value="Complete Registration >>" onclick="return disableForm(this);">
		</font>
		
		</CFFORM>
		
		<br clear=all>
		<font face="Verdana,Arial" size="-1">
		<script src=https://seal.verisign.com/getseal?host_name=www.ilipra.org&size=S&use_flash=YES&use_transparent=YES&lang=en></script>
		 <p>This will initiate a <b>secured</b> transaction to the bank which will validate the credit information you provided and authorize the transfer of funds.  The authorization process may take up to 1 minute to complete so please be patient.</p>
		</font>
		<center><img src="/images/credit_card_bar.gif" alt="" border="0"></center>
		
		<br><br>
			 </td>
		   </tr>		 
		 </table>
<cfmodule template="#Application.footer#" section="0">	 