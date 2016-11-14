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
<strong>Edit Message</strong>
<br><hr>
<cfinclude template="queries/qry_message.cfm">
<cfoutput>
<cfloop query="message">
<cfset user= Session.Userinfo.MemberID>
<cfif msgUsrID eq #user#>
	<!--- parse message and replace html line breaks --->
	<cfset Title=#msgName#>
	<cfset Message=#replace(msgMessage,'<br>',chr(10),'all')#>
	<form name="form1" action="message_update.cfm?msgID=#msgID#&thID=#thID#&tid=#tid#" method="post">
	Message Title:<br>
	<input type="text" name="msgName" size="45" value="#Title#"><br><br>
	Message:<br>
	<textarea name="msgMessage" cols="35" rows="12" wrap="physical">#Message#</textarea>
	<br>
	<input type="submit" value="Update Message >>">
	</form>
<cfelse>
<br><br><br>
	<div align="center"><strong>SECURITY ERROR: You may only edit your own messages.</strong></div>
</cfif>
</cfloop>
</cfoutput>
				   </td>
		        </tr>
		       </table>
			   <br><br>
		 </td>
     </tr>
</table>  

<cfmodule template="#Application.footer#">
