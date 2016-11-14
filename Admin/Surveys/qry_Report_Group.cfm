<cfquery name="getS" datasource="#Application.dsn#">
SELECT sName, sIntro FROM Surveys
WHERE SID=#SID#
</cfquery>
<cfquery name="getGroup" datasource="#Application.dsn#">
SELECT rgName FROM Respondent_Groups
WHERE rgID=#rgID#
</cfquery>

<cfset RespondentList="0">
<cfquery name="getRespondentList" datasource="#Application.dsn#">
SELECT srID FROM Survey_Responses
WHERE srRespID IN 
(SELECT rgrRespID FROM Respondent_GroupRoster WHERE rgrRgID=#rgID#)
AND srSID=#SID#
</cfquery>

<cfloop query="getRespondentList">
	<cfset RespondentList=ListAppend(Respondentlist,"#srID#")>
</cfloop>


<cfquery name="getQ" datasource="#Application.dsn#">
SELECT qID, qQuestion, qNum, qType, qCatID, qScID FROM Questions
WHERE qSID=#SID#
ORDER BY qNum ASC
</cfquery>
