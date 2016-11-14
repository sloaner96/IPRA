 <cfsilent>
  <cfparam name="url.PrinterFriendly" default="false">
  <!--- Get the Groups --->
   <cfset getGroups = request.CoopComponent.GetItemGroups()>
  <!--- Get The Categories --->
   <cfset getCats = request.CoopComponent.GetItemCategories()>
  <!--- Get Both Above in one query ---> 
  <cfset getRelatedGroups = request.CoopComponent.GetAllItemGroupsCats()>
  <!--- <cfset CurrentCoopConfig = Request.CoopAdminComponent.getCoopConfig(now())> --->
  
  
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
		         <td><h3>IPRA Cooperative Purchase Program: Items by Agency Report</h3></td>
		       </tr>
		    </table>

	     <table border="0" cellpadding="4" cellspacing="0" width="100%">
		   <cfif ThisCatID EQ "">
		   <tr>
		     <td>Use the Form below to select the product group and related categories you would like view.</td>
		   </tr>
		   <cfelse>
		    <tr>
	          <td align="right"><a href="ItemByAgency_PDF.cfm?g=#ThisGroupID#&C=#ThisCatID#&f=#form.ConfigID#&r=#RandRange(1,10000)#" target="_blank"><img src="/images/pdficon.gif" width="22" height="24" alt="" border="0" align="absmiddle">  Print as PDF</a></td>
	        </tr> 
		   </cfif>
		   <tr>
		     <td>
			   <cfset getconfigs = request.CoopAdminComponent.getAllConfigs()>
			   <form name="coopItems" action="ItemByAgency.cfm" method="post"> 
			    <table border="0" cellpadding="4" cellspacing="0">
				  <tr>
			        <td><strong>Coop Period:</strong> 
				      <select name="ConfigID">
					    <cfloop query="GetConfigs">
				          <option value="#getConfigs.ConfigID#" <cfif IsDefined("form.ConfigID")><cfif form.configID EQ getConfigs.ConfigID>Selected</cfif></cfif>>#getconfigs.CoopYear#</option>
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
				
				<cfif ThisCatID NEQ "">
					  
				     <!--- Get This Group name --->
					   <cfset getThisGroupName = request.CoopComponent.GetItemGroups(ThisGroupID)>
					  <!--- Get This Category Name --->
					   <cfset getThisCatname = request.CoopComponent.GetItemCategories(ThisCatID)>
					  <!--- Get All Items that match this Category and Group  --->
					  
					    <cfset getItems = request.CoopComponent.getItems(form.ConfigID, ThisCatID, ThisGroupID)>
					  
					   
						   <table border="0" cellpadding="3" cellspacing="0" width="100%">
			                 <tr>
			                    <td><strong style="font-family:arial, tahoma, verdana, courier; font-size:12px;">#getThisGroupName.CodeDesc# > #getThisCatname.CategoryDescription#</strong></td>
			                 </tr>
			               </table>           
						  <cfif getItems.recordcount GT 0>
							  <table border="0" cellpadding="4" cellspacing="1" width="100%" bgcolor="##666666">
								<cfloop query="getItems">
								  <cfset getAgency = request.CoopAdminComponent.getAgencyByItem(form.ConfigID, GetItems.ItemID)>
									
								    <tr bgcolor="##e4e4e4">
								      <td valign="top">#getItems.ItemCode#</td>
								      <td valign="top"><strong>#getItems.ItemName#</strong><br>#getItems.ItemDesc#</td>
									  <td valign="top">#getItems.UnitofMeasure#</td>
									</tr>
									<cfif getAgency.recordcount GT 0>
									<tr>
									  <td bgcolor="##fdfdfd">&nbsp;</td>
									  <td colspan="3" bgcolor="##fdfdfd">
									    <table border="0" cellpadding="1" cellspacing="1" width="100%">
										   <tr bgcolor="##b9b9b9">
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
									    <td align="center" colspan="3"><strong style="color:##CC0000;">No Bids Received</strong></td>
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