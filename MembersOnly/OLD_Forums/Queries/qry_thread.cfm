<!--- 
INPUT: #thID# (thread ID) 
OUTPUT: all fields for Thread
--->
<cfquery name="thread" datasource="#ds#">
SELECT * FROM tblThreads
WHERE thID=#thID#
</cfquery>