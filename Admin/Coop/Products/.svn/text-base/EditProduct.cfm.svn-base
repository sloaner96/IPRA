<cfset ItemInfo = request.CoopAdminComponent.getItemInfo(URL.ProdID)>

<!--- Get This Group name --->
<cfset getThisGroupName = request.CoopComponent.GetItemGroups(ItemInfo.GroupID)>
<!--- Get This Category Name --->
<cfset getThisCatname = request.CoopComponent.GetItemCategories(ItemInfo.CatID)>
  <cfset getUOM = request.CoopAdminComponent.GetUOM()>
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
					<td bgcolor="##ffffff"><a href="ProductMaint.cfm" style="color:##003366;"><strong style="color:##003366;">Product Home</strong></a></td>
					 <td><a href="PeriodUpdate.cfm?t=B" style="color:##ffffff;"><strong>Add Winning Bidder</strong></a></td>
					 <td><a href="PeriodUpdate.cfm?t=V" style="color:##ffffff;"><strong>Add Voting</strong></a></td>
					 <td><strong style="color:##ffffff;"><a href="PeriodUpdate.cfm?t=R" style="color:##ffffff;">Reject Items</a></strong></td>
				     <td><a href="prodReports.cfm" style="color:##ffffff;"><strong style="color:##ffffff;">Product Reports</strong></a></td>
					 
				</tr>
	          </table>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>Cooperative Purchase Program: Product Maintenance</h3></td>
		        </tr>
		      </table>
			  <p>Use the form below to edit the product specification. Click the Update Product button when you are complete.</p>
				<form name="Updproduct" action="ProductAction.cfm?action=UPDATE" Method="POST"> 
				   <input type="hidden" name="ItemID" value="#ItemInfo.ItemID#">
					<table border="0" cellpadding="4" cellspacing="0" >
						<tr>
						    <td><strong>Active Product:</strong></td>
							<td><input type="checkbox" name="IsActive" value="1" <cfif ItemInfo.Isactive>Checked</cfif>></td>
						</tr>
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
							<td>#ItemInfo.ItemCode#</td>
						</tr>
						<!--- <cfif Find(Chr(34),Trim(ItemInfo.ItemName), 1) EQ 1>
							<cfset ItemString = "#Trim(ReplaceNoCase(ItemInfo.ItemName, Chr(34), '', 'ALL'))#">
					    <cfelseif Find(Chr(34),Trim(ItemInfo.ItemName), 1) EQ Len(Trim(ItemInfo.ItemName))>
							 <cfset ItemString = "#Trim(ReplaceNoCase(ItemInfo.ItemName, Chr(34), '', 'ALL'))#">
						<cfelse></cfif> --->
							<cfset ItemString = "#Trim(ItemInfo.ItemName)#">
						
						<tr>
							<td><strong>Item Name:</strong></td>
							<td><input type="text" name="ItemName" value='#ItemString#' size="40" maxlength="100">
							 </td>
						</tr>
						<tr>
							<td><strong>Unit of Measure:</strong></td>
							<td><select name="ItemUOM">
							<cfloop query="getUOM">
							<option value="#GetUOM.Codevalue#" <cfif ItemInfo.UOM EQ GETUOM.CodeValue>Selected</cfif>>#GetUOM.CodeDesc#</option>
							</cfloop> 
							</select>
							</td>
						</tr>
						<tr>
							<td valign="top"><strong>Description:</strong></td>
							<td><textarea name="ItemDesc" rows="5" cols="45">#Trim(ItemInfo.ItemDesc)#</textarea></td>
						</tr>
						<tr>
						<td colspan="2" align="center"><input type="submit" name="submit" value="Update Product >>"></td>
						</tr>
					</table>
				</form> 
				<br><br>
		 </td>
     </tr>
</table>  
</cfoutput>
<cfmodule template="#Application.footer#">