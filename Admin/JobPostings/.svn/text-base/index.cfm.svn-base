<cfparam name="url.e" default="0">
<cfmodule template="#Application.header#" section="0" sectiontitle="Site Admin">
  <cfoutput>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="160"><br>
		    <cfmodule template="#Application.tagdir#/adminnav.cfm" level="2">
		   </td>
		   <td valign="top"><br>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>IPRA Job Postings</h3></td>
		        </tr>
		      </table>
			  <table border="0" cellpadding="6" cellspacing="0" width="100%">
		        <tr>
				   <td width="50%" valign="top">
				     <table border="0" cellpadding="0" cellspacing="0" width="100%">
                           <cfquery name="GetNewJobs" datasource="#Application.dsn#">
						    Select JobId, MemberID, JobTitle, AgencyName, DateEntered
							From JobPostings
							where DateApproved is null
							and Approved = 0
							order by dateentered desc
						  </cfquery>
						  
						  <tr>
                            <td bgcolor="##003366"><strong style="color:##ffffff;">New Job Posting</strong></td>
                          </tr> 
						  <cfif GetNewJobs.recordcount GT 0>
							  <tr>
							    <td>
								  <strong style="color:##cc0000;size:10px;">* Member Posted</strong>
								  <table border="0" cellpadding="3" cellspacing="1" width="100%" bgcolor="eeeeee">
	                                 <tr>
	                                   <td>Date Posted</td>
									   <td>Agency</td>
									   <td>Job Title</td>
	                                 </tr>
									 <cfloop query="GetNewJobs">
										 <tr bgcolor="ffffff">
		                                   <td><a href="Approvejobs.cfm?jobID=#JobId#">#DateFormat(GetNewJobs.DateEntered, 'mm/dd/yyyy')#</a></td>
										   <td>#GetNewJobs.AgencyName#</td>
										   <td>#GetNewJobs.JobTitle# <cfif memberid NEQ ""><strong style="color:##cc0000;">*</strong></cfif></td>
		                                 </tr>
									 </cfloop>
	                              </table>
								</td>
							  </tr>
						 <cfelse>
						  <tr>
						     <td class="regtext"><strong style="color:##969696;">There are no Job Postings to Approve</strong></td>
						  </tr>	  
						 </cfif>
                     </table>
				   </td>
				   <cfquery name="GetCat" datasource="#Application.dsn#">
						Select Codevalue, codeDesc 
						From Lookup L
						Where L.CodeGroup = 'JOBCAT'
						Order By CodeValue, CodeDesc					  
					</cfquery>
					
					
					<cfquery name="GetPricing" datasource="#Application.dsn#">
					    Select Distinct P.ProductCategory, L.Codedesc as jobcategory 
					    From Products P, Lookup L
					    Where P.ProductType = '01'
					    AND L.CodeGroup = 'ORDERCAT'
					    AND L.CodeValue = P.ProductCategory 
					  </cfquery>
		           <td class="RegText" width="50%" align="right" valign="top">
				      <cfif url.e EQ 1>
						    <p class="errorText"><strong>Error!</strong> You must select a criteria to search by</p>
					 </cfif>
				      <form name="search" action="SearchJobs.cfm" method="POST">
					  <table border="0" cellpadding="1" cellspacing="1" width="250" bgcolor="eeeeee">
					  <tr>
					    <td>
						  
							  <table border="0" cellpadding="3" cellspacing="0" bgcolor="ffffff" width="100%">
		                          <tr bgcolor="eeeeee">
		                            <td><strong>Search For Job Postings</strong></td>
		                          </tr>  
								  <tr>
								    <td><strong>Job Type:</strong><br>
									    <select name="JobType">
										       <option value="">-- Select one --</option>
										       <cfloop query="Getpricing">
										        
											        <option Value="#GetPricing.ProductCategory#">#GetPricing.jobcategory#</option>
											      
											   </cfloop>
											</select>
									</td>
								  </tr>
								  <tr>
								    <td><strong>Category:</strong><br>
									    <select name="JobCategory">
										            <option value="">-- Select one --</option>
										       <cfloop query="GetCat">
										        
											        <option Value="#GetCat.codeValue#">#GetCat.CodeDesc#</option>
											      
											   </cfloop>
											</select>
									</td>
								  </tr>
								 
								  <tr>
								    <td><strong>Posted Since:</strong><br>
									    <input type="text" name="Posted" size="12" maxlength="15">
									</td>
								  </tr>
								  <tr>
								    <td><input type="submit" name="submit" value="Search"></td>
								  </tr>
		                      </table>
						  
						</td>
					  </tr>
					 </table> 
					 </form>
				   </td>
		        </tr>
		       </table>
			   <br><br>
		 </td>
     </tr>
</table>  
</cfoutput>
<cfmodule template="#Application.footer#">