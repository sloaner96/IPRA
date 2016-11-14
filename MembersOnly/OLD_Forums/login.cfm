<cfmodule template="#Application.header#" section="0" sectiontitle="Maintaining Certification">
  <cfoutput>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top"><br>
	         <cfmodule template="#Application.tagdir#/certnav.cfm">
		   </td>
		   <td valign="top"><br>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>Forum Login</h3></td>
		        </tr>
		      </table>
			  <table border="0" cellpadding="6" cellspacing="0" width="100%">
		        
			    <tr>
		           <td class="RegText" align="center">
					    <form name="form1" action="login_verify.cfm" method="post">
							<table cellpadding="5" cellspacing="0">
								<tr>
									<td>User Name:<br>
									<input type="text" name="username" size="35">
									</td>
								</tr>
								<tr>
									<td>Password:<br>
									<input type="password" name="password" size="35">
									</td>
								</tr>
								<tr>
									<td align="center"><input type="submit" value="Log In"></td>
								</tr>
							</table>
							</form>
                       
                       
				   </td>
		        </tr>
		       </table>
			   <br><br>
		 </td>
     </tr>
</table>  
</cfoutput>
<cfmodule template="#Application.footer#">

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>BSO Forums Login Screen</title>
<LINK REL=stylesheet HREF="style.css" TYPE="text/css">
</head>

<body>



</body>
</html>
