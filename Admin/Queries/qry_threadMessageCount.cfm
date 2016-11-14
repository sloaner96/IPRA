<!--- 
INPUT: #thID# (thread ID) 
OUTPUT: #msgID# for all messages in Thread
--->
<cfquery name="threadMessageCount" datasource="#ds#">
SELECT msgID FROM tblMessages
WHERE msgThID=#thID#
</cfquery>