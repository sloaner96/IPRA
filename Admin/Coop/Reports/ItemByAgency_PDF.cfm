<cfparam name="URL.G" default="0" type="string">
<cfparam name="URL.C" default="0" type="string">
<cfparam name="URL.F" default="0" type="numeric">
<cfparam name="URL.ShowComm" default="0" type="numeric">
<cfset ThisGroupID = URl.G>
<cfset ThisCatID = URl.C>

	<cfsavecontent variable="PrintItemBid">		
<cfoutput>
 <h3 style="font-family:verdana,arial;">IPRA Cooperative Purchase Program: Items by Agency Report</h3>
  <cfset CurrentCoopConfig.ConfigID = URL.F>
     <!--- Get This Group name --->
	   <cfset getThisGroupName = request.CoopComponent.GetItemGroups(ThisGroupID)>
	  <!--- Get This Category Name --->
	   <cfset getThisCatname = request.CoopComponent.GetItemCategories(ThisCatID)>
	  <!--- Get All Items that match this Category and Group  --->
	  
	    <cfset getItems = request.CoopComponent.getItems(CurrentCoopConfig.ConfigID, ThisCatID, ThisGroupID)>
	  
	   
		   <table border="0" cellpadding="3" cellspacing="0" width="100%"  style="font-family:verdana,arial; font-size:8px;">
	               <tr>
	                  <td><strong style="font-family:arial, tahoma, verdana, courier; font-size:10px;">#getThisGroupName.CodeDesc# > #getThisCatname.CategoryDescription#</strong></td>
	               </tr>
	             </table>           
		  <cfif getItems.recordcount GT 0>
			  <table border="0" cellpadding="4" cellspacing="1" width="100%" bgcolor="##666666"  style="font-family:verdana,arial; font-size:8px;">
				<cfloop query="getItems">
				  <cfset getAgency = request.CoopAdminComponent.getAgencyByItem(CurrentCoopConfig.ConfigID, GetItems.ItemID)>
					
				    <tr bgcolor="##e4e4e4">
				      <td valign="top">#getItems.ItemCode#</td>
				      <td valign="top"><strong>#getItems.ItemName#</strong><br>#getItems.ItemDesc#</td>
					  <td valign="top">#getItems.UnitofMeasure#</td>
					</tr>
					<cfif getAgency.recordcount GT 0>
					<tr>
					  <td bgcolor="##fdfdfd">&nbsp;</td>
					  <td colspan="3" bgcolor="##fdfdfd">
					    <table border="0" cellpadding="2" cellspacing="1" width="100%" style="font-family:verdana,arial; font-size:8px;">
						   <tr bgcolor="##a9a9a9">
						     <td><strong>Agency</strong></td>
							 <td><strong>Quantity</strong></td>
						   </tr>
						   <cfloop query="getAgency">
						     <tr <cfif getAgency.currentrow MOD(2) EQ 0>bgcolor="##eeeeee"</cfif>> 
						        <td width="200">#AgencyName#</td>
						        <td width="200">#Quantity#</td>
						     </tr>
						   </cfloop>
						</table>
					  </td>
					</tr>
					<cfelse>
					  <tr bgcolor="##ffffff">
					    <td align="center" colspan="3"><strong>No Agency ordered this Item</strong></td>
					  </tr>
					</cfif>
					<cfif GetItems.BidsReceived EQ 0>
						<tr bgcolor="##ffffff">
							<td align="center" colspan="3"><strong>No Bids Received</strong></td>
						</tr>
					</cfif>
					<tr>
				    <td colspan="4" bgcolor="##ffffff">&nbsp;</td>
				    </tr>
				</cfloop>
			  </table>
	  <cfelse>
	    <hr noshade size="1">
	    <p style="color:##cc0000; size:14px;"><strong>There are currently no Products in this Category that have bids.</strong></p>
	  </cfif>
</cfoutput>
</cfsavecontent>			  

<cfdocument  format="PDF" pagetype="letter" orientation="landscape" unit="in" encryption="none" fontembed="Yes" backgroundvisible="Yes"><cfoutput>#PrintItemBid#</cfoutput></cfdocument>