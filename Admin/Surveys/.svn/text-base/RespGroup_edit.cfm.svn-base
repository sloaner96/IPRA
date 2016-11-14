<cfquery name="getRG" datasource="#Application.dsn#">
SELECT * FROM Respondent_Groups
WHERE rgID=#rgID#
</cfquery>


<html>
<head>
	<title>BSO_Surveys v.3.0</title>
	
	<LINK REL=stylesheet HREF="../style.css" TYPE="text/css">
<script language="JavaScript">
function check() {

TF=true;

if(document.form1.name.value == ''){
	alert('Please include a name');
	document.form1.name.focus();
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
<strong>Edit Respondent <a href="##" onclick="help('group');"><font class="helpfont">Group</font></a></strong>
<hr><br><br>
<cfoutput query="getRG">
<form name="form1" action="respGroup_update.cfm?rgID=#rgID#" method="post" onSubmit="return check();">
<table cellpadding="5">
	<tr>
		<td>Group Name:</td>
	</tr>
	<tr>
		<td><input type="text" name="name" value="#rgName#"></td>
	</tr>
	<tr>
		<td>Notes(optional):</td>
	</tr>
	<tr>
		<td><textarea name="notes" cols="45" rows="6" wrap="virtual">#rgNotes#</textarea></td>
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
