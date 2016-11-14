<!--- 
INPUT: #TID# (topic ID) 
OUTPUT: most recent #thDateTime#, unaltered Date/Time format
--->
<cfquery name="recentThread" datasource="#ds#">
SELECT MAX(thDateTime) FROM tblThreads
WHERE thTID=#TID#
ORDER BY thDateTime desc
</cfquery>