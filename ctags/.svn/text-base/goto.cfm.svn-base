<cfparam name="attributes.location" default="/index.cfm">
<cfparam name="attributes.querystring" default="">

<cfset urlstring = attributes.location>


<cfif attributes.querystring NEQ "">
  <cfset urlstring = urlstring & "?" & attributes.querystring> 
</cfif>

<cflocation url="#urlstring#" addtoken="No">