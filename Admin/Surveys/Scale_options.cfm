<cfquery name="getScale" datasource="#Application.dsn#">
SELECT scID, scName 
FROM Scales
WHERE scID=#ID#
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
<br><br><br>
<strong><a href="##" onclick="help('rating_scale');"><font class="helpfont">Rating Scale</font></a> Options</strong>
<hr><br>
<cfoutput query="getScale">
<ul>
	<li><a href="Scale_edit.cfm?ID=#scID#">Edit this Scale</a></li>
	<br><br>
	<li><a href="Scale_delete.cfm?ID=#scID#">Delete this Scale</a></li>
	<br><br>
	<li>Add more values to this Scale:
<form action="ScValues.cfm?ID=#scID#" method="post">
Number of Values to add: <input type="text" name="val_num" size="5"><input type="submit" value="Add"></form></li>
</ul>

<br><br>
<br><br>
</cfoutput>


</body>
</html>
