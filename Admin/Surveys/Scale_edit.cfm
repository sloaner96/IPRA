<cfquery name="getScale" datasource="#Application.dsn#">
SELECT scID, scName, scpID, scpValue from Scales, Scale_Values
WHERE scID=#scID#
AND scID=scpScID
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
<strong>Edit <a href="##" onclick="help('rating_scale');"><font class="helpfont">Rating Scale</font></a></strong>
<hr><br>
To change a <a href="##" onclick="help('rating_value');"><font class="helpfont">Value</font></a>, change the text in the corresponding text box.
<br><br>
To delete a <a href="##" onclick="help('rating_value');"><font class="helpfont">Value</font></a>, simply delete all of the text from the box.
<cfoutput query="getScale" group="scID">
<form name="form1" action="Scale_update.cfm?scID=#scID#" method="post">
<strong>Scale Name:</strong><br><br>
<input type="text" name="name" value="#scName#">
<br><br><br>
<strong>Scale <a href="##" onclick="help('rating_value');"><font class="helpfont">Values</font></a>:</strong><br><br>
<cfoutput><input type="text" name="#scpID#" value="#scpValue#"><br></cfoutput>
<br><br>
<input type="submit" value="Save Changes >>">
</form>
<form name="form1" action="Scale_AddValue.cfm?scID=#scID#" method="post">
<input type="submit" value="Add More Values >>">
</form>
</cfoutput>
<br>
<div align="center"><a href="##" onClick="window.close();"><strong>- Cancel-</strong></a></div>
</body>
</html>
