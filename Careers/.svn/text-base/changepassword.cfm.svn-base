<cfset Error = 0>

<cfif IsDefined("form.newpw2")>
	<!--- See if the form has been submitted --->
	 <cfif Len(Trim(form.oldpw)) EQ 0>
	    <cfset Error = 1>
	 </cfif>
	 <cfif Len(Trim(form.newpw)) EQ 0>
	    <cfset Error = 2>
	 </cfif>
	 <cfif Len(Trim(form.newpw2)) EQ 0>
	    <cfset Error = 3>
	 </cfif>
	 
	 <cfif Len(Trim(form.newpw)) LTE 5>
	   <cfset Error = 4>
	 </cfif>
	 
	 <cfif trim(form.newpw) NEQ trim(form.newpw2)>
	   <cfset Error = 5>
	 </cfif>
	 
	 <cfif trim(form.oldpw) NEQ session.ResSearch.password>
	    <cfset Error = 5>
	 </cfif>  
	 
	 <cfif Error EQ 0>
	    <!--- Update the users password and kick them to ResumeSearch.cfm --->
	    <cfset UpdatePW = request.CareersComponent.ChangeSearchPassword(session.ResSearch.JobID, session.ResSearch.username, form.newpw2)>
	    <cflocation url="ResumeSearch.cfm" addtoken="NO">
		<cfabort>
	 </cfif>
</cfif>

<!--- show the users the change password UI --->
<cfmodule template="#Application.Header#" sectiontitle="Job Opportunities Bulletin">

  <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top">
		     <br>
		    <cfmodule template="#Application.tagdir#/aboutusnav.cfm" level="3">
		   </td>
		   <td valign="top">
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>Job Opportunities Bulletin: Change password</h3></td>
		        </tr>
		      </table>
			  <cfif Error GT 0>
			     <cfswitch expression="#Error#">
				    <cfcase value="1">
					    <p><strong class="errorText">Error! You must include the old password</strong></p>
					</cfcase>
					<cfcase value="2">
					    <p><strong class="errorText">Error! You must include the new password</strong></p>
					</cfcase>
					<cfcase value="3">
					    <p><strong class="errorText">Error! You must re-enter the new password in the second box</strong></p>
					</cfcase>
					<cfcase value="4">
					    <p><strong class="errorText">Error! Your new password must be greater than 6 characters in length.</strong></p>
					</cfcase>
					<cfcase value="5">
					    <p><strong class="errorText">Error! Your passwords do not match.</strong></p>
					</cfcase>
					<cfcase value="6">
					    <p><strong class="errorText">Error! Your old password does not match what we have in the database.</strong></p>
					</cfcase>
				 </cfswitch> 
			  </cfif>
			  <p>This is the first time you have logged into the IPRA Job Opprotunities Bulletin Resume Search. Please change your password to something that you will remember more easily. The password must be between 6-15 characters long and should include at least one number.</p>
			  <cfform action="changepassword.cfm" method="POST" scriptsrc="/scripts/cfform.js">
			  <table border="0" cellpadding="0" cellspacing="3" width="100%">
                 <tr>
                   <td><strong>Old Password:</strong></td>
				   <td><cfinput type="password" name="oldpw" value="" size="25" maxlength="15" required="YES" message="You must enter your Old Password."></td>
                 </tr>
				 <tr>
                   <td><strong>New Password:</strong></td>
				   <td><cfinput type="password" name="newpw" value="" size="25" maxlength="15" required="YES" message="You must enter your New Password."></td>
                 </tr>
				 <tr>
                   <td><strong>Re-type Password:</strong></td>
				   <td><cfinput type="password" name="newpw2" value="" size="25" maxlength="15" required="YES" message="You must enter your Old Password."></td>
                 </tr>
				 <tr>
				   <td><input type="submit" name="submit" value="Change Password >>"></td>
				 </tr>
              </table>    
			  </cfform>      
		 </td>
     </tr>
  </table>  

<cfmodule template="#Application.Footer#">

