<!--- Validation --->
<cfif Len(trim(form.username)) EQ 0>
  <cflocation url="changelogin.cfm?e=1" addtoken="no">
</cfif>

<cftry>
<cfinvoke 
 webservice="http://www.webservicex.net/ValidateEmail.asmx?WSDL"
 method="isValidEMail"
 returnvariable="isValidEMailRet">
	<cfinvokeargument name="emailAddress" value="#form.username#"/>
</cfinvoke>
<cfcatch type="ANY">
  <cfset IsValidEmailRet = true>
</cfcatch>

</cftry>

<cfif NOT isValidEMailRet>
   <cflocation url="changelogin.cfm?e=1" addtoken="no">
</cfif>

<cfif Len(trim(form.password1)) EQ 0>
  <cflocation url="changelogin.cfm?e=2" addtoken="no">
</cfif>

<cfif Len(trim(form.password2)) EQ 0>
  <cflocation url="changelogin.cfm?e=3" addtoken="no">
</cfif>

<cfif password1 NEQ password2>
  <cflocation url="changelogin.cfm?e=4" addtoken="no">
</cfif>

<!--- Update db --->
 <cfquery name="UpdateUser" datasource="#Application.dsn#">
   Update Members
   Set Email = '#form.username#',
       Password = '#form.password2#'
  Where MemberID = #session.userinfo.memberid#   
 </cfquery>

<!--- Email user their new login info --->
<cfmail to="#form.username#" 
        from="webmaster@ilipra.org" 
		subject="New Login Information for ILIPRA.ORG" server="#Application.mailserver#">
Dear #Session.userinfo.Firstname#,

Thank you for updating your login information. At the IPRA we take security seriously, if you have any questions about why we have changed your login information please contact Dean Comber at dean@ilipra.org

Keep your login and password for future reference.

Username: #form.username#
password: #form.password1#

If you did not initiate this email, please contact the Illinois Park and Recreation Association
at webmaster@ilipra.org 

====================================================
PLEASE DO NOT RESPOND TO THIS AUTO-GENERATED MESSAGE
====================================================
</cfmail> 
<!--- Kick the user to the main member only page --->

<cflocation url="index.cfm" addtoken="no"> 