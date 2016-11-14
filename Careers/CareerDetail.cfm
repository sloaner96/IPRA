<cfmodule template="#Application.header#" section="0" sectiontitle="Job Opportunities Bulletin">
<cfquery name="GetJobs" datasource="#Application.dsn#">
  Select J.*,
     (Select CodeDesc
	   From Lookup
	    Where CodeValue = J.JobType
		AND CodeGroup = 'JobCat') as JobTypeDesc,
	 (Select CodeDesc
	   From Lookup
	    Where CodeValue = J.Category
		AND CodeGroup = 'OrderCat') as CatName
   From JobPostings J
   Where JobType = <cfqueryparam value="#Url.JType#" cfsqltype="CF_SQL_VARCHAR" maxlength="3">
   AND CATEGORY = <cfqueryparam value="#Url.CatID#" cfsqltype="CF_SQL_VARCHAR" maxlength="3">
   AND JobID = <cfqueryparam value="#Url.JobID#" cfsqltype="CF_SQL_INTEGER">
   Order By DateEntered Asc, JobTitle
</cfquery>
<table border="0" cellpadding="4" cellspacing="0" width="100%">
   <tr>
      <td valign="top" width="160"><br>
		    <cfmodule template="#Application.tagdir#/aboutusNav.cfm" level=3></td>
	  <td>
	    <table border="0" cellpadding="3" cellspacing="0" width="100%">
           <tr>
              <td><h3>Job Opportunities Bulletin</h3></td>
           </tr>
        </table>
		<div align="right"><a href="##" onclick="javascript:history.back();"><< Click to go back</a></div><br>
		<cfoutput query="GetJobs">
		<table width="100%" border="0" cellspacing="0" cellpadding="5" align="center">
             <tr bgcolor="eeeee">
	             <td class="regtext" colspan=2><strong>#GetJobs.CatName# > #GetJobs.JobTypeDesc# </strong></td>
	         </tr>
              <tr class="regtext"> 
                <td valign="top" bgcolor="##006699"> 
                  <strong style="color:ffffff;">Job Title:</strong>
                </td>
                <td valign="top">#GetJobs.JobTitle#</td>
              </tr>
              <tr class="regtext"> 
                <td valign="top" bgcolor="##006699"> 
                  <strong style="color:ffffff;">Closing Date:</strong>
                </td>
                <td valign="top"><cfif GetJobs.JobClosing NEQ "">#GetJobs.JobClosing#<cfelse>Until Filled</cfif></td>
              </tr>
              <tr class="regtext"> 
                <td valign="top" bgcolor="##006699"> 
                  <strong style="color:ffffff;">Agency:</strong>
                </td>
                <td valign="top">#AgencyName#</td>
              </tr>
			  <cfif GetJobs.AgencyURL NEQ "">
	              <tr class="regtext"> 
	                <td valign="top" bgcolor="##006699"> 
	                  <strong style="color:ffffff;">Website:</strong>
	                </td>
	                <td valign="top"><a href="http://#ReplaceList(GetJobs.AgencyURL, 'http://, https://', '' )#" target="_blank">#GetJobs.AgencyURL#</a></td>
	              </tr>
			  </cfif>
			  
			  <cfif GetJobs.JobSalary NEQ "">
	              <tr class="regtext"> 
	                <td valign="top" bgcolor="##006699"> 
	                  <strong style="color:ffffff;">Salary:</strong>
	                </td>
	                <td valign="top">#GetJobs.JobSalary#</td>
	              </tr>
              </cfif> 
			  <tr class="regtext"> 
                <td valign="top" bgcolor="##006699"> 
                  <strong style="color:ffffff;">Posted Date:</strong>
                </td>
                <td valign="top">#DateFormat(GetJobs.DateEntered, 'MM/DD/YYYY')#</td>
              </tr>
              <tr class="regtext"> 
                <td valign="top" bgcolor="##006699"> 
                  <strong style="color:ffffff;">Qualifications:</strong>
                </td>
                <td valign="top">#Replacenocase(GetJobs.JobQualifications, "#chr(13)##Chr(10)#", "<BR>", "All")#</td>
              </tr>
              <tr class="regtext"> 
                <td valign="top" bgcolor="##006699"> 
                  <strong style="color:ffffff;">Duties:</strong>
                </td>
                <td valign="top">#Replacenocase(GetJobs.JobDuties, "#chr(13)##Chr(10)#", "<BR>", "All")#</td>
              </tr>
              <tr class="regtext"> 
                <td valign="top" bgcolor="##006699"> 
                  <strong style="color:ffffff;">Address:</strong>
                </td>
                <td valign="top" >#GetJobs.AgencyAddr#<cfif GetJobs.AgencyAddr2 NEQ ""><br>#GetJobs.AgencyAddr2#</cfif></td>
              </tr>
              <tr class="regtext"> 
                <td valign="top" bgcolor="##006699"> 
                  <strong style="color:ffffff;">City, State Zip:</strong>
                </td>
                <td valign="top" >#AgencyCity#, #AgencyState# #AgencyZip#</td>
              </tr>
              <tr class="regtext"> 
                <td valign="top" bgcolor="##006699"> 
                  <strong style="color:ffffff;"> Contact:</strong>
                </td>
                <td valign="top" >#ContactName#</td>
              </tr>
			  <cfif getJobs.ContactPhone NEQ "">
              <tr class="regtext"> 
                <td valign="top" bgcolor="##006699"> 
                  <strong style="color:ffffff;">Phone:</strong>
                </td>
                <td valign="top" >#GetJobs.ContactPhone#</td>
              </tr>
			  </cfif>
			  <cfif getJobs.ContactEmail NEQ "">
	              <tr class="regtext"> 
	                <td valign="top" bgcolor="##006699"> 
	                  <strong style="color:ffffff;">Contact Email:</strong>
	                </td>
	                <td valign="top"><a href="mailto:#GetJobs.ContactEmail#?subject=IPRA Job Posting: #GetJobs.JobTitle#">#GetJobs.ContactEmail#</a></td>
	              </tr>
			  </cfif>
			  <cfif getJobs.ContactFax NEQ "">
	            <tr class="regtext"> 
	              <td valign="top" bgcolor="##006699"> 
	                <strong style="color:ffffff;">Contact Fax:</strong>
	              </td>
	              <td valign="top">#GetJobs.ContactFax#</td>
	            </tr>
			  </cfif>
			  
			  <cfif getjobs.AllowApp EQ 1>
			     <tr class="regtext"> 
	              <td valign="top" colspan="2" align="center"><a href="ApplyForJob.cfm?JobID=#getJobs.JobID#"><img src="/images/btn_applyjob.gif" alt="Click to Apply for Job Today" border="0" vspace="10" hspace="10"></a></td>
	            </tr>
			  </cfif>
            </table>
		</cfoutput>	
	  </td> 
   </tr>
</table>
<br><br>
<cfmodule template="#Application.footer#">