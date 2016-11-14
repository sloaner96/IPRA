<cfset GetVendor = request.CoopAdminComponent.GetVendorInfo(URL.VendorID)>
<cfset CurrentCoopConfig = Request.CoopAdminComponent.getCoopConfig(now())>
<cfset GetBidItem = Request.CoopAdminComponent.getBidItem(url.BidID)>
<cfmodule template="#Application.header#" section="0" sectiontitle="Coop Maintenance: Update Vendor">
  <cfoutput>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="160"><br>
		    <cfmodule template="#Application.tagdir#/adminnav.cfm" level="5">
		   </td>
		   <td valign="top"><br>
		     <table border="0" cellpadding="4" cellspacing="2" width="100%" bgcolor="##eeeeee">
				<tr bgcolor="##003366">
					 <td><strong style="color:##ffffff;"><a href="VendorMaint.cfm" style="color:##ffffff;">Vendor Home</a></strong></td>
					 <td><strong style="color:##ffffff;"><a href="VendorDetail.cfm?vendorID=#URL.VendorID#"" style="color:##ffffff;">Vendor Detail</a></strong></td>
					 <td bgcolor="##ffffff"><strong style="color:##003366;">Vendor Bids</strong></td>
					 <td><strong style="color:##ffffff;"><a href="VendorHistory.cfm?vendorID=#URL.VendorID#" style="color:##ffffff;">Vendor History</a></strong></td>	 
				</tr>
	          </table>
			 
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		           <td><h3>Cooperative Purchase Program: Update Bids</h3></td>
		        </tr>
			   <tr>
			     <td>Use the form below to update a bid for a specific item.</td>
			   </tr>
			 </table>	
			 
		   <form name="coopItems" action="AddVendorBids.cfm?action=UPDATE" method="post">
		    <input type="hidden" name="VendorID" value="#URL.VendorID#"> 
			<input type="hidden" name="VenItemID" value="#URL.BIDID#">
			<input type="hidden" name="ItemID" value="#getBidItem.ItemID#">
			<input type="hidden" name="CoopID" value="#getBidItem.CoopID#">
			
			 <table border="0" cellpadding="4" cellspacing="0">
				<tr>
				  <td><strong>Item:</strong></td>
				  <td>#GetBidItem.ItemCode# - #GetBidItem.ItemName#</td>
				</tr>
				<tr>
					<td><strong>Vendor Product:</strong></td>
					<td><input type="text" name="VendorProduct" value="#GetBidItem.VendorProdName#" size="40" maxlength="200"></td>
				</tr>
				<tr>
					<td><strong>Shipping Terms:</strong></td>
					<td><input type="text" name="ShippingTerms" value="#GetBidItem.ShippingTerms#" size="45" maxlength="150"></td>
				</tr>
				<tr>
					<td><strong>Bid Price:</strong></td>
					<td>$<input type="text" name="BidPrice" value="#Numberformat(GetBidItem.VendorPrice, '0.00')#" size="10" maxlength="15"></td>
				</tr>
				<tr>
					<td><strong>Bid Comments:</strong></td>
					<td><textarea name="bidComments" rows="5" cols="45">#Trim(GetBidItem.BidComment)#</textarea></td>
				</tr>
				<tr>
				<td colspan="2" align="center"><input type="submit" name="submit" value="Update Bid >>"></td>
				</tr>
			 </table>
		   </form>
		   <br><br>
		   </td>
     </tr>
</table>  
</cfoutput>
<cfmodule template="#Application.footer#">