<cfquery name="getCat" datasource="#Application.dsn#">
SELECT catID, catName FROM categories
WHERE catID=#ID#
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
<strong><a href="##" onclick="help('category');"><font class="helpfont">Category</font></a> Options</strong>
<hr><br><br>
<cfoutput query="getCat">
<strong>Add/Remove Questions:</strong>
<br><br>
<a href="Category.cfm?ID=#catID#">Create a new Question for this Category</a>
<br><br>
<a href="Category_listSurveyQuestions.cfm?ID=#catID#">Add a Question from this survey to this Category</a>
<br><br>
<a href="Category.cfm?ID=#catID#">Remove a Question from this Category</a>
<br><br><br><br>
<strong>Edit/Delete Questions:</strong><br><br>
<a href="Category.cfm?ID=#catID#">Edit a Question in this Category</a>
<br><br>
<a href="Category.cfm?ID=#catID#">Delete a Question in this Category</a>
<br><br><br><br>
<strong>Other Options:</strong><br><br>
<a href="Category.cfm?ID=#catID#">Associate a Scale with this Category</a>
<br><br>
<a href="Category.cfm?ID=#catID#">Edit the Name or Additional Text of this Category</a>
<br><br>
<a href="Category.cfm?ID=#catID#">Delete this Category</a>
</cfoutput>
</body>
</html>
