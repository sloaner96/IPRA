<cfparam name="url.e" default="0">

<cfset AllCoopConfig = Request.CoopAdminComponent.getAllConfigs()>
<cfset CurrentCoopConfig = Request.CoopAdminComponent.getCoopConfig(now())>
<cfset UpcomingCoopConfig = Request.CoopAdminComponent.getFutureConfigs(now())>

<cfmodule template="#Application.header#" section="0" sectiontitle="Coop Maintenance">
  <cfoutput>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="160"><br>
		    <cfmodule template="#Application.tagdir#/adminnav.cfm" level="5">
		   </td>
		   <td valign="top"><br>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>Cooperative Purchase Program: Agency Maintenance</h3></td>
		        </tr>
		      </table>
			  <cfif url.e EQ 1>
			    <p class="Errortext"><strong>Error! You must enter a search criteria</strong></p>
			  </cfif>
			  <form name="searchag" action="AgencySearch.cfm" method="Post">
			  <table border="0" cellpadding="0" cellspacing="0" width="100%">
                 <tr>
                    <td><strong>Search For a Registered Agency:</strong></td>
					<td><input type="text" name="searchAg" size="40" maxlegth="80">&nbsp;&nbsp;&nbsp;<input type="submit" value="submit" name="search >>"></td>
                 </tr>
              </table><br>
			  </form>
			  <table border="0" cellpadding="6" cellspacing="0" width="100%">
		        <tr>
				  <td>Below are the cooperative Purchase program years in the system. Click the year to view the Agencies registered for this program</td>
				</tr>
				<tr>
		           <td class="RegText">
				      <strong>Bold Year</strong> is the currently running period
				      <table border="0" cellpadding="3" cellspacing="1" width="100%" bgcolor="##666666">
                         <tr bgcolor="##003366">
                            <td colspan="7"><strong style="color:##ffffff;">Cooperative Purchase Programs</strong></td>
                         </tr> 
						 <tr bgcolor="##eeeeee">
						   <td><strong>Year</strong></td>
						   <td><strong>Enrollment Begin</strong></td>
						   <td><strong>Enrollment End</strong></td>
						   <td><strong>Order Begin</strong></td>
						   <td><strong>Order End</strong></td>
						   <td><strong>Coop EndDate</strong></td>
			               <td><strong>Enrolled Agencies</strong></td>
						 </tr>
						 <cfloop query="CurrentCoopConfig">
						    <cfset CurrentRegistrations = Request.CoopAdminComponent.getRegisteredCount(CurrentCoopConfig.ConfigID)>
							 <tr bgcolor="##ffffff">
							   <td><a href="reports/RegistrationReport.cfm?PeriodID=#CurrentCoopConfig.ConfigID#"><strong>#CurrentCoopConfig.CoopYear#</strong></a></td>
							   <td>#DateFormat(CurrentCoopConfig.CoopEnrollmentBegin, 'MM/DD/YYYY')#</td>
							   <td>#DateFormat(CurrentCoopConfig.CoopEnrollmentEnd, 'MM/DD/YYYY')#</td>
							   <td>#DateFormat(CurrentCoopConfig.orderBegin, 'MM/DD/YYYY')#</td>
							   <td>#DateFormat(CurrentCoopConfig.OrderEnd, 'MM/DD/YYYY')#</td>
							   <td>#DateFormat(CurrentCoopConfig.CoopEndDate, 'MM/DD/YYYY')#</td>
				               <td>#CurrentRegistrations#</td>
							 </tr>
						 </cfloop>
						 <cfloop query="AllCoopConfig">
						  <cfif AllCoopConfig.ConfigID NEQ CurrentCoopConfig.ConfigID AND AllCoopConfig.ConfigID NEQ UpcomingCoopConfig.ConfigID>
						    <cfset PastRegistrations = Request.CoopAdminComponent.getRegisteredCount(AllCoopConfig.ConfigID)>
							 <tr bgcolor="##ffffff">
							   <td><cfif PastRegistrations GT 0><a href="reports/RegistrationReport.cfm?PeriodID=#AllCoopConfig.ConfigID#">#AllCoopConfig.CoopYear#</a><cfelse>#AllCoopConfig.CoopYear#</cfif></td>
							   <td>#DateFormat(AllCoopConfig.CoopEnrollmentBegin, 'MM/DD/YYYY')#</td>
							   <td>#DateFormat(AllCoopConfig.CoopEnrollmentEnd, 'MM/DD/YYYY')#</td>
							   <td>#DateFormat(AllCoopConfig.orderBegin, 'MM/DD/YYYY')#</td>
							   <td>#DateFormat(AllCoopConfig.OrderEnd, 'MM/DD/YYYY')#</td>
							   <td>#DateFormat(AllCoopConfig.CoopEndDate, 'MM/DD/YYYY')#</td>
				               <td>#PastRegistrations#</td>
							 </tr>
						   </cfif>	 
						 </cfloop>
                      </table><br>
				   </td>
		        </tr>
		       </table>
			   <br><br>
		 </td>
     </tr>
</table>  
</cfoutput>
<cfmodule template="#Application.footer#">