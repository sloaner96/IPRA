<!--- 
INPUT: TID 
OUTPUT: all Topics fields
--->
<cfquery name="topic" datasource="#ds#">
SELECT * FROM tblTopics
WHERE TID=#TID#
</cfquery>