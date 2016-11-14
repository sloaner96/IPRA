<cfif not isdefined('renum')>
	<!--- <cflocation url="Survey_Renum.cfm?SID=#SID#"> --->
	
	<cfoutput><meta http-equiv="refresh" content="0;url=Survey_Renum.cfm?SID=#SID#"></cfoutput>
</cfif>

<cfquery name="getS" datasource="#Application.dsn#">
SELECT sID, sName FROM Surveys
WHERE sID=#SID#
</cfquery>

<cfquery name="getQ" datasource="#Application.dsn#">
SELECT qID, qQuestion, qNum, qType FROM Questions
WHERE qSID=#SID#
AND qCatID IS NULL
ORDER BY qNum ASC
</cfquery>

<cfquery name="getCatQ" datasource="#Application.dsn#">
SELECT qID, qQuestion, qNum, qType, qCatID, catID, catName FROM Questions, Categories
WHERE qSID=#SID#
AND qCatID=catID
ORDER BY catID, qNum ASC
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
<strong>UnPublished Surveys</strong>
<hr><br><br>
<cfoutput>
<table border="1" cellpadding="5" align="center" width="570">
<tr bgcolor="gray">
	<td colspan="6"><font class="lightfont"><strong>Unpublished Survey</strong></font></td>
</tr>
<tr bgcolor="lightgrey">
	<td colspan="6" align="center">
	<table cellpadding="5" align="center">
		<tr>
			<td align="center" colspan="2"><strong><font class="bigfont">#getS.sName#</font></strong></td>
		</tr>
		<tr>
			<td valign="top">
			<ul>
				<li><a href="##" onClick="window.open('Question_whatType.cfm?SID=#SID#','newWindow','location=no,scrollbars=yes,menubars=no,toolbars=no,resizable=yes,width=600,height=475');">Add a new Question</a></li>
				<li><a href="##" onClick="window.open('Category_new.cfm?SID=#SID#','newWindow','location=no,scrollbars=yes,menubars=no,toolbars=no,resizable=yes,width=600,height=425');">Add a new Category</a></li>
				<li><a href="##" onClick="window.open('Survey_preview.cfm?SID=#SID#','newWindow','location=no,scrollbars=yes,menubars=no,toolbars=no,resizable=yes,width=600,height=425');">Preview Survey</a></li>
			</ul>
			</td>
			<td valign="top">
			<ul>
				<li><a href="##" onClick="window.open('Survey_reName.cfm?SID=#SID#&pub=no','newWindow','location=no,scrollbars=yes,menubars=no,toolbars=no,resizable=yes,width=600,height=425');">Edit Survey Header</a></li>
				<li><a href="##" onClick="window.open('Survey_ConfirmDelete.cfm?SID=#SID#&pub=no','newWindow','location=no,scrollbars=yes,menubars=no,toolbars=no,resizable=yes,width=600,height=425');">Delete Survey</a></li>
				<li><a href="##" onClick="window.open('Survey_PubOptions.cfm?SID=#SID#','newWindow','location=no,scrollbars=yes,menubars=no,toolbars=no,resizable=yes,width=600,height=475');">Publish Survey</a></li>
			</ul>
			</td>
		</tr>
	</table>
	
	</td>
</tr>
</cfoutput>
<cfoutput query="getQ">
<tr><a name="Q#qID#"></a>
	<td><cfif qType eq "MUL3"><font class="orangefont">s</font><cfelse>&nbsp;</cfif></td>
	<td><strong>#qNum#</strong></td>
	<td><a href="###qID#" onClick="window.open('Question_edit.cfm?SID=#SID#&QID=#QID#','newWindow','location=no,scrollbars=yes,menubars=no,toolbars=no,resizable=yes,width=600,height=425');">#left(qQuestion, 65)#<cfif len(qQuestion) GTE 65>...</cfif></a></td>
	<td><a href="###qID#" onClick="window.open('Question_ConfirmDelete.cfm?SID=#SID#&QID=#QID#','newWindow','location=no,scrollbars=yes,menubars=no,toolbars=no,resizable=yes,width=400,height=200');">delete</a></td>
	<td colspan="2"><a href="###qID#" onClick="window.open('Question_catAdd.cfm?SID=#SID#&QID=#QID#','newWindow','location=no,scrollbars=yes,menubars=no,toolbars=no,resizable=yes,width=300,height=400');">add to category...</a></td>
</tr>
</cfoutput>
<cfset CatQList="0">
<cfoutput query="getCatQ" Group="qCatID">

<cfset CatQList=#ListAppend(CatQList, catID)#>

<cfquery name="getCatScale" datasource="#Application.dsn#">
SELECT ScID, scpValue FROM Scales, Scale_Values, Categories
WHERE catScID=scID
AND scpScID=scID
AND catID=#catID#
</cfquery>

