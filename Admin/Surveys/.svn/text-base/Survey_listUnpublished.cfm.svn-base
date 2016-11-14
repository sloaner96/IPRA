

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
<SCRIPT LANGUAGE="JavaScript">
<!--
SurveyOn = new Image();          
SurveyOn.src='/images/Surveys/survey.gif';

SurveyOff = new Image();          
SurveyOff.src = "/images/Surveys/survey_blur.gif";
-->
</SCRIPT>
</head>

<cfoutput>
<body onload="this.window.focus();">
<strong>UnPublished Surveys</strong>
<hr><br><br>
</cfoutput>

<cfquery name="getSurveys" datasource="#Application.dsn#">
Select * from surveys
where sPublished = 0
order by sDate, sName asc
</cfquery>
<table cellpadding="5" border="1" align="center" width="570">
	<tr bgcolor="gray">
		<td><font class="lightfont"><strong>Unpublished Surveys</strong></font></td>
	</tr>
<cfif GetSurveys.recordcount eq 0>
	<tr bgcolor="lightgrey">
		<td valign="top">
		<div align="center"><br><br><strong> - No Unpublished Surveys - </strong></div>
		<br><br>
		</td>
	</tr>
<cfelse>
	<cfquery name="getThisSurvey" datasource="#Application.dsn#">
	Select * from surveys
	where SID=#getSurveys.sid#
	AND sPublished = 1
	order by sName asc
	</cfquery>
	<tr bgcolor="lightgrey">
		<td valign="top">
		<table cellpadding="0" cellspacing="3" border="0" width="100%">
		<tr>
			<td><b>Survey Name</b><hr></td>
			<td>|&nbsp;&nbsp;<b>Created</b><hr></td>
		</tr>
		<cfoutput query="getSurveys">
		<tr>
			<a href="survey.cfm?sid=#sid#" onMouseOver="document.survey_icon#currentrow#.src=SurveyOn.src;" onMouseOut="document.survey_icon#currentrow#.src=SurveyOff.src;" >
			<td valign="middle"><img name="survey_icon#currentrow#" src="/images/Surveys/survey_blur.gif" width="15" height="16" border="0" align="left"><a href="survey.cfm?sid=#sid#"><strong>#sName#</strong></a></td>
			<td valign="middle">&nbsp;&nbsp;<a href="survey.cfm?sid=#sid#">#DateFormat(sDate, 'MMM dd, yyyy')#</a></td>
			</a>
		</tr>
		</cfoutput>
		</table>
		</td>
	</tr>
</cfif>
</table>
</body>
</html>