<cfquery name="getHelp" datasource="#Application.dsn#">
SELECT * FROM Help
order by helpWord asc
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
<a href="##" onclick="help('#helpKey#');"><font class="helpfont">#helpWord#</font></a><br>
</cfoutput>
<br><br>
<div align="center"><a href="help_full.cfm"><strong>View All Definitions</strong></a></div>
<br><br>
<div align="center"><a href="##" onClick="window.close();"><strong>- Close Window -</strong></a></div>

</body>
</html>
