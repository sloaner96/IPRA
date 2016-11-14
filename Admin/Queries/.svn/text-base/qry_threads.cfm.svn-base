<!--- 
INPUT: #tID# (topic ID) 
OUTPUT: all Threads in topic, sorted by Date/Time
--->
<cfquery name="threads" datasource="#ds#">
SELECT * FROM tblThreads
WHERE thTID=#TID#
ORDER BY thDateTime desc
</cfquery>