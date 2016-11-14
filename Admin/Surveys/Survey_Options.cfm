<cfquery name="getS" datasource="#Application.dsn#">
SELECT * FROM Surveys
WHERE sID=#SID#

</cfquery>


<html>
<head>
	<title>BSO_Surveys v.3.0</title>
	
	<LINK REL=stylesheet HREF="../style.css" TYPE="text/css">
<script language="JavaScript">
function goNonAnon() {
location.href="Survey_setNonAnon.cfm?sid=<cfoutput>#SID#</cfoutput>"
}
</script>
<script language="JavaScript">
function goAnon() {
location.href="Survey_setAnon.cfm?sid=<cfoutput>#SID#</cfoutput>"
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
<br><strong>Published Survey: Options</strong>
<cfoutput query="getS">
<hr><br>
<form name="form1" action="Survey_UpdateOptions.cfm?SID=#SID#" method="post">
<input type="checkbox" name="unpublish">&nbsp;<strong>Un-publish this survey</strong>
<br><br>
Make real-time results of this survey available to respondents?<br><br>
<input type="radio" name="Public" value="yes"<cfif sResults_Public eq 'yes'> checked</cfif>> Yes &nbsp;&nbsp;<input type="radio" name="Public" value="no"<cfif sResults_Public eq 'no'> checked</cfif>> No
<br><br>
Allow anonymous respondents to take this survey?<br><br>
<input type="radio" name="Anonymous" value="yes"<cfif sAnonymous eq 'yes'> checked</cfif><cfif sAnonymous eq 'no'> onClick="goAnon();"</cfif>> Yes &nbsp;&nbsp;<input type="radio" name="Anonymous" value="no"<cfif sAnonymous eq 'no'> checked</cfif><cfif sAnonymous eq 'yes'> onClick="goNonAnon();"</cfif>> No
<br><br>
<cfif sAnonymous eq 'no'>

	<CFquery datasource="#Application.dsn#" name="getRG">
	SELECT rgID, rgName from Respondent_Groups
	</CFQUERY>
	
	<CFquery datasource="#Application.dsn#" name="getRR">
	SELECT rrRgID, rrSID from Respondent_SurveyRoster
	WHERE rrSID=#SID#
	</CFQUERY>
	
	<cfset rrList="">
	<cfloop query="getRR">
		<cfset rrList=#ListAppend(rrList, rrRgID)#>
	</cfloop>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Choose the groups to which this survey is available:<br><br>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select name="group" multiple="yes" size="#getRG.recordcount#"> 
		<cfloop query="getRG">
		<option value="#rgID#"<cfif getRR.recordcount eq 0><cfif getRG.currentrow eq 1> selected</cfif></cfif><cfif ListFind(rrList, rgID) neq 0> selected</cfif>>#rgName#
		</cfloop>
	</select>
	<br><br>
</cfif>
<br><br>
<strong>Specify a Publishing date:</strong>
<br><br>
(Changing this date renders the survey unavailable to any respondents until that date arrives.)<br><br>
<input type="text" name="Date" value="#dateformat(sDate, 'mm/dd/yyyy')#">
<br><br>
<input type="submit" value="Make Changes >>">
</form>
</cfoutput>
<br>
<div align="center"><a href="##" onClick="window.close();"><strong>- Cancel-</strong></a></div>
</body>
</html>
