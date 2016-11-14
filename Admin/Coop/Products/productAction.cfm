<cfoutput>
	<cfswitch expression="#URL.Action#">
	  <!--- Add New products --->
	  <cfcase value="ADD">
	    <cfset Error = ArrayNew(1)>
	    
		<cfif Len(Trim(form.ItemCode)) EQ 0>
		  <cfset X = ArrayAppen(Error, "The Item you are adding does not have a valid ")>
		</cfif>
		<cfif Len(Trim(form.ItemCode)) EQ 0>
		  <cflocation url="AddProduct.cfm?e=1" addtoken="NO">
		</cfif>
		 
		 
	      <cfinvoke component="IPRA.CoopAdmin" method="AddProduct">
		     <cfinvokeargument name="ItemCode"  value="#trim(Form.ItemCode)#">
			 <cfinvokeargument name="ItemNumber"  value="#trim(Form.NextItemNumber)#">
			 <cfinvokeargument name="CatID"    value="#trim(Form.CatID)#">
			 <cfinvokeargument name="GroupID"  value="#trim(Form.GroupID)#">
			 <cfinvokeargument name="ItemName" value="#trim(Form.ItemName)#">
			 <cfinvokeargument name="ItemUOM"  value="#trim(Form.ItemUOM)#">
			 <cfinvokeargument name="ItemDesc" value="#trim(Form.ItemDesc)#">
		  </cfinvoke>
		  
		  <cflocation url="ProductMaint.cfm" addtoken="NO">
		  
	  </cfcase>
	  
	  <!--- Update products --->
	  <cfcase value="Update">
	      <cfinvoke component="IPRA.CoopAdmin" method="UpdateProduct">
		     <cfinvokeargument name="ItemID"  value="#trim(Form.ItemID)#">
			 <cfif IsDefined("form.IsActive")>
			 <cfinvokeargument name="IsActive"  value="#Form.IsActive#">
			 <cfelse>
			   <cfinvokeargument name="IsActive"  value="0">
			 </cfif> 
			 <cfinvokeargument name="ItemName" value="#trim(Form.ItemName)#">
			 <cfinvokeargument name="ItemUOM"  value="#trim(Form.ItemUOM)#">
			 <cfinvokeargument name="ItemDesc" value="#trim(Form.ItemDesc)#">
		  </cfinvoke>
		  
		  <cflocation url="ProductMaint.cfm" addtoken="NO">
	  </cfcase>
	  
	  <!--- Add WinningBid --->
	  <cfcase value="Winbid">
			<cfloop index="i" list="#form.ItemList#" delimiters=",">
		      <cfif Evaluate("Form.WINNINGBIDDER_#i#") NEQ "">
		         <cfset getVendor = request.coopAdminComponent.getVendorBidByItem(i, Evaluate("Form.WINNINGBIDDER_#i#"), Form.CoopID)>
	  
				   <cfinvoke component="IPRA.CoopAdmin" method="AddWinningBidder">
				      <cfinvokeargument name="ItemID" value="#i#">
				      <cfinvokeargument name="CoopID" value="#Form.CoopID#">
				      <cfinvokeargument name="WinningVendorID" value="#Evaluate("Form.WINNINGBIDDER_#i#")#">
				      <cfinvokeargument name="VendorProdName" value="#GetVendor.VendorProdName#">
				      <cfinvokeargument name="Cost" value="#GetVendor.VendorPrice#">
				      <cfinvokeargument name="ShippingTerms" value="#GetVendor.ShippingTerms#">
				  </cfinvoke>
		      </cfif>
		    </cfloop>
		   
		   <cflocation url="PeriodUpdate.cfm?T=b" addtoken="NO">
	  </cfcase>
	   
	  <!--- Add RejectBid --->
	  <cfcase value="RejectBid">
	    <cfset getItems = request.CoopComponent.getItems(form.CoopID, form.catid, form.groupid)> 
	    <cfif IsDefined("form.ItemToAct")>
			  <cfloop query="getitems">
			     <cfif ListFind(form.ItemToAct, getitems.ItemID, ",")>
				   <cfset isReject = 1>
				 <cfelse>
				   <cfset isReject = 0>  
				 </cfif>
			     
			     <cfinvoke component="IPRA.CoopAdmin" method="RejectProduct">
			         <cfinvokeargument name="ItemID"  value="#getitems.ItemID#">
				     <cfinvokeargument name="CoopID"  value="#form.CoopID#">
				     <cfinvokeargument name="Rejected" value="#isReject#">
					 <cfinvokeargument name="RejectComment" value="#Evaluate('form.ItemComment_#getitems.ItemID#')#">
			     </cfinvoke>  
            </cfloop>
		<cfelse>
		   <cfif getItems.recordcount gt 0>
		      <cfloop query="getItems">
			     <cfinvoke component="IPRA.CoopAdmin" method="RejectProduct">
			         <cfinvokeargument name="ItemID"  value="#getItems.ItemID#">
				     <cfinvokeargument name="CoopID"  value="#form.CoopID#">
				     <cfinvokeargument name="Rejected" value="0">
				     <cfinvokeargument name="RejectComment" value="">
			     </cfinvoke>  
			  </cfloop>
		   </cfif> 
	    </cfif>

	     
		  
		  <cflocation url="PeriodUpdate.cfm?T=r" addtoken="NO">
	  </cfcase>
	  
	  <!--- Add RejectBid --->
	  <cfcase value="VoteBid">
	     <cfset getItems = request.CoopComponent.getItems(form.CoopID, form.catid, form.groupid)> 
	    <cfif IsDefined("form.ItemToAct")>
			  <cfloop query="getitems">
			     <cfif ListFind(form.ItemToAct, getitems.ItemID, ",")>
				   <cfset isVote = 1>
				 <cfelse>
				   <cfset isVote = 0>  
				 </cfif>
			     
			     <cfinvoke component="IPRA.CoopAdmin" method="VoteProduct">
			         <cfinvokeargument name="ItemID"  value="#getitems.ItemID#">
				     <cfinvokeargument name="CoopID"  value="#form.CoopID#">
				     <cfinvokeargument name="Vote" value="#isVote#">
					 <cfinvokeargument name="VoteComment" value="#Evaluate('form.ItemComment_#getitems.ItemID#')#">
			     </cfinvoke>  
            </cfloop>
		<cfelse>
		   <cfif getItems.recordcount gt 0>
		      <cfloop query="getItems">
			     <cfinvoke component="IPRA.CoopAdmin" method="VoteProduct">
			         <cfinvokeargument name="ItemID"  value="#getItems.ItemID#">
				     <cfinvokeargument name="CoopID"  value="#form.CoopID#">
				     <cfinvokeargument name="Vote" value="0">
				     <cfinvokeargument name="VoteComment" value="">
			     </cfinvoke>  
			  </cfloop>
		   </cfif> 
	    </cfif> 
		  
		<cflocation url="PeriodUpdate.cfm?T=v" addtoken="NO"> 
	  </cfcase>
	  
	</cfswitch>
</cfoutput>