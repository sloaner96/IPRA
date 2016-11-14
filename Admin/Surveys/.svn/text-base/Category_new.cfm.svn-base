

<html>
<head>
	<title>BSO_Surveys v.3.0</title>
	
	<LINK REL=stylesheet HREF="../style.css" TYPE="text/css">
<script language="JavaScript">
function check() {
var tf=true;
if(document.form1.Name.value == ""){
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
<cfoutput>
<strong>Add a new <a href="##" onclick="help('category');"><font class="helpfont">Category</font></a></strong>
<form name="form1" onSubmit="return check();" action="Category_finish.cfm?SID=#SID#" method="post">
<hr><br>
Enter the <a href="##" onclick="help('category_name');"><font class="helpfont"><strong>Category Name</strong></font></a> here:
<br>
<input type="text" name="Name" size="35">
<br><br>
Enter <a href="##" onclick="help('add_text');"><font class="helpfont"><strong>Additional Text</strong></font></a> here: (optional)
<br>
<textarea name="AddText" rows="5" cols="35" wrap="virtual"></textarea>
<br><br>
<input type="submit" value="Continue >>"></form><br>

</cfoutput>
<br><br>
<div align="center"><a href="##" onClick="window.close();"><strong>- Cancel-</strong></a></div>
</body>
</html>
