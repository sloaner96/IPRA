<cfquery name="getS" datasource="#Application.dsn#">
SELECT * FROM Surveys
WHERE sID=#SID#
</cfquery>

<CFquery datasource="#Application.dsn#" name="getRG">
SELECT * from Respondent_Groups, Respondent_SurveyRoster
WHERE rrSID=#SID#
AND rrRgID=rgID
</CFQUERY>
	


<html>
<head>
	<title>BSO_Surveys v.3.0</title>
	
	<LINK REL=stylesheet HREF="../style.css" TYPE="text/css">
<script language="JavaScript">
function check() {

TF=true;

if(document.form1.subject.value == ''){
	alert('Please include a subject');
	document.form1.subject.focus();
	TF=false;
	}
return TF;
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
<br><strong>Invite Respondents</strong>
<cfoutput query="getS">
<hr><br>
<form name="form1" action="Survey_SendInvite.cfm?SID=#SID#" method="post" onSubmit="return check();">
To<br>
<select name="group" multiple="yes" size="#getRG.recordcount#">
<cfloop query="getRG">
<option value="#rgID#"<cfif currentrow eq 1> selected</cfif>>#rgName#<br>
</cfloop>
</select>
<br><br>
Subject<br>
<input type="text" name="subject" size="45">
<br><br>
Message (optional)<br>
<textarea name="message" rows="5" cols="35" wrap="physical"></textarea>
<br><br>
<input type="submit" value="Send >>">
</form>
</cfoutput>
<br>
<div align="center"><a href="##" onClick="window.close();"><strong>- Cancel-</strong></a></div>
</body>
</html>
