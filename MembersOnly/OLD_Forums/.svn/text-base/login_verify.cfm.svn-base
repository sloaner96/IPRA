<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>BSO Forums Login Screen</title>
<LINK REL=stylesheet HREF="style.css" TYPE="text/css">
</head>

<body>
<cfquery name="verify" datasource="#dsUsers#">
SELECT #user_ID# as loginID FROM [#table_Users#]
WHERE #username#='#form.username#'
AND #user_password# like '#form.password#'
</cfquery>
<cfif verify.recordcount eq 0>
	<br><br><br><br>
	<div align="center">
	Sorry.
	<br><br>
	Your username and/or password could not be verified. Please <a href="JavaScript:history.back();">go back</a> and check your spelling.</div>
<cfelse>
	<cfoutput>#verify.recordcount#</cfoutput>
	<cfif logType eq 'session'>
		<cfset "session.#logVar#"="#verify.loginID#">
	<cfelse>
		<cfset "cookie.#logVar#"="#verify.loginID#">
	</cfif>
	<br><br><br><br>
	<div align="center">
	Logged In!
	<br><br>
	<a href="topics.cfm">Click here</a> if you are not redirected
	</div>
	<meta http-equiv="refresh" content="0;url=topics.cfm">
</cfif>

</body>
</html>
