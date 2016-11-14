<cfif Not ISDefined("url.Type")>
   <cfset x = structDelete(Session, "ResSearch","False")>
<cfelse>
   <cfset x = structDelete(Session, "ResBuilder","False")>
</cfif>
<cflocation url="index.cfm" addtoken="NO">