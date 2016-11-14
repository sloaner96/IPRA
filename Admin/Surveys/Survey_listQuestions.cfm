<cfquery datasource="#Application.dsn#" name="getQuestions">
Select qID, qSID, qNum, qQuestion, qType from Questions
where qSID=#SID#
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
<br><br><br>
<strong>Edit Questions</strong>
<hr><br>
<table cellpadding="5">
<tr>
	<td><strong><a href="##" OnClick="help('question_text');"><font class="helpfont">Question #</font></a></strong></td>
	<td><strong><a href="##" OnClick="help('question_text');"><font class="helpfont">Question text</font></a></strong></td>
</tr>
<cfoutput query="getQuestions">

<tr>
	<td align="center">#qNum#</td>
	<td><a href="Question_edit.cfm?qID=#qID#&sID=#qSID#">#qQuestion#</a></td>
</tr>

</cfoutput>
</table>
</body>
</html>
