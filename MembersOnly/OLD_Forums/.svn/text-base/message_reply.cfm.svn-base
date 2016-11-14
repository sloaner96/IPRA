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

<body>
<br><br>
<strong>Respond to Message</strong>
<br><hr>
<cfinclude template="queries/qry_message.cfm">
<cfloop query="message">
	<cfset ReplyTitle=#msgName#>
	<cfset ReplyMessage=#msgMessage#>
</cfloop>
<cfoutput>
<form name="form1" action="message_re_insert.cfm?thID=#thID#&tid=#tid#" method="post">
<input type="hidden" name="replyMessage" value="#ReplyMessage#">
Message Title:<br>
<input type="text" name="msgName" size="45" value="re: #ReplyTitle#"><br><br>
Message:<br>
<textarea name="msgMessage" cols="35" rows="12" wrap="physical"></textarea>
<br>
<input type="submit" value="Post Message >>">
</form>
</cfoutput>
				   </td>
		        </tr>
		       </table>
			   <br><br>
		 </td>
     </tr>
</table>  

<cfmodule template="#Application.footer#">

