<!---////////////////////////////////// 
    Add Items to my order
 ///////////////////////////////////--->   
<cfif url.Action EQ "Add">
   
   <!--- Get all the items in this catagory to loop through --->
   <cfset getItems = request.CoopComponent.getItems(Session.CoopConfig.ConfigID, form.catid, form.GroupID)>
   
   <cfloop query="getItems">
     <cfif ISDefined('form.Item_#getItems.ItemID#')>
	   
      <cfif Len(Trim(Evaluate("form.Item_#getItems.ItemID#"))) GT 0 AND IsNumeric(Evaluate("form.Item_#getItems.ItemID#"))>
       <!--- Check to see if the user already added this ---> 
		<cfset ChkItemExistsInOrder = request.CoopComponent.getItemInOrder(getItems.ItemID, Session.OrderID)>
		<!--- if the item is currently on order, update the quantity, otherwise add it. --->
		<cfif ChkItemExistsInOrder.Recordcount GT 0>
		   <cfset UpdateOrder = request.coopComponent.UpdateOrder(Session.OrderID, getItems.itemID, Evaluate("form.Item_#getItems.ItemID#"))>
		<cfelse>
		   <cfset AddItemtoOrder = request.coopComponent.AddOrder(Session.OrderID, getItems.itemID, Evaluate("form.Item_#getItems.ItemID#"))>
	    </cfif>
	  </cfif> 
	 </cfif>
   </cfloop>
   <cflocation url="Additems.cfm?catID=#form.CatID#&GroupID=#form.GroupID#" addtoken="No">
<!---////////////////////////////////// 
    Update Items from the order
 ///////////////////////////////////--->    
<cfelseif url.Action EQ "Update">
    <!--- Get all the items in this catagory to loop through --->
   <cfset UpdItems = request.CoopComponent.getItemsbyCategory(Session.OrderID, form.catid)>
   
   <cfloop query="UpdItems">
     <cfif ISDefined('form.Item_#UpdItems.ItemID#')>
	     <cfif Len(Trim(Evaluate("form.Item_#UpdItems.ItemID#"))) GT 0 AND IsNumeric(Evaluate("form.Item_#UpdItems.ItemID#"))>
		   <cfif Evaluate("form.Item_#UpdItems.ItemID#") GT 0>
	          <cfset UpdateOrder = request.coopComponent.UpdateOrder(Session.OrderID, UpdItems.itemID, Evaluate("form.Item_#UpdItems.ItemID#"))>
		  </cfif>
		 </cfif> 
	 </cfif>
   </cfloop>
   <cfif UpdateOrder>
     <cflocation url="CoopOrder.cfm" addtoken="NO"> 
   <cfelse>
     <cflocation url="CoopOrder.cfm?e=3" addtoken="NO"> 
   </cfif>
<!---////////////////////////////////// 
    Remove an Item from the order
 ///////////////////////////////////--->   
<cfelseif url.Action EQ "Remove">
   <cfif Not IsDefined("url.id")>
     <cflocation url="CoopOrder.cfm?e=1" addtoken="NO">
   </cfif>
   
   <cfset RemoveItem = request.coopComponent.DeleteOrderItem(Session.OrderID, url.id)>
   <cfif RemoveItem>
      <cflocation url="CoopOrder.cfm" addtoken="NO">
   <cfelse>
      <cflocation url="CoopOrder.cfm?e=2" addtoken="NO">
   </cfif>
</cfif>