<cfquery datasource="#Application.dsn#" name="getscales">
SELECT * FROM Scales
</CFQUERY>


<html>
<head>
	<title>BSO_Surveys v.3.0</title>
	
	<LINK REL=stylesheet HREF="../style.css" TYPE="text/css">
	
<script language="JavaScript">
function newScale(){

window.open("Scale_new.cfm?q=yes&<cfoutput>type=MUL3&SID=#SID#</cfoutput>","newWindow2","location=no,scrollbars=no,menubars=no,toolbars=no,resizable=yes,width=400,height=425");

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
<strong>Choose <a href="##" onclick="help('rating_scale');"><font class="helpfont">Rating Scale</font></a></strong>

<hr><br>
<cfoutput>
<cfif getscales.recordcount eq 0>
There are no <a href="##" onclick="help('rating_scale');"><font class="helpfont">rating scales</font></a> currently defined. Since this <a href="##" onclick="help('type');"><font class="helpfont">type</font></a> of question requires the use of a <a href="##" onclick="help('rating_scale');"><font class="helpfont">rating scale</font></a>, you may either <a href="##" onclick="newScale();">define one now</a> or <a href="Question_whatType.cfm?SID=#SID#">choose another type</a> of question.
<cfelse>
Please select a <a href="##" onclick="help('rating_scale');"><font class="helpfont">rating scale</font></a> to use:
<ul>
<cfloop query="getscales">
	<li><a href="Question_whatText.cfm?type=MUL3&SID=#SID#&ScID=#scID#">#scName#</a></li>
</cfloop>
</ul>
<hr><br>
<strong>OR</strong>
<br><br>
<a href="##" onclick="newScale();">Define a new Rating Scale</a>
<br><br>

</cfif>


</cfoutput>
<br><br>
<div align="center"><a href="##" onClick="window.close();"><strong>- Cancel-</strong></a></div>
</body>
</html>
