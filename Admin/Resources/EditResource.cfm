<cfparam name="url.e" default="0">
<cfmodule template="#Application.header#" section="0" sectiontitle="Site Admin">
<cfquery name="GetResType" datasource="#Application.dsn#">
  Select CodeValue, CodeDesc
   From Lookup
  Where CodeGroup = 'RESTYPE'
  order By Ranking, CodeDesc
</cfquery>

<cfquery name="GetResCat" datasource="#Application.dsn#">
  Select CodeValue, CodeDesc
   From Lookup
  Where CodeGroup = 'RESCAT'
  order By Ranking, CodeDesc
</cfquery>

<cfquery name="GetRes" datasource="#Application.dsn#">
  Select *
  From Resources
  Where ResourceID = #url.recID#
</cfquery>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="160"><br>
		    <cfmodule template="#Application.tagdir#/adminnav.cfm" level="1">
		   </td>
		   <td valign="top" ><br>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>Add New Resource</h3></td>
		        </tr>
		      </table>
			  <table border="0" cellpadding="3" cellspacing="0" width="100%">
                <tr>
                   <td>Please fill out the form below to update this resource.</td>
                </tr>
              </table>
			  <cfform name="addres" action="UpdateResource.cfm?action=Edit" method="POST" enctype="multipart/form-data" scriptsrc="/scripts/cfform.js">
				 <cfoutput>
				   <input type="hidden" name="ResID" value="#GetRes.ResourceID#">
				  <table border="0" cellpadding="3" cellspacing="0">
	                <tr>
					  <td colspan=2><strong style="color:##990000;">De-Activate Resource:</strong> <input type="checkbox" name="MembersOnly" value="1" <cfif GetRes.Active EQ 0>Checked</cfif>></td>
					</tr>
					<tr>
	                  <td><strong>Resource Label:</strong></td>
					  <td><input type="text" name="resname" value="#GetRes.ResourceLabel#" size="35" maxlength="150"></td>
	                </tr>
					<tr>
	                  <td><strong>Resource Type:</strong></td>
					  <td><select name="ResType">
					        <option value="">-- Select One --</option>
							 <cfloop query="GetResType">
					           <option value="#GetResType.CodeValue#" <cfif GetRes.ResourceType EQ GetresType.Codevalue>Selected</cfif>>#GetResType.CodeDesc#</option>
						     </cfloop>
						  </select>
					  </td>
	                </tr>
					<tr>
	                  <td><strong>Category:</strong></td>
					  <td><select name="ResCat">
					        <option value="">-- Select One --</option>
					        <cfloop query="GetResCat">
					           <option value="#GetResCat.CodeValue#" <cfif GetRes.Category EQ Getrescat.Codevalue>Selected</cfif>>#GetResCat.CodeDesc#</option>
						     </cfloop>
						  </select></td>
	                </tr>
					<tr>
					  <td colspan=2><strong>Show Only to Members:</strong> <input type="checkbox" name="MembersOnly" value="1" <cfif GetRes.MembersOnly EQ 1>Checked</cfif>></td>
					</tr>
					<tr>
	                  <td><strong>Contact:</strong></td>
					  <td><input type="text" name="contact" value="#GetRes.ContactName#" size="30" maxlength="80"></td>
	                </tr>
					<tr>
	                  <td><strong>Contact Email:</strong></td>
					  <td><input type="text" name="email" value="#GetRes.ContactEmail#" size="30" maxlength="100"></td>
	                </tr>
					<tr>
	                  <td><strong>Contact Phone:</strong></td>
					  <td><input type="text" name="phone" value="#GetRes.ContactPhone#" size="15" maxlength="15"></td>
	                </tr>
					<cfif GetRes.ResourceFile NEQ "">
					 <tr>
					   <td colspan=2><strong>Current File:</strong> <a href="#Application.baseurl#/Resources/Downloadresource.cfm?ResID=#GetRes.ResourceID#" target="_blank">#GetRes.ResourceFile#</a></td>
					 </tr>
					</cfif>
					<tr>
	                  <td><strong>Replace File:</strong> <br><font color="##959595">(pdf, doc, ppt, xls ONLY)</font></td>
					  <td><input type="file" name="resourcefile" size="15"></td>
	                </tr>
					
					<tr>
	                  <td><strong>Website:</strong></td>
					  <td><input type="text" name="website" value="#GetRes.ResourceLink#" size="30" maxlength="100"></td>
	                </tr>
					<tr>
					  <td colspan=2><strong>Description:</strong><br>
					      <textarea name="ResDesc" rows="12" cols="45">#GetRes.ResourceDesc#</textarea>
					  </td>
					</tr>
					<tr>
					  <td colspan=2><input type="submit" name="submit" value="Update Resource >>"></td>
					</tr>
	              </table>
				 </cfoutput> 
			  </cfform>
			   <br><br>
		 </td>
     </tr>
</table>  

<cfmodule template="#Application.footer#">