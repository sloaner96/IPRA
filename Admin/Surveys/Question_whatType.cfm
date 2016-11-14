

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
<strong>Select Question <a href="##" onclick="help('Type');"><font class="helpfont">Type</font></a></strong>

<hr><br>
<cfoutput>
<strong>What <a href="##" onclick="help('type');"><font class="helpfont">type</font></a> of question would you like to add?</strong>
<br><br>
<table border="0" cellpadding="8">
<tr>
<td><a href="Question_whatText.cfm?type=TF&SID=#SID#<cfif isdefined('catID')>&catID=#catID#</cfif>">True/False</a></td>
<td><a href="##" onclick="help('TF');"><font class="helpfont">help</font></a></td>
</tr>
<tr>
<td><a href="Question_whatText.cfm?type=YN&SID=#SID#<cfif isdefined('catID')>&catID=#catID#</cfif>">Yes/No</a></td>
<td><a href="##" onclick="help('YN');"><font class="helpfont">help</font></a></td>
</tr>
<tr>
<td><a href="Question_whatText.cfm?type=OE&SID=#SID#<cfif isdefined('catID')>&catID=#catID#</cfif>">Open-Ended</a></td>
<td><a href="##" onclick="help('OE');"><font class="helpfont">help</font></a></td>
</tr>
<tr>
<td><a href="Question_whatText.cfm?type=MUL1&SID=#SID#<cfif isdefined('catID')>&catID=#catID#</cfif>">Multiple Choice - Multiple (check boxes)</a></td>
<td><a href="##" onclick="help('MUL1');"><font class="helpfont">help</font></a></td>
</tr>
<tr>
<td><a href="Question_whatText.cfm?type=MUL2&SID=#SID#<cfif isdefined('catID')>&catID=#catID#</cfif>">Multiple Choice - Exclusive (radio buttons)</a></td>
<td><a href="##" onclick="help('MUL2');"><font class="helpfont">help</font></a></td>
</tr>
<tr>
<td><a href="Question_whatScale.cfm?type=MUL3&SID=#SID#<cfif isdefined('catID')>&catID=#catID#</cfif>">Rating Scale</a></td>
<td><a href="##" onclick="help('MUL3');"><font class="helpfont">help</font></a></td>
</tr>
</table>
</cfoutput>
<br><br>
<div align="center"><a href="##" onClick="window.close();"><strong>- Cancel-</strong></a></div>
</body>
</html>
