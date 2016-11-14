

<html>
<head>
	<title>BSO_Surveys v.3.0</title>
<LINK REL=stylesheet HREF="../style.css" TYPE="text/css">
<script language="JavaScript">
		function refresh_orig(){
			window.opener.location.href="<cfoutput>Survey.cfm?SID=#SID#</cfoutput>";
			window.opener.focus();
			window.close();
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

<cfquery name="checkScale" datasource="#Application.dsn#">
SELECT qType FROM Questions, Categories
WHERE qType <> 'MUL3'
AND catScID IS NOT NULL
AND qID=#QID#
AND	CatID=#form.category#
</cfquery>

<cfquery name="isCatScale" datasource="#Application.dsn#">
SELECT catScID FROM Categories
WHERE catID=#form.Category#
AND catScID IS NOT NULL
</cfquery>

<cfif checkScale.recordcount eq 0><!--- if question is scalar, or if category has no Scale assigned, go ahead and update --->

	<cfquery name="setCatQ" datasource="#Application.dsn#">
	UPDATE Questions
	SET qCatID = #form.Category#
	WHERE qID=#QID#
	</cfquery>
	
	<br><br><br>
	<div align="center">
	Changes Complete
	<br><br>
	<cfif isCatScale.recordcount neq 0>
	<strong>Note:</strong> The Scale previously assigned to this Question has been<br>
	replaced with the Scale assigned to the Category.
	<br><br>
	</cfif>
	<a href="##" onClick="refresh_orig();"><strong>Close Window</strong></a>
	</div>

<cfelse>

	<br><br><br>
	<div align="center">
	<strong>Sorry</strong>
	<br><br>
	This Category is <a href="##" onclick="help('catScale_association');"><font class="helpfont">associated</font></a> with a Scale, and the question you are trying to <br>
	move does not use a scale.
	<br><br>
	You can either remove the Scale from this category, or add a different question to this category
	<br><br>
	<a href="##" onClick="refresh_orig();"><strong>Close Window</strong></a>
	</div>
</cfif>

</body>
</html>
