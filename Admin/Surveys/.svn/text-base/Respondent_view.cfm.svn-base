<cfquery name="getResp" datasource="#Application.dsn#">
SELECT 
[#user_First#] as respFirst,
[#user_Last#] as respLast,
[#user_Email#] as respEmail,
[#user_userName#] as respUserName,
[#user_Password#] as respPassword,
[#user_ID#] as respID
FROM [#table_users#]
WHERE [#user_ID#]=#respID#
</cfquery>


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
<strong><a href="##" onclick="help('Respondent');"><font class="helpfont">Respondent</font></a> Info</strong>
<hr><br><br>
<cfoutput query="getResp">
<table cellpadding="5">
	<tr>
		<td>
		ResidentID: <strong>#respID#</strong><br>
		Name: <strong>#respFirst# #respLast#</strong><br>
		Email: <strong>#respEmail# </strong><br>
		Username: <strong>#respUserName#</strong><br>
		Password: <strong>#respPassword#</strong><br>
		</td>
	</tr>
</table>
</cfoutput>
<br><br>
<div align="center"><a href="##" onClick="window.close();"><strong>- Close Window -</strong></a></div>
</body>
</html>
