<cfset getConfig = request.CoopAdminComponent.getCoopConfigByID(url.CID)>
<cfset StartYear = GetConfig.CoopYear>
<cfset EndYear = GetConfig.CoopYear>

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
			   <form name="Editcoopconfig" action="Act_CoopConfig.cfm?action=Update" Method="POST">
			      <input type="hidden" name="ConfigID" value="#getConfig.ConfigID#">
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
					   <td><input type="text" name="enrollmentbegins" value="#DateFormat(getConfig.CoopEnrollmentBegin, 'mm/dd/yyyy')#" size="10" maxlength="10"> <em style="color:##aaaaaa;">format: mm/dd/yyyy</em></td>
					 </tr>
					 <tr>
					   <td><strong>Enrollment Ends:</strong></td>
					   <td><input type="text" name="EnrollmentEnds" value="#DateFormat(getConfig.CoopEnrollmentEnd, 'mm/dd/yyyy')#" size="10" maxlength="10"> <em style="color:##aaaaaa;">format: mm/dd/yyyy</em></td>
					 </tr>
					 <tr>
					   <td><strong>Ordering Begins:</strong></td>
					   <td><input type="text" name="orderingtBegins" value="#DateFormat(getConfig.orderBegin, 'mm/dd/yyyy')#" size="10" maxlength="10"> <em style="color:##aaaaaa;">format: mm/dd/yyyy</em></td>
					 </tr>
					 <tr>
					   <td><strong>Ordering Ends:</strong></td>
					   <td><input type="text" name="OrderingEnds" value="#DateFormat(getConfig.OrderEnd, 'mm/dd/yyyy')#" size="10" maxlength="10"> <em style="color:##aaaaaa;">format: mm/dd/yyyy</em></td>
					 </tr>
					 <tr>
					   <td><strong>Program Ends:</strong></td>
					   <td><input type="text" name="CycleEnds" value="#DateFormat(getConfig.CoopEndDate, 'mm/dd/yyyy')#" size="10" maxlength="10"> <em style="color:##aaaaaa;">format: mm/dd/yyyy</em></td>
					 </tr>
					 </table>
					 <table border="0" cellpadding="5" cellspacing="0">
					 <tr>
					   <td><strong>Memorandum of Understanding:</strong>To dynamically add the Agencies name in the body of the text add [AgencyName] in the text belwo and it will be replaced when the user see's the memorandum of understanding.</td>
					 </tr>
					 <tr>  
					   <td><textarea name="agreementtext" cols="65" rows="20" wrap="VIRTUAL">#trim(getConfig.AgreementText)#</textarea></td>
					 </tr>
					 <tr>
					   <td><input type="submit" name="submit" value="Update >>"></td>
					 </tr>
				   </table>
			   </form>
			   <br><br>
		 </td>
     </tr>
</table>  
</cfoutput>
<cfmodule template="#Application.footer#">