<cfparam name="URL.G" default="0" type="string">
<cfparam name="URL.C" default="0" type="string">
<cfparam name="URL.ConfigID" default="0" type="numeric">
<cfset ThisGroupID = URl.G>
<cfset ThisCatID = URl.C>

<cfsavecontent variable="PrintPDFWinBidder">
    <cfoutput>
	     <!--- Get This Group name --->
		   <cfset getThisGroupName = request.CoopComponent.GetItemGroups(ThisGroupID)>
		  <!--- Get This Category Name --->
		   <cfset getThisCatname = request.CoopComponent.GetItemCategories(ThisCatID)>
		  <!--- Get All Items that match this Category and Group  --->
		  
		    <cfset getItems = request.CoopAdminComponent.getItemWinBidders(URL.ConfigID, ThisCatID, ThisGroupID)>
          <table border="0" cellpadding="5" cellspacing="0" style="font-family:verdana,arial; font-size:8px;">
            <tr>
              <td><h3>IPRA Cooperative Purchase Program: Winning Bidder Report</h3></td>
           </tr>
          </table>
	      <table border="0" cellpadding="4" cellspacing="1" width="100%" bgcolor="##666666" style="font-family:verdana,arial; font-size:8px;">
            <tr bgcolor="##ffffff">
               <td><strong style="font-family:arial, tahoma, verdana, courier; font-size:12px;">#getThisGroupName.CodeDesc# > #getThisCatname.CategoryDescription#</strong> (<strong>#getItems.recordcount#</strong> items found)</td>
            </tr>
          </table>           
	  <cfif getItems.recordcount GT 0>
		  <table border="0" cellpadding="2" cellspacing="1" width="100%" bgcolor="##666666" style="font-family:verdana,arial; font-size:8px;">
			<tr bgcolor="##ffffff">
			   <td><strong>Item ID</strong></td>
			   <td><strong>Item</strong></td>
			   <td><strong>Unit of measure</strong></td>
			   <td><strong>Vendor</strong></td>
			   <td><strong>Previous Cost</strong></td>
			   <td><strong>Cost</strong></td>
			   <td><strong>Total Agencies</strong></td>
			   <td><strong>Total Quantity</strong></td>
			</tr>
			
			<cfloop query="getItems">
			    	<cfset ItemCount = request.CoopAdminComponent.GetItemCount(URL.ConfigID, getItems.ItemID)>
				    <cfset AgencyCount = request.CoopAdminComponent.GetAgencyCountByItem(URL.ConfigID, getItems.ItemID)>
				   
			    <tr bgcolor="##ffffff">
			      <td>#getItems.ItemCode#</td>
			      <td><strong>#getItems.ItemName#</strong><br>#getItems.ItemDesc#</td>
				  <td>#getItems.UnitofMeasure#</td>
				  <td>#GetItems.VendorName#</td>
				  <td align="center">#DollarFormat(GetItems.PreviousCost)#</td>
				  <td align="center"><cfif getItems.Rejected EQ 1><strong>REJECTED:</strong> <span style="font-size:10px;">#getItems.RejectReason#<span>
										 <cfelse>#DollarFormat(GetItems.Cost)#
										 </cfif></td>
				  <td align="right">#AgencyCount.Quantity#</td>
				  <td align="right">#ItemCount.Quantity#</td>
			    </tr>
			    <tr bgcolor="##ffffff">
				  <td></td>
				  <td colspan="8">
				     <table border="0" cellpadding="0" cellspacing="1" width="100%" bgcolor="##ffffff" style="font-family:verdana,arial; font-size:8px;">
	                         <tr bgcolor="##eeeeee">
				         <td width="40%"><strong>Product:</strong></td>
				         <td width="60%"><strong>Shipping Terms:</strong></td>
	                         </tr>
				       <tr>
				         <td>#GetItems.VendorProdName#</td>
				         <td>#GetItems.ShippingTerms#</td>
				       </tr>
	                 </table>
				  </td>
				</tr>
			</cfloop>
		  </table>
	  <cfelse>
	    <hr noshade size="1">
	    <p style="color:##cc0000; size:14px;"><strong>There are currently no Products in this Category.</strong></p>
	  </cfif>
  </cfoutput>
</cfsavecontent>			  

<cfdocument  format="PDF" pagetype="letter" orientation="landscape" unit="in" encryption="none" fontembed="Yes" backgroundvisible="yes"><cfoutput>#PrintPDFWinBidder#</cfoutput></cfdocument>