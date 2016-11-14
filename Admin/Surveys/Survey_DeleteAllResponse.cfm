<cfinclude template="SecurityCheck.cfm">
<cftransaction>
<cfquery name="getResp" datasource="#Application.dsn#">
SELECT srID
FROM Survey_Responses
WHERE srSid=#SID#
</cfquery>
<cfoutput query="getResp">
	<cfquery name="deleteQResponse" datasource="#Application.dsn#">
	DELETE
	FROM Question_Responses
	WHERE qrSrID=#srID#
	</cfquery>	
	<cfquery name="deleteResponses" datasource="#Application.dsn#">
	DELETE
	FROM Survey_Responses
	WHERE srID=#srID#
	</cfquery>
</cfoutput>
</cftransaction>
<html>
<head>
	<title>BSO_Surveys v.2.0</title>
	
	<LINK REL=stylesheet HREF="../style.css" TYPE="text/css">
<script language="JavaScript">
		function refresh_orig(){
			window.opener.location.href="survey_listPublished.cfm?<cfoutput>survey=#sid#&group=#group#</cfoutput>";
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

<body onload="refresh_orig();">
<br><br><br>
<strong>Response Deleted</strong>
</body>
</html>
