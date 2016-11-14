<cfquery name="getCats" datasource="#Application.dsn#">
SELECT catID, catName FROM Categories
WHERE catSID=#SID#
</cfquery>



<html>
<head>
	<title>Untitled</title>
<LINK REL=stylesheet HREF="../style.css" TYPE="text/css">
<script language="JavaScript">
		function help(keyword){
		var urlString='help.cfm?q=' + keyword;
			window.open(urlString,'HelpWindow','location=no,scrollbars=yes,menubars=no,toolbars=no,resizable=yes,width=400,height=400');
		}
</script>
</head>

<body onload="this.window.focus();">

<form name="form1" action="Question_catInsert.cfm<cfoutput>?SID=#SID#&qID=#QID#</cfoutput>" method="post">
Please select the Category you would like to move this Question to:<br><br>
<cfoutput query="getCats">
<input type="radio" name="category" value="#catID#">#catName#<br>
</cfoutput>
<br><br>
<input type="submit" value="Go >>">
</form>
<br><br>
<div align="center"><a href="##" onClick="window.close();"><strong>- Cancel-</strong></a></div>
</body>
</html>
