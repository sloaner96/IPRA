<cfmodule template="#Application.header#" sectiontitle="Resource Directory">
  <cfoutput>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="170"><br>
	         <cfmodule template="#Application.tagdir#/resourcenav.cfm">
		   </td>
		   
		   <td valign="top"><br>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>Find A Facility</h3></td>
		        </tr>
		      </table>
			  <cfif Not IsDefined("url.AgencyID")>
			      <cfif Not IsDefined("form.Facility") AND Not IsDefined("form.city") AND Not IsDefined("form.Company")>
				    <meta http-equiv="refresh" content="0;url=FindAFacility.cfm?e=1">
					<!--- <cflocation url="FindAFacility.cfm?e=1" addtoken="No"> --->
				  </cfif>
				  <cfif form.Facility EQ "" AND form.city EQ "" AND form.Company EQ "">
				  <meta http-equiv="refresh" content="0;url=FindAFacility.cfm?e=1">
				    <!--- <cflocation url="FindAFacility.cfm?e=1" addtoken="No"> --->
				  </cfif>
				  
				  <cfquery name="FindFac" datasource="#Application.dsn#">
				    select Distinct  A.AgencyID, A.AgencyName,A.addr1, A.addr2, A.city, A.state, A.zip, A.Phone
					From Agencies A, AgencyResources R 
					Where R.AgencyID = A.AgencyID
					<cfif form.City NEQ "">
					  AND A.City = '#City#'
					</cfif>
					<cfif form.Company NEQ "">
					  AND A.AgencyName = '#form.company#'   
					</cfif>
					<cfif form.facility NEQ "">
					  AND R.ResourceType = '#Form.Facility#'   
					  </cfif>
					Order By A.City, A.AgencyName
				  </cfquery>
				  
				  <table border="0" cellpadding="6" cellspacing="0" width="100%">
					<tr>
					  <td class="regtext">
					    <table border="0" cellpadding="0" cellspacing="0" width="100%">
	                      <tr>
	                         <td>Below are the agencies that meet your search criteria. Click on the name to view the facility detail.</td>
	                      </tr>
	                    </table><br>
						<table border="0" cellpadding="4" cellspacing="0" width="100%">
	                      <cfloop query="FindFac"> 
						  <tr <cfif Findfac.currentrow MOD(2) EQ 1>bgcolor="eeeeee"</cfif>>
	                        <td valign="top"><a href="FacilityFinder_action.cfm?AgencyID=#FindFac.AgencyID#">#FindFac.AgencyName#</a></td>
							<td>#FindFac.Addr1#<br>#FindFac.Addr2#<br> #FindFac.City#, #FindFac.State# #FindFac.Zip#<br>#Phone#</td>
	                      </tr>
						  </cfloop>
	                    </table>
					  </td>
					</tr>
			       </table>
			   <cfelseif IsDefined("url.agencyID")>
			    <cfquery name="FindFac" datasource="#Application.dsn#">
				    select A.*
					From Agencies A
					Where A.AgencyID = #url.agencyID#
					Order By A.City, A.AgencyName
				  </cfquery>
			     <table border="0" cellpadding="3" cellspacing="0" width="100%">
                    <tr>
                     <td>Details for <strong>#FindFac.AgencyName#</strong></td>
                   </tr>
				   <tr>
				     <td>#FindFac.Addr1#<br>
					    <cfif Len(trim(findFac.addr2)) GT 0> 
					      #FindFac.Addr2#<br>
						 </cfif>
						 <cfif Len(trim(findFac.addr3)) GT 0>
						  #FindFac.Addr3#<br>
						 </cfif>
					     #FindFac.City#, #FindFac.State# #FindFac.Zip#<br><br>
						 <cfif findfac.Phone NEQ "">
						 <strong>Phone:</strong> #FindFac.Phone#<br>
						 </cfif>
						 <cfif findfac.Fax NEQ "">
						 <strong>Fax:</strong> #FindFac.Fax#<br>
						 </cfif>
						 <cfif findfac.TollFree NEQ "">
						 <strong>TollFree:</strong> #FindFac.TollFree# <br>
						 </cfif>
						 <cfif findfac.Email NEQ "">
						 <strong>Email:</strong> <a href="mailto:#FindFac.Email#">#FindFac.Email#</a><br>
						 </cfif>
						 <cfif findfac.Website NEQ "">
						 <strong>Website:</strong> <a href="http://#replacenocase(FindFac.Website, 'http://', '', 'all')#" target="_blank">#FindFac.Website#</a><br><br>
						 </cfif>
						 <strong>Population:</strong> <cfif FindFac.Population NEQ "">#FindFac.Population#<cfelse>N/A</cfif>
					 </td>
				   </tr>
                 </table><hr noshade size="1">	
				 <cfquery name="GetFacType" datasource="#Application.dsn#">
				   Select ResourceType, Quantity, ConcessionStand, Washrooms,Rentals, AcreageOwned, AcreageLeased,
				     (Select CodeDesc  
					  From Lookup
					  Where Codegroup = 'FACRES'
					  AND CodeValue = R.Resourcetype) as FacilityType
				   From AgencyResources  R
				   Where AgencyID = #findFac.AgencyID#
				   Order By ResourceType 
				 </cfquery>  
				 <cfif GetFacType.Recordcount GT 0>
				 <table border="0" cellpadding="0" cellspacing="0">
                   <tr>
                     <td valign="bottom"><img src="/images/FacilityHead.gif" alt="" border="0"></td>
					 <td valign="bottom"><img src="/images/Fac_Quantity.gif" alt="" border="0"></td>
					 <td valign="bottom"><img src="/images/FAC_Conce.gif" alt="" border="0"></td>
					 <td valign="bottom"><img src="/images/FAC_Wash.gif" alt="" border="0"></td>
					 <td valign="bottom"><img src="/images/FAC_Rent.gif" alt="" border="0"></td>
					 <td valign="bottom"><img src="/images/FAC_AcreO1.gif" alt="" border="0"></td>
					 <td valign="bottom"><img src="/images/FAC_AcreO.gif" alt="" border="0"></td>
					 <td valign="bottom"><img src="/images/FAC_AcreL.gif" alt="" border="0"></td>
                   </tr>
				   
				   <cfloop query="GetFacType">
					   <tr <cfif GetFacType.CurrentRow MOD(2) EQ 1>bgcolor="##eeeeee"</cfif>>
					     <td width="104">#GetFacType.FacilityType#</td>
						 <td align="center">#GetFacType.Quantity#</td>
						 <td align="center"><cfif GetFacType.ConcessionStand EQ 1><img src="/images/FAC_On.gif" width="12" height="12" alt="" border="0" align="middle"><cfelse><img src="/images/FAC_Off.gif" width="12" height="12" alt="" border="0"  align="middle"></cfif></td>
						 <td align="center"><cfif GetFacType.Washrooms EQ 1><img src="/images/FAC_On.gif" width="12" height="12" alt="" border="0" align="middle"><cfelse><img src="/images/FAC_Off.gif" width="12" height="12" alt="" border="0"  align="middle"></cfif></td>
						 <td align="center"><cfif GetFacType.Rentals EQ 1><img src="/images/FAC_On.gif" width="12" height="12" alt="" border="0" align="middle"><cfelse><img src="/images/FAC_Off.gif" width="12" height="12" alt="" border="0"  align="middle"></cfif></td>
						 <td>&nbsp;</td>
						 <td align="center">#GetFacType.AcreageOwned#</td>
						 <td align="center">#GetFacType.AcreageLeased#</td>
					   </tr>
				   </cfloop>
				   <cfelse>
				     <table border="0" cellpadding="4" cellspacing="0" width="100%">
                        <tr>
                          <td><strong class="ErrorHead">There are no facilities associated with this agency/company</strong></td>
                        </tr>
						<tr>
						  <td><a href="/Resources/FindAFacility.cfm">Click Here</a> to Search again</td>
						</tr>
                     </table>
				   </cfif>
				   
                 </table>
			   <cfelseif Not IsDefined("url.agency") AND (Not IsDefined("form.Facility") AND Not IsDefined("form.city") AND Not IsDefined("form.Company"))>
			     <meta http-equiv="refresh" content="0;url=/Resources/FindaFacility.cfm">
				 <!--- <cflocation url="/Resources/FindaFacility.cfm"> --->
			   </cfif>
			   
			   <br><br>
		 </td>
     </tr>
</table>  
</cfoutput>
<cfmodule template="#Application.footer#">