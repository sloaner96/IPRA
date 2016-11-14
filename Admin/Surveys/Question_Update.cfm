

<html>
<head>
	<title>Untitled</title>
<LINK REL=stylesheet HREF="../style.css" TYPE="text/css">
<script language="JavaScript">
		function refresh_orig(){
			window.opener.location.href="Survey.cfm?SID=<cfoutput>#SID#</cfoutput>";
			window.opener.focus();
			window.close();
		}
</script>
<script language="JavaScript">
		function help(keyword){
		var urlString='help.cfm?q=' + keyword;
			window.open(urlString,'HelpWindow','location=no,scrollbars=yes,menubars=no,toolbars=no,resizable=yes,width=400,height=400');
		}
</script>
</head>

<body onload="this.window.focus();">
<!--- set qScID to requested Scale --->

<cfif isDefined('form.ChangeScale')>
	<cfset qScID="#form.whatScale#">
</cfif>

<!--- set qType to requested Question Type --->

<cfif isDefined('form.ChangeType')>
	<cfif qType eq "MUL1">
		<cfset qType="MUL2">
	<cfelseif qType eq "MUL2">
		<cfset qType="MUL1">
	<cfelseif qType eq "TF">
		<cfset qType="YN">
	<cfelseif qType eq "YN">
		<cfset qType="TF">
	</cfif>
</cfif>

<!--- update question - name, qType, qScale --->

<cfquery name="qUpdate" datasource="#Application.dsn#">
UPDATE Questions
SET
qQuestion='#form.Question#'
<cfif isDefined('form.ChangeType')>, qType='#qType#'</cfif>
<cfif isDefined('form.ChangeScale')>, qScID='#qScID#'</cfif>
WHERE qID=#qID#
</cfquery>

<!-- update responses --->

<CFLOOP ITEM="Field" COLLECTION="#Form#">
	<cfset x=#form[field]#>
	<cfif Field neq 'fieldnames' and Field neq 'Question' and Field neq 'ChangeType' and Field neq 'nothing' and Field neq 'Scale' and Field neq 'ChangeScale' and Field neq 'whatScale'>
		<cfif form[field] neq "">
			<cfset value=#evaluate("form[field]")#>
			<cfquery datasource="#Application.dsn#" name="insert_resp">
			UPDATE Possible_Responses
			SET
			prResponse='#value#'
			WHERE prID=#Field#
			</cfquery>
		</cfif>
	</cfif>
</CFLOOP>

<br><br><br>
<div align="center">
Changes Complete
<br><br>
<a href="##" onClick="refresh_orig();">Close Window</a>
</div>

</body>
</html>
