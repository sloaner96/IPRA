<!---
    $Id: ,v 1.0 2005/12/27 rsloan Exp $
    Copyright (c) 2006 X2 Interactive

    Description: This is the action page for the Create a contact page.  
        
    Parameters: form variables from /careers/resume/CreateContact.cfm
        
    Usage: This will accept form variables and validate them 
	       if they are within the parameters we are looking 
		   for add a contact record and log the user in to the 
		   system, then kick them to the Edit Resume screen.
     
--->
<!--- Initialize component --->

<cfset careers = request.CareersComponent>
<!--- Validate Form --->
    <cfset Error = ArrayNew(1)>
	<!--- Make sure the required fields are here --->
	   <cfif Trim(Len(form.firstname)) EQ 0>
	      <cfset x = ArrayAppend(Error, "Error! You Must include your First name.")>
	   </cfif>
	   
	   <cfif Trim(Len(form.lastname)) EQ 0>
	     <cfset x = ArrayAppend(Error, "Error! You Must include your Last name.")>
	   </cfif>
	   
	   <cfif Trim(Len(form.Email)) EQ 0>
	     <cfset x = ArrayAppend(Error, "Error! You Must include your Email address.")>
	   </cfif>
	   
	   <cfif Trim(Len(form.BestContact)) EQ 0>
	     <cfset x = ArrayAppend(Error, "Error! You Must select a best way to contact you.")>
	   </cfif>
	   
	   <cfif Trim(Len(form.username)) EQ 0>
	     <cfset x = ArrayAppend(Error, "Error! You Must enter a username.")> 
	   <cfelse>
	     <cfif FindNocase(" ", trim(form.password)) GT 0>
		     <cfset x = ArrayAppend(Error, "Error! Your username can not have any spaces in it.")> 
		  </cfif>	 
	   </cfif>
	   
	   <cfif Trim(Len(form.password)) EQ 0>
	     <cfset x = ArrayAppend(Error, "Error! You Must enter a password.")> 
	   <!--- <cfelse>
	      <cfif Len(Trim(form.password)) LT 6>
		     <cfset x = ArrayAppend(Error, "Error! Your password must be at least 6 characters long.")> 
		  </cfif>
		  <cfif ReFindNocase("[[:alnum:]]", trim(form.password)) EQ 0>
		     <cfset x = ArrayAppend(Error, "Error! Your password must be alphanumeric, containting atleast one letter and one number, such as smith1")> 
		  </cfif> --->
	   </cfif>
	
	<!--- Make sure there is not a record already in the databae for this person based on email address --->
       <cfinvoke component="IPRA.Careers" method="checkContactDup" returnvariable="checkCDup">
	      <cfinvokeargument name="firstname" value="#Trim(form.firstname)#" />
		  <cfinvokeargument name="lastname" value="#Trim(form.lastname)#" />
		  <cfinvokeargument name="email" value="#Trim(form.Email)#" />
	   </cfinvoke> 

	<cfif checkCDup>
	   <cfset x = ArrayAppend(Error, "Error! You already have a Resume stored in our system. Please login to maintain your resume. If you have forgotten your login or password use the 'forgot my login link'.")> 
	</cfif>   
    
	<!--- Make sure there is not a record already in the databae with this username--->
       <cfset checkUDup = Careers.checkUsernameDup(Trim(form.username)) >
	   
	<cfif checkUDup>
	      <cfset x = ArrayAppend(Error, "Error! The username <strong>#form.username#</strong> has already been used. Please try another username.")> 
	</cfif>  
