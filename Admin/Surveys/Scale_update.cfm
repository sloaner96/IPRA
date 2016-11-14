<!-- update Scale Name --->
<cfquery datasource="#Application.dsn#" name="updateScale">
UPDATE Scales
SET scName = '#form.Name#'
WHERE scID=#scID#
</CFQUERY>

<!-- update Values --->
<CFLOOP ITEM="Field" COLLECTION="#Form#">
	<cfset x=#form[field]#>
	<cfif Field neq 'fieldnames' and Field neq 'name' and Field neq 'btnDelete'>
		<cfif form[field] neq "">
			<cfquery datasource="#Application.dsn#" name="update_value">
			UPDATE Scale_Values
			SET
			scpValue='#form[field]#'
			WHERE scpID=#Field#
			</cfquery>
		<cfelse>
			<cfquery datasource="#Application.dsn#" name="delete_value">
			DELETE FROM Scale_Values
			WHERE scpID=#Field#
			</cfquery>
		</cfif>
	</cfif>
</cfloop>


<html>
<head>
	<title>BSO_Surveys v.3.0</title>
	
	<LINK REL=stylesheet HREF="../style.css" TYPE="text/css">
<script language="JavaScript">
		function refresh_orig(){
			window.opener.location.href="Scales.cfm";
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
<br><br><br>
<strong>Scale Updated</strong>
<hr><br>
<div align="center">
	<br><br><br>
	Done.
	<br><br>
	<a href="##" onClick="refresh_orig();"><strong>Continue</strong></a></div>

</body>
</html>
