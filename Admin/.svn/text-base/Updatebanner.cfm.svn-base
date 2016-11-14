
<cfif url.action EQ "Add">
  <!--- Check For Errors --->
    <cfif form.adName EQ "">
	  <!--- <cflocation url="banners.cfm?e=1" addtoken="No"> --->
	  <meta http-equiv="refresh" content="0;url=banners.cfm?e=1">
	</cfif>

    <cfif form.adURL EQ "">
	  <!--- <cflocation url="banners.cfm?e=2" addtoken="No"> --->
	  <meta http-equiv="refresh" content="0;url=banners.cfm?e=2">
	</cfif>

    <cfif form.adImage EQ "">
	  <!--- <cflocation url="banners.cfm?e=3" addtoken="No"> --->
	  <meta http-equiv="refresh" content="0;url=banners.cfm?e=3">
	<cfelse>
	  <cfset fileString = "#Application.sitepath#/images/BannerAds">
      <cffile action="UPLOAD" filefield="form.AdImage" destination="#FileString#" NameConflict="MAKEUNIQUE"> 
	  <cfset NewFile = File.ServerFile>
				  
	</cfif>

    <cfif form.adStart EQ "">
	  <!--- <cflocation url="banners.cfm?e=4" addtoken="No"> --->
<meta http-equiv="refresh" content="0;url=banners.cfm?e=4">
	</cfif>

    <cfif form.adFinish EQ "">
	   <!--- <cflocation url="banners.cfm?e=5" addtoken="No"> --->
	   <meta http-equiv="refresh" content="0;url=banners.cfm?e=5">
	</cfif>
    
	<cfquery name="InsertBanner" datasource="#Application.dsn#">
	  Insert into BannerAds (AdName, AdURL, adImage, AdStart, AdFinish, HitCount, DateEntered)
	  Values ('#Form.AdName#', '#form.adURL#', '#NewFile#', #CreateODBCDate(form.adStart)#, #CreateODBCDate(form.adFinish)#, 0, #CreateODBCDate(Now())# )
	</cfquery>
	
	<!--- <cflocation url="banners.cfm" addtoken="No"> --->
	<meta http-equiv="refresh" content="0;url=banners.cfm">
<cfelseif url.action EQ "Edit">
   <cfif form.adName EQ "">
	  <!--- <cflocation url="banners.cfm?e=1" addtoken="No"> --->
	  <meta http-equiv="refresh" content="0;url=banners.cfm?e=1">
	</cfif>

    <cfif form.adURL EQ "">
	  <!--- <cflocation url="banners.cfm?e=2" addtoken="No"> --->
	  <meta http-equiv="refresh" content="0;url=banners.cfm?e=2">
	</cfif>

    <cfif form.adImage NEQ "">
	   <cfset fileString = "#Application.sitepath#/images/BannerAds">
       <cffile action="UPLOAD" filefield="form.AdImage" destination="#FileString#" NameConflict="MAKEUNIQUE"> 
	   <cfset NewFile = File.ServerFile>
	</cfif>

    <cfif form.adStart EQ "">
	<meta http-equiv="refresh" content="0;url=banners.cfm?e=4">
	  <!--- <cflocation url="banners.cfm?e=4" addtoken="No"> --->
	</cfif>

    <cfif form.adFinish EQ "">
	<meta http-equiv="refresh" content="0;url=banners.cfm?e=5">
	   <!--- <cflocation url="banners.cfm?e=5" addtoken="No"> --->
	</cfif>
	
	<cfquery name="UpdateBanner" datasource="#Application.dsn#">
	  Update BannerAds 
	   Set 
	     AdName =  '#Form.AdName#',
		 AdURL = '#form.adURL#',
		 <cfif IsDefined("NewFile")>adImage = '#NewFile#',</cfif>
		 AdStart = #CreateODBCDate(form.adStart)#,
		 AdFinish = #CreateODBCDate(form.adFinish)#,
		 LastUpdated = #CreateODBCDate(Now())#
	  Where BannerID = #form.BannerID#
	</cfquery>
	<meta http-equiv="refresh" content="0;url=banners.cfm">
    <!--- <cflocation url="banners.cfm" addtoken="No"> --->
<cfelseif url.action EQ "Remove">
   <cfif Not IsDefined("url.BannerID")>
      <meta http-equiv="refresh" content="0;url=banners.cfm?e=6">
      <!--- <cflocation url="banners.cfm?e=6" addtoken="No"> --->
   </cfif>
   <cfif url.BannerID EQ "">
      <meta http-equiv="refresh" content="0;url=banners.cfm?e=6">
      <!--- <cflocation url="banners.cfm?e=6" addtoken="No"> --->
   </cfif>
   
   <cfquery name="DeleteBanner" datasource="#Application.dsn#">
     Delete 
	 From BannerAds
	 Where BannerID = #url.BannerID#
   </cfquery>
    <meta http-equiv="refresh" content="0;url=banners.cfm">
   <!--- <cflocation url="banners.cfm" addtoken="No"> --->
   
</cfif>