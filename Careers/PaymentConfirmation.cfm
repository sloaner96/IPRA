<cfparam name="url.JobID" default="0">
<CFQUERY Name="GetEvents" Datasource="#Application.DSN#">
	Select T.*, J.*, P.ProductID, P.ProductName, P.MemberPrice, P.NonMemberPrice,
	  (Select codeDesc 
		 From Lookup L
		 Where L.CodeGroup = 'JOBCAT'
		 And L.Codevalue = J.Category) as JobCatName
	From Transactions T, JobPostings J, Products P
	Where T.TransID = J.TransID
	AND J.JobID = <cfqueryparam value="#url.JobID#" cfsqltype="CF_SQL_INTEGER">
	AND J.ProductID = P.ProductID
</CFQUERY>
<cfinclude template="#Application.TagDir#/Libraries/ccEscape.cfm">
<cfparam name="URL.E" default="0">
<cfmodule template="#Application.header#" section="0" sectiontitle="Upcoming Events">
  <table width="100%" border="0" cellspacing="3" cellpadding="0">
     <tr>
        <td valign="top"> <br>
	     <cfoutput>
		 <table width="70%" border="0" cellspacing="0" cellpadding="4">
	        <tr>
	           <td align="center"><h3>Thank You For Your Order (#GetEvents.ProductName#)!</h3></td>
	        </tr>
	     </table>
		 </cfoutput>
		<table border="0" cellpadding="4" cellspacing="0" width="100%">
		  <tr>
             <td align="Center">
			   <cfoutput query="GetEvents">
		       <table border="0" cellpadding="4" cellspacing="0" width="60%" class="regtext">
                  <tr>
                     <td colspan=2>Below is the information you just submitted for an IPRA Job Posting. <br><strong>Please Note:</strong> All job postings must be approved before being activated on the site.   Please print this as your reciept.</td>
                  </tr>
			  </table><br>
			  <table border="0" cellpadding="4" cellspacing="0" width="60%" class="regtext">	  
				  <tr>
				    <td><strong>Confirmation Number:</strong></td>
					<td>#TransID#-#JobID#-#ProductID#</td>
				  </tr>
				  <tr>
				     <td><strong>Job Posting Category:</strong></td>
					 <td>#JobCatName#</td>
				  </tr>
				  <cfif TransType EQ "Credit">
				  <tr>
				     <td><strong>Payment:</strong></td>
					 <td>#CardType# #ccEscape(GetEvents.CardNbr)# Exp: #CardExpMonth#/#CardExpYear#</td>
				  </tr>
				  <cfelse>
				  <tr>
				     <td><strong>Payment:</strong></td>
					 <td>P.O. Number: #PONumber#</td>
				  </tr>
				  </cfif>
				  <tr bgcolor="eeeeee">
				     <td colspan=2><strong>Contact Info:</strong></td>
				  </tr>
				  <tr>
				    <td colspan="2">
					  <table border="0" cellpadding="0" cellspacing="0" width="100%">
                         <tr>
                           <td>#ContactName#</td>
                         </tr>
						 <tr>
                           <td>#ContactEmail#</td>
                         </tr>
						 <tr>
                           <td>#ContactPhone#</td>
                         </tr>
						 <tr>
                           <td>#AgencyName#</td>
                         </tr>
						 <tr>
                           <td>#AgencyAddr#<br>#AgencyCity#,  #AgencyState# #AgencyZip#</td>
                         </tr>
					
                      </table>
					</td>
				  </tr>
				  <tr bgcolor="eeeeee">
				     <td colspan=2><strong>Description:</strong></td>
				  </tr>
				  <tr>
				    <td colspan=2>
					  <table border="0" cellpadding="4" cellspacing="0" width="100%">
                         <tr> 
                            <td><strong>Job Title:</strong><br>#JobTitle#</td>
                         </tr>
						 <tr> 
                            <td><strong>Salary:</strong><br>#JobSalary#</td>
                         </tr>
						 <tr> 
                            <td><strong>Closing:</strong><br>#JobClosing#</td>
                         </tr>
						 <tr> 
                            <td><strong>Qualifications:</strong><br>#JobQualifications#</td>
                         </tr>
						 <tr> 
                            <td><strong>Duties:</strong><br>#JobDuties#</td>
                         </tr>
						 
                      </table>
					</td>
				  </tr>
				  <tr bgcolor="eeeeee">
				    <td colspan="2"><strong>Resume Search Login Info</strong></td>
				  </tr>
				  <tr>
				    <td colspan="2">
					   <table border="0" cellpadding="4" cellspacing="0" width="100%">
                          <tr>
                             <td colspan="2">You may now use the IPRA's Resume Search feature, for the duration of your job posting. This is a secure area for employers such as yourself to find today's best talent. The Resume Search is a unique tool that allows employers and job seekers to connect via the web. Below you will find your login information for the Resume Search area of the site, simply click the link or cut and paste the link into your browsers address window. <br><br><strong>Please note: For each job you post, you will receive a separate
                                             password in order to access resumes for the individual job you posted.</strong></td>
                          </tr>
						  <tr>
						    <td>&nbsp;</td>
						  </tr>
						  <tr>
						    <td><strong>Login URL:</strong></td>
							<td><a href="#Application.SecureUrl#/careers/ResLogin.cfm">#Application.SecureUrl#/careers/ResLogin.cfm</a></td>
						  </tr>
						  <tr>
						    <td><strong>Login:</strong></td>
							<td>#ContactEmail#</td>
						  </tr>
						  <tr>
						    <td><strong>Temporary Password:</strong></td>
							<td>#password# <strong style="color:##939393; font-family: arial; font-size:10px;">(You will be prompted to change this upon your first login)</strong></td>
						  </tr>
                       </table>         
					</td>
				  </tr>
               </table>
			   </cfoutput>
			   <p>The IPRA thanks you for your business</p>
		<br><br>

		 </td>
       </tr>
      </table>
	 </td>
   </tr>		 
 </table>
<cfmodule template="#Application.footer#" section="0">	