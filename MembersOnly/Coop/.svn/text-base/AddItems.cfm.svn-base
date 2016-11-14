    <cfset getorderID = request.CoopComponent.getOrderID(Session.MyCoopReg.RegistrationID, Session.CoopConfig.ConfigID)>
  
  <cfif getOrderID.recordcount EQ 0>
    <cfset createOrderID = request.CoopComponent.CreateOrderID(Session.MyCoopReg.RegistrationID, Session.CoopConfig.ConfigID)>
	<cfset Session.OrderID = createOrderID>
  <cfelse>
    <cfset Session.OrderID = getorderID.orderID>  	 
  </cfif>	  
<!--- Get My Current order information  --->
<cfset MyOrderInfo = request.CoopComponent.getCurrentorderInfo(Session.OrderID)>

<!--- Get My Current order items --->
<cfset MyOrderItems = request.CoopComponent.getAllOrderItems(Session.OrderID)>
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
  
<cfset DaysLeftToOrder = DateDiff('d', Now(), Session.CoopConfig.OrderEnd)>

<cfset CoopEndDate = Session.CoopConfig.CoopEndDate>

	<cfif DaysleftToOrder GTE 0>
	  <cfset AllowMaintenance = true>
	  
	  <cfif MyOrderInfo.orderComplete NEQ "">
	    <cfset AllowMaintenance = false>
	  </cfif>
	<cfelse>
	  <cfset AllowMaintenance = false>
	</cfif>

<cfmodule template="#Application.header#" section="0" sectiontitle="Cooperative Purchase Program">
  <cfoutput><br>
	<table border="0" cellpadding="5" cellspacing="0">
       <tr>
         <td><h3>IPRA Cooperative Purchase Program</h3></td>
       </tr>
    </table>
  	<cfmodule template="HeaderTabs.cfm" CoopEndDate="#CoopEndDate#" AllowMaintenance="#AllowMaintenance#" Page="2">
							
<br>

     <table border="0" cellpadding="4" cellspacing="0" width="100%">
       <tr>
	     <td>Use the Form below to select the product group and related categories you would like to add to your order. Once you select the category you would like; Enter the quantity of the product and click save my order &amp; continue. The page will refresh and your products will be saved. <strong><font color="red">PLEASE PLACE AND SUBMIT YOUR ORDERS WITHIN 20 MINUTES OF ACCESSING EACH PRODUCT AND CATEGORY SCREEN!!! INACTIVITY AFTER 20 MINUTES WILL AUTOMATICALLY LOG YOU OUT AND YOUR ORDER WILL NOT BE SAVED!!!!</font></strong>.
<p><strong>Maintenance PDF's</strong></p>
<p><a href="/forms/coop/Lighting_06.pdf" target="_blank">Lighting</a> | <a href="/forms/coop/Custodial Supplies_06.pdf" target="_blank">Custodial Supplies</a> | <a href="/forms/coop/DrumsTrash_06.pdf" target="_blank">Drums & Trash Containers</a> | <a href="/forms/coop/FirstAid_06.pdf" target="_blank">First Aid Safety Supplies</a> | <a href="/forms/coop/Signage_06.pdf" target="_blank">Signage</a> | <a href="/forms/coop/PowerTools_06.pdf" target="_blank">Power Tools</a> | <a href="/forms/coop/PoolChemicals_06.pdf" target="_blank">Pool Chemicals</a> | <a href="/forms/coop/Stepladders_06.pdf" target="_blank">Stepladders</a> | <a href="/forms/coop/TurfSupplies_06.pdf" target="_blank">Turf Supplies</a></p>
<p><strong>Recreation PDF's</strong></p>
<p><a href="/forms/coop/ArtsCrafts_06.pdf" target="_blank">Arts & Crafts Supplies</a> | <a href="/forms/coop/AthleticSupplies_06.pdf" target="_blank">Athletic Supplies</a> | <a href="/forms/coop/SportsNets_06.pdf" target="_blank">Sports Nets</a> | <a href="/forms/coop/OfficeSupplies_06.pdf" target="_blank">Office Supplies</a> | <a href="/forms/coop/AquaticSupplies_06.pdf" target="_blank">Aquatic Supplies</a></p>
</td>
	   </tr>
	   <tr>
          <td><strong>Select a<cfif ThisCatID NEQ ""> New<cfelse>n</cfif> Product:</strong></td>
       </tr>
	   <tr>
	     <td>
		   <form name="coopItems" action="AddItems.cfm" method="post"> 
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
						FORCEWIDTH1="70"
						FORCEWIDTH2="70"
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
				   <cfset getItems = request.CoopComponent.getItems(Session.CoopConfig.ConfigID, ThisCatID, ThisGroupID)>
			   <table border="0" cellpadding="3" cellspacing="0" width="100%">
                 <tr>
                    <td><strong style="font-family:arial, tahoma, verdana, courier; font-size:12px;">#getThisGroupName.CodeDesc# > #getThisCatname.CategoryDescription#</strong> (<strong>#getItems.recordcount#</strong> products found)</td>
                 </tr>
               </table>           
			  
			 <form name="additem" action="Order_action.cfm?action=Add" method="POST">
			   <input type="hidden" name="groupID" value="#ThisGroupID#">
			   <input type="hidden" name="catID" value="#ThisCatID#">
			   
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
				   <cfset ChkItemExistsInOrder = request.CoopComponent.getItemInOrder(getItems.ItemID, Session.OrderID)>
				  <tr <cfif getItems.currentrow MOD(2) EQ 0>bgcolor="##ffffff"<cfelse>bgcolor="##eeeeee"</cfif>>
				    <td>#getItems.ItemCode#</td>
				    <td><strong>#getItems.ItemName#</strong><br>#getItems.ItemDesc#</td>
					<td>#getItems.UnitofMeasure#</td>
					<td>#DollarFormat(getItems.PreviousCost)#</td>
					<td>#DollarFormat(getItems.Cost)#</td>
					<cfif ChkItemExistsInOrder.recordcount EQ 0>
					<td><input type="text" name="Item_#getItems.ItemID#" value="" size="5" maxlength="8"></td>
					<cfelse>
					<td align="center" style="color:##CC0000;">#ChkItemExistsInOrder.Quantity# on order already</td>
					</cfif> 
				  </tr>
				</cfloop>
				<tr>
				  <td colspan="5" align="center"><input type="submit" name="submit" value="Save to Order & Continue"></td>
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

 </cfoutput>		   	
<cfmodule template="#Application.footer#">