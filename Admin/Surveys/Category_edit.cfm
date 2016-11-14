<cfquery name="getCat" datasource="#Application.dsn#">
SELECT * FROM categories
WHERE catID=#catID#
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
<cfoutput query="getCat">
<strong>Edit <a href="##" onclick="help('category');"><font class="helpfont">Category</a></font></strong>
<form name="form1" action="Category_update.cfm?catID=#catID#&SID=#SID#" method="post">
<hr><br>
Enter the <a href="##" onclick="help('category_name');"><font class="helpfont"><strong>Category Name</strong></font></a> here:
<br><br>
<input type="text" name="Name" value="#catName#" size="35">
<br><br>
Enter <a href="##" onclick="help('add_text');"><font class="helpfont"><strong>Additional Text</strong></font></a> here: (optional)
<br><br>
<textarea name="AddText" rows="5" cols="35" wrap="virtual">#catAddText#</textarea>
<br><br>
<input type="submit" value="Continue >>"></form><br>

</cfoutput>
<br><br>
<div align="center"><a href="##" onClick="window.close();"><strong>- Cancel-</strong></a></div>
</body>
</html>
