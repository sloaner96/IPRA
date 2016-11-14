
<cfif url.action EQ "Add">
  <cfif Len(Trim(form.CoopYear)) EQ 0>
    <cflocation url="AddCoopConfig.cfm?e=1" addtoken="No">
  </cfif>
  <cfif Len(Trim(form.enrollmentbegins)) EQ 0>
    <cflocation url="AddCoopConfig.cfm?e=2" addtoken="No">
  </cfif>
  <cfif Len(Trim(form.EnrollmentEnds)) EQ 0>
    <cflocation url="AddCoopConfig.cfm?e=3" addtoken="No">
  </cfif>
  <cfif Len(Trim(form.orderingtBegins)) EQ 0>
    <cflocation url="AddCoopConfig.cfm?e=4" addtoken="No">
  </cfif>
  <cfif Len(Trim(form.OrderingEnds)) EQ 0>
    <cflocation url="AddCoopConfig.cfm?e=5" addtoken="No">
  </cfif>
  <cfif Len(Trim(form.CycleEnds)) EQ 0>
    <cflocation url="AddCoopConfig.cfm?e=6" addtoken="No">
  </cfif>
  <cfif Len(Trim(form.agreementtext)) EQ 0>
    <cflocation url="AddCoopConfig.cfm?e=7" addtoken="No">
  </cfif>
  
  <cfinvoke component="ipra.coopAdmin" Method="AddCoopConfig">
     <cfinvokeargument name="CoopEnrollmentBegin" value="#form.enrollmentbegins#">
	 <cfinvokeargument name="CoopEnrollmentEnd" value="#form.EnrollmentEnds#">
	 <cfinvokeargument name="orderBegin" value="#form.orderingtBegins#">
	 <cfinvokeargument name="OrderEnd" value="#form.OrderingEnds#">
	 <cfinvokeargument name="CoopYear" value="#form.CoopYear#">
	 <cfinvokeargument name="CoopEndDate" value="#form.CycleEnds#">
	 <cfinvokeargument name="AgreementText" value="#form.agreementtext#">
	 <cfinvokeargument name="AddedBy" value="#Session.AdminInfo.UserID#">
  </cfinvoke>
  
  <cflocation url="CoopConfig.cfm" addtoken="No">
<cfelseif url.action EQ "Update">
    <cfif Len(Trim(form.CoopYear)) EQ 0>
    <cflocation url="EditCoopConfig.cfm?e=1" addtoken="No">
  </cfif>
  <cfif Len(Trim(form.enrollmentbegins)) EQ 0>
    <cflocation url="EditCoopConfig.cfm?e=2" addtoken="No">
  </cfif>
  <cfif Len(Trim(form.EnrollmentEnds)) EQ 0>
    <cflocation url="EditCoopConfig.cfm?e=3" addtoken="No">
  </cfif>
  <cfif Len(Trim(form.orderingtBegins)) EQ 0>
    <cflocation url="EditCoopConfig.cfm?e=4" addtoken="No">
  </cfif>
  <cfif Len(Trim(form.OrderingEnds)) EQ 0>
    <cflocation url="EditCoopConfig.cfm?e=5" addtoken="No">
  </cfif>
  <cfif Len(Trim(form.CycleEnds)) EQ 0>
    <cflocation url="EditCoopConfig.cfm?e=6" addtoken="No">
  </cfif>
  <cfif Len(Trim(form.agreementtext)) EQ 0>
    <cflocation url="EditCoopConfig.cfm?e=7" addtoken="No">
  </cfif>
  
  <cfinvoke component="ipra.coopAdmin" Method="UpdateCoopConfig">
     <cfinvokeargument name="CoopEnrollmentBegin" value="#form.enrollmentbegins#">
	 <cfinvokeargument name="CoopEnrollmentEnd" value="#form.EnrollmentEnds#">
	 <cfinvokeargument name="orderBegin" value="#form.orderingtBegins#">
	 <cfinvokeargument name="OrderEnd" value="#form.OrderingEnds#">
	 <cfinvokeargument name="CoopYear" value="#form.CoopYear#">
	 <cfinvokeargument name="CoopEndDate" value="#form.CycleEnds#">
	 <cfinvokeargument name="AgreementText" value="#form.agreementtext#">
	 <cfinvokeargument name="UpdateBy" value="#Session.AdminInfo.UserID#">
	 <cfinvokeargument name="ConfigID" value="#Form.ConfigID#">
	 
  </cfinvoke>
  
  <cflocation url="CoopConfig.cfm" addtoken="No">
  
<cfelseif url.action EQ "Remove">
   <cfset getConfig = request.CoopAdminComponent.getCoopConfigByID(url.CID)>
   
   <cfif EnrollmentDate GT NOW()>
     <cfset DeleteConfig = request.CoopAdminComponent.DeleteCoopConfig(url.CID)>
   </cfif>
</cfif>