<!--- Get The Link --->
	<cfquery name="getLinks" datasource="#application.DSN#">
		SELECT *
		FROM BannerAds B
		WHERE B.BannerID = <cfqueryparam value="#url.Link#" 
						        cfsqltype="CF_SQL_INTEGER" 
						        null="NO">
	
	</cfquery>
	
<!--- Add to hitcount and Update the DB --->
    <cfif GetLinks.Hitcount IS "">
	 <cfset CurrentHitCount = 0>
	<cfelse>
	  <cfset CurrentHitCount = GetLinks.Hitcount>
	</cfif>
	
	<cfset LinkHitCount = CurrentHitCount + 1>
	
	<cfquery name="UpdateHitCount" datasource="#application.DSN#">
	  Update BannerAds
	  Set HitCount = #LinkHitCount#
	   Where bannerID = <cfqueryparam value="#GetLinks.BannerID#" 
						  cfsqltype="CF_SQL_INTEGER" 
						  null="NO">
	</cfquery>
	
<!--- Push to the site 
	  <cflocation url="#getLinks.AdURL#" addtoken="NO">--->
<cfoutput>
<meta http-equiv="refresh" content="0;url=#getLinks.AdURL#">
</cfoutput>