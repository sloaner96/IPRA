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
  
  
  <cfif URL.T EQ "B">
    <cfset ShowTypeName = "Winning Bidders">
  <cfelseif URL.T EQ "V">
    <cfset ShowTypeName = "Products Voted On">
  <cfelseif URL.T EQ "R">
    <cfset ShowTypeName = "Rejected Products">	
  </cfif>
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
             <table border="0" cellpadding="4" cellspacing="2" width="100%" bgcolor="##eeeeee">
				<tr bgcolor="##003366">
					<td bgcolor="##003366"><a href="ProductMaint.cfm" style="color:##ffffff;"><strong>Product Home</strong></td>
					 <td><a href="PeriodUpdate.cfm?t=B" style="color:##ffffff;"><strong>Add Winning Bidder</strong></a></td>
					 <td><a href="PeriodUpdate.cfm?t=V" style="color:##ffffff;"><strong>Add Voting</strong></a></td>
					 <td><a href="PeriodUpdate.cfm?t=R" style="color:##ffffff;"><strong style="color:##ffffff;">Reject Items</strong></a></td>
					 <td><a href="prodReports.cfm" style="color:##ffffff;"><strong style="color:##ffffff;">Product Reports</strong></a></td>
					 
				</tr>
	        </table>
			<table border="0" cellpadding="5" cellspacing="0">
		       <tr>
		         <td><h3>IPRA Cooperative Purchase Program</h3></td>
		       </tr>
		    </table>

	     <table border="0" cellpadding="4" cellspacing="0" width="100%">
	       <cfif ThisCatID EQ "">
		   <tr>
		     <td>Use the Form below to select the product group and related categories you would like maintain.</td>
		   </tr>
		   </cfif>
		   <tr>
		     <td>

			     
				 
			   <form name="coopItems" action="PeriodUpdate.cfm?t=#URL.T#" method="post"> 
			    <table border="0" cellpadding="4" cellspacing="0">
			
