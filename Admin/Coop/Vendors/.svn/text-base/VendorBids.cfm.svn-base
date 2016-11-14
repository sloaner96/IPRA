<cfparam name="URL.ShowWinner" default="0">
<cfset GetVendor = request.CoopAdminComponent.GetVendorInfo(URL.VendorID)>
<cfset CurrentCoopConfig = Request.CoopAdminComponent.getCoopConfig(now())>

<cfif CurrentCoopConfig.recordcount GT 0>
	<cfif url.ShowWinner EQ 0>
	  <cfset GetBids = request.CoopAdminComponent.GetVendorBids(CurrentCoopConfig.ConfigID,Url.VendorID)>
	<cfelse>
	  <cfset GetBids = request.CoopAdminComponent.GetVendorWinningBids(CurrentCoopConfig.ConfigID,Url.VendorID)>
	</cfif>
</cfif>
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
  
<cfmodule template="#Application.header#" section="0" sectiontitle="Coop Vendor Maintenance">
  
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="160"><br>
		    <cfmodule template="#Application.tagdir#/adminnav.cfm" level="5">
		   </td>
		   <td valign="top"><br>
		    <cfoutput>
			  <table border="0" cellpadding="4" cellspacing="2" width="100%" bgcolor="##eeeeee">
				<tr bgcolor="##003366">
					 <td><strong style="color:##ffffff;"><a href="VendorMaint.cfm" style="color:##ffffff;">Vendor Home</a></strong></td>
					 <td><strong style="color:##ffffff;"><a href="VendorDetail.cfm?vendorID=#URL.VendorID#"" style="color:##ffffff;">Vendor Detail</a></strong></td>
					 <td bgcolor="##ffffff"><strong style="color:##003366;">Vendor Bids</strong></td>
					 <td><strong style="color:##ffffff;"><a href="VendorHistory.cfm?vendorID=#URL.VendorID#" style="color:##ffffff;">Vendor History</a></strong></td>	 
				</tr>
	          </table>
			  </cfoutput>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		             <td><h3>Cooperative Purchase Program: Current Vendor Bids</h3></td>
		        </tr>
				<cfif CurrentCoopConfig.recordcount GT 0>
				  <cfoutput>
					<tr>
					  <td>Below are the current bids for <strong>#GetVendor.CompanyName#</strong>. To add a new bid for this vendor, Select the Group and Category you would like to add to and enter the bid information. Winning Bids can not be entered from this screen they must be entered in the Product Maintenance Screens.</td>
					</tr>
			      </table><br>
						  <table border="0" cellpadding="0" cellspacing="0" width="100%">
			                <tr>
			                     <td><strong style="color:##cc6600;font-size:12px; font-family:arial;">Add a New Bid</strong></td>
			                </tr>
							<tr>
							   <td>
							      <form name="coopItems" action="VendorBids.cfm?VendorID=#URL.VendorID#" method="post"> 
								    <table border="0" cellpadding="4" cellspacing="0">
									  <tr>
									    <td></td>
									  </tr>
									  <tr>
									    <td><cfmodule template="/IPRA/TwoSelectsRelated.cfm"
												QUERY="getRelatedGroups"
												NAME1="GroupID"
												NAME2="CatID"
												DISPLAY1="GroupName"
												DISPLAY2="CategoryDescription"
												VALUE1="groupID"
												VALUE2="CategoryCode"
												FORCEWIDTH1="40"
												FORCEWIDTH2="40"
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
								  <cfif ISDefined("form.CatID")>
								    <form name="addcoopItems" action="AddVendorBids.cfm?action=ADD" method="post">
									   <input type="hidden" name="CoopID"  value="#CurrentCoopConfig.ConfigID#">
									   <input type="hidden" name="VendorID"  value="#URL.VendorID#">
									   
									    <!--- Get This Group name --->
									      <cfset getThisGroupName = request.CoopComponent.GetItemGroups(ThisGroupID)>
									   <!--- Get This Category Name --->
									     <cfset getThisCatname = request.CoopComponent.GetItemCategories(ThisCatID)>
									   <!--- Get Items for this Group and Category---> 
									      <cfset getItems = request.CoopComponent.getItems(CurrentCoopConfig.ConfigID, Form.catID, form.groupID)>
										<table border="0" cellpadding="3" cellspacing="0" width="100%">
					                      <tr>
					                        <td><strong style="font-family:verdana, arial, tahoma, courier; font-size:12px; color:##666666;">#getThisGroupName.CodeDesc# > #getThisCatname.CategoryDescription#</strong> (<strong>#getItems.recordcount#</strong> products found)</td>
					                     </tr>
					                    </table>  
									    <table border="0" cellpadding="4" cellspacing="0">
				                            <tr>
											   <td><strong>Coop Item:</strong></td>
				                               <td><select name="ItemID">
											        <cfloop query="getItems">
											         <option value="#getItems.ItemID#">#getItems.ItemCode# - #getItems.ItemName#</option>
													</cfloop> 
												   </select>
											   </td>
				                            </tr>
											<tr>
											  <td><strong>Model/Brand:</strong></td>
											  <td><input type="text" name="VendorProduct" value="" size="40" maxlength="200"></td>
											</tr>
											<tr>
											  <td><strong>Shipping Terms:</strong></td>
											  <td><input type="text" name="ShippingTerms" value="" size="45" maxlength="150"></td>
											</tr>
											<tr>
											  <td><strong>Bid Price:</strong></td>
											  <td>$<input type="text" name="BidPrice" value="" size="10" maxlength="15"></td>
											</tr>
											<tr>
											  <td><strong>Bid Comments:</strong></td>
											  <td><textarea name="bidComments" rows="5" cols="45"></textarea></td>
										    </tr>
											<tr>
											  <td colspan="2" align="center"><input type="submit" name="submit" value="Add Bid >>"></td>
											</tr>
				                        </table>
									</form>
								  </cfif>
							   </td>
							</tr>
			              </table><br>
			      </cfoutput>
				  <cfoutput>
				    <table border="0" cellpadding="4" cellspacing="1" width="100%" bgcolor="##ffffff">
                      <tr>
					    <cfif URL.ShowWinner EQ 0>
                           <td width="100" align="center" bgcolor="##9dabc4"><strong>Current Bids</strong></td>
						<cfelse>
						   <td width="100" align="center" bgcolor="##eeeeee"><a href="VendorBids.cfm?VendorID=#URL.VendorID#"><strong>Current Bids</strong></a></td>
						</cfif>
						<cfif URL.ShowWinner EQ 1>
						   <td width="100" align="center" bgcolor="##9dabc4"><strong>Bids Won</strong></td>
						<cfelse>
						   <td width="100" align="center" bgcolor="##eeeeee"><a href="VendorBids.cfm?VendorID=#URL.VendorID#&ShowWinner=1"><strong>Bids Won</strong></a></td>
						</cfif>
                        <cfif GetBids.recordcount GT 0><td align="right" bgcolor="##ffffff"><a href="VendorBidReport.cfm?VendorID=#URL.VendorID#&ShowWinner=#url.ShowWinner#">Print Vendor Bid Report</a></td><cfelse><td>&nbsp;</td></cfif>
                      </tr>
                    </table>
				  </cfoutput>
				  <cfif GetBids.recordcount GT 0>
				  <table border="0" cellpadding="3" cellspacing="1" width="100%" bgcolor="#666666">
						 <cfoutput query="GetBids" group="GroupName">
						   <tr bgcolor="##9dabc4">
						     <td colspan="8"><strong style="font-family:arial; font-size:16px;padding-left:5px;padding-top:5px;padding-bottom:5px;">#getBids.groupName#</strong></td>
						   </tr>
						   <cfoutput group="CatID">
						      <tr bgcolor="##006699">
						         <td colspan="8"><strong style="font-family:arial; font-size:14px; color: ##ffffff; padding-left:20px;padding-top:5px;padding-bottom:5px;">#getBids.CategoryName#</strong></td>
						      </tr>
							  <tr bgcolor="##f7f7f7">
								    <td></td>
								    <td><strong>Item ID</strong></td>
									<td><strong>Item</strong></td>
									<td><strong>Brand</strong></td>
									<td><strong>UOM</strong></td>
									<td><strong>Previous</strong></td>
									<td><strong>Bid</strong></td>
									<td><strong>Bid Date</strong></td>
							  </tr>
								 <cfoutput> 
								   <tr bgcolor="##ffffff">
								      <td valign="top"><a href="AddvendorBids.cfm?action=DELETE&VendorID=#URL.VendorID#&VenItemID=#GetBids.VenItemID#"><img src="/images/btn_remove.gif" width="15" height="15" alt="Remove Bid" border="0"></a></td> 
								      <td valign="top">#GetBids.ITEMCODE#</td>
									  <td valign="top"><a href="EditBid.cfm?VendorID=#URL.VendorID#&BidID=#GetBids.VenItemID#"><strong>#GetBids.ItemName#</strong></a><br><font style="font-size:9px;">#ItemDesc#</font></td>
									  <td valign="top">#GetBids.VendorProdName#</td>
									  <td valign="top">#GetBids.UNITOFMEASURE#</td>
									  <td valign="top">#DollarFormat(GetBids.PreviousCost)#</td>
									  <td valign="top">#DollarFormat(GetBids.VendorPrice)#</td>
									  <td valign="top">#DateFormat(GetBids.BidDate, 'MM/DD/YYYY')#</td>
								   </tr>
								   <tr bgcolor="##fbfbfb">
								      <td></td>
			                          <td colspan="8"><strong>SHIPPING TERMS:</strong> #GetBids.ShippingTerms#<br></td>
			   					   </tr>
								   <cfif GetBids.BidComment NEQ "">
								   <tr bgcolor="##f4f4f4">
								      <td></td>
			                          <td colspan="8"><strong>COMMENTS:</strong> #GetBids.BidComment#<br></td>
			   					   </tr>
								   </cfif>
						    </cfoutput>
						  </cfoutput>	
						    <tr bgcolor="##ffffff">
							  <td colspan="8">&nbsp;</td>
							</tr>	   
						 </cfoutput>
						</table> 
					  <cfelse>
					    <table border="0" cellpadding="3" cellspacing="1" width="100%">
					    <cfif url.ShowWinner EQ 0>
					      <tr>
		                     <td class="errortext" align="center">There are currently no bids for this vendor. Use the form above to add a new bid.</td>
		                  </tr>
						<cfelse>
				          <tr>
                            <td><strong class="Errortext">This Vendor Has not Currently Won any Bids</strong></td>
                         </tr>
				        </cfif>
					  </table>	
					  </cfif>
				  
			 <cfelse>
			   <table border="0" cellpadding="4" cellspacing="0" width="100%">
				   <tr>
                      <td><strong class="Errortext">At this time you can not add bids for ANY vendors as there is no current Coop Period.</strong></td>
                   </tr>
               </table> 
			 </cfif> 
		 	<br><br>
		 </td>
     </tr>
</table>  

<cfmodule template="#Application.footer#">	  