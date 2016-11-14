<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<cfset getCosts = request.CoopAdminComponent.getVendorCosts()>
<cfset getpayType = request.PaymentComponent.GetPayType()>
<cfset GetVendor = request.CoopAdminComponent.GetVendorInfo(URL.VendorID)>
<html>
<head>
	<title>Add Vendor Payment</title>
	<cfoutput>	
		<link href="#application.baseurl#/main.css" rel="stylesheet" type="text/css" media="screen">
	</cfoutput>
</head>

<body onload="self.focus();">
<cfoutput>	
<table border="0" cellpadding="3" cellspacing="0" width="100%">
  <tr bgcolor="##003366">
     <td colspan="2"><strong style="font-family:Arial, verdana, tahoma; font-size:12px; color:##ffffff;">Add Payment Information for #getVendor.CompanyName#</strong></td>
  </tr>
</table>
		  
<cfif Not IsDefined("Form.PaidAmount")>
	<cfform name="addpayment" action="AddPayment.cfm?VendorID=#getVendor.VendorID#" Method="POST">
	   
	        <input type="hidden" name="VendorID" value="#URL.VendorID#">
			<table border="0" cellpadding="3" cellspacing="0" width="100%">
			  <tr>
				<td><strong>Payment Date:</strong></td>
				<td><input type="text" name="PaymentDate" value="" size="12" maxlength="12"></td>
			  </tr>
			  <tr>
				<td><strong>Payment Via:</strong></td>
				<td><select name="PaidVia">
					  <cfloop query="getpayType">
					     <option value="#getpayType.Codevalue#">#getpayType.CodeDesc#</option>
					  </cfloop>	
					     <option value="K">Check</option>
					 </select>
			    </td>
			  </tr>
			  <tr>
			    <td><strong>Payment Amount:</strong></td>
				<td><select name="PaidAmount">
					   <cfloop query="getCosts">
					      <option value="#getCosts.ProductID#">#getCosts.ProductName#-#DollarFormat(PerUnitPrice)#</option>
					   </cfloop>	
					</select>
				</td>
			  </tr>
			  <tr>
			     <td colspan="2">&nbsp;</td>
			  </tr>
			  <tr>
			     <td colspan="2"><input type="submit" name="submit" value="Add Payment >>"></td>
			  </tr>
			</table>

	</cfform>
<cfelse>
   <cfset Error = arrayNew(1)>
   <cfif Len(trim(form.paymentDate)) EQ 0>
     <cfset X = Arrayappend(Error, "Error! You must include a Date for this payment.")>
   </cfif>
   
   <cfif Arraylen(Error) EQ 0>
    <cfset getPaymentAmount = request.coopAdmincomponent.getVendorCosts(form.PaidAmount)>
	<cfset PaymentAmount = getPaymentAmount.PerUnitPrice>
	
	
	<cfinvoke component="ipra.CoopAdmin" method="AddvendorPayment">
	   <cfinvokeargument name="VendorID" value="#form.VendorID#">
	   <cfinvokeargument name="PaymentDate" value="#CreateODBCDateTime(form.PaymentDate)#">
	   <cfinvokeargument name="PaidVia" value="#form.PaidVia#">
	   <cfinvokeargument name="PaymentAmount" value="#PaymentAmount#">
	</cfinvoke>
	
	<cfset CheckIsInActive = request.coopAdmincomponent.ActivateViaPayment(form.VendorID)>
	<cfset CheckIsIsNewVendor = request.coopAdmincomponent.IsNewVendor(form.VendorID)>
	
	
	<br>
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
       <tr>
            <td><strong>You have successfully added a payment for this vendor.</strong></td>
       </tr>
	   <tr>
	     <td>&nbsp;</td>
	   </tr>
	   <tr>
	      <td><a href="VendorDetail.cfm?VendorID=#form.VendorID#" onclick="self.close();" target="main">Click here</a> to close and refresh</td>
	   </tr>
	   
    </table>
   <cfelse>

	      <table border="0" cellpadding="3" cellspacing="0" width="100%">
			 <tr>
			   <td>&nbsp;</td>
			 </tr> 
			 <cfloop index="e" from="1" to="#ArrayLen(Error)#">
			  <tr>
			     <td class="Errortext">#Error[E]#</td>
			  </tr>
			 </cfloop>
			 <tr>
			   <td><a href="##" onclick="javascript:history.back();">Click here</a> to correct this<br></td>
			 </tr>
		  </table>	
		  
   </cfif>
</cfif>
</cfoutput> 
</body>
</html>
