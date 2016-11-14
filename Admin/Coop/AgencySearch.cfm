<cfif Len(Trim(form.searchAg)) EQ 0>
  <cflocation url="AgencyMaint.cfm?e=1" addtoken="no">
</cfif>
<cfset AgencySearch = request.CoopAdminComponent.AgencySearch(form.searchAg)>

<cfmodule template="#Application.header#" section="0" sectiontitle="Coop Maintenance">

	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="160"><br>
		    <cfmodule template="#Application.tagdir#/adminnav.cfm" level="5">
		   </td>
		   <td valign="top"><br>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>Cooperative Purchase Program: Agency Search</h3></td>
		        </tr>
		      </table>
			  <table border="0" cellpadding="6" cellspacing="0" width="100%">
		        <tr>
		           <td class="RegText">
				      
					  <cfif AgencySearch.recordcount GT 0>
					     <cfoutput>
						 <p>Your Search ("<em>#form.searchAg#</em>") returned the following possible matches</p>
						 </cfoutput>
						  <table border="0" cellpadding="4" cellspacing="0" width="100%">
	                          <tr bgcolor="#eeeeee">
							    <td><strong>Company</strong></td>
							  </tr>
							  <cfoutput query="AgencySearch" group="MemberID">
							    <tr>
	                               <td><a href="Reports/orderByAgency.cfm?MemID=#AgencySearch.MemberID#">#AgencySearch.Company#</a></td>
	                            </tr>
							   </cfoutput>
	                      </table>
					  <cfelseif AgencySearch.recordcount EQ 0>
					    <table border="0" cellpadding="0" cellspacing="0" width="100%">
						  <tr>
						    <td>Your Search Returned no matches. <a href="##" onclick="javascript:go.back(-1);">Please go back</a> an refine your search</td>
						  </tr>
						</table>
					  </cfif>
				   </td>
		        </tr>
		       </table>
			   <br><br>
		 </td>
     </tr>
</table>  
<cfmodule template="#Application.footer#">