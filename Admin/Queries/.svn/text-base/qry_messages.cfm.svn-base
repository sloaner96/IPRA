<!--- 
INPUT: #thID# (thread ID) 
OUTPUT: all Messages in Thread, sorted by Date/Time
--->

<cfquery name="Messages" datasource="#ds#">
SELECT * FROM tblMessages
WHERE msgThID=#thID#
ORDER BY msgDateTime desc
</cfquery>
