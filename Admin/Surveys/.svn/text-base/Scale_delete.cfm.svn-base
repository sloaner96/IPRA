<cfinclude template="SecurityCheck.cfm">
<cfquery name="checkQ" datasource="#Application.dsn#">
SELECT qNum, qQuestion, sID, sName
FROM Questions, Surveys
WHERE qScID=#scID#
AND sID=qSID
</cfquery>


<html>
<head>
	<title>BSO_Surveys v.3.0</title>
	
	<LINK REL=stylesheet HREF="../style.css" TYPE="text/css">
<script language="JavaScript">
		function refresh_orig(){
			window.opener.location.href="scales.cfm";
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
<strong>Delete <a href="##" onclick="help('rating_scale');"><font class="helpfont">Rating Scale</font></a></strong>
<hr><br>

<cfif checkQ.recordcount eq 0>

	<cftransaction>
	<cfquery name="delete_scale" datasource="#Application.dsn#">
	DELETE FROM Scales
	WHERE scID=#scID#
	</cfquery>
	
	<cfquery name="delete_scale_values" datasource="#Application.dsn#">
	DELETE FROM Scale_Values
	WHERE scpScID=#scID#
	</cfquery>
	</cftransaction>

	<br><br><br>
<div align="center">
<strong>Scale Deleted</strong>
<br><br>

<a href="##" onClick="refresh_orig();"><strong>Close Window</strong></a>
</div>
	
<cfelse>
	<br>
	<div align="center"><font class="brightredfont"><strong>Sorry, you cannot delete this scale</strong></font> 
	<br><br>
	Following is a list of the question(s) using this scale:
	<br><br>
	<cfoutput query="checkQ" group="SID">
		<table>
			<tr>
				<td colspan="2"align="center">Survey: <strong>#sName#</strong><br><br></td>
			</tr>
			<cfoutput>
			<tr>
				<td><strong>#qNum#</strong></td>
				<td>#qQuestion#</td>
			</tr>
			</cfoutput>
		</table>
	</cfoutput>
	<br>
	<a href="##" onClick="refresh_orig();"><strong>Close Window</strong></a></div>
	
</cfif>


</body>
</html>
