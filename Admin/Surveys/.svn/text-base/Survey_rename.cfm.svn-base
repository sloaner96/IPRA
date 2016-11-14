<cfquery name="getS" datasource="#Application.dsn#">
SELECT sID, sName, sIntro FROM Surveys
WHERE sID=#SID#

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

</head>

<body onload="this.window.focus();">
<strong>Rename <a href="##" onclick="help('survey');"><font class="helpfont">survey</font></a></strong>
<cfoutput query="getS">
<hr><br>

<form name="form1" action="Survey_reNameFinish.cfm?SID=#SID#&pub=#pub#" method="post" onSubmit="return check();">
<strong>Survey Name:</strong><br><br>
<input type="text" name="name" value="#sName#" size="35">
<br><br>
<strong>Survey Intro:</strong><br><br>
<textarea name="Intro" wrap="virtual" cols="35" rows="5">#sIntro#</textarea>
<br><br>
<input type="submit" value="Save Changes >>">
</form>
<br><br><br>

</cfoutput>
<br><br>
<div align="center"><a href="##" onClick="window.close();"><strong>- Cancel-</strong></a></div>
</body>
</html>
