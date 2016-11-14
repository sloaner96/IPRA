<cfquery name="GetRes" datasource="#Application.dsn#">
  Select R.*,
      (Select Codedesc
	    From Lookup
	    where CodeValue = R.Category
	    AND CodeGroup = 'RESCAT') as CatName,
      (Select CodeDesc
	    From Lookup
		Where CodeGroup = 'RESTYPE'
		 AND CodeValue = R.ResourceType) As ResourceTypeDesc
  From Resources R
  Where R.Active = 1
  AND R.ResourceID = <cfqueryparam value="#url.recid#" cfsqltype="CF_SQL_INTEGER">
   <cfif NOT IsDefined("session.userinfo.memberID")>
	  AND R.MembersOnly = 0
   </cfif>	   
  order by Category, ResourceType, ResourceLabel  
</cfquery>

<cfmodule template="#Application.header#" sectiontitle="Resource Library">
  <cfoutput>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width=167"><br>
	         <cfmodule template="#Application.tagdir#/resourcenav.cfm">
		   </td>
		   <td valign="top"><br>
		      
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>#GetRes.ResourceLabel#</h3> <cfif GetRes.MembersOnly EQ 1><strong color="##990000">(Members Only)</strong></cfif></td>
		        </tr>
		      </table><div align="right" class="footer"><a href="#CGI.HTTP_REFERER#" onclick="history.back()"><< Back</a></div>
			  <table border="0" cellpadding="6" cellspacing="0">
		        <tr>
		           <td class="RegText">
                        <table border="0" cellpadding="3" cellspacing="0">
                          <tr>
                            <td width="20"><strong>Category</strong>:</td>
							<td>#GetRes.CatName#</td> 
                          </tr>
						  <tr>
                            <td><strong>Resource Type:</strong></td>
							<td>#GetRes.ResourceTypeDesc#</td>
                          </tr>
						  <cfif GetRes.ResourceFile NEQ "">
						     <tr><td>&nbsp;</td></tr>
							   <tr>
							     <td><strong>Download File:</strong></td>
							     <td><a href="/Resources/DownloadResource.cfm?ResID=#GetRes.ResourceID#" target="_Blank">#GetRes.ResourceFile#</a></td>
							   </tr>
						  </cfif>
						  <cfif GetRes.ResourceLink NEQ "">
							  <tr>
							    <td><strong>Website:</strong></td> 
							    <td><a href="#GetRes.ResourceLink#" target="_blank">#GetRes.ResourceLink#</a></td>
							  </tr>
						  </cfif>
						  <cfif GetRes.ContactName NEQ "">
						      <tr><td colspan=2><hr noshade size=1></td></tr>
							  <tr>
							    <td><strong>Contact:</strong></td>
								<td>#GetRes.ContactName#<br>
								   <a href="mailto:#GetRes.ContactEmail#">#GetRes.ContactEmail#</a><br>
								   #GetRes.ContactPhone#</td>
							  </tr>
						  </cfif>
						  <cfif GetRes.ResourceDesc NEQ "">
						  </table>
						  <table border="0" cellpadding="3" cellspacing="0">
						  <tr>
                            <td colspan=2><strong>Description:</strong></td>
                          </tr>
						  <tr>
						    <td colspan=2>#ReplaceNoCase(GetRes.ResourceDesc, '#chr(13)##chr(10)#', '<br>', 'ALL')#</td>
						  </tr>
						  </cfif>
                        </table>
				   </td>
		        </tr>
		       </table>
			   <br>
			   
			   <br><br>
		 </td>
     </tr>
</table>  
</cfoutput>
<cfmodule template="#Application.footer#">