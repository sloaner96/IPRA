

<html>
<head>
	<title>BSO_Surveys v.3.0</title>
	
	<LINK REL=stylesheet HREF="../style.css" TYPE="text/css">

<cfoutput>
<cfif isdefined('q')>
	<script language="JavaScript">
		function refresh_orig(){
			window.opener.location.href="Question_whatText.cfm?type=MUL3&SID=#SID#&scID=#ID#";
			window.opener.focus();
			window.close();
		}
	</script>
<cfelseif isdefined('s')>
	<script language="JavaScript">
		function refresh_orig(){
			window.opener.location.href="scales.cfm";
			window.opener.focus();
			window.close();
		}
	</script>
<cfelse>
	<script language="JavaScript">
		function refresh_orig(){
			window.opener.location.href="Category_addScale.cfm?SID=#SID#&scID=#ID#<cfif isdefined('catID')>&catID=#CatID#</cfif>";
			window.opener.focus();
			window.close();
		}
	</script>
</cfif>
<script language="JavaScript">
		function help(keyword){
		var urlString='help.cfm?q=' + keyword;
			window.open(urlString,'HelpWindow','location=no,scrollbars=yes,menubars=no,toolbars=no,resizable=yes,width=400,height=400');
		}
</script>
</head>
<body onload="this.window.focus();">

	<CFLOOP ITEM="Field" COLLECTION="#Form#">
		<cfset x=#form[field]#>
		<cfif Field neq 'fieldnames'>
			<cfif form[field] neq "">
				<cfset value=#evaluate("form[field]")#>
				<cfquery datasource="#Application.dsn#" name="insert_resp">
				INSERT INTO Scale_Values
				(scpScID, scpValue)
				VALUES
				(#ID#, '#value#')
				</cfquery>
			</cfif>
		</cfif>
	</CFLOOP>

	<div align="center">
	<br><br><br>
	Done.
	<br><br>
	<a href="##" onClick="refresh_orig();"><strong>Continue</strong></a></div>

</cfoutput>
</body>
</html>
