<cfparam name="url.RegID" default="0">
<CFQUERY Name="GetEvents" Datasource="#Application.DSN#">
	Select E.*, R.*, T.*
	From Transactions T, Registrations R, Events E
	Where T.RegisterID = R.RegisterID
	AND R.EventID = E.EventID 
	AND R.RegisterID= <cfqueryparam Value="#URL.RegID#" cfsqltype="CF_SQL_INTEGER">
	AND T.OrderNUM= <cfqueryparam Value="#URL.OrderID#" cfsqltype="CF_SQL_varchar">
	
</CFQUERY>
<cfinclude template="#Application.TagDir#/Libraries/ccEscape.cfm">
<cfparam name="URL.E" default="0">
<cfmodule template="#Application.header#" section="0" sectiontitle="Upcoming Events">
  <table width="100%" border="0" cellspacing="3" cellpadding="0">
     <tr>
        <td valign="top"> <br>
	     <cfoutput>
		 <table width="70%" border="0" cellspacing="0" cellpadding="4">
	        <tr>
	           <td align="center"><h3>Thank You For Registering for #GetEvents.EventName#!</h3></td>
	        </tr>
	     </table>
		 </cfoutput>
		<table border="0" cellpadding="4" cellspacing="0" width="100%">
		  <tr>
             <td align="Center">
			   <cfoutput query="GetEvents">
		       <table border="0" cellpadding="4" cellspacing="0" width="85%" class="regtext">
                  <tr>
                     <td colspan=2>Below us the Information you will need for the event you just registered for. Please print this as your receipt.</td>
                  </tr>
				  <tr>
				    <td><strong>Confirmation Number:</strong></td>
					<td>#TransID#-#RegisterID#-#EventID#</td>
				  </tr>
				  <tr>
				     <td><strong>EventName:</strong></td>
					 <td>#EventName#</td>
				  </tr>
				  <tr>
				     <td><strong>Date(s):</strong></td>
					 <td>#DateFormat(BeginDate, 'MM/DD/YY')# at #TimeFormat(BeginDate, 'hh:mm tt')# - #DateFormat(BeginDate, 'MM/DD/YY')# at #TimeFormat(EndDate, 'hh:mm tt')#</td>
				  </tr>
				  <tr>
				     <td><strong>Location:</strong></td>
					 <td>#Location#</td>
				  </tr>
				  <tr>
				     <td valign="top"><strong>Contact:</strong></td>
					 <td>#Contact#<br><cfif ContactEmail NEQ "">#Contactemail#<br></cfif><cfif ContactPhone NEQ "">#ContactPhone#</cfif></td>
				  </tr>
				  <cfquery name="GetPayment" datasource="#Application.dsn#">
				     Select D.EvntQty, E.DetailLabel, DetailCost
					 From RegDetail D, EventDetail E
					 Where  D.EventDetailID = E.EventDetailID
					 AND D.RegistrationID = #GetEvents.RegisterID#
					 Order By E.IsPrimary, DetailLabel
				  </cfquery>
				  <tr bgcolor="eeeeee">
				    <td colspan=2><strong>Event Costs:</strong></td>
				  </tr>
				  
				    <tr>
					  <td colspan=2>
					    <table border="0" cellpadding="4" cellspacing="0" width="100%">
                           <cfloop query="GetPayment">
						   <cfset ThisEventCost = (DetailCost * EvntQty)>
						    <tr>
							  <td width="10"></td> 
							  <td>#GetPayment.EvntQty# #GetPayment.DetailLabel#&nbsp;&nbsp;<strong>X</strong>&nbsp;&nbsp;#DollarFormat(DetailCost)# = <strong>#DollarFormat(ThisEventCost)#</strong></td>
							</tr> 
						   </cfloop>	
                        </table>
					  </td>
					</tr>
				  
				  <cfif AdminFee NEQ "">
				   <tr>
				     <td><strong>Admin Fee:</strong></td>
					 <td>#DollarFormat(AdminFee)#</td>
				  </tr>
				  </cfif>
				  <tr>
				    <td><strong>Total Charged:</strong> </td>
					<td>#DollarFormat(Amount)#</td>
				  </tr>
				  <tr bgcolor="eeeeee">
				    <td colspan=2><strong>Payment:</strong></td>
				  </tr>  	
				  <tr>	
					<td>Paid Via: <strong><cfif GetEvents.TransType EQ "Credit">Credit Card<cfelse>Purchase Order</cfif></strong><br>
				  <cfif GetEvents.TransType EQ "Credit">
							  #GetEvents.CardType# #ccEscape(GetEvents.CardNbr)# Exp: #GetEvents.CardExpMonth#/#GetEvents.CardExpYear#
							  
							<cfelse>
							  <strong>Purchase Order Number:</strong> #GetEvents.PONumber# 
							</cfif>
				    </td>
				  </tr>			
				  <tr>
				     <td colspan=2><strong>Description:</strong><br>#ReplaceNocase(Description, "#Chr(13)##Chr(10)#", "<br>", "All")#</td>
				  </tr>
				  
               </table>
			   </cfoutput>
			   <p><strong>The IPRA thanks you for your business. You will be receiving a written confirmation notice within 10 business days. If you do not receive this notice, please contact IPRA immediately at 630-376-1911.</strong></p>
		<br><br>

		 </td>
       </tr>
      </table>
	 </td>
   </tr>		 
 </table>
<cfmodule template="#Application.footer#" section="0">	 