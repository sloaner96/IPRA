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
         <td><h3>IPRA Cooperative Purchase Program: Winning Bidder Report</h3></td>
       </tr>
    </table>
     
     <table border="0" cellpadding="4" cellspacing="0" width="100%">
      
	   
	  
	   <cfif ThisCatID EQ "">
	      <tr>
	        <td>Use the Form below to select the product group and related categories you would like to report on.</td>
	     </tr>
	   <cfelse>
	     <tr>
	        <td align="right"><a href="index.cfm"><< Back to Reports Home</a><br><br><a href="WinningBidder_PDF.cfm?g=#ThisGroupID#&C=#ThisCatID#&ConfigID=#form.ConfigID#&r=#RandRange(1,10000)#" target="_blank"><img src="/images/pdficon.gif" width="22" height="24" alt="" border="0" align="absmiddle">  Print as PDF</a></td>
	     </tr>   
	   </cfif>
	   <tr>
	     <td>
		   <cfif ThisCatID EQ "">
		     <cfset getconfigs = request.CoopAdminComponent.getAllConfigs()>
		   <form name="coopItems" action="WinningBidders.cfm" method="post"> 
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
			</cfif>
			<cfif ThisCatID NEQ "">
			     <!--- Get This Group name --->
				   <cfset getThisGroupName = request.CoopComponent.GetItemGroups(ThisGroupID)>
				  <!--- Get This Category Name --->
				   <cfset getThisCatname = request.CoopComponent.GetItemCategories(ThisCatID)>
				  <!--- Get All Items that match this Category and Group  --->
				  
				    <cfset getItems = request.CoopAdminComponent.getItemWinBidders(form.ConfigID, ThisCatID, ThisGroupID)>
				
				  <div align="right"><a href="WinningBidders.cfm"><< Search Again</a></div> 
			   <table border="0" cellpadding="3" cellspacing="0" width="100%">
                 <tr>
                    <td><strong style="font-family:arial, tahoma, verdana, courier; font-size:12px;">#getThisGroupName.CodeDesc# > #getThisCatname.CategoryDescription#</strong> (<strong>#getItems.recordcount#</strong> items found)</td>
                 </tr>
               </table>           
			  <cfif getItems.recordcount GT 0>
			  <table border="0" cellpadding="2" cellspacing="1" width="100%" bgcolor="##666666">
				<tr bgcolor="##9dabc4">
				   <td><strong style="color:##ffffff;">Item ID</strong></td>
				   <td><strong style="color:##ffffff;">Item</strong></td>
				   <td><strong style="color:##ffffff;">Unit of measure</strong></td>
				   <td><strong style="color:##ffffff;">Vendor</strong></td>
				   <td><strong style="color:##ffffff;">Previous Cost</strong></td>
				   <td><strong style="color:##ffffff;">Cost</strong></td>
				   <td><strong style="color:##ffffff;">Total Agencies</strong></td>
				   <td><strong style="color:##ffffff;">Total Quantity</strong></td>
				</tr>
				
				<cfloop query="getItems">
				   	<cfset ItemCount = request.CoopAdminComponent.GetItemCount(form.ConfigID, getItems.ItemID)>
				    <cfset AgencyCount = request.CoopAdminComponent.GetAgencyCountByItem(form.ConfigID, getItems.ItemID)>
				   
				    <tr bgcolor="##ffffff">
				      <td>#getItems.ItemCode#</td>
				      <td><strong>#getItems.ItemName#</strong><br>#getItems.ItemDesc#</td>
					  <td>#getItems.UnitofMeasure#</td>
					  <td>#GetItems.VendorName#</td>
					  <td align="center">#DollarFormat(GetItems.PreviousCost)#</td>
					  <td align="center"><cfif getItems.Rejected EQ 1><strong style="color:##CC0000;">REJECTED:</strong> <span style="font-size:10px;">#getItems.RejectReason#<span>
										 <cfelse>#DollarFormat(GetItems.Cost)#
										 </cfif></td>
					  <td align="right">#AgencyCount.Quantity#</td>
					  <td align="right">#ItemCount.Quantity#</td>
				    </tr>
				    <tr bgcolor="##ffffff">
					  <td></td>
					  <td colspan="8">
					     <table border="0" cellpadding="0" cellspacing="1" width="100%"bgcolor="##ffffff">
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