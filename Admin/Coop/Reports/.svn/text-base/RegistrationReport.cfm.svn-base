<cfparam name="Url.PeriodID" default="0">

<cfset registerReport = request.CoopAdminComponent.getRegisteredAgency(url.PeriodID)>
<cfmodule template="#Application.header#" section="0" sectiontitle="Cooperative Purchase Reports">
  <cfoutput>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="160"><br>
		    <cfmodule template="#Application.tagdir#/adminnav.cfm" level="5">
		   </td>
		   <td valign="top"><br>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>Cooperative Purchase Program: Reports: Program Participants</h3></td>
		        </tr>
		      </table>
			  <table border="0" cellpadding="6" cellspacing="0" width="100%">
		        <tr>
		           <td class="RegText">
				      <table border="0" cellpadding="4" cellspacing="1" width="100%" bgcolor="##666666">
                          <tr bgcolor="##9dabc4">
                            <td><strong>Agency</strong></td>
							<td><strong>Date Registered</strong></td>
							<td><strong>Contact</strong></td>
							<td><strong>Total Items</strong></td>
							<td><strong>Total Cost</strong></td>
                          </tr> 
						   <cfset PeriodTotal = 0>
						  <cfloop query="registerReport">
						    <cfset PeriodTotal = PeriodTotal + numberformat(registerReport.OrderTotal,0.00)>
						    <tr bgcolor="##ffffff">
							  <td><cfif RegisterReport.OrderID NEQ ""><a href="OrderByAgency.cfm?orderID=#RegisterReport.OrderID#&MemID=#RegisterReport.MemberID#"></cfif><cfif AgencyName NEQ "">#registerReport.AgencyName#<cfelse>#registerReport.Company#</cfif><cfif RegisterReport.OrderID NEQ ""></a></cfif></td>
							  <td>#DateFormat(registerReport.RegistrationDate, 'mm/dd/yyyy')#</td>
							  <td>#registerReport.Firstname# #registerReport.lastname#</td>
							  <td>#registerReport.TotalItems#</td>
							  <td align="right">#DollarFormat(registerReport.OrderTotal)#</td>
							</tr>
						  </cfloop>
						  <tr bgcolor="##eeeeee">
						    <td colspan="5" align="right"><strong>Program Total: #DollarFormat(PeriodTotal)#</strong></td>
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