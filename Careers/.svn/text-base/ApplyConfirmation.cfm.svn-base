<cfset getJobInfo = request.CareersComponent.getJobInfo(form.JobID)>
<cfset getResume = request.CareersComponent.getResume(Session.ResBuilder.Contact.ContactID)>

<cfset getResumeContent = request.CareersComponent.getFullResume(getResume.ResumeID)>
<cfset GetWorkHistory = request.CareersComponent.getallWorkHistory(getResume.ResumeID)>
<!--- Get the Data for Education History --->
<cfset GetEducHistory = request.CareersComponent.GetAllEduc(getResume.ResumeID)>
				     
<cfmodule template="#Application.header#" section="0" sectiontitle="Job Opportunities Bulletin: Apply for Job">
<table border="0" cellpadding="4" cellspacing="0" width="100%">
   <tr>
      <td valign="top" width="160"><br>
		    <cfmodule template="#Application.tagdir#/aboutusNav.cfm" level=3></td>
	  <td valign="top">
	    <table border="0" cellpadding="3" cellspacing="0" width="100%">
           <tr>
              <td><h3>Job Opportunities Bulletin: Apply For Job</h3></td>
           </tr>
        </table>
		<!--- make sure they clicked something for the coverletter --->
		    
		  <!--- check to see if they clicked it, more than once --->
		    <cfset checkapplied = request.CareersComponent.checkApplied(form.JobID, getResume.ResumeID)>
			
			<cfif checkapplied.recordcount EQ 0>
		  <!--- Set CoverletterText --->
		    <cfif form.Coverletter EQ "1">
			  <cfset ThisCoverText = getResume.CoverLetterText> 
			<cfelseif form.Coverletter EQ "2">
			  <cfset ThisCoverText = Trim(cvtext)>
			<cfelse>
			   <cfset ThisCoverText = ""> 
			</cfif>
		  
		  <!--- set resumeText ---> 
<cfsavecontent variable="resText">
<cfoutput>
Resume Title: #getResumeContent.ResumeTitle#

Contact Information:
#getResumeContent.Firstname# <cfif getResumeContent.MiddleInitial NEQ "">#getResumeContent.MiddleInitial# </cfif>#getResumeContent.Lastname#
#getResumeContent.Address1#
<cfif getResumeContent.Address2 NEQ "">#getResumeContent.Address2#</cfif>
#getResumeContent.City#, #getResumeContent.State# #getResumeContent.ZipCode#

Preferred Method of Contact: 
<cfif getResumeContent.BestContact EQ "H">Home Phone: #getResumeContent.HomePhone#
<cfelseif getResumeContent.BestContact EQ "W">Work Phone: #getResumeContent.WorkPhone#
<cfelseif getResumeContent.BestContact EQ "M">Mobile Phone: #getResumeContent.Mobile#
<cfelseif getResumeContent.BestContact EQ "E">Email Address: #getResumeContent.Email#</cfif>		

OBJECTIVE: #getResumeContent.ObjectiveText#
SALARY RANGE: #getResumeContent.SalaryRange#	

Cover Letter: <cfif Len(trim(ThisCoverText)) GT 0>#ThisCoverText#<cfelse>Not Displaying</cfif>

WORK HISTORY
<cfloop query="GetWorkHistory">
Dates: #GetWorkHistory.WorkFrom# - #GetWorkHistory.WorkTo#    
Company: #GetWorkHistory.CompanyName#   
Location: #GetWorkHistory.WorkLocation#
Job Title: #GetWorkHistory.JobTitle# 
Job Description: #GetWorkHistory.WorkHistory#
</cfloop>

EDUCATION
<cfloop query="GetEducHistory">
<cfif GetEducHistory.GraduationYr NEQ "">Graduation Date:#GetEducHistory.GraduationYr#</cfif>
School: #GetEducHistory.SchoolName#
Degree Earned: #GetEducHistory.Degreetext#
<cfif GetEducHistory.EducationComment NEQ "">
Comments: #GetEducHistory.EducationComment#
</cfif>
</cfloop>

CERTIFICATIONS	 
#getResumeContent.Certifications#

ADDITIONAL INFORMATION
#getResumeContent.AdditionalInfo#
</cfoutput>
</cfsavecontent>
		  <!--- Send Application --->
		    <cfinvoke component="ipra.careers" method="SendApplication">
			   <cfinvokeargument name="JobID" value="#form.JobID#">
		       <cfinvokeargument name="resumeID" value="#getResume.ResumeID#">
			   <cfif IsDefined("ThisCoverText")> 
		          <cfinvokeargument name="CoverText" value="#ThisCoverText#">
			   </cfif>
		      <cfinvokeargument name="ResumeText" value="#resText#">
		      <cfinvokeargument name="Emailaddr" value="#getJobInfo.ContactEmail#">
		      <cfinvokeargument name="subject" value="IPRA Online Application: (###getJobInfo.JobID#) #getJobInfo.JobTitle#">
			</cfinvoke>
		
	    <!--- Show Confirmation --->   
		  <cfoutput>
			<table border="0" cellpadding="4" cellspacing="0" width="100%">
	           <tr>
	             <td>You have sucessfully sent your resume to <strong>#getJobInfo.AgencyName#</strong> for <strong><em>#getJobInfo.JobTitle#</em></strong></td>
	           </tr>
	        </table>  
		  </cfoutput>  
		  <cfelse>
		    <div align="right"><a href="index.cfm"><< Click to go back</a></div><br>
			<br><br>
			
			<cfoutput>
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                   <td>You applied for this job on #DateFormat(checkapplied.DateSent, 'MM/DD/YYYY')# at #timeFormat(checkapplied.DateSent, 'hh:mm tt')#</td>
                </tr>
             </table> 
			 </cfoutput>
		  </cfif>     
	 </td> 
   </tr>
</table>
<br><br>
<cfmodule template="#Application.footer#">	