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
                   <td>Please fill out the form below to add a new resource to the reosurce library.</td>
                </tr>
              </table>
			  <cfform name="addres" action="UpdateResource.cfm?action=Add" method="POST" enctype="multipart/form-data" scriptsrc="/scripts/cfform.js">
				  <table border="0" cellpadding="3" cellspacing="0">
	                <tr>
	                  <td><strong>Resource Label:</strong></td>
					  <td><input type="text" name="resname" value="" size="35" maxlength="150"></td>
	                </tr>
					<tr>
	                  <td><strong>Resource Type:</strong></td>
					  <td><select name="ResType">
					        <option value="">-- Select One --</option>
							 <cfoutput query="GetResType">
					           <option value="#GetResType.CodeValue#">#GetResType.CodeDesc#</option>
						     </cfoutput>
						  </select>
					  </td>
	                </tr>
					<tr>
	                  <td><strong>Category:</strong></td>
					  <td><select name="ResCat">
					        <option value="">-- Select One --</option>
					        <cfoutput query="GetResCat">
					           <option value="#GetResCat.CodeValue#">#GetResCat.CodeDesc#</option>
						     </cfoutput>
						  </select></td>
	                </tr>
					<tr>
					  <td colspan=2><strong>Show Only to Members:</strong> <input type="checkbox" name="MembersOnly" value="1"></td>
					</tr>
					<tr>
	                  <td><strong>Contact:</strong></td>
					  <td><input type="text" name="contact" value="" size="30" maxlength="80"></td>
	                </tr>
					<tr>
	                  <td><strong>Contact Email:</strong></td>
					  <td><input type="text" name="email" value="" size="30" maxlength="100"></td>
	                </tr>
					<tr>
	                  <td><strong>Contact Phone:</strong></td>
					  <td><input type="text" name="phone" value="" size="15" maxlength="15"></td>
	                </tr>
					<tr>
	                  <td><strong>Resource File:</strong> <br><font color="#959595">(pdf, doc, ppt, xls ONLY)</font></td>
					  <td><input type="file" name="resourcefile" size="15"></td>
	                </tr>
					<tr>
	                  <td><strong>Website:</strong></td>
					  <td><input type="text" name="website" value="" size="30" maxlength="100"></td>
	                </tr>
					<tr>
					  <td colspan=2><strong>Description:</strong><br>
					      <textarea name="ResDesc" rows="12" cols="45"></textarea>
					  </td>
					</tr>
					<tr>
					  <td colspan=2><input type="submit" name="submit" value="Add Resource >>"></td>
					</tr>
	              </table>
			  </cfform>
			   <br><br>
		 </td>
     </tr>
</table>  

<cfmodule template="#Application.footer#">