<!--- Check Form --->

<cfif Len(trim(form.mbrID)) EQ "">
  <!--- <cflocation url="index.cfm" addtoken="NO"> --->
  <meta http-equiv="refresh" content="0;url=index.cfm">
</cfif>


<cfif url.action EQ "ADD">
<cfif Len(trim(form.NewIPRAID)) EQ "">
  <cfoutput><meta http-equiv="refresh" content="0;url=MembershipDetail.cfm?mbrID=#form.mbrID#&e=1"></cfoutput>
  <!--- <cflocation url="MembershipDetail.cfm?mbrID=#form.mbrID#&e=1" addtoken="NO"> --->
</cfif>

<cfif Not IsNumeric(form.newIPRAID)>
  <cfoutput><meta http-equiv="refresh" content="0;url=MembershipDetail.cfm?mbrID=#form.mbrID#&e=2"></cfoutput>
  <!--- <cflocation url="MembershipDetail.cfm?mbrID=#form.mbrID#&e=2" addtoken="NO"> --->
</cfif>

<cfquery name="CheckID" datasource="#Application.dsn#">
  Select Top 1 MemberID
  From Members
  where IPRAMemberID = #form.newIPRAID#
</cfquery>


<cfif Checkid.recordcount GT 0>
  <cfoutput><meta http-equiv="refresh" content="0;url=MembershipDetail.cfm?mbrID=#form.mbrID#&e=3"></cfoutput>
  <!--- <cflocation url="MembershipDetail.cfm?mbrID=#form.mbrID#&e=3" addtoken="NO"> --->
</cfif>


<cfquery name="UpdMbr" datasource="#Application.dsn#">
  Update Members
    Set IPRAMemberID = #form.newIPRAID#
  Where MemberID = #form.MbrID#	
</cfquery>
<cfelse>

	<cfquery name="UpdMbr" datasource="#Application.dsn#">
	  Update Members
	    Set LastSync = #CreateODBCDateTime(Now())#,
		    LastUpdated = #CreateODBCDateTime(Now())#
	  Where MemberID = #form.MbrID#	
	</cfquery>
</cfif>
  <cfoutput><meta http-equiv="refresh" content="0;url=MembershipDetail.cfm?mbrID=#form.mbrID#"></cfoutput> 
<!--- <cflocation url="MembershipDetail.cfm?mbrID=#form.mbrID#" addtoken="NO"> --->