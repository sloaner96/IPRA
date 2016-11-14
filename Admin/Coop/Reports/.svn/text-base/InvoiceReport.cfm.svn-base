
<cfmodule template="#Application.header#" section="0" sectiontitle="Cooperative Purchase Program">
  <cfoutput><br>
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
      <tr>
         <td valign="top" width="160"><br>
		    <cfmodule template="#Application.tagdir#/adminnav.cfm" level="5">
         </td>
         <td valign="top">


	<table border="0" cellpadding="5" cellspacing="0">
       <tr>
         <td><h3>IPRA Cooperative Purchase Program: Purchase Order Report</h3></td>
       </tr>
    </table>
     <div align="right"><a href="index.cfm"><< Back to Reports Home</a><br><br></div>
     <table border="0" cellpadding="4" cellspacing="0" width="100%">
       <cfif Not IsDefined("form.ConfigID")>
		   <tr>
		     <td>Use the form below to select the period for which you would like to generate a PO invoice report.</td>
		   </tr>
		   <tr>
		     <td>
			   
			      <cfset getconfigs = request.CoopAdminComponent.getAllConfigs()>
				   <form name="coopItems" action="InvoiceReport.cfm" method="post"> 
				    <table border="0" cellpadding="4" cellspacing="0">
					  <tr>
					    <td><strong>Coop Period:</strong> 
						    <select name="ConfigID">
							  <cfloop query="GetConfigs">
						      <option value="#getConfigs.ConfigID#">#getconfigs.CoopYear#</option>
							  </cfloop>
							</select>
						</td>
					  </tr>
					  <tr>
					    <td><input type="submit" name="submit" value="Get Invoices"></td>
					  </tr>
		           </table>
		         </form>
			 <cfelse>
			    <cfset CoopInvoices = request.CoopAdminComponent.getInvoices(Form.ConfigID)>
			    <table border="0" cellpadding="4" cellspacing="1" width="100%" bgcolor="##eeeeee">
	               <tr bgcolor="##006699">
				      <td><strong style="color:##ffffff;">Registration Date</strong></td>
	                  <td><strong style="color:##ffffff;">Name</strong></td>
					  <td><strong style="color:##ffffff;">PO Number</strong></td>
					  <td><strong style="color:##ffffff;">Amount</strong></td>
	              </tr>
				  <cfloop query="CoopInvoices">
					  <tr bgcolor="##ffffff">
					      <td>#DateFormat(CoopInvoices.DateAuthorized, 'MM/DD/YYYY')#</td>
					      <td><strong>#CoopInvoices.Company#</strong><br>
						      #CoopInvoices.Firstname# #CoopInvoices.Lastname#<br>
							  #CoopInvoices.Address1#<br><cfif CoopInvoices.Address2 NEQ "">#CoopInvoices.Address2#<br></cfif>
							  #CoopInvoices.City#, #CoopInvoices.State# #CoopInvoices.ZipCode#  
						  </td>
						  <td>#CoopInvoices.PONumber#</td>
						  <td>#DollarFormat(CoopInvoices.Amount)#</td>
					  </tr>
				  </cfloop>
	            </table>	 
			 </cfif>
		  <br><br><br><br>
	  </td>
	</tr>
</table>

 </cfoutput>		   	
<cfmodule template="#Application.footer#">