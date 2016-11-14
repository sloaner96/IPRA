<cfif url.action EQ "Add">
     <cfif form.ChargeTitle EQ "">
	   <!--- <cflocation url="EventCharges.cfm?EventID=#url.eventID#&E=1" addtoken="No"> --->
	   <cfoutput><meta http-equiv="refresh" content="0;url=EventCharges.cfm?EventID=#url.eventID#&E=1"></cfoutput>
	 </cfif>
	 <cfif form.Charge EQ "">
	   <!--- <cflocation url="EventCharges.cfm?EventID=#url.eventID#&E=2" addtoken="No"> --->
	   <cfoutput><meta http-equiv="refresh" content="0;url=EventCharges.cfm?EventID=#url.eventID#&E=2"></cfoutput>
	 </cfif>
	 <cfif Not ISNumeric(form.Charge)>
	   <!--- <cflocation url="EventCharges.cfm?EventID=#url.eventID#&E=3" addtoken="No"> --->
	   <cfoutput><meta http-equiv="refresh" content="0;url=EventCharges.cfm?EventID=#url.eventID#&E=3"></cfoutput>
	 </cfif>
	 
	  <cfquery name="Insert" datasource="#Application.dsn#">
	     Insert into EventDetail(
		        EventID, 
				DetailLabel, 
				Description, 
				DetailCost,
				IsPrimary,
				DateAdded
			    )
		 Values(
		         #url.EventID#, 
				'#Form.ChargeTitle#', 
				<cfif form.ChargeDesc NEQ "">'#Form.ChargeDesc#'<cfelse>NULL</cfif>, 
				 #Form.Charge#,
				 <cfif IsDefined("form.IsPrimary")>1<cfelse>0</cfif>,
				 #CreateODBCDateTime(now())#
				)
	  </cfquery>    
	  <cfquery name="GetDetailCount" datasource="#Application.dsn#">
       Update Events
	   Set Approved = 1
	   Where EventID = #url.EventID#
	   </cfquery> 
	   <cfoutput><meta http-equiv="refresh" content="0;url=EventCharges.cfm?EventID=#url.eventID#"></cfoutput>
      <!--- <cflocation url="EventCharges.cfm?EventID=#url.EventID#" addtoken="No"> --->
<cfelseif url.action EQ "Update">
         <cfif form.ChargeTitle EQ "">
		    <cfoutput><meta http-equiv="refresh" content="0;url=EventCharges.cfm?EventID=#url.eventID#&E=1"></cfoutput>
		    <!--- <cflocation url="EventCharges.cfm?EventID=#url.eventID#&DetailID=#url.DetailID#&E=1" addtoken="No"> --->
		 </cfif>
		 <cfif form.Charge EQ "">
		    <cfoutput><meta http-equiv="refresh" content="0;url=EventCharges.cfm?EventID=#url.eventID#&E=2"></cfoutput> 
		    <!--- <cflocation url="EventCharges.cfm?EventID=#url.eventID#&DetailID=#url.DetailID#&E=2" addtoken="No"> --->
		 </cfif>
		 <cfif Not ISNumeric(form.Charge)>
		    <cfoutput><meta http-equiv="refresh" content="0;url=EventCharges.cfm?EventID=#url.eventID#&E=3"></cfoutput>
		    <!--- <cflocation url="EventCharges.cfm?EventID=#url.eventID#&DetailID=#url.DetailID#&E=3" addtoken="No"> --->
		 </cfif>
      <cfquery name="Insert" datasource="#Application.dsn#">
	     Update EventDetail 
		   Set DetailLabel = '#Form.ChargeTitle#',
			   Description = <cfif form.ChargeDesc NEQ "">'#Form.ChargeDesc#'<cfelse>NULL</cfif>,
			   DetailCost = #Form.Charge#,
			   IsPrimary = <cfif IsDefined("form.IsPrimary")>1<cfelse>0</cfif>
		 Where EventDetailID = #Form.DetailID#
	  </cfquery> 
	  <cfoutput><meta http-equiv="refresh" content="0;url=EventCharges.cfm?EventID=#url.eventID#"></cfoutput>
	  <!--- <cflocation url="EventCharges.cfm?EventID=#url.EventID#" addtoken="No"> --->
<cfelseif url.action EQ "Remove">
	  <cfquery name="Remove" datasource="#Application.dsn#">
	     Delete From EventDetail
		 Where EventDetailID = #url.DetailID#
		 AND EventID = #url.EventID#
	  </cfquery>
	  
	  <cfquery name="GetDetailCount" datasource="#Application.dsn#">
	     Select Count(*) as ChargeCount
		 From EventDetail
		 Where EventID = #url.EventID#
	  </cfquery>
	  
	  <cfif GetDetailCount.ChargeCount EQ 0>
	     <cfquery name="GetDetailCount" datasource="#Application.dsn#">
	       Update Events
		   Set Approved = 0
		   Where EventID = #url.EventID#
	     </cfquery>
	  </cfif>
	  <cfoutput><meta http-equiv="refresh" content="0;url=EventCharges.cfm?EventID=#url.eventID#"></cfoutput>
	  <!--- <cflocation url="EventCharges.cfm?EventID=#url.EventID#" addtoken="No"> --->
</cfif>