<cfmodule template="#Application.header#" section="0" sectiontitle="Site Admin">

	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="160"><br>
		    <cfmodule template="#Application.tagdir#/adminnav.cfm" level="1">
		   </td>
		   <td valign="top"><br>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>Category Administration</h3></td>
		        </tr>
		      </table>
			  <table border="0" cellpadding="6" cellspacing="0" width="100%">
		        <tr>
		           <td class="RegText">
<cfif NOT IsDefined("URL.CG")>
	<!--- <cflocation url="index.cfm"> --->
	<meta http-equiv="refresh" content="0;url=index.cfm">
</cfif>

<cfquery name="Cats" datasource="#Application.DSN#">
	SELECT * From Lookup
		WHERE CodeGroup = '#URL.CG#'
	ORDER BY CodeValue	
</cfquery>

<br>
<cfform name="AddCat" action="CatProcess.cfm" method="POST" scriptsrc="/scripts/cfform.js">

<table border="1" cellspacing="0" cellpadding="3" align="right" bordercolor="Black" bgcolor="#F3F3F3">
<tr valign=center>
	<td align=left>
	<cfoutput><input type="hidden" name="CG" value="#URL.CG#"></cfoutput>
	<font face="Verdana" size="-1"><b>New Entry Code:</b></font><br>
	<cfinput type="text" name="CValue" value="" size=10 maxlength=15 required="Yes" Message="Please provide a Unique code for this entry"><br>
	<font face="Verdana" size="-1"><b>Description:</b></font><br>
	<cfinput type="text" name="CDesc" value="" size=25 maxlength=150 required="Yes" Message="Please provide a description for this code"><br>
<!---	<font face="Verdana" size="-1"><b>Contact Email:</b></font><br>
	<cfinput type="text" name="Email" value="" size=25 maxlength=150 required="No"><br> --->
	<div align=center><input type="submit" name="Cmd" value="Save Entry"></div>
	</td>
</tr>
</table>
</cfform>


<center>
<table width=350 border=0 cellpadding=1 cellspacing=5>
<tr bgcolor="#F3F3F3">
	<th width=100 align=left>Code</th>
	<th width=250 align=center>Description</th>
</tr>

<CFOUTPUT Query="Cats">
<tr valign=top>
	<td width=100 align=left><font face="Verdana,Arial" size="-1"><a href="UpdCode.cfm?ID=#LookupID#">#CodeValue#</a></font></td>
	<td width=250 align=left><font face="Verdana,Arial" size="-1">#CodeDesc#</font></td>
</tr>
</CFOUTPUT>

</table>

				   </td>
		        </tr>
		       </table>
			   <br><br>
		 </td>
     </tr>
</table>  

<cfmodule template="#Application.footer#">