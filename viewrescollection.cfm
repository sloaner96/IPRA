<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<body>
<cfcollection action="LIST" name="getAll">
<cfdump var="#getAll#">

 <cfcollection action="CATEGORYLIST" name="getcollection" collection="IPRARESUME">
<cfdump var="#getcollection#">

 <cfsearch collection="IPRARESUME" name="getResume" language="English">


<cfdump var="#getResume#">
</body>
</html>
