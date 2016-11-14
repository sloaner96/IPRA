

<html>
<head>
	<title>BSO_Surveys v.3.0</title>
	
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
	<cfif not isDefined('scID')>
		<cfset scID="#form.Scale#">
	</cfif>
	
	<!--- first check that all questions claiming membership to this Category are of question type "Scale" (MUL3)--->
	
	<cfquery name="catCheck" datasource="#Application.dsn#">
	SELECT * FROM Questions, Surveys
	WHERE qCatID=#catID#
	AND qType <> 'MUL3'
	AND QSID=SID
	ORDER BY sName, qNum asc
	</cfquery>
	
	<cfif catCheck.recordcount eq 0>
	
		<cfif scID neq "">
			<cfquery name="catAssoc" datasource="#Application.dsn#">
			UPDATE Categories
			SET catScID=#scID#
			WHERE catID=#catID#
			</cfquery>
		
			<cfquery name="catAssocQ" datasource="#Application.dsn#">
			UPDATE Questions
			SET qScID=#scID#
			WHERE qCatID=#catID#
			</cfquery>
			
			<cfoutput>
				<div align="center"><br><br><br>
				<strong>Scale Associated</strong>
				<hr><br>
				
				<a href="##" onClick="refresh_orig();">Return to Survey</a></div>
				
			</cfoutput>
		<cfelse>
			<cfoutput>
				<div align="center"><br><br><br>
				<strong>Done</strong>
				<hr><br>
				
				<a href="##" onClick="refresh_orig();">Return to Survey</a></div>
				
			</cfoutput>
		
		</cfif>
	<cfelse>
		<br><br><br>
			<strong>Scale Association Error</strong>
			<hr><br>
			You cannot <a href="##" onclick="help('catScale_association');"><font class="helpfont">associate</font></a> a scale with this category.
			<br><br>
			The following Questions are not in the Scale format:
			<br><br>
			<cfoutput query="catCheck" group="SID">
			Survey: <strong>#sName#</strong>
			<br><br>
				<cfoutput>
				&nbsp;&nbsp;&nbsp;#qNum#: #qQuestion#<br>
				</cfoutput>
			</cfoutput>
			<br><br><br>
			<div align="center"><a href="##" onClick="refresh_orig();">Return to Survey</a></div>
	</cfif>
</body>
</html>
