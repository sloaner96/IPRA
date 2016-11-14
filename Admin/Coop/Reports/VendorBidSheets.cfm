<cfset ThisGroupID = URl.groupID>
<cfset ThisCatID = URl.CatID>
<cfset ThisConfigID = URL.PeriodID>

<!--- Get This Group name --->
<cfset getThisGroupName = request.CoopComponent.GetItemGroups(ThisGroupID)>
<!--- Get This Category Name --->
<cfset getThisCatname = request.CoopComponent.GetItemCategories(ThisCatID)>
<!--- Get All Items that match this Category and Group  --->
<cfset getItems = request.CoopComponent.getItemswithQuantity(ThisConfigID, ThisCatID, ThisGroupID)>
<cfsavecontent variable="VendorBidSheet"> 
  <cfoutput>
   <table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
      <td align="Center"><h3>IPRA Vendor Bid Form</h3></td>
    </tr>
	<tr>
	  <td>&nbsp;</td>
	</tr>
	<tr>
	  <td align="right"><strong style="font-family:arial;font-size:11px;">Vendor:</strong>_____________________________________</td>
	</tr>
</table>
	<table border="0" cellpadding="3" cellspacing="0" width="100%">
		<tr>
		  <td><strong style="font-family:arial, tahoma, verdana, courier; font-size:12px;">#getThisCatname.CategoryDescription#</strong></td>
		</tr>
	</table>           
	<cfif getItems.recordcount GT 0>
		<table width="100%" border="0" cellspacing="1" cellpadding="4" bgcolor="##006666" style="font-family: verdana,arial; font-size: 8px;">
			<tr bgcolor="##FFFFFF" style="border-bottom: 1px solid ##000;">
				<td><strong>Item ID</strong></td>
				<td><strong>Item</strong></td>
				<td><strong>Agencies</strong></td>
				<td><strong>Order Quantity</strong></td>
				<td><strong>Brand</strong></td>				
				<td><strong>Unit of measure</strong></td>
				<td><strong>Unit Cost</strong></td>
				<td><strong>Total Cost</strong></td>
				<td><strong>Delivery Time</strong></td>
			</tr>
		
		<cfloop query="getItems">
		<cfset ItemCount = request.CoopAdminComponent.GetItemCount(ThisConfigID, getItems.ItemID)>
		<cfset AgencyCount = request.CoopAdminComponent.GetAgencyCountByItem(ThisConfigID, getItems.ItemID)>
		
		<tr bgcolor="##ffffff" style="border: 1px solid Black;">
		<td valign="top">#getItems.ItemCode#</td>
		<td><strong>#getItems.ItemName#</strong><br>#getItems.ItemDesc#</td>
		
		<td align="center">#AgencyCount.Quantity#</td>
		<td align="center">#ItemCount.Quantity#</td>
		<td></td>
		<td>#getItems.UnitofMeasure#</td>
		<td></td>
		<td></td>
		<td></td>
		</tr>
		</cfloop>
		</table>
		<cfelse>
		<hr noshade size="1">
		<p style="color:##cc0000; size:14px;"><strong>There are currently no Products in this Category.</strong></p>
	</cfif></cfoutput>
</cfsavecontent>

<cfdocument  format="PDF" pagetype="letter" orientation="landscape" unit="in" encryption="none" fontembed="Yes" backgroundvisible="YES"><cfoutput>#VendorBidSheet#</cfoutput></cfdocument>