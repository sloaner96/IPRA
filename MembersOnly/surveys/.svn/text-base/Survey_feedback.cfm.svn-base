

<html>
<head>
	<title>IPRA Surveys</title>
	
	<LINK REL=stylesheet HREF="style.css" TYPE="text/css">

<script language="JavaScript">
function check() {

TF=true;

if(document.form1.comments.value == ''){
	alert('Please type you comments');
	document.form1.comments.focus();
	TF=false;
	}
return TF;
}
</script>

</head>

<body>
<strong>Survey Feedback</strong>
<cfoutput>
<hr><br>

<form name="form1" action="Survey_insertFeedback.cfm?SrID=#SrID#" method="post" onSubmit="return check();">
<strong>Your Comments:</strong><br><br>
<textarea name="comments" wrap="virtual" cols="35" rows="5"></textarea>
<br><br>
<input type="submit" value="Submit >>">
</form>
<br><br><br>

</cfoutput>
<br><br>
<div align="center"><a href="##" onClick="window.close();"><strong>- Cancel-</strong></a></div>
</body>
</html>
