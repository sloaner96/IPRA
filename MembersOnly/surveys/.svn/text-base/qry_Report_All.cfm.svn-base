<cfquery name="getS" datasource="#ds#">
SELECT sName, sIntro FROM Surveys
WHERE SID=#SID#
AND siteConfigKey=#siteConfigurationKey#
</cfquery>
<cfset getGroup.rgName="All Respondents">

<cfset RespondentList="0">
<cfquery name="getRespondentList" datasource="#ds#">
SELECT srID FROM Survey_Responses
WHERE srSID=#SID#
</cfquery>

<cfloop query="getRespondentList">
	<cfset RespondentList=ListAppend(Respondentlist,"#srID#")>
</cfloop>


<cfquery name="getQ" datasource="#ds#">
SELECT qID, qQuestion, qNum, qType, qCatID, qScID FROM Questions
WHERE qSID=#SID#
ORDER BY qNum ASC
</cfquery>