<CFquery datasource="#Application.dsn#" name="insertSc">
UPDATE [#table_Users#]
SET
[#user_First#]='#form.first#',
[#user_Last#]='#form.last#',
[#user_Email#]='#form.Email#',
[#user_Phone#]='#form.Phone#',
[#user_Password#]='#form.pass#',
WHERE [#user_ID#]=#respID#
</CFQUERY>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>BSO_Surveys v.2.0</title>
	
	<LINK REL=stylesheet HREF="../style.css" TYPE="text/css">
<script language="JavaScript">
		function refresh_orig(){
			window.opener.location.href="respondents.cfm";
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

<body>
<br><br><br>
<strong>Respondent Information Updated</strong>
<hr><br>
<div align="center">
	<br><br><br>
	Done.
	<br><br>
	<a href="##" onClick="refresh_orig();">Close Window</a></div>
</body>
</html>
