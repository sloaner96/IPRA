<cfquery name="getHelp" datasource="#Application.dsn#">
SELECT * FROM Help
WHERE helpKey like '#q#'
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
<cfoutput query="getHelp">
<div align="center"><strong><u>#helpWord#</u></strong></div>
<br><br>
#helpDef#
</cfoutput>
<br><br>
<div align="center">

<a href="help_index.cfm"><font class="helpfont"><strong>Help Index</strong></font></a>
<br><br><br>
<a href="##" onClick="window.close();"><strong>- Close Window -</strong></a>

</div>

</body>
</html>
