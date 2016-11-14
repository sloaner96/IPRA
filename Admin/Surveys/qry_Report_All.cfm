<cfquery name="getS" datasource="#Application.dsn#">
SELECT sName, sIntro FROM Surveys
WHERE SID=#SID#
</cfquery>
<cfset getGroup.rgName="All Respondents">

<cfset RespondentList="0">
<cfquery name="getRespondentList" datasource="#Application.dsn#">
SELECT srID FROM Survey_Responses
WHERE srSID=#SID#
</cfquery>

<cfloop query="getRespondentList">
	<cfset RespondentList=ListAppend(Respondentlist,"#srID#")>
</cfloop>


<cfquery name="getQ" datasource="#Application.dsn#">
SELECT qID, qQuestion, qNum, qType, qCatID, qScID FROM Questions
WHERE qSID=#SID#
ORDER BY qNum ASC
</cfquery>