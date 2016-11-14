<cfparam name="url.OrderID" default="0">
<CFQUERY Name="Getorder" Datasource="#Application.DSN#">
	Select O.*, T.TransID, T.TransType, T.PONumber, T.CardType, T.CardNbr, T.CardExpMonth, T.CardExpYear, P.productID, productName, PerUnitPrice
	From Orders O, Transactions T, Products P
	Where O.OrderID = <cfqueryparam value="#URL.OrderID#" cfsqltype="CF_SQL_INTEGER">
	AND O.ProductID = P.ProductID
	AND O.OrderNUM = T.OrderNum
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
	           <td align="center"><h3>Thank You For Your #Getorder.productName# Order!</h3></td>
	        </tr>
	     </table>
		 </cfoutput>
		<table border="0" cellpadding="4" cellspacing="0" width="100%">
		  <tr>
             <td align="Center">
			   <cfoutput query="Getorder">
		       <table border="0" cellpadding="4" cellspacing="0" width="100%">
                         <tr bgcolor="##eeeeee">
                           <td><strong>Shipping Information</strong></td>
                        </tr>
						<tr>
						  <td>
						    #Getorder.ContactName#<br>
							#Getorder.ContactAddress1#<br> 
							<cfif Getorder.ContactAdress2 NEQ "">#Getorder.ContactAdress2#<br></cfif>
							#Getorder.ContactCity#, #Getorder.ContactState# #Getorder.ContactZip#<br><br>
							

							<strong>Email:</strong> #Getorder.ContactEmail#<br><br>
							
			
						  </td>
						</tr>
						<tr><td>&nbsp;</td></tr>
						 <tr bgcolor="##eeeeee">
                           <td><strong>Order Information</strong></td>
                        </tr>
						<tr>
						  <td>#Getorder.ProductName#<br> #Getorder.OrderQuantity# X #DollarFormat(PerUnitPrice)#</td>
						</tr>
						<tr><td>&nbsp;</td></tr>
						 <tr bgcolor="##eeeeee">
                           <td><strong>Payment Information</strong></td>
                        </tr>
						<tr>
						  <td>
						    Cost: <strong>#DollarFormat(Getorder.OrderTotal)#</strong><br>
						    Paid Via: <strong><cfif Getorder.TransType EQ "Credit">Credit Card<cfelse>Purchase Order</cfif></strong><br>
							<cfif Getorder.TransType EQ "Credit">
							  #Getorder.CardType# #ccEscape(Getorder.CardNbr)# Exp: #Getorder.CardExpMonth#/#Getorder.CardExpYear#
							  
							<cfelse>
							  Purchase Order Number: #Getorder.PONumber# 
							</cfif>
							
						  </td>
						</tr>
                      </table>
			   </cfoutput>
			   <p>The IPRA thanks you for your business</p>
		<br><br>

		 </td>
       </tr>
      </table>
	 </td>
   </tr>		 
 </table>
<cfmodule template="#Application.footer#" section="0">	 