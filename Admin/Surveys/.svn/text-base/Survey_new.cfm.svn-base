

<html>
<head>
	<title>BSO_Surveys v.3.0</title>
	
	<LINK REL=stylesheet HREF="../style.css" TYPE="text/css">
<script language="JavaScript">
function check() {
var tf=true;
if(document.form1.name.value == ""){
	tf=false;
	}
if(tf == false){
	alert('One or more of the required fields was not completed');
	}
return tf;
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
<strong>Create a new <a href="##" onclick="help('survey');"><font class="helpfont">survey</font></a></strong>
<cfoutput>
<hr><br>
<div align="center"><IMG SRC="/images/surveys/down_arrow.gif" WIDTH="48" HEIGHT="100" BORDER="0" HSPACE="0" VSPACE="0">
<br>
<form name="form1" onsubmit="return check();" action="Survey_finish.cfm" method="post">
Please choose a name to identify the new <strong><a href="##" onclick="help('survey');"><font class="helpfont">Survey</font></a>:</strong><br><br>
<input type="text" name="name">
<br><br>
<input type="submit" value="Create >>">
</form>
<br><br><br>
</div>
</cfoutput>

</body>
</html>
