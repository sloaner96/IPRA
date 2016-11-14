<!--- 
INPUT: #tID# (topic ID) 
OUTPUT: most recent message #msgDateTime#, unaltered Date/Time format, FK #msgAuthorID#, number
--->
<cfquery name="topicRecentMessage" datasource="#ds#">
SELECT MAX(msgDateTime) as recentDate
FROM tblMessages,tblThreads
WHERE thTID=#TID#
AND thID=msgThID 
</cfquery>