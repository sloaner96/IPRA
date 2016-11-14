<cfset CurrentCoopConfig = Request.CoopAdminComponent.getCoopConfig(now())>
<cfset UpcomingCoopConfig = Request.CoopAdminComponent.getFutureConfigs(now())>
<cfset PastCoopConfig = Request.CoopAdminComponent.getPastConfigs(now())>
<cfif CurrentCoopConfig.RecordCount GT 0>
    <cfif UpcomingCoopConfig.recordcount GT 0>
        <cfset StartYear = (UpcomingCoopConfig.CoopYear + 1)>
		<cfset AgreementText =  UpcomingCoopConfig.AgreementText>
    <cfelse>
         <cfset StartYear = (CurrentCoopConfig.CoopYear + 1)>	
		 <cfset AgreementText =  CurrentCoopConfig.AgreementText>
    </cfif>
<cfelse>
	 <cfif UpcomingCoopConfig.recordcount GT 0>   
	   <cfset StartYear = (UpcomingCoopConfig.CoopYear + 1)>
	   <cfset AgreementText =  UpcomingCoopConfig.AgreementText>
	<cfelse>
	  <cfset StartYear = year(Now())>
	  
	  <cfset AgreementText =  "#PastCoopConfig.AgreementText#">
	</cfif>
</cfif>
<cfset EndYear = (StartYear + 3)>
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
		          <td><h3>Cooperative Purchase Program: Add New Purchasing Cycle</h3></td>
		        </tr>
		      </table>
			  <table border="0" cellpadding="6" cellspacing="0" width="100%">
				<tr>
				   <td>Use the form below to add a new Cooperative Purchase Program Purchasing Cycle. You may have only <strong>One Purchasing Cycle Per Year</strong> and dates may not overlap a currently running program.</td>
				</tr>
		       </table><br>
			   <strong class="errortext">* All Fields Required</strong>
			   <form name="addcoopconfig" action="Act_CoopConfig.cfm?action=Add" Method="POST">
				   <table border="0" cellpadding="5" cellspacing="0">
					 <tr>
					   <td><strong>Coop Year:</strong></td>
					   <td><select name="CoopYear">
					        <cfloop index="year" from="#StartYear#" to="#EndYear#">
					         <option value="#year#">#year#</option>
						    </cfloop>
						   </select>
					   </td>
					 </tr>
					 <tr>
					   <td><strong>Enrollment Begins:</strong></td>
					   <td><input type="text" name="enrollmentbegins" value="" size="10" maxlength="10"> <em style="color:##aaaaaa;">format: mm/dd/yyyy</em></td>
					 </tr>
					 <tr>
					   <td><strong>Enrollment Ends:</strong></td>
					   <td><input type="text" name="EnrollmentEnds" value="" size="10" maxlength="10"> <em style="color:##aaaaaa;">format: mm/dd/yyyy</em></td>
					 </tr>
					 <tr>
					   <td><strong>Ordering Begins:</strong></td>
					   <td><input type="text" name="orderingtBegins" value="" size="10" maxlength="10"> <em style="color:##aaaaaa;">format: mm/dd/yyyy</em></td>
					 </tr>
					 <tr>
					   <td><strong>Ordering Ends:</strong></td>
					   <td><input type="text" name="OrderingEnds" value="" size="10" maxlength="10"> <em style="color:##aaaaaa;">format: mm/dd/yyyy</em></td>
					 </tr>
					 <tr>
					   <td><strong>Program Ends:</strong></td>
					   <td><input type="text" name="CycleEnds" value="" size="10" maxlength="10"> <em style="color:##aaaaaa;">format: mm/dd/yyyy</em></td>
					 </tr>
					 </table>
					 <table border="0" cellpadding="5" cellspacing="0">
					 <tr>
					   <td><strong>Memorandum of Understanding:</strong>To dynamically add the Agencies name in the body of the text add [AgencyName] in the text belwo and it will be replaced when the user see's the memorandum of understanding.</td>
					 </tr>
					 <tr>  
					   <td><textarea name="agreementtext" cols="65" rows="20" wrap="VIRTUAL">#trim(AgreementText)#</textarea></td>
					 </tr>
					 <tr>
					   <td><input type="submit" name="submit" value="Save >>"></td>
					 </tr>
				   </table>
			   </form>
			   <br><br>
		 </td>
     </tr>
</table>  
</cfoutput>
<cfmodule template="#Application.footer#">