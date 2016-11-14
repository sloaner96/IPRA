

<html>
<head>
	<title>BSO_Surveys v.3.0</title>
	
	<LINK REL=stylesheet HREF="../style.css" TYPE="text/css">
<script language="JavaScript">
function check() {
var tf=true;
if(document.form1.resp_num.value % 1 != 0){
	tf=false;
	}
else if(document.form1.resp_num.value == " "){
	tf=false;
	}
else if(document.form1.resp_num.value == ""){
	tf=false;
	}
if(tf == false){
	alert('One or more of the required fields was not completed');
	}
return tf;
}
</script>

<script language="JavaScript">
function check2() {
var tf=true;
if(document.form2.resp_num.value % 1 != 0){
	tf=false;
	}
else if(document.form2.resp_num.value == " "){
	tf=false;
	}
else if(document.form2.resp_num.value == ""){
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
<strong>Add <a href="##" onclick="help('possible_responses');"><font class="helpfont">Possible Responses</font></a></strong>
<cfoutput>
<hr><br>
<cfif not isdefined('havenum')>
How many <a href="##" onclick="help('possible_responses');"><font class="helpfont">possible responses</font></a> would you like?
<br><br>
<form name="form1" onSubmit="return check();" action="Response_responses.cfm?QID=#QID#&SID=#SID#&havenum=yes" method="post">
<input type="text" name="resp_num" size="5">
<input type="submit" value="Continue >>">
</form>
<cfelse>
Please type the possible responses in the corresponding text boxes below:<br><br>
<form name="form1" action="Response_finish.cfm?QID=#QID#&SID=#SID#&count=#form.resp_num#" method="post">
<cfloop index="x"
		from="1"
		to="#form.resp_num#">
#x#: <input type="text" name="resp#x#">
<br><br>		
</cfloop>
<input type="submit" value="Continue >>">
</form>
<hr><br>
<strong>OR</strong>
<br><br>
Change number of <a href="##" onclick="help('possible_responses');"><font class="helpfont">possible responses</font></a> to:
<br><br>
<form name="form2" onSubmit="return check2();" action="Response_responses.cfm?QID=#QID#&SID=#SID#&havenum=yes" method="post">
<input type="text" name="resp_num" size="5">
<input type="submit" value="Change >>">
</form>
</cfif>
</cfoutput>
</body>
</html>
