<CFIF NOT IsDefined("URL.ID")>
    <meta http-equiv="refresh" content="0;url=index.cfm">
	<!--- <CFLOCATION URL="index.cfm"> --->
</CFIF>

<CFQUERY Name="GetCat" Datasource="#Application.DSN#">
	SELECT * from Lookup
		WHERE lookupID = #URL.ID#
</CFQUERY>

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
<p align=center>Use this form to modify or delete the category information displayed below.</p>


<CFLOOP Query="GetCat">

<CFFORM Name="UpdCat" Action="CatProcess.cfm" scriptsrc="/scripts/cfform.js">
<CFOUTPUT>
<input name="LookupID" type="hidden" value="#URL.ID#">
<input type="hidden" name="CG" value="#CodeGroup#">
<input type="hidden" name="CValue" value="#CodeValue#">
</CFOUTPUT>

<table width="100%" border=0 cellspacing=1 cellpadding=3>
<tr>
	<td width=120 align=left><font face="Verdana,Arial" size="-1"><b>Category Type</b></font>:</td>
	<td width=* align=left><font face="Verdana,Arial" size="-1"><cfoutput>#CodeGroup#</cfoutput></font></td>
</tr>

<tr>
	<td width=120 align=left><font face="Verdana,Arial" size="-1"><b>Entry Code</b></font>:</td>
	<td width=* align=left><font face="Verdana,Arial" size="-1"><cfoutput>#CodeValue#</cfoutput></font></td>
</tr>

<tr valign=top>
	<td width=120 align=left><font face="Verdana,Arial" size="-1"><b>Description</b></font>:</td>
	<td width=* align=left><cfinput name="CDesc" type="text" value="#CodeDesc#" size=45 maxlength=150 required="Yes" Message="Please provide a description for this code"></td>
</tr>

<!---
<tr valign=top>
	<td width=120 align=left><font face="Verdana,Arial" size="-1"><b>Contact Email</b></font>:</td>
	<td width=* align=left><cfinput name="Email" type="text" value="#Email#" size=45 maxlength=150 required="No"></td>
</tr>
--->

<tr valign=bottom>
	<td align=center><br><input type="submit" name="Cmd" value="Delete Code" onClick="return confirm('Are you sure you want to delete this?');"></td>
	<td width=* align=center>
			<input type="Submit" name="Cmd" value="Update Code"> 
			<input type="reset"  name="Cmd" value="Reset Form">
		</td>
	</td>
</tr>

</table>

</CFFORM>
</CFLOOP>
				   </td>
		        </tr>
		       </table>
			   <br><br>
		 </td>
     </tr>
</table>  

<cfmodule template="#Application.footer#">