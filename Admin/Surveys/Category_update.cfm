<CFquery datasource="#Application.dsn#" name="updateCat">
UPDATE Categories
SET
catName = '#form.Name#'<cfif form.AddText neq "">, 
catAddText = '#form.AddText#'</cfif>
WHERE catID=#catID#
</CFQUERY>

<cfquery name="getScales" datasource="#Application.dsn#">
SELECT scID, scName, scpValue FROM Scales, Scale_values
WHERE scID=scpScID
</cfquery>

<cfquery name="checkScale" datasource="#Application.dsn#">
SELECT catScID, scID, scName, scpValue from Categories, Scales, Scale_Values
WHERE catID=#catID#
AND catScID=scID
AND scpScID=scID
</cfquery>



<html>
<head>
	<title>BSO_Surveys v.3.0</title>
	
	<LINK REL=stylesheet HREF="../style.css" TYPE="text/css">
<script language="JavaScript">
function newScale(){

window.open("Scale_new.cfm?<cfoutput>catID=#catID#&SID=#SID#</cfoutput>","newWindow2","location=no,scrollbars=no,menubars=no,toolbars=no,resizable=yes,width=400,height=425");

}
</script>
<script language="JavaScript">
function delScale(){

location.href="Category_delScale.cfm?<cfoutput>catID=#catID#&SID=#SID#</cfoutput>";

}
</script>
<script language="JavaScript">
	function refresh_orig(){
		window.opener.location.href="survey.cfm?SID=<cfoutput>#SID#</cfoutput>";
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
<strong>Category Updated</strong>
<hr><br>
<cfquery name="catCheck" datasource="#Application.dsn#">
	SELECT * FROM Questions, Surveys
	WHERE qCatID=#catID#
	AND qType <> 'MUL3'
	AND QSID=SID
	ORDER BY sName, qNum asc
	</cfquery>
<cfif catCheck.recordcount eq 0>
<cfoutput>


	<form name="form1" action="Category_addScale.cfm?catID=#catID#&SID=#SID#" method="post">
	Choose a <a href="##" onclick="help('scale');"><font class="helpfont"><strong>Scale</strong></font></a> to associate with this Category. 
	Click <a href="##" onclick="help('catScale_association');"><font class="helpfont"><strong>here</strong></font></a> for more information.
	<strong></strong>
	<br><br>
	<strong>Associate Scale:</strong>
	<br><br>
	</cfoutput>
	<cfoutput query="getScales" group="scID">
	<input type="radio" name="Scale" value="#scID#"<cfif checkScale.scID eq #scID#> checked</cfif>>#scName#: 
	(
	<select name="nothing">
	<cfoutput><option value="">#scpValue#</cfoutput>
	</select>
	)<br>
	</cfoutput>
	<cfoutput>
	<br><br>
	<input type="radio" name="Scale" value="" onClick="newScale();">Define/Associate a new scale...<br>
	<input type="radio" name="Scale" value="" onClick="delScale();"<cfif checkScale.recordcount eq 0> checked</cfif>><a href="##" onclick="help('disassociate');"><font class="helpfont"><strong>Disassociate</strong></font></a><strong>/do not associate </strong>Scale...
	<br><br>
	<input type="submit" value="Continue >>"></form>

</cfoutput>
<cfelse>
	<cfoutput>
		<div align="center"><br><br><br>
		<strong>Done</strong>
		<br><br>
		
		<a href="##" onClick="refresh_orig();">Return to Survey</a></div>
			
	</cfoutput>
</cfif>

</body>
</html>
