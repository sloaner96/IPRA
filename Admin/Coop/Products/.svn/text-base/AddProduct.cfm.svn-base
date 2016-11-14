  <!--- Get the Groups --->
   <cfset getGroups = request.CoopComponent.GetItemGroups()>
  <!--- Get The Categories --->
   <cfset getCats = request.CoopComponent.GetItemCategories()>
  <!-- Get Both Above in one query --> 
  <cfset getRelatedGroups = request.CoopComponent.GetAllItemGroupsCats()>
  
  <cfset getUOM = request.CoopAdminComponent.GetUOM()>
  
  <cfif IsDefined("form.GroupID")>
    <cfset ThisGroupID = Form.GroupID>
  <cfelseif IsDefined("url.GroupID")>
     <cfset ThisGroupID = URL.GroupID> 	
  <cfelse>
    <cfset ThisGroupID = "">  	 
  </cfif>
  
  <cfif IsDefined("form.CatID")>
    <cfset ThisCatID = Form.CatID>
  <cfelseif IsDefined("url.CatID")>
     <cfset ThisCatID = URL.CatID> 	
  <cfelse>
    <cfset ThisCatID = "">  	 
  </cfif>
  
<cfmodule template="#Application.header#" section="0" sectiontitle="Coop Maintenance">
  <cfoutput>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="160"><br>
		    <cfmodule template="#Application.tagdir#/adminnav.cfm" level="5">
		   </td>
		   <td valign="top"><br>
		     <table border="0" cellpadding="4" cellspacing="2" width="100%" bgcolor="##eeeeee">
				<tr bgcolor="##003366">
					 <td bgcolor="##ffffff"><strong style="color:##003366;"><a href="ProductMaint.cfm">Product Home</a></strong></td>
					 <td><a href="PeriodUpdate.cfm?t=B" style="color:##ffffff;"><strong>Add Winning Bidder</strong></a></td>
					 <td><a href="PeriodUpdate.cfm?t=V" style="color:##ffffff;"><strong>Add Voting</strong></a></td>
					 <td><strong style="color:##ffffff;"><a href="PeriodUpdate.cfm?t=R" style="color:##ffffff;">Reject Items</a></strong></td>
				     <td><a href="prodReports.cfm" style="color:##ffffff;"><strong style="color:##ffffff;">Product Reports</strong></a></td>
					 
				</tr>
	          </table>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>Cooperative Purchase Program: Add A Product</h3></td>
		        </tr>
		        <tr>
				  <td>Use the form below to add a new product to the Cooperative Purchase Program.</td>
				</tr>
			  </table>
			  <br>
			  <form name="coopItems" action="AddProduct.cfm" method="post"> 
				    <table border="0" cellpadding="4" cellspacing="0">
					  <tr>
					    <td><cfmodule template="/IPRA/TwoSelectsRelated.cfm"
								QUERY="getRelatedGroups"
								NAME1="GroupID"
								NAME2="CatID"
								DISPLAY1="GroupName"
								DISPLAY2="CategoryDescription"
								VALUE1="groupID"
								VALUE2="CategoryCode"
								FORCEWIDTH1="35"
								FORCEWIDTH2="35"
								SIZE1="1"
								SIZE2="1"
								HTMLBETWEEN="<br><br>"
								AUTOSELECTFIRST="Yes"
								EMPTYTEXT1="(choose a Item Group)"
								EMPTYTEXT2="(now choose a Item Category)"
								ONCHANGE="submit!"
								FORMNAME="coopItems">
		                </td>
					  </tr>
					</table>
					</form>
			  <cfif IsDefined("form.CatID")>
			    <hr noshade size="1">
			     <cfset NextItemCode = request.CoopAdminComponent.getNextItemCode(form.GroupID, Form.CatID)>
				 <!--- Get This Group name --->
			      <cfset getThisGroupName = request.CoopComponent.GetItemGroups(ThisGroupID)>
			   <!--- Get This Category Name --->
			     <cfset getThisCatname = request.CoopComponent.GetItemCategories(ThisCatID)>
				 
				 <cfif Len(NextItemCode) EQ 4>
				    <cfset nextItemNumber = Right(NextItemCode, 3)>
				 <cfelseif Len(NextItemCode) EQ 5>
				    <cfset nextItemNumber = Right(NextItemCode, 4)>
				 </cfif>
				 
				 <form name="addproduct" action="ProductAction.cfm?action=ADD" Method="POST"> 
				  <input type="hidden" name="GroupID" value="#ThisgroupID#">
				  <input type="hidden" name="CatID" value="#ThisCatID#">
				  <input type="hidden" name="ItemCode" value="#NextItemCode#">
				  <input type="hidden" name="NextItemNumber" value="#nextItemNumber#">
				   
				   
				  <table border="0" cellpadding="4" cellspacing="0" >
	                 <tr>
					   <td><strong>Product Group:</strong></td>
					   <td>#GetThisGroupName.CodeDesc#</td>
					 </tr>
					 <tr>
					   <td><strong>Product Category:</strong></td>
					   <td>#getThisCatname.CategoryDescription#</td>
					 </tr>
					 <tr>
	                    <td><strong>Item Code:</strong></td>
						<td>#NextItemCode#</td>
	                 </tr>
					 <tr>
	                    <td><strong>Item Name:</strong></td>
						<td><input type="text" name="ItemName" value="" size="40" maxlength="100"></td>
	                 </tr>
					 <tr>
	                    <td><strong>Unit of Measure:</strong></td>
						<td><select name="ItemUOM">
						     <cfloop query="getUOM">
						      <option value="#GetUOM.Codevalue#">#GetUOM.CodeDesc#</option>
							 </cfloop> 
							</select>
					    </td>
	                 </tr>
					 <tr>
	                    <td valign="top"><strong>Description:</strong></td>
						<td><textarea name="ItemDesc" rows="5" cols="45"></textarea></td>
	                 </tr>
					 <tr>
					   <td colspan="2" align="center"><input type="submit" name="submit" value="Add Product >>"></td>
					 </tr>
	              </table>
				 </form> 
			  </cfif>
			  <br><br>
		   </td>
        </tr>
     </table>  
  </cfoutput>
<cfmodule template="#Application.footer#">