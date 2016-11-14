<!--- 
INPUT: #thID# (thread ID) 
OUTPUT: most recent message #msgDateTime#, unaltered Date/Time format, FK #msgAuthorID#, number
--->
<cfquery name="recentMessage" datasource="#ds#">
SELECT MAX(msgDateTime) as recentDate FROM tblMessages
WHERE msgThID=#thID#
</cfquery>