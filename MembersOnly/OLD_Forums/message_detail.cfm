<!---
INPUT: msgID (Message ID for message )
OUTPUT: title (name or title of message)
		message (body of message)
		author (full name of author)
		authorID (Unique ID of author)
		d (date message was posted)
		t (time message was posted)
--->

<!--- msgID already set --->
	<cfset title="#msgName#">
	<cfset message="#msgMessage#">
	<cfset d="#Dateformat(msgDateTime, 'mm/dd/yy')#">
	<cfset t="#LCase(Timeformat(msgDateTime, 'hh:mm:ss tt'))#">
<!--- set usrID for user query --->
<cfset usrID=#msgUsrID#>
<cfinclude template="queries/qry_user.cfm">
	<cfset author="#user.usrFirst# #user.usrLast#">
	<cfset authorID="#user.usrID#">
	<cfset authorEmail="#user.usrEmail#">
