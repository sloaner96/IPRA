
<cfmail to="dean@ilipra.org" from="#form.Email#" subject="Section Volunteer Registration" type="html" server="#Application.mailserver#" username="#Application.MailUser#" password="#Application.MailPassword#">
An Individual signed up as an A and F section volunteer. Below is the information they submitted.
<br><br>
<cfloop index="x" list="#form.fieldnames#">
    <CFIF X contains "submit">

    <cfelse>
        #x#: #Evaluate(x)#<br>
    </cfif>
</cfloop>


</cfmail>

<cfmodule template="#Application.header#" section="0" sectiontitle="IPRA Sections">
  <cfoutput>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="160"><br>
		    <cfmodule template="#Application.tagdir#/affilnav.cfm" level="4">
		   </td>
		   <td valign="Top"><br>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>Thank You for Volunteering</h3></td>
		        </tr>
		      </table>
			  <table border="0" cellpadding="6" cellspacing="0" width="100%">
		        <tr>
		           <td class="RegText">
				     Thank you, <strong>#form.Name#</strong>, for volunteering. Your information has been sent to the IPRA. 
				   </td>
		        </tr>
		       </table>
			   <br><br>
		 </td>
     </tr>
</table>  
</cfoutput>
<cfmodule template="#Application.footer#">