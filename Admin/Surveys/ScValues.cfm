<cfif isdefined('form.val_num')>
	<cfset count='#form.val_num#'>
</cfif>


<html>
<head>
	<title>BSO_Surveys v.3.0</title>
	
	<LINK REL=stylesheet HREF="../style.css" TYPE="text/css">
<script language="JavaScript">
function check2() {
var tf=true;
if(document.form2.val_num.value % 1 != 0){
	tf=false;
	}
else if(document.form2.val_num.value == " "){
	tf=false;
	}
else if(document.form2.val_num.value == ""){
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
<strong>Add <a href="##" onclick="help('rating_scale');"><font class="helpfont">Rating Scale</font></a></strong>
<hr><br>
<cfoutput>

Please type the <a href="##" onclick="help('rating_values');"><font class="helpfont">values</font></a> in the corresponding text boxes below:<br><br>
<form name="form1" action="ScValue_finish.cfm?ID=#ID#&count=#count#<cfif isdefined('s')>&s=#s#</cfif><cfif isdefined('SID')>&SID=#SID#</cfif><cfif isdefined('q')>&q=#q#&type=MUL3&scID=#ID#</cfif><cfif isdefined('catID')>&catID=#CatID#</cfif>" method="post">
<cfloop index="x"
		from="1"
		to="#count#">
#x#: <input type="text" name="resp#x#">
<br><br>		
</cfloop>
<input type="submit" value="Continue >>">
</form>
<hr><br>
<strong>OR</strong>
<br><br>
Change number of <a href="##" onclick="help('rating_values');"><font class="helpfont">values</font></a> to:
<br><br>
<form name="form2" onSubmit="return check2();" action="ScValues.cfm?ID=#ID#<cfif isdefined('s')>&s=#s#</cfif><cfif isdefined('SID')>&SID=#SID#</cfif><cfif isdefined('q')>&q=#q#&type=MUL3&scID=#ID#</cfif><cfif isdefined('catID')>&catID=#CatID#</cfif>" method="post">
<input type="text" name="val_num" size="5">
<input type="submit" value="Change >>">
</form>


</cfoutput>
</body>
</html>
