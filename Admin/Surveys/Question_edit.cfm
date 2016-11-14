<cfquery datasource="#Application.dsn#" name="getQuestion">
Select qQuestion, qType, qNum, qScID from Questions
where qID=#qID#
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
<cfoutput query="getQuestion">
<strong>Edit Question #qNum#</strong>
<hr><br>
<table border="0" cellpadding="5">
<tr>
	<td valign="top">
	
<table cellpadding="5" border="0">
<tr>
	<td colspan="2"><strong><a href="##" onclick="help('question');"><font class="helpfont">Question:</font></a></strong></td>
</tr>
<tr>
	<td colspan="2"><form name="form1" action="Question_Update.cfm?qID=#qID#&sID=#SID#&qType=#qType#" method="post">
<textarea name="Question" rows="5" cols="35" wrap="virtual">#qQuestion#</textarea>
</td>
</tr>
</cfoutput>
<cfif getQuestion.qType eq "TF">
<tr>
	<td colspan="2"><strong><a href="##" onclick="help('possible_responses');"><font class="helpfont">Possible Responses:</font></a></strong></td>
</tr>
	<tr>
		<td>
		<ul>
		<li>True</li>
		<li>False</li>
		</ul>
		<input type="checkbox" name="changeType">Use Yes/No Instead
		</td>
	</tr>
<cfelseif getQuestion.qType eq "YN">
<tr>
	<td colspan="2"><strong><a href="##" onclick="help('possible_responses');"><font class="helpfont">Possible Responses:</font></a></strong></td>
</tr>
	<tr>
		<td>
		<ul>
		<li>Yes</li>
		<li>No</li>
		</ul>
		<input type="checkbox" name="changeType">Use True/False Instead
		</td>
	</tr>
<cfelseif getQuestion.qType eq "OE">
<tr>
	<td colspan="2"><strong><a href="##" onclick="help('possible_responses');"><font class="helpfont">Possible Responses:</font></a></strong></td>
</tr>
	<tr>
		<td>
		(open-ended question)
		</td>
	</tr>
<cfelseif getQuestion.qType eq "MUL1">
<tr>
	<td colspan="2"><strong><a href="##" onclick="help('possible_responses');"><font class="helpfont">Possible Responses:</font></a></strong></td>
</tr>
	<cfquery datasource="#Application.dsn#" name="getPossResp">
	SELECT prResponse, prID
	FROM Possible_Responses
	WHERE prQID=#QID#
	</cfquery>
	<cfoutput query="getPossResp">
	<tr>
		<td valign="top">#CurrentRow#: </td>
		<td valign="top"><input type="text" name="#prID#" value="#prResponse#">
		</td>
	</tr>
	</cfoutput>
	<tr>
		<td colspan="2">
		<br><br>
		<strong>Question <a href="##" onclick="help('type');"><font class="helpfont">Type:</font></a></strong>
		</td>
	</tr>
	<tr>
		<td colspan="2">
		Currently using checkboxes (<input type="checkbox" checked name="nothing">).
		<br>
		<input type="checkbox" name="changeType">Use Option Buttons Instead (<input type="radio" checked name="nothing">).
		</td>
	</tr>
<cfelseif getQuestion.qType eq "MUL2">
<tr>
	<td colspan="2"><strong><a href="##" onclick="help('possible_responses');"><font class="helpfont">Possible Responses:</font></a></strong></td>
</tr>
	<cfquery datasource="#Application.dsn#" name="getPossResp">
	SELECT prResponse, prID
	FROM Possible_Responses
	WHERE prQID=#QID#
	</cfquery>
	<cfoutput query="getPossResp">
	<tr>
		<td valign="top">#CurrentRow#: </td>
		<td valign="top"><input type="text" name="#prID#" value="#prResponse#">
		</td>
	</tr>
	</cfoutput>
	<tr>
		<td colspan="2">
		<br><br>
		<strong>Question <a href="##" onclick="help('type');"><font class="helpfont">Type:</font></a></strong>
		</td>
	</tr>
	<tr>
		<td colspan="2">
		Currently using Option Buttons (<input type="radio" checked name="nothing">).
		<br>
		<input type="checkbox" name="changeType">Use Checkboxes Instead (<input type="checkbox" checked name="nothing">).
		</td>
	</tr>
	
<cfelse><!--- type="MUL3" --->
	<cfquery name="checkCatScale" datasource="#Application.dsn#">
	SELECT catID, catScID, qID FROM Questions, Categories
	WHERE qCatID IS NOT NULL
	AND catScID IS NOT NULL
	AND qID=#QID#
	AND qCatID=catID
	</cfquery>
	
	<cfquery datasource="#Application.dsn#" name="getScale">
	SELECT scName, scpValue, scID
	FROM Scales, Scale_Values
	WHERE scpScID=#getQuestion.qScID#
	AND scpScID=ScID
	</cfquery>
	
	<cfif checkCatScale.recordCount eq 0>
	
		<cfquery datasource="#Application.dsn#" name="getOtherScales">
		SELECT scName, scpValue, scID
		FROM Scales, Scale_Values
		WHERE scpScID <> #getQuestion.qScID#
		AND scpScID=ScID
		</cfquery>
		
	</cfif>
	
	<cfoutput query="getscale" group="scID">
	<tr>
		<td colspan="2">
		<strong>Currently using <a href="##" onclick="help('scale');"><font class="helpfont">Scale:</font></a></strong>
		<br><br>
		(#scName#) <select name="Scale">
		<cfoutput>
		<option value="">#scpValue#
		</cfoutput>
		</select>
		<br><br>
		</td>
	</tr>
	</cfoutput>
	<cfif checkCatScale.recordCount eq 0>
		<cfif getOtherScales.recordcount neq 0>
		<tr>
			<td colspan="2">
			<strong><input type="checkbox" name="changeScale">Use Other Scale Instead:</strong>
			</td>
		</tr>
		<cfoutput query="getOtherScales" group="scID">
		<tr>
			<td colspan="2">
			<input type="Radio" name="whatScale" value="#scID#" onClick="document.form1.changeScale.checked=true;">#scName# (<select name="Scale">
			<cfoutput>
			<option value="">#scpValue#
			</cfoutput>
			</select>)
			</td>
		</tr>
		</cfoutput>
		</cfif>
	</cfif>
</cfif>
</table>

</td>
</tr>
<tr>
	<td colspan="2" align="Center"><br><br><input type="submit" value="Submit Changes"></form></td>
</tr>
</table>
<br><br>
<div align="center"><a href="##" onClick="window.close();"><strong>- Cancel-</strong></a></div>
</body>
</html>
