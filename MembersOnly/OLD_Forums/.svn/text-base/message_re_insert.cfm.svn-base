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
<cfset form.msgMessage="<blockquote><hr><strong>#form.replyMessage#</strong><hr></blockquote>#form.msgMessage#">

<cfset user= Session.Userinfo.MemberID>
<cftransaction>

<cfquery datasource="#ds#" name="getID">
SELECT MAX(msgID) as maxID
FROM tblMessages
</cfquery>

<cfif getID.maxID eq "">
	<cfset newID=1>
<cfelse>
	<cfset newID=#getID.maxID#+1>
</cfif>

<CFquery datasource="#ds#" name="insert">
INSERT INTO tblMessages
(

msgThID,
msgName,
msgMessage,
msgUsrID,
msgDateTime
)
VALUES
(

#thID#,
'#form.msgName#',
'#form.msgMessage#',
#user#,
#CreateODBCDateTime(now())#
)
</CFQUERY>

</cftransaction>
<cfoutput>
<br><br><br>
<div align="center">Message Posted
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
