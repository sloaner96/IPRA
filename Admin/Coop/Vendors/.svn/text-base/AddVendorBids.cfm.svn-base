<cfmodule template="#Application.header#" section="0" sectiontitle="Coop Vendor Maintenance">
  <cfoutput>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="160"><br>
		    <cfmodule template="#Application.tagdir#/adminnav.cfm" level="5">
		   </td>
		   <td valign="top"><br>
		     <cfswitch expression="#URL.Action#">
			   <cfcase value="ADD">
			      <cfset Error = ArrayNew(1)>
				  <!--- Validate Form --->
				   <cfif form.vendorID EQ "">
				     <cfset x = ArrayAppend(Error, "There was no vendor for this bid.")>
				   </cfif>
				   
				   <cfif form.ItemID EQ "">
				     <cfset x = ArrayAppend(Error, "There was no vendor for this bid.")>
				   </cfif>
				   
				   <cfif Len(trim(form.VendorProduct)) EQ 0>
				     <cfset x = ArrayAppend(Error, "You did not enter a vendor product name for this bid.")>
				   </cfif>
				   
				   <cfif Len(trim(form.ShippingTerms)) EQ 0>
				     <cfset x = ArrayAppend(Error, "You did not enter shipping terms for this bid.")>
				   </cfif>
				   
				   <cfif Len(trim(form.BidPrice)) EQ 0>
				     <cfset x = ArrayAppend(Error, "You did not enter a Price for this bid.")>
				   </cfif>
				   
				  <!--- Check that this is not a duplicate --->
				    <cfset ISDup = request.CoopAdminComponent.CheckBidExists(form.ItemID, Form.CoopID, Form.VendorID)>
					
					<cfif ISDup>
					  <cfset x = ArrayAppend(Error, "A bid already exists for this product from this vendor.")>
					</cfif>
					
				  <!--- Check that The Item doesn't already have a Winning Bid --->
				  <cfset IsBidWon = request.CoopAdminComponent.CheckBidWon(form.ItemID, Form.CoopID)>
				  
				   <cfif IsBidWon>
					  <cfset x = ArrayAppend(Error, "This product already has a winning bid.")>
					</cfif>
				  
				  <!--- If The Form Looks Good Add the Bid, otherwise throw an error --->
				  <cfif ArrayLen(Error) EQ 0>
				     <cfinvoke component="IPRA.COOPADMIN" method="AddNewBid">
					   <cfinvokeargument name="VendorID" value="#form.vendorID#">
					   <cfinvokeargument name="ItemID" value="#form.ItemID#">
					   <cfinvokeargument name="CoopID" value="#form.CoopID#">
					   <cfinvokeargument name="VendorProdName" value="#form.VendorProduct#">
					   <cfinvokeargument name="VendorPrice" value="#ReplaceNoCase(form.BidPrice, '$', '', 'ALL')#">
					   <cfinvokeargument name="ShippingTerms" value="#form.ShippingTerms#">
					   <cfif Len(trim(form.Bidcomments)) GT 0>
					   <cfinvokeargument name="BIDCOMMENT" value="#trim(form.BidComments)#">
					   </cfif>
					   
					 </cfinvoke>
					 
					 <cflocation url="VendorBids.cfm?VendorID=#Form.VendorID#" addtoken="NO">
				  <cfelse>
				    <br>
					<cfloop index="e" from="1" to="#ArrayLen(Error)#">
					 <strong class="ErrorText">#Error[e]#</strong><BR>
					</cfloop>
					<BR><a href="##" onclick="javascript:history.back();">Click here</a> to correct this<br>
				  </cfif>
			   </cfcase>
			   <!--- Update the Bid --->
			   <cfcase value="UPDATE">
			      <cfset Error = ArrayNew(1)>
				  <!--- Validate Form --->
				   <cfif Len(trim(form.VenItemID)) EQ 0>
				     <cfset x = ArrayAppend(Error, "There is not a BidID for this bid.")>
				   </cfif>
				   
				   <cfif Len(trim(form.VendorProduct)) EQ 0>
				     <cfset x = ArrayAppend(Error, "You did not enter a vendor product name for this bid.")>
				   </cfif>
				   
				   <cfif Len(trim(form.ShippingTerms)) EQ 0>
				     <cfset x = ArrayAppend(Error, "You did not enter shipping terms for this bid.")>
				   </cfif>
				   
				   <cfif Len(trim(form.BidPrice)) EQ 0>
				     <cfset x = ArrayAppend(Error, "You did not enter a Price for this bid.")>
				   </cfif>
				   
				   <!--- Check that The Item doesn't already have a Winning Bid --->
				    <cfset IsBidWon = request.CoopAdminComponent.CheckBidWon(form.ItemID, Form.CoopID)>
				  
				   <cfif IsBidWon>
					  <cfset x = ArrayAppend(Error, "This product already has a winning bid, you may not change the terms.")>
					</cfif>
				  
				  <!--- If The Form Looks Good Add the Bid, otherwise throw an error --->
				  <cfif ArrayLen(Error) EQ 0>
				     <cfinvoke component="IPRA.COOPADMIN" method="UpdateBid">
					   <cfinvokeargument name="VenItemID" value="#form.VenItemID#">
					   <cfinvokeargument name="VendorProdName" value="#form.VendorProduct#">
					   <cfinvokeargument name="VendorPrice" value="#ReplaceNoCase(trim(form.BidPrice), '$', '', 'ALL')#">
					   <cfinvokeargument name="ShippingTerms" value="#form.ShippingTerms#">
					   <cfif Len(trim(form.Bidcomments)) GT 0>
					   <cfinvokeargument name="BidComment" value="#trim(form.BidComments)#">
					   </cfif>
					 </cfinvoke>
					 
					 <cflocation url="VendorBids.cfm?VendorID=#Form.VendorID#" addtoken="NO">
				  <cfelse>
				    <br>
					<cfloop index="e" from="1" to="#ArrayLen(Error)#">
					 <strong class="ErrorText">#Error[e]#</strong><BR>
					</cfloop>
					<BR><a href="##" onclick="javascript:history.back();">Click here</a> to correct this<br>
				  </cfif>
			   </cfcase>
			   <!--- Delete Bid ---> 
			   <cfcase value="DELETE">
				 <cfset DelBid = request.CoopAdminComponent.DeleteBid(url.VenItemID)>
				 <cflocation url="VendorBids.cfm?VendorID=#URL.VendorID#" addtoken="NO">
			   </cfcase>
			 </cfswitch>
		   		 	<br><br>
		   </td>
     </tr>
</table>  
</cfoutput>
<cfmodule template="#Application.footer#">	  