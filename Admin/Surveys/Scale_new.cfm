

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
else if(document.form1.val_num.value % 1 != 0){
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
<form name="form1" onSubmit="return check();" action="Scale_finish.cfm?1=1<cfif isdefined('s')>&s=#s#</cfif><cfif isdefined('Q')>&q=#q#&type=MUL3</cfif><cfif isdefined('SID')>&SID=#SID#</cfif><cfif isdefined('catID')>&catID=#CatID#</cfif>" method="post">
Please choose a name for the <a href="##" onclick="help('rating_scale');"><font class="helpfont">rating scale</font></a>:<br><br>
<input type="text" name="name">
<br><br><br>
...and select the number of <a href="##" onclick="help('rating_values');"><font class="helpfont">values</font></a> for this scale:<br><br>
<input type="text" name="val_num">
<br><br>
<input type="submit" value="Continue >>">
</form>

</cfoutput>
<br><br>
<div align="center"><a href="##" onClick="window.close();"><strong>- Cancel-</strong></a></div>
</body>
</html>
