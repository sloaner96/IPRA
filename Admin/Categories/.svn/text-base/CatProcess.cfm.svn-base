<CFIF NOT IsDefined("Form.CValue")>
   <meta http-equiv="refresh" content="0;url=index.cfm">
	<!--- <CFLOCATION URL="index.cfm"> --->
</CFIF>

<cfmodule template="#Application.header#" section="0" sectiontitle="Site Admin">

	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="160"><br>
		    <cfmodule template="#Application.tagdir#/adminnav.cfm" level="1">
		   </td>
		   <td valign="top"><br>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>IPRA Administrative Site</h3></td>
		        </tr>
		      </table>
			  <table border="0" cellpadding="6" cellspacing="0" width="100%">
		        <tr>
		           <td class="RegText">
<cfset ErrorList = ArrayNew(1)>

<cfif Left(Form.Cmd, "6") is not "Delete">
	<cfif Left(Form.Cmd, "4") is "Save" AND Form.CValue is not "">
		<cfquery name="ChkID" datasource="#Application.DSN#">
			SELECT lookupID From Lookup
				WHERE CodeGroup = '#Form.CG#' AND CodeValue = '#Form.CValue#'
		</cfquery>
		<cfif ChkID.RecordCount gt 0>
			<cfset x = ArrayAppend(ErrorList, "Category value <b>#Form.CValue#</b> is already defined!")>
		</cfif>
	</cfif>

	<CFIF #Form.CG# is "*">
		<cfset x = ArrayAppend(ErrorList, "You must specify a <b>Category</b> for this Entry")>
	</CFIF>

	<CFIF #Form.CValue# is "">
		<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Entry Code</b> field")>
	</CFIF>
	
	<CFIF #Form.CDesc# is "">
		<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Description</b> field")>
	</CFIF>

</cfif>

<cfset NErrors = ArrayLen(ErrorList)>
<cfif NErrors gt 0>

	<cfoutput>
	<h4><font face="" color="Maroon">#NErrors# problem(s) encountered with your Submission</font></h4>
	</cfoutput>
	<p>Errors have been found while processing your request.  Please return to the form, correct these errors, and resubmit.</p>
	<ol>
	<cfloop INDEX="i" FROM="1" TO="#NErrors#">
	<cfoutput><li><p>#ErrorList[i]#</p></li></cfoutput>
	</cfloop>
	</ol>
	<div align=center><form><input type="Button" name="" value="Correct Errors Now" align="ABSMIDDLE" onclick="history.back()"></form></div>

<cfelse>

	<!--- ****************************************************** --->
	<!--- Process the Record here 						 --->

	<CFIF Left(Form.Cmd, 4) is "Save">
		<CFQUERY Name="AddRec" Datasource="#Application.DSN#">
			INSERT into Lookup
				(CodeGroup,
				 CodeValue,
				 CodeDesc
				)
			VALUES
				('#Form.CG#',
				 '#Form.CValue#',
				 '#Form.CDesc#'
				)
		</CFQUERY>
		
		<H3 align=center><FONT FACE="Verdana,Arial" COLOR="Blue" size="+1">This Code has been Entered!</FONT></H3>
	<CFELSEIF Left(Form.Cmd, "6") is "Delete">
		<CFQUERY Name="DelInfo" Datasource="#Application.DSN#">
			DELETE From Lookup
				WHERE lookupID = #Form.LookupID#
		</CFQUERY>
		
		<H3 align=center><FONT FACE="Verdana,Arial" COLOR="Blue" size="+1">This Code has been Removed!</FONT></H3>
	<CFELSE>
		<CFQUERY Name="UpdRec" Datasource="#Application.DSN#">
			UPDATE Lookup
			SET
				CodeGroup	= '#Form.CG#',
				CodeValue	= '#Form.CValue#',
				CodeDesc	= '#Form.CDesc#'
			WHERE lookupID = #Form.LookupID#
		</CFQUERY>
		
		<H3 align=center><FONT FACE="Verdana,Arial" COLOR="Blue" size="+1">This Code has been Updated!</FONT></H3>
	</CFIF>
    <cfoutput><meta http-equiv="refresh" content="0;url=ListCodes.cfm?CG=#Form.CG#"></cfoutput>
	<!--- <cflocation url="ListCodes.cfm?CG=#Form.CG#" addtoken="No"> --->

</cfif>

<p align=center><a href="/Admin/"><font face="Tahoma" color="Maroon" size="+1">Return to Admin Page</font></a></p>
				   </td>
		        </tr>
		       </table>
			   <br><br>
		 </td>
     </tr>
</table>  

<cfmodule template="#Application.footer#">
