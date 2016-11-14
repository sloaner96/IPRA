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
		          <td><h3>Job Opportunities Bulletin</h3></td>
		        </tr>
		      </table>
			  <table border="0" cellpadding="6" cellspacing="8" width="100%">
		        <tr>
		           <td class="RegText"><p><img src="/images/ParkRecJobsLogomain.jpg" alt="" border="0" align="left"><br>The Illinois Park & Recreation Association’s Park & Rec JOBS is the #1 place to search jobs, post jobs and post resumes for the parks and recreation field.</p>
<p><strong>NOTE:</strong> Posting a resume is a free of charge. In order to view resumes in our database, you must have a current job posted. An email confirmation with a username and password will be sent to the contact person at the agency which posted the job.</p> 
<p>In order to apply for a job online, you must create a resume and login with the username and password provided while creating a resume.</p></td>
		        </tr>
				<table border="0" cellpadding="6" cellspacing="3" width="100%">
				<tr class="RegText">
				<cfoutput>
				  <td width="200" align="center"><a href="#Application.secureURL#/Careers/JobPostingApp.cfm"><img src="/images/PostJobsLogo1.jpg" border="0" align="center"></a></td>
<td width="200" align="center"><a href="#Application.secureURL#/Careers/Resume/index.cfm"><img src="/images/PostResumesLogo1.jpg" border="0" align="center"></a></td>
<td width="200" align="center"><a href="careers.cfm"><img src="/images/SearchJobsLogo1.jpg" border="0" align="center"></a></td>
</cfoutput>
				</tr>
				
				<tr class="RegText">
				  <cfoutput>
				  <td width="200" align="center"><a href="#Application.secureURL#/Careers/JobPostingApp.cfm"><strong>Post Job Openings</strong></a></td>
<td width="200" align="center"><a href="#Application.secureURL#/Careers/Resume/index.cfm"><strong>Post Resumes</strong></a></td>
<td width="200" align="center"><a href="careers.cfm"><strong>Search Jobs</strong></a></td>
				</cfoutput>
				</tr>
				<tr class="RegText">
				<td width="200" valign="top" align="center"><strong>Need to fill a position?</strong> <p>At approximately 1/10th the cost of an ad in the Chicago Tribune, we’ll get you qualified applicants in record time!</p></td>
<td width="225" valign="top" align="center"><strong>Want agencies to contact you?</strong> <p>Post your resume and cover letter online and watch the job opportunities come your way! You can also apply for jobs directly online with your saved resume and cover letter.</p></td>
<td width="200" valign="top" align="center"><strong>Looking for a new job?</strong> <p>Search the online job postings and see if there’s something for you. This is the place to find your next career move.</p>
</td>
				</tr>
				<!---  
				<cfquery name="GetPricing" datasource="#Application.dsn#">
				  Select P.*, L.Codedesc as jobcategory 
				  From Products P, Lookup L
				  Where P.ProductType = '01'
				  AND L.CodeGroup = 'ORDERCAT'
				  AND L.CodeValue = P.ProductCategory
				  Order By L.Ranking, P.ProductQty 
				</cfquery>
				<tr>
				  <td class="RegText" align="center">
				     <table border="0" cellpadding="5" cellspacing="1" bgcolor="eeeee" class="RegText">
                       <cfoutput query="GetPricing" group="ProductCategory">
					    <tr bgcolor="##003366">
                          <td colspan="3"><strong style="color:ffffff;">#JobCategory#</strong></td>
                        </tr>
						<tr>
						  <td><strong>Term</strong></td>
					      <td><strong>Member Price</strong></td>
						  <td><strong>Non-Member Price</strong></td>
					    </tr>
						 <cfoutput>
							<tr bgcolor="##ffffff">
							  <td>#ProductName#</td>
							  <td>#DollarFormat(MemberPrice)#</td>
							  <td>#DollarFormat(NonMemberPrice)#</td>
							</tr>
						 </cfoutput>
						  <tr bgcolor="##ffffff"><td colspan=3>&nbsp;</td></tr>
					   </cfoutput>	--->
					   <tr><td class="regtext" colspan="3"><br><br><p align="center"><a href="/careers/rates.cfm" target="_blank">View our current job posting rates</a></p></td></tr>
                     </table>
					 
                  </td>
				</tr>
				<tr><td>&nbsp;</td></tr>
				</table>
			   <br><br>
			   
		 </td>
		 
     </tr>
	 
</table>  
</table>
<cfmodule template="#Application.Footer#">