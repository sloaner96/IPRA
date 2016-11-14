<cfquery name="getResp" datasource="#Application.dsn#">
SELECT [#user_First#] as respFirst, [#user_Last#] as respLast, [#user_ID#] as respID<cfif isDefined('user_sub1')>, [#user_sub1#] as sub1</cfif><cfif isDefined('user_sub2')>, [#user_sub2#] as sub2</cfif>
FROM [#table_Users#]
ORDER BY <cfif isDefined('user_sub1')>[#user_sub1#], </cfif>[#user_Last#], [#user_First#]<cfif isDefined('user_sub2')>, [#user_sub2#]</cfif> asc
</cfquery>

<cfquery name="getNonResp" datasource="#Application.dsn#">
SELECT DISTINCT [#user_ID#] as respID
FROM [#table_Users#], Respondent_GroupRoster
WHERE rgrRgID=#rgID#
AND [#user_ID#]=rgrRespID
</cfquery>
<cfset nonRespList="">
<cfoutput query="getNonResp">
	<cfset nonRespList=#ListAppend(nonRespList, respID)#>
</cfoutput>
<html>
<head>
	<title>BSO_Surveys v.3.0</title>
	
	<LINK REL=stylesheet HREF="../style.css" TYPE="text/css">
<script language="JavaScript">
		function help(keyword){
		var urlString='help.cfm?q=' + keyword;
			window.open(urlString,'HelpWindow','location=no,scrollbars=yes,menubars=no,toolbars=no,resizable=yes,width=400,height=400');
		}
</script>
</head>

<body onload="this.window.focus();">
<strong>Select <a href="##" onclick="help('Respondent');"><font class="helpfont">Respondent</font></a></strong>
<hr><br>
<cfoutput>
<form name="form1" action="respondent_insGroup.cfm?rgID=#rgID#" method="post">
Please select the <a href="##" onclick="help('respondent');"><font class="helpfont">respondent</font></a> you would like to move into this group:<br><br>
<select name="respondent" multiple="yes" size="30">
<cfset count=0>
<cfloop query="getResp">
<cfif ListContains(nonRespList,#respID#) eq 0>
<cfset count=#count#+1>
<option value="#respID#"<cfif count eq 1> selected</cfif>>#RespLast#, #respFirst#<cfif isDefined('user_sub1')>   - #sub1#</cfif><cfif isDefined('user_sub2')> - #sub2#</cfif>
</cfif>
</cfloop>
</select>
&nbsp;&nbsp;<input type="submit" value="Add to Group >>">
</form>
</cfoutput>
<br><br>
<div align="center"><a href="##" onClick="window.close();"><strong>- Cancel-</strong></a></div>
</body>
</html>
