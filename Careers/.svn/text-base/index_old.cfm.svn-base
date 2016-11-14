<cfmodule template="#Application.Header#" sectiontitle="Job Opprotunities Bulletin">
 
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
			  <table border="0" cellpadding="6" cellspacing="0" width="100%">
		        <tr>
		           <td class="RegText"><p><img src="/images/jobopps.jpg" alt="" border="0" align="right">
				      IPRA's Online Job Opportunities Bulletin contains job opportunities in parks and natural resources, 
					  recreation programming, facility management, therapeutic recreation, administration and finance, communications 
					  and marketing, as well as college and university faculty positions and student internships and assistantships.</p>
					  
					  <p><strong>Does it work?</strong>  <br>Laura Barron (Lisle Park District): <em>"I am buried...wow! What a response! Thanks for your assistance."</em></p> 

                      <p>Mary Van Arsdale (Glenview Park District): <em>"I've had six calls in the first hour it was posted! Your site is a god-send!"</em></p>

                      <p>At approximately 1/10th of the cost of an ad in the Chicago Tribune, we'll get you qualified applicants in record time!</p>

                      <p>Check back frequently, as new listings are posted on an ongoing basis.</p>
				   </td>
		        </tr>
				<tr>
				  <td>
				    <table border="0" cellpadding="4" cellspacing="0" width="100%">
                      <tr class="RegText">
						  <td><a href="careers.cfm"><strong>Search For Job Openings</strong></a></td>
						  <td><a href="Resume/index.cfm"><strong>Post/Edit Your Resume</strong></a></td>
						</tr>
						<tr class="RegText">
						<cfoutput>
						  <td><a href="#Application.secureURL#/Careers/JobPostingApp.cfm"><strong>Post Job Openings</strong></a></td>
						  <td><a href="ResLogin.cfm"><strong>Search for Resumes</strong></a></td>
						</cfoutput>
						</tr>
                    </table>   
				  </td>
				</tr>
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
					   </cfoutput>	
                     </table>
                  </td>
				</tr>
				<tr><td>&nbsp;</td></tr>
				<tr><td class="regtext">Questions? Contact <a href="mailto:d&#101;&#97;&#110;&#64;i&#108;&#105;&#112;&#114;&#97;.&#111;&#114;&#103;">Dean Comber</a></td></tr>
		       </table>
			   <br><br>
		 </td>
     </tr>
</table>  

<cfmodule template="#Application.Footer#">