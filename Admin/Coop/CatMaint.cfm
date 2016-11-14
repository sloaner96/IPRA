<cfset GetCategories = request.CoopAdminComponent.GetAllCats()>
<cfset GetGroups = request.CoopAdminComponent.GetItemGroups()>

<cfmodule template="#Application.header#" section="0" sectiontitle="Coop Maintenance">
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="160"><br>
		    <cfmodule template="#Application.tagdir#/adminnav.cfm" level="5">
		   </td>
		   <td valign="top"><br>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>Cooperative Purchase Program: Category Maintenance</h3></td>
		        </tr>
		      </table>
			  <table border="0" cellpadding="6" cellspacing="0" width="100%">
		        <tr>
		           <td class="RegText">
				      <table border="0" cellpadding="4" cellspacing="0" width="100%">
                        <tr bgcolor="#cccc99">
                          <td><strong>Add a New Category</strong></td>
                        </tr>
						<tr>
						  <td>
						  <cfform name="addcat" action="catMaint_Action.cfm?action=ADD" method="POST">
						    <table border="0" cellpadding="4" cellspacing="0">
                               <tr>
                                 <td><strong>Choose a Group:</strong></td>
								 <td><select name="GroupID">
								       <option value="">--Select One--</option>
									   <cfoutput query="GetGroups"> 
									    <option value="#GetGroups.CodeValue#">#GetGroups.CodeDesc#</option>
									   </cfoutput>
									 </select>
								</td>
                               </tr>
							   <tr>
                                 <td><strong>Category Name:</strong></td>
								 <td><input type="text" name="CategoryID" value=""></td>
                               </tr>
							   <tr>
							     <td colspan="2"><input type="submit" name="submit" value="Add Category >>"></td>
							   </tr>
                            </table>
							</cfform>
						  </td>
						</tr>
                      </table>
				      <br><br>
					  <table border="0" cellpadding="4" cellspacing="1" width="100%" bgcolor="#666666">
                          <cfoutput query="GetCategories" group="GroupID">
						    <tr bgcolor="##003366">
                              <td colspan="4"><strong style="color:##ffffff;">#GroupName#</strong></td>
                            </tr>
							<tr bgcolor="##eeeeee">
							  <td></td>
							  <td><strong>Category Name</strong></td>
							  <td><strong>Status</strong></td>
							  <td><strong>Assigned Products</strong></td>
							</tr> 
						    <cfoutput>
							  <cfif ProductCount EQ 0>
							    <cfset Action = "DELETE">
							  <cfelse>
							    <cfset Action = "UPDATE">	
							  </cfif>
							  <cfif IsActive EQ 0>
							    <cfset ThisStatus = 1>
							  <cfelse>
							    <cfset ThisStatus = 0>	
							  </cfif>
							  
							   <tr bgcolor="##ffffff">
							      <td><a href="catMaint_action.cfm?CatID=#GetCategories.CategoryCode#&Action=#Action#&S=#ThisStatus#"><img src="/images/btn_remove.gif" border="0" alt="Remove item from order"></a></td>
							      <td>#CategoryDescription#</td>
								  <td><cfif GetCategories.isActive EQ 1><font color="##008000">Active</font><cfelse><font color="##cc0000">InActive</font></cfif></td>
								  <td>#ProductCount#</td>
							   </tr>
							</cfoutput>
						  </cfoutput> 
                      </table>
				   </td>
		        </tr>
		       </table>
			   <br><br>
		 </td>
     </tr>
</table>  
<cfmodule template="#Application.footer#">