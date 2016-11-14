<cfmodule template="#Application.header#" section="0" sectiontitle="Site Admin">

	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="160"><br>
		    <cfmodule template="#Application.tagdir#/adminnav.cfm" level="1">
		   </td>
		   <td valign="top" ><br>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>IPRA Resource Library</h3></td>
		        </tr>
		      </table>
			  
			  <table border="0" cellpadding="4" cellspacing="0" width="100%">
		        <tr>
				   <td class="RegText" width="50%" valign="top">
				      <table border="0" cellpadding="0" cellspacing="0" width="100%">
                          <tr>
                            <td><a href="AddResource.cfm">Add a New Resource</a></td>
                          </tr> 
                      </table><br>
					  <cfquery name="GetCats" datasource="#Application.dsn#">
					   Select Distinct R.Category, L.CodeDesc
					   From Resources R, Lookup L
					   Where R.Category = L.CodeValue
					   AND L.CodeGroup = 'RESCAT'
					   Order BY L.CodeDesc
					</cfquery>
					  <table border="0" cellpadding="3" cellspacing="0" width="100%">
                          <tr bgcolor="#003366">
                            <td><strong style="color:ffffff;">Edit Resource Library</strong></td>
                          </tr> 
						  <cfoutput query="Getcats">
						  <tr>
						    <td><a href="ResourceCat.cfm?CatID=#GetCats.Category#">#GetCats.CodeDesc#</a></td>
						  </tr>
						  </cfoutput>
                      </table>
				   </td>
		           <td class="RegText" valign="top"  width="50%">
				     <cfset Lastseven = DateAdd('d', -7, now())>
					  <cfquery name="GetResources" datasource="#Application.dsn#">
					    Select Top 25 *,
						  (Select CodeDesc
						   From Lookup 
						   Where CodeValue = R.ResourceType
						   AND CodeGroup = 'RESTYPE') as ResType,
						  (Select CodeDesc
						   From Lookup 
						   Where CodeValue = R.Category
						   AND CodeGroup = 'RESCAT') as ResCat
						From Resources R
						Where LastUpdated >= #CreateODBCDateTime(Lastseven)#
						Order By Category, SubCategory, ResFileType
					  </cfquery> 
					  
				     <table border="0" cellpadding="3" cellspacing="1" width="100%" bgcolor="eeeeee">
                        <tr bgcolor="#003366">
						  <td colspan="4"><strong style="color:ffffff;">Resources Added (Last Seven Days)</strong></td>
						</tr>
						<cfif GetResources.recordcount GT 0>
							<cfoutput query="GetResources" group="Category">
							 <tr bgcolor="##666666">
							   <td colspan="4"><strong style="color:ffffff;">#GetResources.ResCat#</strong></td>
							 </tr>
							 <tr bgcolor="eeeee">
	                              <td><strong>Name</strong></td>
	                              <td><strong>Type</strong></td>
								  <td><strong>File Type</strong></td>
								  <td><strong>Members Only</strong></td>
							  </tr>
							 <cfoutput>
							    
								<tr bgcolor="ffffff">
	                              <td width="40%"><a href="EditResource.cfm?RecID=#GetResources.ResourceID#">#GetResources.ResourceLabel#</a></td>
	                              <td width="20%">#GetResources.ResType#</td>
								  <td width="20%">#GetResources.ResFileType#</td>
								  <td width="20%"><cfif GetResources.membersonly EQ 1>YES<cfelse>NO</cfif></td>
							    </tr>
							  </cfoutput>
							  <tr bgcolor="ffffff">
							    <td colspan=4>&nbsp;</td>
							  </tr>
							 </cfoutput>
						 <cfelse>
						   <tr>
						     <td><p style="color:#737373;" align="center"><strong>No Resources added to the Library</strong></p></td>
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

<cfmodule template="#Application.footer#">