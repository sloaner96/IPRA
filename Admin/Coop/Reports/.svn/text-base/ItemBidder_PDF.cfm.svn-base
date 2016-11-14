<cfparam name="URL.G" default="0" type="string">
<cfparam name="URL.C" default="0" type="string">
<cfparam name="URL.ShowComm" default="0" type="numeric">
<cfset ThisGroupID = URl.G>
<cfset ThisCatID = URl.C>

	<cfsavecontent variable="PrintItemBid">		
<cfoutput>
 <h3 style="font-family:verdana,arial;">IPRA Cooperative Purchase Program: Bids By Item Report</h3>
  <cfset CurrentCoopConfig = Request.CoopAdminComponent.getCoopConfig(now())>
     <!--- Get This Group name --->
	   <cfset getThisGroupName = request.CoopComponent.GetItemGroups(ThisGroupID)>
	  <!--- Get This Category Name --->
	   <cfset getThisCatname = request.CoopComponent.GetItemCategories(ThisCatID)>
	  <!--- Get All Items that match this Category and Group  --->
	  
	    <cfset getItems = request.CoopComponent.getItems(CurrentCoopConfig.ConfigID, ThisCatID, ThisGroupID)>
	  
	   
		   <table border="0" cellpadding="3" cellspacing="0" width="100%" style="font-family:verdana,arial; font-size:8px;">
                <tr>
                   <td><strong style="font-family:arial, tahoma, verdana, courier; font-size:12px;">#getThisGroupName.CodeDesc# > #getThisCatname.CategoryDescription#</strong></td>
                </tr>
              </table>           
		  <cfif getItems.recordcount GT 0>
		      <strong style="font-family:verdana,arial; font-size:10px;">* Winning Vendor</strong>
			  <table border="0" cellpadding="4" cellspacing="1" width="100%" bgcolor="##666666" style="font-family:verdana,arial; font-size:8px;">
				<cfloop query="getItems">
				  <cfset getBidder = request.CoopAdminComponent.GetBidder(CurrentCoopConfig.ConfigID, GetItems.ItemID)>
				  <cfset ItemCount = request.CoopAdminComponent.GetItemCount(CurrentCoopConfig.ConfigID, getItems.ItemID)>
				   <cfset AgencyCount = request.CoopAdminComponent.GetAgencyCountByItem(CurrentCoopConfig.ConfigID, getItems.ItemID)>
				                  
					
				    <tr bgcolor="##ffffff">
				      <td valign="top">#getItems.ItemCode#</td>
				      <td valign="top"><strong>#getItems.ItemName#</strong><br>#getItems.ItemDesc#</td>
					  <td valign="top">#getItems.UnitofMeasure#</td>
					  <td valign="top" align="right"><cfif GetItems.BidsReceived EQ 0>
									                                    <strong>No Bids Received</strong>
																	<cfelse>
																	  <cfif getItems.ProdVote EQ 1 OR getItems.Rejected EQ 1>
																		  <cfif getItems.ProdVote EQ 1>
																			 <strong >VOTING:</strong> <span style="font-size:10px;">#getItems.VoteDesc#</span>
																		  </cfif>
																		  <cfif getItems.Rejected EQ 1>
																			 <strong>REJECTED:</strong> <span style="font-size:10px;">#getItems.RejectReason#</span>
																		  </cfif>   
																	  <cfelse>
																	     <cfif getItems.PreviousCost NEQ "">#DollarFormat(getItems.PreviousCost)#<cfelse>None</cfif>
																	  </cfif>
																	</cfif></td>
				    </tr>
					<cfset WinningVendor = GetItems.WinningVendorID>
					<tr bgcolor="##ffffff">
					  <td>&nbsp;</td>
					  <td colspan="3">
					    <table border="0" cellpadding="1" cellspacing="0" width="100%" style="font-family:verdana,arial; font-size:8px;">
						 <cfif GetBidder.recordcount GT 0>  
						   <tr >
						     <td><strong>Vendor</strong></td>
							 <td><strong>Brand</strong></td>
							 <td><strong>Delivery Time</strong></td>
							 <td align="right"><strong>Bid Price</strong></td>
							 <td><strong>## Agencies</strong></td>
							 <td><strong>Quantity</strong></td>
						   </tr>
						     
						    <cfloop query="GetBidder">
							    <tr <cfif getbidder.currentrow MOD(2) EQ 0>bgcolor="##eeeeee"</cfif>> 
							       <td width="40%"><cfif WinningVendor EQ getBidder.VendorID><strong style="color:##cc0000;">#getBidder.CompanyName# *</strong><cfelse>#getBidder.CompanyName#</cfif></td>
							       <td width="25%">#Trim(GetBidder.VendorProdName)#</td>
							       <td width="25%">#trim(GetBidder.ShippingTerms)#</td>
							       <td width="10%" align="right">#DollarFormat(GetBidder.VendorPrice)#</td>
							       <td width="5%" align="center" valign="top">#AgencyCount.Quantity#</td>
							       <td width="5%" align="center" valign="top">#ItemCount.Quantity#</td>  
							     </tr>
								<cfif GetBidder.BidComment NEQ "" AND URL.ShowComm EQ 1>
								  <tr <cfif getbidder.currentrow MOD(2) EQ 0>bgcolor="##eeeeee"</cfif>>
								    <td style="font-size:10px; font-family:verdana;color:##444444;" colspan="4"><strong>COMMENT:</strong>#GetBidder.BidComment#</td>
								  </tr>
								</cfif>
						    </cfloop>	
						</cfif>	
						</table>
						<cfset WinningVendor = 0>
					  </td>
					</tr>
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