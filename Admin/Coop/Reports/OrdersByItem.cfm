  <cfparam name="url.PrinterFriendly" default="false">
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
  
<cfmodule template="#Application.header#" section="0" sectiontitle="Cooperative Purchase Program">
  <cfoutput><br>
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
      <tr>
	    <cfif ThisCatID EQ "" Or url.printerfriendly>
         <td valign="top" width="160"><br>
		    <cfmodule template="#Application.tagdir#/adminnav.cfm" level="5">
         </td>
         <td valign="top">
        </cfif> 

	<table border="0" cellpadding="5" cellspacing="0">
       <tr>
         <td><h3>IPRA Cooperative Purchase Program: Item Order Report</h3></td>
       </tr>
    </table>

     <table border="0" cellpadding="4" cellspacing="0" width="100%">
       <cfif ThisCatID EQ "">
	   <tr>
	     <td>Use the Form below to select the product group and related categories you would like to report on.</td>
	   </tr>
	   
	   </cfif>
	   <tr>
	     <td>
		   <cfif ThisCatID EQ "">
		     <cfset getconfigs = request.CoopAdminComponent.getAllConfigs()>
		   <form name="coopItems" action="ordersByItem.cfm" method="post"> 
		    <table border="0" cellpadding="4" cellspacing="0">
			  <tr>
			    <td><strong>Coop Period:</strong> 
				    <select name="ConfigID">
					  <cfloop query="GetConfigs">
				      <option value="#getConfigs.ConfigID#">#getconfigs.CoopYear#</option>
					  </cfloop>
					</select>
				</td>
			  </tr>
			  <tr>
			    <td><strong>Show All Items</strong> <input type="radio" name="ShowAll" value="1" checked>&nbsp;&nbsp;Show only Items with a Quantity <input type="radio" name="ShowAll" value="0">&nbsp;&nbsp;</td> 
			  </tr>
			  <tr>
                 <td><strong>Select a<cfif ThisCatID NEQ "">a New<cfelse>n</cfif> Product:</strong></td>
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
			</cfif>
			<cfif ThisCatID NEQ "">
			     <!--- Get This Group name --->
				   <cfset getThisGroupName = request.CoopComponent.GetItemGroups(ThisGroupID)>
				  <!--- Get This Category Name --->
				   <cfset getThisCatname = request.CoopComponent.GetItemCategories(ThisCatID)>
				  <!--- Get All Items that match this Category and Group  --->
				  <cfif form.showall EQ 1>
				    <cfset getItems = request.CoopComponent.getItems(form.ConfigID, ThisCatID, ThisGroupID)>
				  <cfelse>
				    <cfset getItems = request.CoopComponent.getItemswithQuantity(form.ConfigID, ThisCatID, ThisGroupID)>
				  </cfif>
				  <div align="right"><a href="index.cfm"><< Back to Reports Home</a><br><br><a href="VendorBidSheets.cfm?GroupID=#ThisGroupID#&CatID=#ThisCatID#&PeriodID=#form.ConfigID#" target="Blank"><img src="/images/pdficon.gif" width="22" height="24" alt="" border="0" align="absmiddle"> Download as Vendor Bid Sheets</a><br><a href="OrdersByItem.cfm"><< Search Again</a></div> 
			   <table border="0" cellpadding="3" cellspacing="0" width="100%">
                 <tr>
                    <td><strong style="font-family:arial, tahoma, verdana, courier; font-size:12px;">#getThisGroupName.CodeDesc# > #getThisCatname.CategoryDescription#</strong> (<strong>#getItems.recordcount#</strong> products found)</td>
                 </tr>
               </table>           
			  <cfif getItems.recordcount GT 0>
			  <table border="0" cellpadding="4" cellspacing="1" width="100%" bgcolor="##666666">
				<tr bgcolor="##9dabc4">
				   <td><strong style="color:##ffffff;">Item ID</strong></td>
				   <td><strong style="color:##ffffff;">Item</strong></td>
				   <td><strong style="color:##ffffff;">Unit of measure</strong></td>
				   <td><strong style="color:##ffffff;">Agencies</strong></td>
				   <td><strong style="color:##ffffff;">Order Quantity</strong></td>
				</tr>
				
				<cfloop query="getItems">
				   <cfset ItemCount = request.CoopAdminComponent.GetItemCount(form.ConfigID, getItems.ItemID)>
				   <cfset AgencyCount = request.CoopAdminComponent.GetAgencyCountByItem(form.ConfigID, getItems.ItemID)>
				   
				    <tr bgcolor="##ffffff">
				      <td>#getItems.ItemCode#</td>
				      <td><strong>#getItems.ItemName#</strong><br>#getItems.ItemDesc#</td>
					  <td>#getItems.UnitofMeasure#</td>
					  <td align="center">#AgencyCount.Quantity#</td>
					  <td align="center">#ItemCount.Quantity#</td>
				    </tr>
					<cfif GetItems.BidsReceived EQ 0>
						<tr bgcolor="##ffffff">
							<td align="center" colspan="5"><strong style="color:##CC0000;">No Bids Received</strong></td>
						</tr>
					</cfif>
				</cfloop>
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
  </td>
</tr>
</table>

 </cfoutput>		   	
<cfmodule template="#Application.footer#">