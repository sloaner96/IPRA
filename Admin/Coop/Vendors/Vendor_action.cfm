<cfswitch expression="#URL.Action#">
	<cfcase value="ADD">
	    <!--- Validate Form --->
		<!--- Error Checking --->
			<cfif Len(Trim(form.VendorName)) EQ 0>
			  <cflocation url="AddVendor.cfm?e=1" addtoken="NO">
			</cfif>
			
			<cfif Len(Trim(form.VendorFirstname)) EQ 0 or Len(Trim(form.Vendorlastname)) EQ 0>
			  <cflocation url="AddVendor.cfm?e=2" addtoken="NO">
			</cfif>
			
			<cfif Len(Trim(form.Email)) EQ 0>
			  <cflocation url="AddVendor.cfm?e=3" addtoken="NO">
			</cfif>
			
			<cfif Len(Trim(form.addr)) EQ 0>
			  <cflocation url="AddVendor.cfm?e=4" addtoken="NO">
			</cfif>
			
			<cfif Len(Trim(form.city)) EQ 0>
			  <cflocation url="AddVendor.cfm?e=5" addtoken="NO">
			</cfif>
			
			<cfif Len(Trim(form.state)) EQ 0>
			  <cflocation url="AddVendor.cfm?e=6" addtoken="NO">
			</cfif>
			
			<cfif Len(Trim(form.zipcode)) EQ 0>
			  <cflocation url="AddVendor.cfm?e=7" addtoken="NO">
			</cfif>
			
			<cfif Len(Trim(form.Phone)) EQ 0>
			  <cflocation url="AddVendor.cfm?e=8" addtoken="NO">
			</cfif>
			
			<cfif Len(Trim(form.ProductInterest)) EQ 0>
			  <cflocation url="AddVendor.cfm?e=9" addtoken="NO">
			</cfif>
			
			<cfset CheckVendorExists = request.CoopComponent.GetVendorID(form.VendorName, form.Email)>
			
			<cfif CheckVendorExists GT 0>
			 <cflocation url="AddVendor.cfm?e=10" addtoken="NO">
			</cfif>
			
		<!--- (If Defined) Get payment Information 
		<cfif Len(Trim(form.PaymentDate)) GT 0>
		  <cfif NOT IsDate(form.PaymentDate)>
		     <cflocation url="AddVendor.cfm?e=11" addtoken="NO">
		  </cfif>
		  <cfif Len(Trim(form.PaidVia)) EQ 0>
		     <cflocation url="AddVendor.cfm?e=11" addtoken="NO">
		  </cfif>
		  <cfset getPayAmount = request.PaymentComponent.GetPayType(form.PaidAmount)>
		</cfif>--->
		
		<!--- Invoke the Add New Vendor Component--->
			<cfinvoke component="ipra.coop" method="InsertVendor" returnvariable="InsertedVendor">
				<cfinvokeargument name="SendVendorEmail" value="0">
				
				<cfinvokeargument name="VendorName" value="#form.VendorName#">
				
				<cfif Len(Trim(form.VendorPrefix)) GT 0> 
					<cfinvokeargument name="VendorPrefix" value="#form.VendorPrefix#">
				</cfif>
				
				<cfif Len(Trim(form.VendorMI)) GT 0>
					<cfinvokeargument name="VendorMI" value="#form.VendorMI#">
				</cfif>
				
				<cfinvokeargument name="Vendorfirstname" value="#form.VendorFirstname#">
				<cfinvokeargument name="Vendorlastname" value="#form.VendorLastName#">
				
				<cfif Len(Trim(form.VendorTitle)) GT 0>
					<cfinvokeargument name="VendorTitle" value="#form.VendorTitle#">
				</cfif>
				
					<cfinvokeargument name="Address" value="#form.addr#">
				
				<cfif len(trim(form.addr2)) GT 0>
					<cfinvokeargument name="Address2" value="#form.addr2#">
				</cfif>
				
					<cfinvokeargument name="City" value="#form.City#">
					<cfinvokeargument name="State" value="#form.State#"> 
					<cfinvokeargument name="Zip" value="#form.ZipCode#">
					<cfinvokeargument name="Phone" value="#form.Phone#"> 
				
				<cfif Len(Trim(form.PhoneExt)) GT 0>
					<cfinvokeargument name="PhoneExt" value="#form.PhoneExt#"> 
				</cfif>
				
				<cfif len(trim(form.Fax)) GT 0>
					<cfinvokeargument name="Fax" value="#form.Fax#">
				</cfif>
				
				<cfinvokeargument name="Email" value="#form.Email#">
				
				<cfif len(trim(form.website)) GT 0>
					<cfinvokeargument name="Website" value="#form.website#">
				</cfif>
				
				<cfinvokeargument name="ProductInterest" value="#form.ProductInterest#">
				
				<cfif Len(trim(form.VendorNotes)) GT 0>
				   <cfinvokeargument name="VendorNotes" value="#Trim(form.VendorNotes)#">
				</cfif>
				
				<cfif Len(trim(form.VendorNotes)) GT 0>
				   <cfinvokeargument name="SpecSent" value="#Trim(form.SpecSent)#">
				</cfif>
	
                <cfinvokeargument name="IsActive" value="0">
				
				<cfif IsDefined("form.BondRcvd")>
				   <cfinvokeargument name="BondRcvd" value="1">
				<cfelse>
				   <cfinvokeargument name="BondRcvd" value="0">   
				</cfif>
				
				<cfif IsDefined("form.ContractRcvd")>
				   <cfinvokeargument name="ContractRcvd" value="1">
				<cfelse>
				   <cfinvokeargument name="ContractRcvd" value="0">   
				</cfif>
			</cfinvoke>
		<!--- IF the Payment Info is Defined, Invoke the get vendorID Compinenet and add payment Component
		
		<cfif Len(Trim(form.PaymentDate)) GT 0>
		  <cfset ThisVendorID = 
		  <cfset AddPayment = request.CoopAdminComponent.AddvendorPayment(ThisvendorID, CreateODBCDate(Trim(PaymentDate)), )>
		</cfif>--->
		<!---  Kick the user back to the vendor Maint Screen --->
		<cflocation url="Vendormaint.cfm" addtoken="NO">
	</cfcase>
	
	<cfcase value="UPDATE">
	  <!--- Validate Form --->
		<!--- Error Checking --->
			<cfif Len(Trim(form.VendorName)) EQ 0>
			  <cflocation url="EditVendor.cfm?VendorID=#form.vendorID#&e=1" addtoken="NO">
			</cfif>
			
			<cfif Len(Trim(form.VendorFirstname)) EQ 0 or Len(Trim(form.Vendorlastname)) EQ 0>
			  <cflocation url="EditVendor.cfm?VendorID=#form.vendorID#&e=2" addtoken="NO">
			</cfif>
			
			<cfif Len(Trim(form.Email)) EQ 0>
			  <cflocation url="EditVendor.cfm?VendorID=#form.vendorID#&e=3" addtoken="NO">
			</cfif>
			
			<cfif Len(Trim(form.addr)) EQ 0>
			  <cflocation url="EditVendor.cfm?VendorID=#form.vendorID#&e=4" addtoken="NO">
			</cfif>
			
			<cfif Len(Trim(form.city)) EQ 0>
			  <cflocation url="EditVendor.cfm?VendorID=#form.vendorID#&e=5" addtoken="NO">
			</cfif>
			
			<cfif Len(Trim(form.state)) EQ 0>
			  <cflocation url="EditVendor.cfm?VendorID=#form.vendorID#&e=6" addtoken="NO">
			</cfif>
			
			<cfif Len(Trim(form.zipcode)) EQ 0>
			  <cflocation url="EditVendor.cfm?VendorID=#form.vendorID#&e=7" addtoken="NO">
			</cfif>
			
			<cfif Len(Trim(form.Phone)) EQ 0>
			  <cflocation url="EditVendor.cfm?VendorID=#form.vendorID#&e=8" addtoken="NO">
			</cfif>
			
			<cfif Len(Trim(form.ProductInterest)) EQ 0>
			  <cflocation url="EditVendor.cfm?VendorID=#form.vendorID#&e=9" addtoken="NO">
			</cfif>
			
	        
			<cfinvoke component="ipra.coopAdmin" method="UpdateVendor" returnvariable="InsertedVendor">
				<cfinvokeargument name="VendorID" value="#Form.VendorID#">
				
				<cfinvokeargument name="VendorName" value="#form.VendorName#">
				
				<cfif Len(Trim(form.VendorPrefix)) GT 0> 
					<cfinvokeargument name="VendorPrefix" value="#form.VendorPrefix#">
				</cfif>
				
				<cfif Len(Trim(form.VendorMI)) GT 0>
					<cfinvokeargument name="VendorMI" value="#form.VendorMI#">
				</cfif>
				
				<cfinvokeargument name="Vendorfirstname" value="#form.VendorFirstname#">
				<cfinvokeargument name="Vendorlastname" value="#form.VendorLastName#">
				
				<cfif Len(Trim(form.VendorTitle)) GT 0>
					<cfinvokeargument name="VendorTitle" value="#form.VendorTitle#">
				</cfif>
				
					<cfinvokeargument name="Address" value="#form.addr#">
				
				<cfif len(trim(form.addr2)) GT 0>
					<cfinvokeargument name="Address2" value="#form.addr2#">
				</cfif>
				
					<cfinvokeargument name="City" value="#form.City#">
					<cfinvokeargument name="State" value="#form.State#"> 
					<cfinvokeargument name="Zip" value="#form.ZipCode#">
					<cfinvokeargument name="Phone" value="#form.Phone#"> 
				
				<cfif Len(Trim(form.PhoneExt)) GT 0>
					<cfinvokeargument name="PhoneExt" value="#form.PhoneExt#"> 
				</cfif>
				
				<cfif len(trim(form.Fax)) GT 0>
					<cfinvokeargument name="Fax" value="#form.Fax#">
				</cfif>
				
				<cfinvokeargument name="Email" value="#form.Email#">
				
				<cfif len(trim(form.website)) GT 0>
					<cfinvokeargument name="Website" value="#form.website#">
				</cfif>
				
				<cfinvokeargument name="ProductInterest" value="#form.ProductInterest#">
				
				<cfif Len(trim(form.VendorNotes)) GT 0>
				   <cfinvokeargument name="VendorNotes" value="#Trim(form.VendorNotes)#">
				</cfif>
				
				<cfif Len(trim(form.SpecSent)) GT 0>
				   <cfinvokeargument name="SpecSent" value="#Trim(form.SpecSent)#">
				</cfif>
	            
				<cfif IsDefined("form.ActiveVendor")>
                   <cfinvokeargument name="IsActive" value="1">
				<cfelse>
				   <cfinvokeargument name="IsActive" value="0">
				</cfif>
				
				<cfif IsDefined("form.BondRcvd")>
				   <cfinvokeargument name="BondRcvd" value="1">
				<cfelse>
				   <cfinvokeargument name="BondRcvd" value="0">   
				</cfif>
				
				<cfif IsDefined("form.ContractRcvd")>
				   <cfinvokeargument name="ContractRcvd" value="1">
				<cfelse>
				   <cfinvokeargument name="ContractRcvd" value="0">   
				</cfif>
			</cfinvoke>
			
			<!---  Kick the user back to the vendor Maint Screen --->
		<cflocation url="VendorDetail.cfm?VendorID=#Form.vendorID#" addtoken="NO">
	</cfcase>
	<cfcase value="REMOVE">
	    <cfset removeVendor = request.CoopAdminComponent.RemoveVendor(form.vendorID)>
		
		<cflocation url="vendorMaint.cfm?VenLet=#trim(form.firstletter)#" addtoken="no">
	</cfcase>
</cfswitch>
