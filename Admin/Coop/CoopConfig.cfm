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
		          <td><h3>Cooperative Purchase Program: Coop Configuration</h3></td>
		        </tr>
		      </table>
			  <table border="0" cellpadding="6" cellspacing="0" width="100%">
		        <tr>
		           <td class="RegText">
				     <cfif CurrentCoopConfig.RecordCount GT 0>
				      <table border="0" cellpadding="3" cellspacing="1" width="100%" bgcolor="##666666">
                         <tr bgcolor="##009900">
                            <td colspan="7"><strong style="color:##ffffff;">Currently Active Co-op Period</strong></td>
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
								   <td>#CurrentCoopConfig.CoopYear#</td>
								   <td>#DateFormat(CurrentCoopConfig.CoopEnrollmentBegin, 'MM/DD/YYYY')#</td>
								   <td>#DateFormat(CurrentCoopConfig.CoopEnrollmentEnd, 'MM/DD/YYYY')#</td>
								   <td>#DateFormat(CurrentCoopConfig.orderBegin, 'MM/DD/YYYY')#</td>
								   <td>#DateFormat(CurrentCoopConfig.OrderEnd, 'MM/DD/YYYY')#</td>
								   <td>#DateFormat(CurrentCoopConfig.CoopEndDate, 'MM/DD/YYYY')#</td>
					               <td><a href="reports/RegistrationReport.cfm?PeriodID=#CurrentCoopConfig.ConfigID#">#CurrentRegistrations#</a></td>
								 </tr>
							 </cfloop>
						 
						  
						
                      </table><br> 
					  </cfif>
					  <table border="0" cellpadding="3" cellspacing="1" width="100%" bgcolor="##666666">
                         <tr bgcolor="##003366">
                            <td colspan="6"><strong style="color:##ffffff;">Upcoming Co-Op Period</strong></td>
                         </tr>
						 <tr bgcolor="##eeeeee">
						   <td><strong>Year</strong></td>
						   <td><strong>Enrollment Begin</strong></td>
						   <td><strong>Enrollment End</strong></td>
						   <td><strong>Order Begin</strong></td>
						   <td><strong>Order End</strong></td>
						   <td><strong>Coop EndDate</strong></td>
						 </tr>
						 <cfif UpcomingCoopConfig.recordcount GT 0>
						 <cfloop query="UpcomingCoopConfig">
							 <tr bgcolor="##ffffff">
							   <td><a href="EditCoopConfig.cfm?CID=#UpComingCoopConfig.ConfigID#">#UpcomingCoopConfig.CoopYear#</a></td>
							   <td>#DateFormat(UpcomingCoopConfig.CoopEnrollmentBegin, 'MM/DD/YYYY')#</td>
							   <td>#DateFormat(UpcomingCoopConfig.CoopEnrollmentEnd, 'MM/DD/YYYY')#</td>
							   <td>#DateFormat(UpcomingCoopConfig.orderBegin, 'MM/DD/YYYY')#</td>
							   <td>#DateFormat(UpcomingCoopConfig.OrderEnd, 'MM/DD/YYYY')#</td>
							   <td>#DateFormat(UpcomingCoopConfig.CoopEndDate, 'MM/DD/YYYY')#</td>
							 </tr>
						 </cfloop>
						 <cfelse>
						   <tr bgcolor="ffffee">
						     <td colspan="6" align="center">There are currently no upcoming Purchasing Cycles. <a href="AddCoopConfig.cfm">Click here</a> to add one</td>
						   </tr>
						 </cfif>
                      </table><br>
					  <table border="0" cellpadding="3" cellspacing="1" width="100%" bgcolor="##666666">
                         <tr bgcolor="##a8a8a8">
                            <td colspan="7"><strong style="color:##ffffff;">Past Co-op Periods</strong></td>
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
						 <cfloop query="AllCoopConfig">
						  <cfif AllCoopConfig.ConfigID NEQ CurrentCoopConfig.ConfigID AND AllCoopConfig.ConfigID NEQ UpcomingCoopConfig.ConfigID>
						    <cfset PastRegistrations = Request.CoopAdminComponent.getRegisteredCount(AllCoopConfig.ConfigID)>
							 <tr bgcolor="##ffffff">
							   <td>#AllCoopConfig.CoopYear#</td>
							   <td>#DateFormat(AllCoopConfig.CoopEnrollmentBegin, 'MM/DD/YYYY')#</td>
							   <td>#DateFormat(AllCoopConfig.CoopEnrollmentEnd, 'MM/DD/YYYY')#</td>
							   <td>#DateFormat(AllCoopConfig.orderBegin, 'MM/DD/YYYY')#</td>
							   <td>#DateFormat(AllCoopConfig.OrderEnd, 'MM/DD/YYYY')#</td>
							   <td>#DateFormat(AllCoopConfig.CoopEndDate, 'MM/DD/YYYY')#</td>
				               <td><cfif PastRegistrations GT 0><a href="reports/RegistrationReport.cfm?PeriodID=#AllCoopConfig.ConfigID#">#PastRegistrations#</a><cfelse>0</cfif></td>
							 </tr>
						   </cfif>	 
						 </cfloop>
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