<!---
INPUT: thID (Thread ID for this thread)
OUTPUT: thMC (Total message count in Thread)
		dRM (Date of most recent message, mm/dd/yy format)
		tRM (Time of most recent message, hh:mm:ss tt format)
--->

<cfinclude template="../Queries/qry_threadMessageCount.cfm">
	<cfset thMC="#threadMessageCount.recordcount#">

<cfinclude template="../Queries/qry_recentMessage.cfm">
	<cfset dRM="#Dateformat(RecentMessage.recentDate, 'mm/dd/yy')#">
	<cfset tRM="#LCase(Timeformat(RecentMessage.recentDate, 'hh:mm:ss tt'))#">