<!--- 				  <tr>
				    <td><strong>Show All Items</strong> <input type="radio" name="ShowAll" value="1" checked>&nbsp;&nbsp;Show only #ShowTypeName# <input type="radio" name="ShowAll" value="0">&nbsp;&nbsp;</td> 
				  </tr> --->
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
				       <cfif URL.T EQ "B">
					    <cfset ThisAction = "Winbid">
					  <cfelseif URL.T EQ "V">
					    <cfset ThisAction = "VoteBid">
					  <cfelseif URL.T EQ "R">
					    <cfset ThisAction = "RejectBid">	
					  </cfif>
					  
				     <!--- Get This Group name --->
					   <cfset getThisGroupName = request.CoopComponent.GetItemGroups(ThisGroupID)>
					  <!--- Get This Category Name --->
					   <cfset getThisCatname = request.CoopComponent.GetItemCategories(ThisCatID)>
					  <!--- Get All Items that match this Category and Group  --->
					  
					    <cfset getItems = request.CoopComponent.getItems(CurrentCoopConfig.ConfigID, ThisCatID, ThisGroupID)>
					  
					   
						   <table border="0" cellpadding="3" cellspacing="0" width="100%">
			                 <tr>
			                    <td><strong style="font-family:arial, tahoma, verdana, courier; font-size:12px;">#getThisGroupName.CodeDesc# > #getThisCatname.CategoryDescription#</strong> (<strong>#getItems.recordcount#</strong> products found)</td>
			                 </tr>
			               </table>           
						  <cfif getItems.recordcount GT 0>
						   <form name="addProd" action="productAction.cfm?action=#ThisAction#" Method="POST"> 
							 <input type="hidden" name="CoopID" value="#CurrentCoopConfig.ConfigID#">
							 <input type="hidden" name="GroupID" value="#ThisGroupID#">
							 <input type="hidden" name="CatID" value="#ThisCatID#">
							 
							  <table border="0" cellpadding="4" cellspacing="1" width="100%" bgcolor="##666666">
								<tr bgcolor="##9dabc4">
								   <td><strong style="color:##ffffff;">Item ID</strong></td>
								   <td><strong style="color:##ffffff;">Item</strong></td>
								   <td><strong style="color:##ffffff;">Unit of measure</strong></td>
								   <cfif URL.T EQ "B">
					                  <td><strong style="color:##ffffff;">Select Winning Bidder</strong></td>  
					               <cfelseif URL.T EQ "V">
					                  <td><strong style="color:##ffffff;">Mark for Voting</strong></td>
					               <cfelseif URL.T EQ "R">
					                  <td><strong style="color:##ffffff;">Mark for Rejection</strong></td>
					                </cfif>
								</tr>
								<cfset ItemList = "">
								<cfloop query="getItems">
								   <!--- <cfset ItemCount = request.CoopAdminComponent.GetItemCount(form.ConfigID, getItems.ItemID)>
								   <cfset AgencyCount = request.CoopAdminComponent.GetAgencyCountByItem(form.ConfigID, getItems.ItemID)>
								    --->
									<cfif url.T EQ "B">
									  <cfset getBidder = request.CoopAdminComponent.GetBidder(CurrentCoopConfig.ConfigID, GetItems.ItemID)>
									<cfelseif URL.T EQ "V">
					                  
									<cfelseif URL.T EQ "R">
									
									</cfif>
									
								    <tr bgcolor="##ffffff">
								      <td>#getItems.ItemCode#</td>
								      <td><strong>#getItems.ItemName#</strong><br>#getItems.ItemDesc#</td>
									  <td>#getItems.UnitofMeasure#</td>
									  <cfif URL.T NEQ "B">
									     <cfset MarkRecord = False>
									     <cfif URL.T EQ "R">
										   <cfif getItems.Rejected EQ 1>
										      <cfset MarkRecord = True>
										   </cfif>
										 <cfelse>
										   <cfif getItems.ProdVote EQ 1>
										   <cfset MarkRecord = True>
										   </cfif>
										 </cfif>
									     <td><input type="checkbox" name="ItemToAct" value="#GetItems.ItemID#" <cfif MarkRecord>Checked</cfif>></td>
									  <cfelse> 
									     
									     <td style="color:##676767;">
										 
										  <cfif GetBidder.recordcount GT 0>
										    <cfset ItemList = ListAppend(ItemList, GetItems.ItemID, ",")>
										     <cfset WinningVendor = GetItems.WinningVendorID>
										     <select name="WinningBidder_#GetItems.ItemID#">
										       <option value="">-- Select One --</option>
											   <cfloop query="GetBidder">
											     <option value="#getBidder.VendorID#" <cfif WinningVendor EQ getBidder.VendorID>Selected</cfif>>#getBidder.CompanyName#</option>
											   </cfloop>
											 </select>
											 <cfset WinningVendor = 0>
										  <cfelse>
											  No Bidders
										  </cfif>
										 </td>
									  </cfif>
									  
								    </tr>
									<cfif URL.T NEQ "B">
									  <cfif URL.T EQ "V">
									    <cfset ThisText = request.CoopComponent.getVoteDesc(CurrentCoopConfig.ConfigID,GetItems.ItemID)>
									  <cfelseif URL.T EQ "R">
									  	<cfset ThisText = request.CoopComponent.getRejectDesc(CurrentCoopConfig.ConfigID,GetItems.ItemID)>
									  </cfif>
									  <tr bgcolor="##f7f7f7">
									     <td colspan="4"><strong>Comments:</strong> <textarea name="ItemComment_#GetItems.ItemID#" rows="2" cols="45">#ThisText#</textarea></td>
									  </tr>
									</cfif>
									
								</cfloop>
								<tr>
								  <td colspan="4" align="center">
								  <input type="hidden" name="ItemList" value="#ItemList#"> 
								  <input type="submit" name="submit" value="Save >>"></td>
								</tr>
							  </table>
						  </form>
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