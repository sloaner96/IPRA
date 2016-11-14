<cfset getItems = request.CoopComponent.getItemsbyCategory(Session.OrderID, Url.CatID)>

<cfmodule template="#Application.header#" section="0" sectiontitle="Cooperative Purchase Program">
  <cfoutput><br>
	<table border="0" cellpadding="5" cellspacing="0">
       <tr>
         <td><h3>IPRA Cooperative Purchase Program: Edit order</h3></td>
       </tr>
    </table>

	<table border="0" cellpadding="4" cellspacing="2" width="100%" bgcolor="##eeeeee">
	  <tr bgcolor="##003366">
		<td bgcolor="##ffffff"><strong style="color:##003366;">View Current Order</strong></td>
		<td><strong style="color:##ffffff;"><a href="AddItems.cfm?groupid=#url.groupID#&catID=#url.catID#" style="color:##ffffff;">Add New items</a></strong></td>
		<td><strong style="color:##ffffff;"><a href="PreviousOrderReport.cfm" style="color:##ffffff;">View Previous Orders</a></strong></td>
	  </tr>
    </table>

    <br>
     <table border="0" cellpadding="4" cellspacing="0" width="100%">
       <tr>
	     <td>Use the form below to update your order totals per item. You can not use this form to remove or add ietems to your order. Marking an item with a quantity of 0 will not remove it form the order. Please use the previous page to remove items.</td>
	   </tr>
	   <tr>
	     <td>
			<cfif getItems.recordcount GT 0>
			     <!--- Get This Group name --->
				   <cfset getThisGroupName = request.CoopComponent.GetItemGroups(URL.GroupID)>
				  <!--- Get This Category Name --->
				   <cfset getThisCatname = request.CoopComponent.GetItemCategories(URL.CatID)>
				  <!--- Get All Items that match this Category and Group  --->
			   <table border="0" cellpadding="3" cellspacing="0" width="100%">
                 <tr>
                    <td><strong style="font-family:arial, tahoma, verdana, courier; font-size:12px;">Editing #getThisGroupName.CodeDesc# > #getThisCatname.CategoryDescription#</strong> (<strong>#getItems.recordcount#</strong> items found)</td>
                 </tr>
               </table>           
			  
			 <form name="additem" action="Order_action.cfm?action=Update" method="POST">
			   <input type="hidden" name="groupID" value="#URL.GroupID#">
			   <input type="hidden" name="catID" value="#URL.CatID#">
			   
			  <cfif getItems.recordcount GT 0>
			  <table border="0" cellpadding="4" cellspacing="1" width="100%" bgcolor="##6e6e6e">
				<tr bgcolor="##999966">
				   <td><strong style="color:##ffffff;">Item ID</strong></td>
				   <td><strong style="color:##ffffff;">Item</strong></td>
				   <td><strong style="color:##ffffff;">Unit of measure</strong></td>
				   <td><strong style="color:##ffffff;">Previous Price</strong></td>
				   <td><strong style="color:##ffffff;">Current Price</strong></td>
				   <td><strong style="color:##ffffff;">Order Quantity</strong></td>
				</tr>
				
				<cfloop query="getItems">
				   
				  <tr <cfif getItems.currentrow MOD(2) EQ 0>bgcolor="##ffffff"<cfelse>bgcolor="##eeeeee"</cfif>>
				    <td>#getItems.ItemCode#</td>
				    <td><strong>#getItems.ItemName#</strong><br>#getItems.ItemDesc#</td>
					<td>#getItems.UnitofMeasure#</td>
					<td>#DollarFormat(getItems.PreviousCost)#</td>
					<td>#DollarFormat(getItems.CurrentCost)#</td>
					<td><input type="text" name="Item_#getItems.ItemID#" value="#trim(getItems.Quantity)#" size="5" maxlength="8"></td>
				  </tr>
				</cfloop>
				<tr>
				  <td colspan="6" align="center"><input type="submit" name="submit" value="Re-Save to Order & Continue"></td>
				</tr>
			  </table>
			  <cfelse>
			    <hr noshade size="1">
			    <p style="color:##cc0000; size:14px;"><strong>There are currently no Products in this Category.</strong></p>
			  </cfif>
			</cfif>
		 </td>
	   </tr>
     </table>
	  <br><br><br><br>
  </td>
</tr>
</table>

 </cfoutput>		   	
<cfmodule template="#Application.footer#">