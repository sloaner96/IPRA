  <!--- Get the Groups --->
   <cfset getGroups = request.CoopComponent.GetItemGroups()>
  <!--- Get The Categories --->
   <cfset getCats = request.CoopComponent.GetItemCategories()>
  <!-- Get Both Above in one query --> 
  <cfset getRelatedGroups = request.CoopComponent.GetAllItemGroupsCats()>
  

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
					<td bgcolor="##ffffff"><strong style="color:##003366;">Product Home</strong></td>
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
			  
			  <table border="0" cellpadding="4" cellspacing="0" width="100%">
		       <tr>
			     <td>This section will allow you to maintain the Cooperative Purchase Program Products. To add a new product, click the Add new product link Below. To edit a the spec of a product, select the group and category of the product then click the Item Code of the Product. During an open coop period you may add winning bidders, reject products, and mark a product for voting.</td>
			   </tr>
			   <tr>
			     <td><a href="AddProduct.cfm"><strong>ADD NEW PRODUCT</strong></a></td>
			   </tr>
			   <tr>
			     <td><hr noshade size="1"></td>
			   </tr>
			   <tr>
		          <td><strong>Select a Product:</strong></td>
		       </tr>
			   <tr>
			     <td>
				   <form name="coopItems" action="ProductMaint.cfm" method="post"> 
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
					<cfif ThisCatID NEQ "">
					     <!--- Get This Group name --->
						   <cfset getThisGroupName = request.CoopComponent.GetItemGroups(ThisGroupID)>
						  <!--- Get This Category Name --->
						   <cfset getThisCatname = request.CoopComponent.GetItemCategories(ThisCatID)>
						  <!--- Get All Items that match this Category and Group  --->
						   <cfset getItems = request.CoopAdminComponent.getAllItems(ThisCatID, ThisGroupID)>
					   <table border="0" cellpadding="3" cellspacing="0" width="100%">
		                 <tr>
		                    <td><strong style="font-family:arial, tahoma, verdana, courier; font-size:12px;">#getThisGroupName.CodeDesc# > #getThisCatname.CategoryDescription#</strong> (<strong>#getItems.recordcount#</strong> products found)</td>
		                 </tr>
		               </table>           
					  
					 <form name="additem" action="productAction.cfm?action=Add" method="POST">
					   <input type="hidden" name="groupID" value="#ThisGroupID#">
					   <input type="hidden" name="catID" value="#ThisCatID#">
					   
					  <cfif getItems.recordcount GT 0>
					  <table border="0" cellpadding="4" cellspacing="1" width="100%" bgcolor="##6e6e6e">
						<tr bgcolor="##999966">
						   <td><strong style="color:##ffffff;">Item ID</strong></td>
						   <td><strong style="color:##ffffff;">Item</strong></td>
						   <td><strong style="color:##ffffff;">Unit of measure</strong></td>
						</tr>
						
						<cfloop query="getItems">
						  <tr <cfif getItems.currentrow MOD(2) EQ 0>bgcolor="##ffffff"<cfelse>bgcolor="##eeeeee"</cfif>>
							<td><a href="EditProduct.cfm?ProdID=#getItems.ItemID#">#getItems.ItemCode#</a></td>
						    <td><strong>#getItems.ItemName#</strong><br>#getItems.ItemDesc#</td>
							<td>#getItems.UnitofMeasure#</td>
						  </tr>
						</cfloop>
		
					  </table>
					  <cfelse>
					    <hr noshade size="1">
					    <p style="color:##cc0000; size:14px;"><strong>There are currently no Products in this Category. <a href="Addproduct.cfm">Click Here</a> to Add one.</strong></p>
					  </cfif>
					</cfif>
				 </td>
			   </tr>
     </table>
			   <br><br>
		 </td>
     </tr>
</table>  
</cfoutput>
<cfmodule template="#Application.footer#">