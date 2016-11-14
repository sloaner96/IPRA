
<!--- Validate the Form Data --->
<!--- <cftry>
<cfinvoke 
 webservice="http://www.webservicex.net/ValidateEmail.asmx?WSDL"
 method="isValidEMail"
 returnvariable="isValidEMailRet">
	<cfinvokeargument name="emailAddress" value="#form.visEmail#"/>
</cfinvoke>
<cfcatch type="ANY">
  <cfset IsValidEmailRet = true>
</cfcatch>

</cftry> --->
<cfset isValidEMailRet = True>
<cfif isValidEMailRet>
<!--- Send Email --->
<cfmail to="webmaster@ilipra.org" 
        from="webmaster@ilipra.org" 
		subject="Website Comment Submission." 
		server="#Application.Mailserver#" username="#Application.MailUser#" password="#Application.MailPassword#">
Name: #form.VisName#
Title: #form.VisTitle#
Company: #form.VisCompany#
Phone: #form.VisPhone#
Email: #form.VisEmail#

This is regarding: <cfif form.service IS 1>General Comment<cfelseif form.service IS 2>Information Request<cfelseif form.service IS 3>Contact Me<cfelseif form.service IS 3>Other</cfif>
----------------------------
Comments:
 #form.VisComment#</cfmail> 
<!--- Finish and Say thank You --->
<cfmodule template="#Application.header#" section="0" sectiontitle="Thank You for Contacting the IPRA">
 <cfoutput>
   <table border=0 cellpadding=1 cellspacing=1 width="100%">
     <tr>
	 <td valign="top" width="168"><br>
		    <cfmodule template="#Application.tagdir#/aboutusnav.cfm">
		   </td> 
	      <td valign="top"><br>
		       <h3>Thank You</h3>
		        <table border=0 cellpadding=0 cellspacing=0>
	             <tr>
	               <td class="regtext"><strong>Thank you for your comments #form.VisName#.</strong></td>
	             </tr>
	           </table>
		  </td>
     </tr>
   </table>
  </cfoutput> 
 <br><br>
<cfmodule template="#Application.footer#">
<cfelse>
  <!--- <cflocation url="ContactUS.cfm?e=1" addtoken="no"> --->
  <meta http-equiv="refresh" content="0;url=ContactUS.cfm?e=1">
</cfif>
