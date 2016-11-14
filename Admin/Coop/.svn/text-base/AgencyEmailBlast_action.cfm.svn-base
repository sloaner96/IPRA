<cfmodule template="#Application.header#" section="0" sectiontitle="Site Admin">
<cfinclude template="#Application.TagDir#/ISEmail.cfm">
<!--- Validate the form --->
<cfif Len(trim(form.CoopID)) EQ 0>
  <cflocation url="AgencyEmailBlast.cfm?e=1" addtoken="NO">
</cfif>

<cfif Len(trim(form.FromEmail)) EQ 0>
  <cflocation url="AgencyEmailBlast.cfm?e=2&CoopID=#Form.CoopID#" addtoken="NO">
</cfif>

<cfif findnocase("@", form.FromEmail, 1) EQ 0>
  <cflocation url="AgencyEmailBlast.cfm?e=3&CoopID=#Form.CoopID#" addtoken="NO">
</cfif>

<cfif Len(trim(form.Emailsubject)) EQ 0>
  <cflocation url="AgencyEmailBlast.cfm?e=4&CoopID=#Form.CoopID#" addtoken="NO">
</cfif>

<cfif Len(trim(form.emailcontent)) EQ 0>
  <cflocation url="AgencyEmailBlast.cfm?e=5&CoopID=#Form.CoopID#" addtoken="NO">
</cfif>


<!--- Throw Message when done that the emails have been sent --->
<h4 align="Center">You have Successfully Emailed all of the registered user's of the Cooperative Purchase Program.</h4>
<br>
<p align="center"><a href="index.cfm">Click Here</a> to go back to The Coop Admin Homepage</p>
<!--- Get The People to Send the Emails to --->
<cfset sendemailsto = request.CoopAdminComponent.getRegisteredAgency(form.CoopID)>
<!--- Loop over the Registered people and if marked CC to Secondary Contacts--->
<blockquote>
<cfloop query="sendemailsto">

	<cfif ISEmail(sendemailsto.Email)>
	  <cfif Form.SendtoSecondaryContact EQ 0>
		<cfmail from="#form.FromEmail#" 
		        to="#trim(sendemailsto.Email)#" 
				subject="#form.Emailsubject#" 
				server="#Application.MailServer#" 
				username="#Application.MailUser#" 
				password="#Application.mailpassword#">#Form.EmailContent#</cfmail>
	<cfelse>
	  <cfif sendemailsto.SecEmail NEQ "" and IsEmail(sendemailsto.SecEmail)>
	   <cfmail from="#form.FromEmail#" 
		        to="#Trim(sendemailsto.Email)#" 
				cc="#Trim(sendemailsto.SecEmail)#"
				subject="#form.Emailsubject#" 
				server="#Application.MailServer#" 
				username="#Application.MailUser#" 
				password="#Application.mailpassword#">#Form.EmailContent#</cfmail>
	 </cfif> 			
	</cfif>			
	<font face="Verdana" size="-2">Email sent to <strong><cfoutput>#Trim(Sendemailsto.email)#</cfoutput></strong></font><br>
	</cfif>		
</cfloop>

<!--- Send copy to original Sender --->
<cfmail from="#form.FromEmail#" 
        to="#form.FromEmail#" 
		subject="COPY:#form.Emailsubject#" 
		server="#Application.MailServer#" 
		username="#Application.MailUser#" 
		password="#Application.mailpassword#">BELOW IS A COPY OF THE EMAIL YOU JUST SENT:
#Form.EmailContent#</cfmail>
		
</blockquote>
<br><br>
<cfmodule template="#Application.footer#">

