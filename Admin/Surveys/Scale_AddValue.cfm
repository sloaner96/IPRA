

<html>
<head>
	<title>BSO_Surveys v.3.0</title>
	
	<LINK REL=stylesheet HREF="../style.css" TYPE="text/css">
<script language="JavaScript">
function check() {
var tf=true;
if(document.form1.val_num.value % 1 != 0){
	tf=false;
	}
else if(document.form1.val_num.value == " "){
	tf=false;
	}
else if(document.form1.val_num.value == ""){
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
<strong>Add <a href="##" onclick="help('rating_scale');"><font class="helpfont">Rating Scale</font></a></strong>
<hr><br>
<cfoutput>
<form name="form1" onSubmit="return check();" action="Scale_whatValuesAdd.cfm?scID=#scID#" method="post">
Select the number of <a href="##" onclick="help('rating_values');"><font class="helpfont">values</font></a> you would like to add:<br><br>
<input type="text" name="val_num">
<br><br>
<input type="submit" value="Continue >>">
</form>

</cfoutput>
<br><br>
<div align="center"><a href="##" onClick="window.close();"><strong>- Cancel-</strong></a></div>
</body>
</html>
