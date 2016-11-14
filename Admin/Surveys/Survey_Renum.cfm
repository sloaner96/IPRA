<html>
<head>
	<title>Untitled</title>
<LINK REL=stylesheet HREF="../style.css" TYPE="text/css">
<script language="JavaScript">
		function help(keyword){
		var urlString='help.cfm?q=' + keyword;
			window.open(urlString,'HelpWindow','location=no,scrollbars=yes,menubars=no,toolbars=no,resizable=yes,width=400,height=400');
		}
</script>
</head>

<body onload="this.window.focus();">
<!--- variables to pass to this page: SID --->

<!--- NOTE: the term 'doomsday number' refers to the first number in a given category.
If the number of questions in category C is equal to N, and number X has not been used,
and if f(X, N), where f increments X N number of times, is also available, then X becomes
the doomsday number, and each ensuing question in that category receives the corresponding 
f(X) number. If X is not available it is incremented until X is available. If X is available
but f(X, N) is not, then X is incremented to the next available X, and f(X, N) is tested, and so
on until X and f(X, N) are all available. Then the uncategorized question are numbered with the
remaining available numbers ---> 


<!--- query for number of questions--->
<cfquery name="numQ" datasource="#Application.dsn#">
SELECT * from Questions
WHERE qSID=#SID#
ORDER BY qNum ASC
</cfquery>

<!--- loop thru numQ, and reset Question Number, maintain current order --->
<cfoutput query="numQ">
	<cfquery name="setQNum" datasource="#Application.dsn#">
	UPDATE Questions
	SET qNum=#numQ.currentRow#
	WHERE qID=#numQ.qID#
	AND qSID=#SID#
	</cfquery>
</cfoutput>

<!--- query categories --->
<cfquery name="NumCat" datasource="#Application.dsn#">
SELECT catID, catName from Categories
WHERE catSID=#SID#
</cfquery>

<!--- declare List "u" for list of Unavailable numbers --->
<cfset u="">

<!--- Loop thru numCat ---> 
<cfoutput query="NumCat">

	<cfquery name="getQs" datasource="#Application.dsn#">
	SELECT qNum, qID FROM Questions
	WHERE qCatID=#catID#
	ORDER BY qNum ASC
	</cfquery>
	
	<!--- loop thru Questions in this category --->
	<cfloop query="getQs">
		<!--- first Question in Category gets it's #, or next available # --->
		<cfif currentrow eq 1>
			<!--- loop while qualified doomsday not found --->
			<cfset X=#qNum#>
			<cfset doomsDayFound=0>
			<cfset QCount=#getQs.RecordCount#>
			<cfset qID=#qID#>
			<cfloop condition="doomsdayFound eq 0">	
				<cfif #ListFind(u, X)# eq 0>
					<!--- X is available --->
					<!--- are f(X, N) available? --->
					<cfset available="yes">
					<cfset fX=#X#>
					<cfset qID=#qID#>
					<cfloop from="1" to="#QCount#" index="count">
						<cfif #ListFind(u, fX)# neq 0>
							<cfset available="no">
						<cfelse>
						</cfif>
						<cfset fX=#fx#+1>
					</cfloop>
					
					<!--- if available eq "yes", then f(X, N) is good. If not, increment X and try again --->
					<cfif available eq "yes">
						<cfset doomsDayFound=1>
					<cfelse>
						<cfset X=#X#+1>
					</cfif>
				<cfelse>
					<cfset X=#X#+1>
				</cfif>
				
			</cfloop>
			
			<!--- X is qualified doomsday number. Set qNum to X, make X unavailable, and increment X--->
				<cfquery name="setQNum" datasource="#Application.dsn#">
				UPDATE Questions
				SET qNum=#X#
				WHERE qID=#qID#
				AND qSID=#SID#
				</cfquery>
				<cfset u=#ListAppend(u, X)#>
				<cfset X=#X#+1>
		<cfelse>
		<!--- Assign ensuing questions incremented values --->
			<cfquery name="setQNum" datasource="#Application.dsn#">
			UPDATE Questions
			SET qNum=#X#
			WHERE qID=#qID#
			AND qSID=#SID#
			</cfquery>
			<cfset u=#ListAppend(u, X)#>
			<cfset X=#X#+1>
		</cfif>		
	</cfloop>
</cfoutput>

<cfquery name="getSolos" datasource="#Application.dsn#">
SELECT qID, qNum
FROM Questions
WHERE qCatID IS NULL
ORDER BY qNum asc
</cfquery>

<cfoutput query="getSolos">
	<cfset X=#qNum#>
	<!--- assign each question the first available number --->
	
		<cfif #ListFind(u, X)# eq 0>
			<cfquery name="setQNum" datasource="#Application.dsn#">
			UPDATE Questions
			SET qNum=#X#
			WHERE qID=#qID#
			AND qSID=#SID#
			</cfquery>
			<cfset u=#ListAppend(u, X)#>
		<cfelse>
		
			<cfset findX=#X#>
			<!--- loop list until X is found --->
			<cfloop condition="#ListFind(u, findX)# neq 0">
				<cfset findX=#findX#+1>
			</cfloop>
			<!--- X located --->
			<cfset X=#findX#>
			
			<cfquery name="setQNum" datasource="#Application.dsn#">
			UPDATE Questions
			SET qNum=#X#
			WHERE qID=#qID#
			AND qSID=#SID#
			</cfquery>
			<cfset u=#ListAppend(u, X)#>
		</cfif>
</cfoutput>

<cfquery name="numQ2" datasource="#Application.dsn#">
SELECT qID from Questions
WHERE qSID=#SID#
ORDER BY qNum ASC
</cfquery>
<!--- reset Question Numbers starting @ 1, maintain current order --->
<cfoutput query="numQ2">
	<cfquery name="setQNum" datasource="#Application.dsn#">
	UPDATE Questions
	SET qNum=#currentRow#
	WHERE qID=#qID#
	AND qSID=#SID#
	</cfquery>
</cfoutput>

<cfoutput>
<br><br>

<meta http-equiv="refresh" content="0;url=survey.cfm?renum=done&SID=#SID#">
</cfoutput>
</body>
</html>
