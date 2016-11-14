
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
		          <td><h3>Job Postings</h3></td>
		        </tr>
		      </table>
			  <cfif Not IsDefined("form.submit")>
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
			   <form name="search" action="SearchJobs.cfm" method="POST">
					  <table border="0" cellpadding="1" cellspacing="1" width="100%">
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
			  <cfelse>
			    <cfif form.jobtype EQ "" and form.JobCategory EQ "" AND Form.Posted EQ "">
				  <!--- <cflocation url="index.cfm?e=1" addtoken="No"> --->
				  <meta http-equiv="refresh" content="0;url=index.cfm?e=1">
				</cfif>
		
				<cfquery name="GetJobs" datasource="#Application.dsn#">
				    Select JobID, JobTitle, DateApproved, DateEntered, AgencyName, Approved
					From JobPostings
					Where 1 = 1
					<cfif form.JobType NEQ "">
					AND Category = '#form.JobType#'
					</cfif>
					<cfif form.JobCategory NEQ "">
					AND JobType = '#form.JobCategory#'
					</cfif>
					<cfif form.posted NEQ "">
					AND DateEntered >= #Createodbcdate(form.posted)#
					</cfif>
					Order By DateApproved desc, DateEntered desc, JobTitle
				</cfquery> 	
			 
			  
			  <table border="0" cellpadding="3" cellspacing="1" width="100%">
                <cfif GetJobs.recordcount GT 0>
				 <tr>
				   <td colspan=5><strong>Your Search Returned #GetJobs.recordcount# Matches</strong></td>
				 </tr> 
				 <tr bgcolor="##003366">
                   <td><strong style="color:ffffff;">JobTitle</strong></td>
				   <td><strong style="color:ffffff;">Agency</strong></td>
				    <td><strong style="color:ffffff;">Status</strong></td>
				   <td><strong style="color:ffffff;">Date Entered</strong></td>
				   <td><strong style="color:ffffff;">Date Approved/Rejected</strong></td>
                 </tr>
				 <cfloop query="GetJobs">
				   <tr <cfif getjobs.currentrow MOD(2) EQ 0>bgcolor="eeeee"</cfif>>
                   <td><a href="ApproveJobs.cfm?jobID=#GetJobs.JobID#">#GetJobs.JobTitle#</a></td>
				   <td>#GetJobs.AgencyName#</td>
				    <td><cfif GetJobs.Approved EQ 1><font color="##009900">Approved</font><cfelse><font color="##990000">Not Approved</font></cfif></td>
				   <td>#DateFormat(GetJobs.DateEntered, 'mm/dd/yyyy')#</td>
				   <td>#DateFormat(getJobs.DateApproved, 'mm/dd/yyyy')#</td>
                 </tr>
				 </cfloop>
				<cfelse>
				 <tr>
				   <td class="errortext">Your search did not return any matches.<br><a href="SearchJobs.cfm">Click here</a> to search again.</td>
				 </tr> 
				</cfif>
              </table>
			   <br><br> 
			  </cfif>
		 </td>
     </tr>
</table>  
</cfoutput>
<cfmodule template="#Application.footer#">