 <cfsilent>
  <cfparam name="url.PrinterFriendly" default="false">
  <!--- Get the Groups --->
   <cfset getGroups = request.CoopComponent.GetItemGroups()>
  <!--- Get The Categories --->
   <cfset getCats = request.CoopComponent.GetItemCategories()>
  <!--- Get Both Above in one query ---> 
  <cfset getRelatedGroups = request.CoopComponent.GetAllItemGroupsCats()>
  <cfset CurrentCoopConfig = Request.CoopAdminComponent.getCoopConfig(now())>
  
  
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
  
    <cfset ShowTypeName = "Winning Bidders">

</cfsilent>  
<cfmodule template="#Application.header#" section="0" sectiontitle="Cooperative Purchase Program">
  <cfoutput><br>
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
      <tr>
	    <cfif ThisCatID EQ "" Or url.printerfriendly>
         <td valign="top" width="160"><br>
		    <cfmodule template="#Application.tagdir#/adminnav.cfm" level="5">
         </td> 
		</cfif> 
         <td valign="top">
  
			<table border="0" cellpadding="5" cellspacing="0">
		       <tr>
		         <td><h3>IPRA Cooperative Purchase Program: Bids By Item Report</h3></td>
		       </tr>
		    </table>

	     <table border="0" cellpadding="4" cellspacing="0" width="100%">
	      <cfif CurrentCoopConfig.ConfigID NEQ "">
		   <cfif ThisCatID EQ "">
		   <tr>
		     <td>Use the Form below to select the product group and related categories you would like view.</td>
		   </tr>
		   <cfelse>
		    <tr>
	          <td align="right"><a href="index.cfm"><< Back to Reports Home</a><br><br><a href="ItemBidder_PDF.cfm?g=#ThisGroupID#&C=#ThisCatID#&ShowComm=#form.ShowBidComments#&r=#RandRange(1,10000)#" target="_blank"><img src="/images/pdficon.gif" width="22" height="24" alt="" border="0" align="absmiddle">  Print as PDF</a></td>
	        </tr> 
		   </cfif>
		   <tr>
		     <td>
			   <form name="coopItems" action="ItemBidders.cfm" method="post"> 
			    <table border="0" cellpadding="4" cellspacing="0">
				  <tr>
			        <td><strong>Show Bid Comments:</strong> <input type="radio" name="ShowBidComments" value="1"> YES&nbsp;&nbsp;&nbsp;<input type="radio" name="ShowBidComments" value="0" checked> NO</td>
			      </tr>
				  <tr>
	                 <td><strong>Select a<cfif ThisCatID NEQ ""> New<cfelse>n</cfif> Product:</strong></td>
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
					  
					    <cfset getItems = request.CoopComponent.getItems(CurrentCoopConfig.ConfigID, ThisCatID, ThisGroupID)>
					  
					   
						   <table border="0" cellpadding="3" cellspacing="0" width="100%">
			                 <tr>
			                    <td><strong style="font-family:arial, tahoma, verdana, courier; font-size:12px;">#getThisGroupName.CodeDesc# > #getThisCatname.CategoryDescription#</strong></td>
			                 </tr>
			               </table>         
						  
						  <cfif getItems.recordcount GT 0>
						      <strong style="color:##cc0000;">* Winning Vendor</strong>
							  <table border="0" cellpadding="4" cellspacing="1" width="100%" bgcolor="##666666">
								<cfloop query="getItems">
								  <cfset getBidder = request.CoopAdminComponent.GetBidder(CurrentCoopConfig.ConfigID, GetItems.ItemID)>
								  
								 
								    <cfset ItemCount = request.CoopAdminComponent.GetItemCount(CurrentCoopConfig.ConfigID, getItems.ItemID)>
				                    <cfset AgencyCount = request.CoopAdminComponent.GetAgencyCountByItem(CurrentCoopConfig.ConfigID, getItems.ItemID)>
				                  
								    
								    <tr bgcolor="##f0f8ff">
								      <td valign="top">#getItems.ItemCode#</td>
								      <td valign="top"><strong>#getItems.ItemName#</strong><br>#getItems.ItemDesc#</td>
									  <td valign="top">#getItems.UnitofMeasure#</td>
									  <td valign="top" align="right"><cfif GetItems.BidsReceived EQ 0>
									                                    <strong style="color:##CC0000;">No Bids Received</strong>
																	<cfelse>
																	  <cfif getItems.ProdVote EQ 1 OR getItems.Rejected EQ 1>
																		  <cfif getItems.ProdVote EQ 1>
																			 <strong style="color:##009900;">VOTING:</strong> <span style="font-size:10px;">#getItems.VoteDesc#</span>
																		  </cfif>
																		  <cfif getItems.Rejected EQ 1>
																			 <strong style="color:##CC0000;">REJECTED:</strong> <span style="font-size:10px;">#getItems.RejectReason#</span>
																		  </cfif>   
																	  <cfelse>
																	     <cfif getItems.PreviousCost NEQ "">#DollarFormat(getItems.PreviousCost)#<cfelse>None</cfif>
																	  </cfif>
																	</cfif>
																	
									  </td>
								    </tr>
									<cfset WinningVendor = GetItems.WinningVendorID>
									<tr>
									  <td bgcolor="##fdfdfd">&nbsp;</td>
									  <td colspan="3" bgcolor="##fdfdfd">
									    <table border="0" cellpadding="1" cellspacing="1" width="100%">
										   <tr bgcolor="##b9b9b9">
										     <td><strong>Vendor</strong></td>
											 <td><strong>Brand</strong></td>
											 <td><strong>Delivery Time</strong></td>
											 <td><strong>Bid Price</strong></td>
											 <td><strong>## Agencies</strong></td>
											 <td><strong>Quantity</strong></td>
										   </tr> 
										   
									  <cfif GetBidder.recordcount GT 0>
										 <cfloop query="GetBidder">
										    <tr <cfif getbidder.currentrow MOD(2) EQ 0>bgcolor="##eeeeee"</cfif>> 
										     <td width="40%" valign="top"><cfif WinningVendor EQ getBidder.VendorID><strong style="color:##cc0000;">#getBidder.CompanyName# *</strong><cfelse>#getBidder.CompanyName#</cfif></td>
										     <td width="25%" valign="top">#Trim(GetBidder.VendorProdName)#</td>
											 <td width="20%" valign="top">#trim(GetBidder.ShippingTerms)#</td>
											 <td width="10%" align="right" valign="top">#DollarFormat(GetBidder.VendorPrice)#</td>
											 <td width="5%" align="center" valign="top">#AgencyCount.Quantity#</td>
											 <td width="5%" align="center" valign="top">#ItemCount.Quantity#</td>
											</tr>
											<cfif GetBidder.BidComment NEQ "" AND form.ShowBidComments NEQ 0>
											  <tr <cfif getbidder.currentrow MOD(2) EQ 0>bgcolor="##eeeeee"</cfif>>
											    <td style="font-size:10px; font-family:verdana;color:##444444;" colspan="6"><strong>COMMENT:</strong>#GetBidder.BidComment#</td>
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
				</cfif>
			 </td>
		   </tr>
		   <cfelse>
		     <tr>
			   <td><strong style="color:##CC0000;">This report may only be run during an open Coop Period</strong></td>
			 </tr>
		   </cfif>
	     </table>
	  <br><br><br><br>
  </td>
</tr>
</table>

 </cfoutput>		   	
<cfmodule template="#Application.footer#">