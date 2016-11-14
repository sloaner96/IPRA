<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<body>


<CFINDEX ACTION="PURGE" COLLECTION="IPRA">

<cfindex action="Update"
         collection="IPRA"
         key="#Application.Sitepath#"
         type="PATH"
		 URLpath="http://www.ilipra.org/"
		 Extensions=".cfm, .htm, .html"
		 Recurse="yes">
Completed WebSite Collection<br>	 
<cfindex action="Update"
         collection="IPRA"
         key="#Application.Sitepath#/forms"
         type="PATH"
		 URLpath="http://www.ilipra.org/Forms"
		 Extensions=".pdf, .doc, .xls, .ppt"
		 Recurse="No">
Completed Document Collection		 
</body>
</html>