<tr bgcolor="gray"><a name="catQ#catID#"></a>
	<form name="nullform">
	<td colspan="3" valign="top">
	<strong><a href="##catQ#catID#" onClick="window.open('Category_edit.cfm?SID=#SID#&catID=#catID#','newWindow','location=no,scrollbars=yes,menubars=no,toolbars=no,resizable=yes,width=600,height=425');"><font class="lightfont">#catName#</font></a><font class="lightfont"></font></strong>
	<cfif getCatScale.recordcount neq 0> | Scale: <select name="nullselect"><cfloop query="getCatScale">
	<option value="">#scpValue#</cfloop></select></cfif>
	</td>
	</form>
	<td valign="top" colspan="2">
	<cfif getCatScale.recordcount neq 0>
		<a href="##catQ#catID#" onClick="window.open('Question_whatText.cfm?Type=MUL3&SID=#SID#&catID=#catID#&scID=#getCatScale.scID#','newWindow','location=no,scrollbars=yes,menubars=no,toolbars=no,resizable=yes,width=600,height=475');"><font class="lightfont">New Question</font></a>
	<cfelse>
		<a href="##catQ#catID#" onClick="window.open('Question_whatType.cfm?SID=#SID#&catID=#catID#','newWindow','location=no,scrollbars=yes,menubars=no,toolbars=no,resizable=yes,width=400,height=475');"><font class="lightfont">New Question</font></a>
	</cfif>
	</td>
	<td valign="top"><a href="##catQ#catID#" onClick="window.open('Category_confirmDelete.cfm?SID=#SID#&catID=#catID#','newWindow','location=no,scrollbars=yes,menubars=no,toolbars=no,resizable=yes,width=400,height=200');"><font class="lightfont">Delete</font></a></td>
</tr>
<cfoutput>
<tr><a name="Q#qID#"></a>
	<td><cfif qType eq "MUL3"><font class="orangefont">s</font><cfelse>&nbsp;</cfif></td>
	<td><strong>#qNum#</strong></td>
	<td><a href="##Q#qID#" onClick="window.open('Question_edit.cfm?SID=#SID#&QID=#QID#','newWindow','location=no,scrollbars=yes,menubars=no,toolbars=no,resizable=yes,width=600,height=425');">#left(qQuestion, 65)#<cfif len(qQuestion) GTE 65>...</cfif></a></td>
	<td><a href="##Q#qID#" onClick="window.open('Question_ConfirmDelete.cfm?SID=#SID#&QID=#QID#','newWindow','location=no,scrollbars=yes,menubars=no,toolbars=no,resizable=yes,width=400,height=200');">delete</a></td>
	<td><a href="##Q#qID#" onClick="window.open('Question_catRemove.cfm?SID=#SID#&QID=#QID#','newWindow','location=no,scrollbars=yes,menubars=no,toolbars=no,resizable=yes,width=200,height=200');">remove</a></td>
	<td><a href="##Q#qID#" onClick="window.open('Question_catAdd.cfm?SID=#SID#&QID=#QID#','newWindow','location=no,scrollbars=yes,menubars=no,toolbars=no,resizable=yes,width=300,height=400');">move...</a></td>
</tr>
</cfoutput>
</cfoutput>

<cfquery name="getNonQCat" datasource="#Application.dsn#">
SELECT catID, catName
FROM Categories
WHERE catID NOT IN (#catQList#)
AND catSID=#SID#
</cfquery>

<cfoutput query="getNonQCat">

<cfquery name="getCatScale" datasource="#Application.dsn#">
SELECT scID, scpValue FROM Scales, Scale_Values, Categories
WHERE catScID=scID
AND scpScID=scID
AND catID=#catID#
</cfquery>

<tr bgcolor="gray"><a name="catNoQ#catID#"></a>
	<form name="nullform">
	<td colspan="3" valign="top">
	<strong><a href="##CatNoQ#catID#" onClick="window.open('Category_edit.cfm?SID=#SID#&catID=#catID#','newWindow','location=no,scrollbars=yes,menubars=no,toolbars=no,resizable=yes,width=600,height=425');"><font class="lightfont">#catName#</font></a><font class="lightfont"></font></strong>
	<cfif getCatScale.recordcount neq 0> | Scale: <select name="nullselect"><cfloop query="getCatScale">
	<option value="">#scpValue#</cfloop></select></cfif>
	</td>
	</form>
	<td valign="top" colspan="2">
	<cfif getCatScale.recordcount neq 0>
		<a href="##catNoQ#catID#" onClick="window.open('Question_whatText.cfm?Type=MUL3&SID=#SID#&catID=#catID#&scID=#getCatScale.scID#','newWindow','location=no,scrollbars=yes,menubars=no,toolbars=no,resizable=yes,width=600,height=475');"><font class="lightfont">New Question</font></a>
	<cfelse>
		<a href="##catNoQ#catID#" onClick="window.open('Question_whatType.cfm?SID=#SID#&catID=#catID#','newWindow','location=no,scrollbars=yes,menubars=no,toolbars=no,resizable=yes,width=400,height=475');"><font class="lightfont">New Question</font></a>
	</cfif>
	</td>
	<td valign="top"><a href="##catNoQ#catID#" onClick="window.open('Category_confirmDelete.cfm?SID=#SID#&catID=#catID#','newWindow','location=no,scrollbars=yes,menubars=no,toolbars=no,resizable=yes,width=400,height=200');"><font class="lightfont">Delete</font></a></td>
</tr>
</cfoutput>

</table>
<br><br><br>
</body>
</html>
