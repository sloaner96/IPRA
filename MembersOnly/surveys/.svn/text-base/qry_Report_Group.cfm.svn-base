<cfquery name="getS" datasource="#ds#">
SELECT sName, sIntro FROM Surveys
WHERE SID=#SID#
AND siteConfigKey=#siteConfigurationKey#
</cfquery>
<cfquery name="getGroup" datasource="#ds#">
SELECT rgName FROM Respondent_Groups
WHERE rgID=#rgID#
</cfquery>

<cfset RespondentList="0">
<cfquery name="getRespondentList" datasource="#ds#">
SELECT srID FROM Survey_Responses
WHERE srRespID IN 
(SELECT rgrRespID FROM Respondent_GroupRoster WHERE rgrRgID=#rgID#)
AND srSID=#SID#
</cfquery>

<cfloop query="getRespondentList">
	<cfset RespondentList=ListAppend(Respondentlist,"#srID#")>
</cfloop>


<cfquery name="getQ" datasource="#ds#">
SELECT qID, qQuestion, qNum, qType, qCatID, qScID FROM Questions
WHERE qSID=#SID#
ORDER BY qNum ASC
</cfquery>
