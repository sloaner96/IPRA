  <cfset CoopEndDate = Session.CoopConfig.CoopEndDate>
  <cfset DaysLeftToOrder = DateDiff('d', Now(), Session.CoopConfig.OrderEnd)>
  <!--- Get My Current order information  --->
    <cfset MyOrderInfo = request.CoopComponent.getCurrentorderInfo(Session.OrderID)>
    
	<cfset geteav = request.CoopComponent.GetEAVInfo(Session.MyCoopReg.RegEAV)> 
	
	<cfif DaysleftToOrder GTE 0>
	  <cfset AllowMaintenance = true>
	  
	  <cfif MyOrderInfo.orderComplete NEQ "">
	    <cfset AllowMaintenance = false>
	  </cfif>
	<cfelse>
	  <cfset AllowMaintenance = false>
	</cfif>

<cfmodule template="#Application.header#" section="0" sectiontitle="Cooperative Purchase Program">
  <cfoutput><br>
	<table border="0" cellpadding="5" cellspacing="0">
       <tr>
         <td><h3>IPRA Cooperative Purchase Program</h3></td>
       </tr>
    </table>
  	<cfmodule template="HeaderTabs.cfm" CoopEndDate="#CoopEndDate#" AllowMaintenance="#AllowMaintenance#" Page="5">
	<br>
	<table border="0" cellpadding="4" cellspacing="0" width="100%">
	   <tr>
	     <td>Use the form below to change or add a secondary admin that you may have set up when you registered for the Cooperative purchase program.</td>
	   </tr>		   
	</table><br>
	<table border="0" cellpadding="4" cellspacing="0" width="100%">
       <tr bgcolor="##9dabc4">
         <td><strong>Secondary Admin Information</strong></td>
       </tr>
	   <tr>
	     <td>
		   <cfform name="regmaint" action="regMaint_action.cfm" method="Post" scriptsrc="/scripts/">
		       <strong style="color:##cc0000;">* Required Fields</strong>
			   <table border="0" cellpadding="4" cellspacing="0"> 	   
				   <tr>
				     <td><strong>Firstname:</strong></td>
					 <td><cfinput type="text" name="SecFirstName" size="20" maxlength="50" value="#Trim(Session.MyCoopReg.SecFirstname)#" required="Yes" message="You must include the firstname"> <strong style="color:##cc0000;">*</strong></td>
				   </tr>
				   <tr>
				     <td><strong>Lastname:</strong></td>
					 <td><cfinput type="text" name="SecLastName" size="20" maxlength="50" value="#Trim(Session.MyCoopReg.SecLastname)#" required="Yes" message="You must include the lastname"> <strong style="color:##cc0000;">*</strong></td>
				   </tr>
				   <tr>
				     <td><strong>Phone:</strong></td>
					 <td><input type="text" name="SecPhone" size="20" maxlength="15" value="#Trim(Session.MyCoopReg.SecPhone)#"></td>
				   </tr>
				   <tr>
				     <td><strong>Fax:</strong></td>
					 <td><input type="text" name="Secfax" size="20" maxlength="15" value="#Trim(Session.MyCoopReg.SecFax)#"></td>
				   </tr>
				   <tr>
				     <td><strong>Email:</strong></td>
					 <td><cfinput type="text" name="SecEmail" size="20" maxlength="90" value="#Trim(Session.MyCoopReg.SecEmail)#" required="Yes" message="You must include the email address"> <strong style="color:##cc0000;">*</strong></td>
				   </tr>
				   <tr>
				     <td colspan="2">&nbsp;</td>
				   </tr>
				   <tr>
				     <td colspan="2" align="center"><input type="submit" name="submit" value="submit"></td>
				   </tr>
			   </table>
		   </cfform>
		 </td>
	   </tr>
     </table>           						
	<br><br><br><br>

 </cfoutput>		   	
<cfmodule template="#Application.footer#">
