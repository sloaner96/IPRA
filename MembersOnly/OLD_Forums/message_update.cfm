<cfmodule template="#Application.header#" section="0" sectiontitle="IPRA Members Forum">

	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <!--- <td valign="top"><br>
	         <cfmodule template="#Application.tagdir#/certnav.cfm">
		   </td> --->
		   <td valign="top"><br>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>IPRA Members Forum</h3></td>
		        </tr>
		      </table>
			  <table border="0" cellpadding="6" cellspacing="0" width="100%">
		        <tr>
		           <td align="center" class="regtext">
<br><br>

<!--- parse message and insert html line breaks --->
<cfset form.msgMessage=#replace(form.msgMessage, chr(10),'<br>','all')#>

<CFquery datasource="#ds#" name="update">
UPDATE tblMessages
SET
msgName='#form.msgName#',
msgMessage='#form.msgMessage#'
WHERE msgID=#msgID#
</CFQUERY>

<cfoutput>
<br><br><br>
<div align="center">Message Updated
<br><br>
<meta http-equiv="refresh" content="0;url=messages.cfm?thid=#ThID#&tid=#tid#">
</div>
</cfoutput>
				   </td>
		        </tr>
		       </table>
			   <br><br>
		 </td>
     </tr>
</table>  

<cfmodule template="#Application.footer#">
