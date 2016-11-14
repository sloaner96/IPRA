<cfset VendorFirstLetter = request.CoopAdminComponent.GetVendorFirstLetter()>

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
		          <td><h3>Cooperative Purchase Program: Vendor Maintenance</h3></td>
		        </tr>
		      </table>
			  <table border="0" cellpadding="6" cellspacing="0" width="100%">
		        <tr>
		           <td class="RegText">
				      <table border="0" cellpadding="0" cellspacing="0" width="99%">
                         <tr> 
                           <td align="right"><a href="AddVendor.cfm"><strong>Add a New Vendor</strong></a></td>
                         </tr>
                      </table><br>
					  <table border="0" cellpadding="4" cellspacing="0" width="100%">
                       <tr bgcolor="##9dabc4">
                          <td><strong>Select Vendor</strong></td>
                       </tr> 
					   <tr>
					      <td align="center">
						    <table border="0" cellpadding="3" cellspacing="0" align="center">
                              <tr>
                                <cfloop query="VendorFirstLetter">
								   <td align="center"><a href="vendorMaint.cfm?VenLet=#VendorFirstLetter.VendorLetter#">#VendorFirstLetter.VendorLetter#</a></td>
								   <cfif VendorFirstLetter.CurrentRow NEQ VendorFirstLetter.RecordCount><td align="center">|</td></cfif>
								</cfloop>
                              </tr>
                            </table>
							
						  </td>
					   </tr>
                      </table>
					  <cfif ISDefined("url.VenLet")>
							  <cfset getVendors = request.CoopAdminComponent.GetVendorByFirstLetter(url.VenLet)>
							    <p>Click on the company name to view information about the Vendor</p>
								<table border="0" cellpadding="3" cellspacing="0" width="100%">
	                              <tr bgcolor="##cccc66">
	                                <td><strong>Company Name</strong></td>
	                              </tr>
								  <cfloop query="getVendors">
								   <tr>
								     <td><a href="VendorDetail.cfm?VendorID=#getVendors.VendorID#">#getVendors.CompanyName#</a></td>
								   </tr>
								  </cfloop>
	                            </table>
							</cfif>
					  <br><br>
				   </td>
		        </tr>
		       </table>
			   <br><br>
		 </td>
     </tr>
</table>  
</cfoutput>
<cfmodule template="#Application.footer#">