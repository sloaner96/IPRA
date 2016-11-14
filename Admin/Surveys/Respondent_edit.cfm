<cfquery name="getResp" datasource="#Application.dsn#">
SELECT [#user_First#] as respFirst,
[#user_Last#] as respLast,
[#user_Email#] as respEmail,
[#user_Password#] as respPass,
FROM [#table_Users#]
WHERE [#user_ID#]=#respID#
</cfquery>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>BSO_Surveys v.2.0</title>
	
	<LINK REL=stylesheet HREF="../style.css" TYPE="text/css">
<script language="JavaScript">
function check() {

TF=true;

if(document.form1.first.value == ''){
	alert('Please include a first name');
	document.form1.first.focus();
	TF=false;
	}
else if(document.form1.last.value == ''){
	alert('Please include a last name');
	document.form1.last.focus();
	TF=false;
	}
else if(document.form1.email.value == ''){
	alert('Please include an email address');
	document.form1.email.focus();
	TF=false;
	}
else if(document.form1.pass.value == ''){
	alert('Please include a password');
	document.form1.pass.focus();
	TF=false;
	}
else if(document.form1.pass.value != document.form1.pass2.value){
	alert('Passwords do not match!');
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

<body>
<strong>Edit <a href="##" onclick="help('Respondent');"><font class="helpfont">Respondent</font></a></strong>
<hr><br><br>
<cfoutput query="getResp">
<form name="form1" action="respondent_update.cfm?respID=#respID#" method="post" onSubmit="return check();">
<table cellpadding="5">
	<tr>
		<td>First</td>
		<td>Last</td>
	</tr>
	<tr>
		<td><input type="text" name="first" value="#respfirst#"></td>
		<td><input type="text" name="last" value="#resplast#"></td>
	</tr>
	<tr>
		<td colspan="2">Email</td>
	</tr>
	<tr>
		<td colspan="2"><input type="text" name="email" value="#respemail#" size="35"></td>
	</tr>
	<tr>
		<td>Password</td>
		<td>Retype Password</td>
	</tr>
	<tr>
		<td><input type="password" name="pass" value="#respPass#"></td>
		<td><input type="password" name="pass2" value="#respPass#"></td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" value="Update >>"></td>
	</tr>
</table>
</form>
</cfoutput>
<br><br>
<div align="center"><a href="##" onClick="window.close();"><strong>- Cancel-</strong></a></div>
</body>
</html>