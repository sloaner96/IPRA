<cfmodule template="#Application.header#" section="0" sectiontitle="Maintaining Facilities">
  <cfif Session.UserInfo.IPRACOID NEQ "">
  <cfquery name="GetAgency" datasource="#Application.dsn#">
     Select * 
	 From Agencies
	 Where IPRAAgencyID = #Session.UserInfo.IPRACOID#
  </cfquery>
  </cfif>
  <cfoutput>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="150"><br>
	         <cfmodule template="#Application.tagdir#/MemberonlyNav.cfm" level=1>
		   </td>
		   <td valign="top"><br>
			  <table border="0" cellpadding="5" cellspacing="0">
		        <tr>
		          <td><h3>Manage Your Facilities</h3></td>
		        </tr>
		      </table>
			  <cfif Session.UserInfo.IPRACOID NEQ "">
			  <table border="0" cellpadding="6" cellspacing="0" width="100%">
		        <tr>
		           <td class="RegText">
				      <table border="0" cellpadding="0" cellspacing="0" width="100%">
                         <tr>
                           <td><strong>#GetAgency.AgencyName#</strong></td>
                         </tr>
						 <tr>
						   <td>#GetAgency.Addr1#<br>
						       <cfif GetAgency.addr2 NEQ "">#GetAgency.Addr2#<br></cfif>
							   #GetAgency.City#, #GetAgency.State# #GetAgency.Zip#<br>
							   <strong>Phone:</strong> #GetAgency.Phone#
							</td>
						 </tr>
                      </table><br>
				      <table border="0" cellpadding="3" cellspacing="0" width="100%">
                         <tr bgcolor="##eeeee">
                            <td><strong>Demographic Information</strong></td>
                         </tr>
                      </table>
					  <cfform name="demupdate" action="EditFacility_Action.cfm?Action=Dem" Method="POST" scriptsrc="/scripts/cfform.js">
					     <input type="hidden" name="AgencyID" value="#GetAgency.AgencyID#">
						  <table border="0" cellpadding="4" cellspacing="0">
	                        <tr>
	                          <td><strong>Budget:</strong></td>
							  <td><input type="text" name="budget" value="#Trim(Numberformat(GetAgency.Budget, 0.00))#" width="8" maxlenth="20"> <strong><font color="red">(Do Not Use Comma's)</font></strong></td>
	                        </tr>
							<tr>
	                          <td><strong>Population:</strong></td>
							  <td><input type="text" name="population" value="#Trim(GetAgency.Population)#" width="8" maxlenth="20"> <strong><font color="red">(Do Not Use Comma's)</font></strong></td>
	                        </tr>
							<tr>
							  <td colspan=2><input type="submit" name="submit" value="Update >>"></td>
							</tr>
	                      </table>
					  </cfform>
					  <br>
					  <table border="0" cellpadding="3" cellspacing="0" width="100%">
                         <tr bgcolor="##eeeee">
                            <td><strong>Facilities</strong></td>
							<td align="right"><a href="javascript:void(0);" onclick="window.open('/MembersOnly/MyIPRA/AddFacility.cfm?agencyid=#GetAgency.AgencyID#', 'popupwin', 'height=330, width=440, top=200, left=250, scrollbars=yes, resizable=yes');self.name = 'main';"title="Add New Facility">[ADD NEW]</a></td>
                         </tr>
                      </table>
					  <cfquery name="GetFacilities" datasource="#Application.dsn#">
					    Select R.AgResourceID, CodeDesc
						From AgencyResources R, Lookup L
						Where R.AgencyID = #GetAgency.AgencyID#
						AND L.CodeValue = R.ResourceType
						AND L.CodeGroup = 'FACRES'
						Order By codeDesc
					  </cfquery>
					  <table border="0" cellpadding="4" cellspacing="0" width="100%">
                        <tr>
                          <td width="10" bgcolor="##ffffff">&nbsp;</td>
						  <td>Existing Facilities: (click to Edit)</td>
                        </tr>
						<cfloop query="GetFacilities">
						  <tr>
                            <td width="10" bgcolor="##ffffff">&nbsp;</td>
						    <td><a href="javascript:void(0);" onclick="window.open('EditFacilityDem.cfm?agencyid=#GetAgency.AgencyID#&AgRes=#GetFacilities.AGResourceID#', 'popupwin', 'height=330, width=485, top=200, left=250, scrollbars=yes, resizable=yes');self.name = 'main';"title="Edit Facility">#CodeDesc#</a></td>
                          </tr>
						</cfloop>
                      </table>
				   </td>
		        </tr>
		       </table>
			 <cfelse>
			   <p class="ErrorText">Error! Due to a configuration problem with you account, you may not update your facilities.</p>
			 </cfif>  
			   <br><br>
		 </td>
     </tr>
</table>  
</cfoutput>
<cfmodule template="#Application.footer#">