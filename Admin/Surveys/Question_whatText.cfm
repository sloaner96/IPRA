

<html>
<head>
	<title>BSO_Surveys v.3.0</title>
	
	<LINK REL=stylesheet HREF="../style.css" TYPE="text/css">
<script language="JavaScript">
function check() {
var tf=true;
if(document.form1.Question.value == ""){
	tf=false;
	}
if(tf == false){
	alert('One or more of the required fields was not completed');
	}
return tf;
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
<strong>Add <a href="##" onclick="help('question_text');"><font class="helpfont">Question Text</font></a></strong>
<hr><br>
Enter the question here:
<br><br>
<cfif type eq "TF" or type eq "YN" or type eq "OE">
<form name="form1" onSubmit="return check();" action="Question_finish.cfm?type=#type#&SID=#SID#<cfif isdefined('catID')>&catID=#catID#</cfif>" method="post">
<textarea name="Question" rows="5" cols="35" wrap="virtual"></textarea>
<cfelseif type eq "MUL1" or type eq "MUL2">
<form name="form1" onSubmit="return check();" action="Question_finish.cfm?type=#type#&SID=#SID#<cfif isdefined('catID')>&catID=#catID#</cfif>" method="post">
<textarea name="Question" rows="5" cols="35" wrap="virtual"></textarea>
<cfelse>
<form name="form1" onSubmit="return check();" action="Question_finish.cfm?type=#type#&SID=#SID#&scID=#scID#<cfif isdefined('catID')>&catID=#catID#</cfif>" method="post">
<textarea name="Question" rows="5" cols="35" wrap="virtual"></textarea>
</cfif>
<br><br>
<input type="submit" value="Continue >>">
</form>
</cfoutput>
<br><br>
<div align="center"><a href="##" onClick="window.close();"><strong>- Cancel-</strong></a></div>
<body onload="this.window.focus();">



</body>
</html>
