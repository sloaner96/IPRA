<cfmodule template="#Application.header#" section="0" sectiontitle="Job Opportunities Bulletin">
<table border="0" cellpadding="4" cellspacing="0" width="100%">
   <tr>
      <td valign="top" width="160"><br>
		    <cfmodule template="#Application.tagdir#/aboutusNav.cfm" level=3></td>
	  <td valign="top"><br>
	    <table border="0" cellpadding="3" cellspacing="0" width="100%">
           <tr>
              <td><h3>Job Opportunities Bulletin</h3></td>
           </tr>
        </table>
		<cfif Not IsDefined("url.Cat") AND Not IsDefined("url.JType")>
		<table border="0" cellpadding="3" cellspacing="0" width="100%">
          <tr class="regtext">
            <td>Welcome to the IPRA Job Opportunities Bulletin. Click on the links below to view job postings.</td>
          </tr>
        </table>
		<br>
		<cfquery name="GetJobCats" datasource="#Application.dsn#">
		   Select Distinct J.JobType, J.Category, L.CodeDesc as JobCategory,
		     (Select CodeDesc
			   From Lookup
			    Where J.JobType= CodeValue
				AND CodeGroup = 'JobCat') as JobTypeDesc
		     From JobPostings J, lookup L
			 Where J.category = L.Codevalue
			 AND L.CodeGroup = 'OrderCat'
			 AND Approved = 1
			 AND EndDate >= #CreateODBCDateTime(now())#
			 Order BY Category
		</cfquery>
		<table border="0" cellpadding="3" cellspacing="0" width="100%">
           <cfoutput query="GetJobCats" group="Category">
			   <tr bgcolor="eeeee">
	             <td class="regtext"><strong>#GetJobCats.JobCategory#</strong></td>
	           </tr>
			   <cfoutput>
			     <tr>
	                <td class="regtext"><a href="Careers.cfm?Jtype=#GetJobCats.Category#&CatID=#GetJobCats.JobType#">#JobTypeDesc#</a></td>
	             </tr>
			   </cfoutput>
			   <tr>
			     <td>&nbsp;</td>
			   </tr>
		   </cfoutput>
         </table>
		<cfelse>
		   <table border="0" cellpadding="3" cellspacing="0" width="100%">
          <tr class="regtext">
            <td></td>
          </tr>
        </table>
		<br>
		<cfquery name="GetJobs" datasource="#Application.dsn#">
		   Select J.JobId, J.JobType, J.JobTitle, J.Category, J.AgencyName,
		     (Select CodeDesc
			   From Lookup
			    Where CodeValue = J.JobType
				AND CodeGroup = 'JOBCat') as JobTypeDesc,
			 (Select CodeDesc
			   From Lookup
			    Where CodeValue = J.Category
				AND CodeGroup = 'OrderCat') as CatName
		   From JobPostings J
		   Where (CATEGORY = <cfqueryparam value="#Url.JType#" cfsqltype="CF_SQL_VARCHAR">
		   AND JobType = <cfqueryparam value="#Url.CatID#" cfsqltype="CF_SQL_VARCHAR">)
		   And Approved = 1 
		   AND EndDate >= #CreateODBCDateTime(now())#
		   Order By DateEntered Asc, JobTitle
		</cfquery>
		<table border="0" cellpadding="3" cellspacing="0" width="100%">
            <cfset RowsPerPage = 30>
			<cfset TotalRows = GetJobs.recordcount>
			<cfparam name="url.nstart" default="1">
			<cfset EndRow = Min(url.Nstart + RowsPerPage - 1, TotalRows)>
			<cfset StartRowNext = EndRow + 1>
			<cfset StartRowback = Url.nstart - RowsPerPage>
			
		   <cfoutput>
		     <tr>
			   <td colspan=2>
			     <div align="right"><a href="##" onclick="javascript:history.back();"><< Click to go back</a></div>
			     <table border="0" cellpadding="0" cellspacing="0" width="100%">
                   <tr bgcolor="ffffff">
			          <td><font face="verdana" color="000000" size="-1">Displaying <strong>#Url.nstart#</strong> to <strong>#EndRow#</strong> of <strong>#TotalRows#</strong></font></td>
				      <td>&nbsp;</td>
					  <td align="right">
					    <table border="0" cellpadding="3" cellspacing="0" align="right">
		                  <tr>
						   <cfif startrowBack GT 0>
		                     <td align="right"><a href="Careers.cfm?Jtype=#url.Jtype#&CatID=#Url.CatID#&nstart=#StartRowBack#"><font face="verdana" size="-2"><< BACK</font></a></td>
						   </cfif>
						   <cfif StartRowNext LT TotalRows>
							 <td align="right"><a href="Careers.cfm?Jtype=#url.Jtype#&CatID=#Url.CatID#&nstart=#StartRowNext#"><font face="verdana" size="-2">NEXT >></font></a></td>
						   </cfif>	
		                  </tr>
		                </table>
					</td>
			       </tr>  
                 </table>
			   </td>
			 </tr> 
			 <tr bgcolor="eeeee">
	             <td class="regtext" colspan=2><strong>#GetJobs.JobTypeDesc# > #GetJobs.CatName#</strong></td>
	         </tr>
			</cfoutput>
			    
			<cfoutput Query="GetJobs" startrow="#url.nstart#" maxrows="#RowsPerPage#">
			  <tr class="regtext">
	             <td><a href="CareerDetail.cfm?Jtype=#GetJobs.JobType#&CatID=#GetJobs.Category#&JobID=#GetJobs.JobID#">#GetJobs.JobTitle#</a></td>
				 <td>#GetJobs.AgencyName#</td>
	          </tr>
			 </cfoutput>
			   <tr>
			     <td>&nbsp;</td>
			   </tr>
		   
         </table>
		</cfif> 
	  </td> 
   </tr>
</table>
<br><br>
<cfmodule template="#Application.footer#">