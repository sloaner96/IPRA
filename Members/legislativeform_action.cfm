<cfset ErrorList = ArrayNew(1)>
<!--- Check For General Content Errors --->

<!--- Check Info --->
<CFIF Form.first_name is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>First Name</b> field")>
</CFIF>
<CFIF Form.last_name is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Last Name</b> field")>
</CFIF>
<CFIF Form.email is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Email</b> field")>
</CFIF>
<CFIF Form.phone is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Phone</b> field")>
</CFIF>
<CFIF Form.email is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Email</b> field")>
</CFIF>

<cfif ArrayLen(ErrorList) eq 0>
	<cfmail to="bill@ilipra.org" from="webmaster@ilipra.org" subject="Legislative Form Follow Up" type="html" server="#Application.Mailserver#" username="#Application.MailUser#" password="#Application.MailPassword#">
		An Individual submitted a Legislative Form Follow up.
		<br><br>
		<cfloop index="x" list="#form.fieldnames#">
		    <CFIF X contains "submit">
		
		    <cfelse>
		        #x#: #Evaluate(x)#<br>
		    </cfif>
		</cfloop>
	
	</cfmail>
</cfif>

<cfmodule template="#Application.header#" sectiontitle="Legislative Form Follow Up">
  <cfoutput>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top"><br>
	         <cfmodule template="#Application.tagdir#/membersnav.cfm">
		   </td>
		   <td valign="top"><br>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>Legislative Form Follow Up</h3></td>
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
				    
                        <p>Thank you <strong>#Form.first_name# #Form.last_name# </strong> for completing the Legislative Form Follow Up. Your information has been sent to the appropriate person at the IPRA.</p>
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