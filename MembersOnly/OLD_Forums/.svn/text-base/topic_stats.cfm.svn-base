<!---
INPUT: tID (Topic ID)
OUTPUT: tTC (Total thread count in Topic)
		tMC  (Total message count in Topic)
		dRM (Date of most recent message, mm/dd/yy format)
		tRM (Time of most recent message, hh:mm:ss tt format)
--->


<cfinclude template="queries/qry_topicThreadcount.cfm">
	<cfset tThC="#topicThreadcount.recordcount#">

<cfinclude template="queries/qry_topicMessageCount.cfm">
	<cfset tMC="#topicMessageCount.recordcount#">

<cfinclude template="queries/qry_topicRecentMessage.cfm">
	<cfset dRM="#Dateformat(topicRecentMessage.recentDate, 'mm/dd/yy')#">
	<cfset tRM="#LCase(Timeformat(topicRecentMessage.recentDate, 'hh:mm:ss tt'))#">