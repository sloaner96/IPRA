<cfset ErrorList = ArrayNew(1)>
<!--- Check For General Content Errors --->

<!--- Check Info --->
<CFIF Form.Name is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Name</b> field")>
</CFIF>
<CFIF Form.email is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Email</b> field")>
</CFIF>
<CFIF Form.phone is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Work Phone</b> field")>
</CFIF>
<CFIF Form.Agency is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Agency Name</b> field")>
</CFIF>
<CFIF Form.choice1 is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Choice 1</b> field")>
</CFIF>
<CFIF Form.choice2 is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Choice 2</b> field")>
</CFIF>
<CFIF Form.choice3 is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Choice 3</b> field")>
</CFIF>
<cfif ArrayLen(ErrorList) eq 0>
	<cfmail to="dean@ilipra.org" from="webmaster@ilipra.org" subject="Protégé Registration Form" type="html" server="#Application.Mailserver#" username="#Application.MailUser#" password="#Application.MailPassword#">
		An Individual signed up to be a protégés. Below is the information they submitted.
		<br><br>
		<cfloop index="x" list="#form.fieldnames#">
		    <CFIF X contains "submit">
		
		    <cfelse>
		        #x#: #Evaluate(x)#<br>
		    </cfif>
		</cfloop>
	
	</cfmail>
</cfif>

<cfmodule template="#Application.header#" sectiontitle="Mentoring Committee">
  <cfoutput>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top"><br>
	         <cfmodule template="#Application.tagdir#/resourcenav.cfm">
		   </td>
		   <td valign="top"><br>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>Protégé Registration</h3></td>
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
                        <p><strong>Thank you #Form.Name# for registering, You information has been sent to the Mentoring Committee.</strong></p>
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