<!--- 
INPUT: #tID# (topic ID) 
OUTPUT: #msgID# for all messages in Topic
--->
<cfquery name="topicMessageCount" datasource="#ds#">
SELECT msgID FROM tblMessages
WHERE msgThID IN
	(SELECT thID from tblThreads
		WHERE thTID=#TID#)
</cfquery>