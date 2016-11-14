<cfif isDefined('sid')>
	<cfquery name="SecurityCheck" datasource="#Application.dsn#">
	SELECT siteConfigKey from Surveys
	WHERE sid=#sid#
	</cfquery>
	<cfif SecurityCheck.recordcount eq 0>
		<!--- <cflocation url="#survey_address#/admin"> --->
		<cfoutput>
		   <meta http-equiv="refresh" content="0;url=#survey_address#/admin">
		</cfoutput>
	</cfif>
<cfelseif isDefined('survey')>
	<cfquery name="SecurityCheck" datasource="#Application.dsn#">
	SELECT siteConfigKey from Surveys
	WHERE sid=#survey#
	</cfquery>
	<cfif SecurityCheck.recordcount eq 0>
		<!--- <cflocation url="#survey_address#/admin"> --->
		<cfoutput>
		   <meta http-equiv="refresh" content="0;url=#survey_address#/admin">
		</cfoutput>
	</cfif>
</cfif>