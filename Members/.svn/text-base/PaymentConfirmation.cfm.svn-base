<cfinclude template="#Application.TagDir#/Libraries/ccEscape.cfm">
<cfmodule template="#Application.header#" section="0" sectiontitle="Membership Application">
  <cfoutput>
     <cfquery name="GetMemberinfo" datasource="#Application.dsn#">
	  Select M.*, T.TransID, T.OrderNum, T.TransType, T.CardType, T.PONumber, T.CardNbr, T.CardExpMonth, T.CardExpYear, T.Amount
	  From Members M, Transactions T
	  Where M.MemberID = T.MemberID
	  AND Month(DateAuthorized)  = #Month(now())#
	  AND Day(DateAuthorized) = #Day(now())#
	  AND Year(DateAuthorized) = #Year(Now())#
	  AND PurchaseCode = 'MBR'
	  AND M.MemberID = <cfqueryparam value="#url.mbrID#" cfsqltype="CF_SQL_INTEGER">
	  AND T.OrderNum = <cfqueryparam value="#url.OID#" cfsqltype="CF_SQL_VARCHAR">
	 </cfquery>
	 
	 <cfset x =structClear("#Session.MbrApp#")>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top"><br>
		    <cfmodule template="#Application.tagdir#/membersnav.cfm">
		   </td>
		   <td valign="top"><br>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>Thank you for your membership</h3></td>
		        </tr>
		      </table>
			  <table border="0" cellpadding="6" cellspacing="0" width="100%">
		        <tr>
		           <td class="RegText" valign="top">
				      <table border="0" cellpadding="4" cellspacing="0" width="100%">
                         <tr>
                           <td>Thank you for your membership to the IPRA. Below is the information you just entered. Your login information has been emailed to the email address you provided. Please print this for your records.</td>
                        </tr>
                      </table><br>
					  <table border="0" cellpadding="4" cellspacing="0" width="100%">
                         <tr bgcolor="##eeeeee">
                           <td><strong>Membership Information</strong></td>
                        </tr>
						<tr>
						  <td>
						    #GetMemberinfo.FirstName# #GetMemberinfo.LastName#<cfif getmemberinfo.title NEQ "">, #getmemberinfo.title#</cfif><br>
						    #GetMemberinfo.Company#<br>
							#GetMemberinfo.Address1#<br> 
							<cfif GetMemberInfo.Address2 NEQ "">#GetMemberinfo.Address2#<br></cfif>
							#GetMemberinfo.City#, #GetMemberinfo.State# #GetMemberinfo.Zipcode#<br><br>
							
							<strong>Phone:</strong> #GetMemberinfo.MainPhone#<br>
							<strong>Fax:</strong> #GetMemberinfo.Fax#<br><br>
							
							<strong>Email:</strong> #GetMemberinfo.Email#<br><br>
							
							<strong>Membership Begins:</strong> #DateFormat(GetMemberinfo.MembershipBegin, 'MM/DD/YYYY')#<br>
							<strong style="color:##990000;">Membership Expires:</strong> #DateFormat(GetMemberinfo.MembershipExpire, 'MM/DD/YYYY')#<br>
							
						  </td>
						</tr>
						<tr><td>&nbsp;</td></tr>
						 <tr bgcolor="##eeeeee">
                           <td><strong>Payment Information</strong></td>
                        </tr>
						<tr>
						  <td>
						    Cost: <strong>#DollarFormat(GetMemberInfo.Amount)#</strong><br>
						    Paid Via: <strong><cfif GetMemberinfo.TransType EQ "Credit">Credit Card<cfelse>Purchase Order</cfif></strong><br>
							<cfif GetMemberinfo.TransType EQ "Credit">
							  #GetMemberinfo.CardType# #ccEscape(GetMemberinfo.CardNbr)# Exp: #GetMemberinfo.CardExpMonth#/#GetMemberinfo.CardExpYear#
							  
							<cfelse>
							  Purchase Order Number: #GetMemberinfo.PONumber# 
							</cfif>
							
						  </td>
						</tr>
                      </table>
					  
				   </td>
		        </tr>
		       </table>
			   <br><br>
		 </td>
     </tr>
</table>  
</cfoutput>
<cfmodule template="#Application.footer#">