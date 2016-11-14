<cfset ErrorList = ArrayNew(1)>
<!--- Check For General Content Errors --->

<!--- Check Info --->
<CFIF Form.Name is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Name</b> field")>
</CFIF>
<CFIF Form.email is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Email</b> field")>
</CFIF>
<CFIF Form.workphone is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Work Phone</b> field")>
</CFIF>
<CFIF Form.Agency is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Agency Name</b> field")>
</CFIF>

<cfif ArrayLen(ErrorList) eq 0>
	<cfmail to="mike@ilipra.org" from="webmaster@ilipra.org" subject="2006 Western Open Volunteer Form" type="html" server="#Application.Mailserver#" username="#Application.MailUser#" password="#Application.MailPassword#">
		An Individual signed up as a volunteer for the 2006 Cialis Western Open. Below is the information they submitted.
		<br><br>
		<cfloop index="x" list="#form.fieldnames#">
		    <CFIF X contains "submit">
		
		    <cfelse>
		        #x#: #Evaluate(x)#<br>
		    </cfif>
		</cfloop>
	
	</cfmail>
</cfif>

<cfmodule template="#Application.header#" sectiontitle="Western Open Volunteer Registration">
  <cfoutput>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top"><br>
	         <cfmodule template="#Application.tagdir#/resourcenav.cfm">
		   </td>
		   <td valign="top"><br>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>Western Open Volunteer Registration</h3></td>
		        </tr>
		      </table>
			  <cfif ArrayLen(ErrorList) gt 0>
					<font face="Verdana,Arial" size="-1">
					<h4><font color="Maroon">Problem(s) were encountered with your Application</font></h4>
					<p>Your transaction could not be completed because:</p>
					<ol>
					<cfloop INDEX="i" FROM="1" TO="#ArrayLen(ErrorList)#">
					<li><p>#ErrorList[i]#</p></li>
					</cfloop>
					</ol>
					<div align=center><form><input type="Button" name="" value="Click here to correct Errors Now" align="ABSMIDDLE" onclick="history.back()"></form></div>
					</font>
			  <cfelse> 					
			  <table border="0" cellpadding="6" cellspacing="0" width="100%">
		        <tr>
		           <td class="RegText">
				    <p align="center"><img src="/images/cialiswologo.gif" alt="" border="0"><p/><p></p>
                        <p>Thank you <strong>#Form.Name#</strong> for registering for the 2006 Cialis Western Open. Your information has been sent to the appropriate person at the IPRA.</p>
				   </td>
		        </tr>
		       </table>
			   <br>
			   </cfif>
			   <br><br>
		 </td>
     </tr>
</table>  
</cfoutput>
<cfmodule template="#Application.footer#">