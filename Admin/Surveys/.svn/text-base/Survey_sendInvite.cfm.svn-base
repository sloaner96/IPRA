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
<cfquery datasource="#Application.dsn#" name="getResp">
SELECT DISTINCT [#user_ID#] as respID, [#user_Email#] as respEmail from [#table_users#], Respondent_GroupRoster
WHERE rgrRgID IN (#form.group#)
AND rgrRespID=[#user_ID#]
AND [#user_Email#] <> ''
</cfquery>
<cfloop query="getResp">
	<cfquery name="chkRpt" datasource="#Application.dsn#">
	SELECT srRespID FROM Survey_Responses
	WHERE srRespID=#getResp.respID#
	AND srSID=#SID#
	</cfquery>
	<cfif chkRpt.recordcount neq 0>
		<cfoutput><font class="redfont">#respEmail#</font><br></cfoutput>
	<cfelse>
		<cfoutput>#respEmail#<br></cfoutput>
		<cfmail to="#respEmail#"
				from="#survey_email#"
				subject="#form.subject#" server="#Application.MailServer#" username="#Application.MailUser#" password="#Application.MailPassword#">
		
		#form.message#
		
		Please click on the link below, or copy and paste it into the URL window of your browser
		
		#survey_address#/survey_vip.cfm?sid=#sid#&respID=#respID#
		
		</cfmail>
	</cfif>
</cfloop>
<br>
<div align="center"><a href="##" onClick="window.close();"><strong>- Close Window -</strong></a></div>
</body>
</html>
