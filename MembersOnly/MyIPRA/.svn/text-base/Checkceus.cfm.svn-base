<cfmodule template="#Application.header#" section="0" sectiontitle="Maintaining Certification">
  <cfoutput>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="150"><br>
	         <cfmodule template="#Application.tagdir#/MemberonlyNav.cfm" level=1>
		   </td>
		   <td valign="top"><br>
			  <table border="0" cellpadding="5" cellspacing="0">
		        <tr>
		          <td><h3>Check your CEUs</h3></td>
		        </tr>
		      </table>
			  <cfquery name="GetCert" datasource="#Application.dsn#">
			    Select *
				From Certifications
				Where MemberID = #Session.UserInfo.IPRAMemberID#
				Order By Description
			  </cfquery>
			  <table border="0" cellpadding="6" cellspacing="0" width="100%">
		        <tr>
		           <td class="RegText"><img border="0" src="/images/IPREAlogo.gif" width="150" height="58" align="right">
                    <p>Please do not send CEUs to IPRA at 
                        this time. The appropriate time to submit NRPA CEUs, 
                        missing IPRA CEUs, or other outside CEUs is when you 
                        renew your professional certification.</p><br>
				     <table border="0" cellpadding="3" cellspacing="1" width="100%" bgcolor="eeeee" class="regtext">
                      <cfif getCert.recordcount GT 0>
					   <tr bgcolor="##003366">
                         <td><strong style="color:ffffff;">Course Description</strong></td>
						 <td><strong style="color:ffffff;">Renewal year</strong></td>
						 <td><strong style="color:ffffff;">Course Hours</strong></td>
						 <td><strong style="color:ffffff;">NPRA</strong></td>
						 <td><strong style="color:ffffff;">Academic</strong></td>
						 <td><strong style="color:ffffff;">Other Credits</strong></td>
                       </tr>
					    <cfset TotalEarned = 0>
					   <cfloop query="GetCert">
						   <tr bgcolor="##ffffff">
						     <td>#GetCert.Description#</td>
						     <td>#GetCert.CERTYEAR#</td>  
							 <td>#NumberFormat(GetCert.CourseHrs, 9.99)#</td>
							 <td>#NumberFormat(GetCert.NRPA)#</td>
							 <td>#NumberFormat(GetCert.ACAD)#</td>
							 <td>#NumberFormat(GetCert.OCE1, 9.99)#</td>
						   </tr>
						   <cfset TotalEarned = totalEarned + (NumberFormat(GetCert.CourseHrs, 9.99) + NumberFormat(GetCert.NRPA) + NumberFormat(GetCert.ACAD) + NumberFormat(GetCert.OCE1, 9.99))>
					   </cfloop>
					   <tr>
					     <td colspan=6 align="Right"><strong>TOTAL EARNED:</strong> #NumberFormat(TotalEarned, 9.99)#</td>
					   </tr>
					   <cfelse>
					     <tr bgcolor="##ffffff">
						   <td class="ErrorText">There are currently no CEUs on file for you.</td>
						 </tr>
					   </cfif>
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