<cfif ArrayLen(Error) EQ 0>
	<!--- If Everything looks good add it to the Contact Table, Get the Contact ID, Log the person in and take them to the Edit Resume Screen --->
	      <!--- Create Contact --->
		  <cfinvoke component="IPRA.Careers" method="CreateContact" returnvariable="NewContactID">
		      <cfif IsDefined("form.MemberID")>
			     <cfinvokeargument name="MemberID" value="#Trim(form.memberID)#" />
			  </cfif>
			   
		      <cfinvokeargument name="firstname" value="#Trim(form.firstname)#" />
			  <cfinvokeargument name="lastname" value="#Trim(form.lastname)#" />
			  <cfinvokeargument name="MiddleInitial" value="#Trim(form.middleName)#" />
			  <cfinvokeargument name="Address1" value="#Trim(form.HomeAddr1)#" />
			  <cfinvokeargument name="Address2" value="#Trim(form.HomeAddr2)#" />
			  <cfinvokeargument name="City" value="#Trim(form.City)#" />
			  <cfinvokeargument name="State" value="#Trim(form.State)#" />
			  <cfinvokeargument name="ZipCode" value="#Trim(form.ZipCode)#" />
			  <cfinvokeargument name="HomePhone" value="#ReplaceList(Trim(form.HomePhone), '(,), ,-','')#" />
			  <cfinvokeargument name="WorkPhone" value="#ReplaceList(Trim(form.WorkPhone), '(,), ,-','')#" />
			  <cfinvokeargument name="Mobile" value="#ReplaceList(Trim(form.MobilePhone), '(,), ,-','')#" />
			  <cfinvokeargument name="Email" value="#Trim(form.Email)#" />
			  <cfinvokeargument name="BestContact" value="#Trim(form.BestContact)#" />
			  <cfinvokeargument name="Username" value="#Trim(form.username)#" />
			  <cfinvokeargument name="Password" value="#Trim(form.password)#" />
		   </cfinvoke>  
	      
		  <cfif NewContactID NEQ "">
		  <!--- Get Contact Info --->
		     <cfset ContactInfo = Careers.getContact(newContactID)>
			 
		  <!--- Get Send Confirmation Email --->
		     <cfinvoke component="IPRA.Careers" method="SendConfirmEmail">
				<cfinvokeargument name="email" value="#Trim(form.Email)#" />
				<cfinvokeargument name="subject" value="Thank You for registering for the IPRA Resume Builder" />
				<cfinvokeargument name="firstname" value="#Trim(form.firstname)#" />
				<cfinvokeargument name="lastname" value="#Trim(form.lastname)#" />
				<cfinvokeargument name="username" value="#Trim(form.username)#" />
				<cfinvokeargument name="password" value="#Trim(form.password)#" />
			 </cfinvoke> 
			 
		  	 
		  <!--- Set Session Variables --->
		     <cfset Session.resBuilder.Contact = ContactInfo>
			 
		  <!--- Send to EditResume.cfm --->
		     <cflocation url="EditResume.cfm" addtoken="NO">
		  
	     </cfif>
<cfelse>
	<!--- If there is a probem show the issue and let them click the lnk to correct the error --->
	<cfmodule template="#Application.Header#" sectiontitle="Job Opportunities Bulletin">

    <cfoutput>
		<table border="0" cellpadding="3" cellspacing="0" width="100%">
		   <tr>
		      <td valign="top" width="150">
				<br>
				    <cfmodule template="#Application.tagdir#/aboutusnav.cfm" level="3">
			  </td>
			  <td valign="top"><br>
			    <table border="0" cellpadding="4" cellspacing="0" width="100%">
		          <tr>
		            <td class="errortext"><strong>The following problems were found while attempting to save your contact information.</strong></td>
		          </tr>
				  <cfloop index="i" from="1" to="#ArrayLen(Error)#">
				    <tr>
				       <td>#Error[i]#</td>
				    </tr>
				  </cfloop>
				  <tr>
				    <td><a href="CreateContact.cfm" onclick="history.back();">Click Here</a> to go back and correct these errors.</td>
				  </tr>
		        </table>   
			  </td>
		  </tr>
		</table>  	  
	</cfoutput>
<cfmodule template="#Application.Footer#">	
</cfif>