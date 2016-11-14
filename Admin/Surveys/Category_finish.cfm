<cftransaction>

<cfquery datasource="#Application.dsn#" name="getID">
SELECT MAX(catID) as ID
FROM Categories
</cfquery>

<cfif getID.ID eq "">
	<cfset ID=1>
<cfelse>
	<cfset ID=#getID.ID#+1>
</cfif>

<CFquery datasource="#Application.dsn#" name="insertQ">
INSERT INTO Categories
(catName, catSID<cfif form.AddText neq "">, catAddText</cfif>)
VALUES
('#form.Name#', #SID#<cfif form.AddText neq "">, '#form.AddText#'</cfif>)
</CFQUERY>

</cftransaction>

<cfquery name="getScales" datasource="#Application.dsn#">
SELECT scID, scName, scpValue FROM Scales, Scale_values
WHERE scID=scpScID
</cfquery>



<html>
<head>
	<title>BSO_Surveys v.3.0</title>
	
	<LINK REL=stylesheet HREF="../style.css" TYPE="text/css">
<script language="JavaScript">
function newScale(){

window.open("Scale_new.cfm?<cfoutput>SID=#SID#&catID=#ID#</cfoutput>","newWindow2","location=no,scrollbars=no,menubars=no,toolbars=no,resizable=yes,width=400,height=425");

}
</script>
<script language="JavaScript">
		function refresh_orig(){
			window.opener.location.href="Survey.cfm?SID=<cfoutput>#SID#</cfoutput>";
			window.opener.focus();
			window.close();
		}
</script>

<script language="JavaScript">
function check() {
alert(document.form1.Scale.Checked);
return false;
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
<cfoutput>
<strong>Category Added</strong>
<hr><br>

<form name="form1" action="Category_addScale.cfm?catID=#ID#&SID=#SID#" method="post">
If you like, you may associate a <a href="##" onclick="help('scale');"><font class="helpfont"><strong>Scale</strong></font></a> with this Category. 
Click <a href="##" onclick="help('catScale_association');"><font class="helpfont"><strong>here</strong></font></a> for a more detailed explanation.
<br><br>
<strong>Associate Scale:</strong>
<br><br>
</cfoutput>
<cfoutput query="getScales" group="scID">
<input type="radio" name="Scale" value="#scID#">#scName#: 
(
<select name="nothing">
<cfoutput><option value="">#scpValue#</cfoutput>
</select>
)<br>
</cfoutput>
<cfoutput>
<br><br>
<input type="radio" name="Scale" value="" onClick="newScale();">Define/Associate a new scale...<br>
<input type="radio" name="Scale" value="" checked>Do not Associate scale...
<br><br>
<input type="submit" value="Continue >>"></form>
<form name="form2" action="##" onSubmit="refresh_orig();" method="post">


</cfoutput>
</body>
</html>
