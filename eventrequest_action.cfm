<cfset ErrorList = ArrayNew(1)>
<!--- Check For General Content Errors --->

<!--- Check Info --->
<CFIF Form.eventname is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Event Name</b> field")>
</CFIF>
<!---  <CFIF Form.whoshouldattend is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Event Name</b> field")>
</CFIF>--->
<CFIF Form.email is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Email</b> field")>
</CFIF>
<CFIF Form.phone is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Work Phone</b> field")>
</CFIF>
<!---  <CFIF Form.Agency is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Agency Name</b> field")>
</CFIF>--->
<CFIF Form.location is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Location</b> field")>
</CFIF>
<CFIF Form.startdate is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Event Start Date/Time</b> field")>
</CFIF>
<CFIF Form.enddate is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Event End Date/Time</b> field")>
</CFIF>
<!---  <CFIF Form.starttime is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Event Start Time</b> field")>
</CFIF>
<CFIF Form.endtime is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Event End Time</b> field")>
</CFIF>
<CFIF Form.regdeadline is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Registration Deadline</b> field")>
</CFIF>
<CFIF Form.presentedby is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Presented By</b> field")>
</CFIF>--->
<cfif ArrayLen(ErrorList) eq 0>
	<cfmail to="dina@ilipra.org" from="webmaster@ilipra.org" subject="Event Request Form" type="html" server="#Application.Mailserver#" username="#Application.MailUser#" password="#Application.MailPassword#">
		An Individual submitted an Event Submission Form. Below is the information they submitted.
		<br><br>
		<cfloop index="x" list="#form.fieldnames#">
		    <CFIF X contains "submit">
		
		    <cfelse>
		        #x#: #Evaluate(x)#<br>
		    </cfif>
		</cfloop>
	
	</cfmail>
</cfif>

<cfmodule template="#Application.header#" sectiontitle="Event Request Form">
  <cfoutput>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top"><br>
	         <cfmodule template="#Application.tagdir#/aboutusnav.cfm">
		   </td>
		   <td valign="top"><br>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>Event Request Form</h3></td>
		        </tr>
		      </table>
			  <cfif ArrayLen(ErrorList) gt 0>
					<font face="Verdana,Arial" size="-1">
					<h4><font color="Maroon">Problem(s) were encountered with your Event Request</font></h4>
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
                        <p><strong>Thank you #Form.contact# for submitting your event to IPRA, your information has been sent to the appropriate person.</strong></p>
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