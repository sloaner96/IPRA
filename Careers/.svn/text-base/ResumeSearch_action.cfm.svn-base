<cfif Not IsDefined("Session.ResSearch")>
  <cflocation url="reslogin.cfm" addtoken="NO">
</cfif>
<cfmodule template="#Application.Header#" sectiontitle="Job Opportunities Bulletin">
<style>
  #searchingovrlay{
  	position: absolute;
  	display: none;
  	width: 340px;
	height:85px;
  	padding-top: 10px;
  	padding-bottom: 10px;
  	z-index: 5;
  	top: 220;
  	left: 358;
  	background-color: #000;
	color: #fff;
	filter:alpha(opacity=65); -moz-opacity:0.65; opacity: 0.65;
  }
  .divider{
   width:3px;
   border-right: 1px solid #000;
  }
</style>
<script language="JavaScript">
  function showoverlay(){
     var searchovr = document.getElementById('searchingovrlay');
	 searchovr.style.display = "block";
	 
  }
</script>
<cfset getJobCategory = request.CareersComponent.getJobCat()>

<cfif Len(trim(form.keyword)) EQ 0 AND Len(trim(form.Category)) EQ 0>
  <cflocation url="ResumeSearch.cfm?e=1" addtoken="NO">
</cfif>


  <cfinvoke component="IPRA.Careers" method="searchResume" returnvariable="getResume">
    <cfinvokeargument name="JobID" value="#Session.ResSearch.JobID#">
	<cfif Len(Trim(form.keyword)) GT 0>
	   <cfinvokeargument name="SearchTerm" value="#Trim(form.keyword)#">
	</cfif>
	<cfif Len(Trim(form.category)) GT 0>
	   <cfinvokeargument name="SearchCat" value="#Trim(form.category)#">
	</cfif>
  </cfinvoke>
  
<!-- <cfoutput>#form.keyword#::#Len(Trim(form.keyword))#<br>#form.category#::#Len(Trim(form.category))#</cfoutput>-->
<div class="searchingovrlay" id="searchingovrlay"><strong style="font-size:14px; paddong-left:20px;">Searching....</strong></div> 
  <table border="0" cellpadding="3" cellspacing="0" width="100%">
	  <tr>
          <td valign="top">
		     <br>
		    <cfmodule template="#Application.tagdir#/aboutusnav.cfm" level="3">
		  </td>
		  <td valign="top">
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>Job Opportunities Bulletin: Search Resume Bank</h3></td>
		        </tr>
		      </table> 
			  <cfoutput>
				  <table border="0" cellpadding="0" cellspacing="0" width="100%">
	                 <tr>
	                   <td valign="top">
					     <cfform name="search" action="ResumeSearch_action.cfm" method="POST">
					      <table border="0" cellpadding="4" cellspacing="0" width="100%">
	                        <tr>
							  <td colspan="2">Use the form below to search for resumes by keywords or category, or use both to narrow your search. click the search buttom when you are complete to search our resume bank.<p><strong>We apologize for the recent issue regarding searching for resume's by category. This is now fixed, however, if you experience problems when searching for resume's by category (i.e. it states that there are zero resume's per category), please contact <a href="mailto:webmaster@ilipra.org?subject=Resume Search Issue">webmaster@ilipra.org</a> so we can repair the bug</strong>.</p></td>
							</tr>
							<tr>
	                          <td><strong>Keyword(s):</strong></td>
							  <td><input type="text" name="keyword" value="" size="25" maxlength="75">&nbsp;&nbsp;</td>
	                        </tr>
							<tr>
							  <td><strong>Category:</strong></td>
							  <td><select name="Category">
									           <option value="">--Select One--</option> 
									         <cfloop query="getJobCategory">
									           <option value="#getJobCategory.CatID#">#getJobCategory.CatDesc#</option>
											 </cfloop>
										   </select>
							  </td>
							</tr>
							<tr>
							  <td><input type="submit" name="search" value="search" onclick="showoverlay();"></td>
							</tr>
	                      </table>
						 </cfform>
						  <hr noshade size="1">  
						 <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td><strong>Your search returned #getResume.recordcount# possible matches.</strong></td>
                            </tr>
                         </table>  
						 <cfif Not IsDefined("Session.EncryptionCode")>
						     <cfset Session.EncryptionCode = CreateUUID()>
						 </cfif>
						 <table border="0" cellpadding="4" cellspacing="0" width="100%">
                            <tr>
							  <td colspan="2">Click on the title below to view the resume.</td>
							</tr>
							<cfloop query="getresume">
							  <tr <cfif getResume.currentrow MOD(2) EQ 0>bgcolor="##eeeeee"</cfif>>
                                <td><cfif custom3 NEQ "">#DateFormat(custom3, 'MM/DD/YYYY')#<cfelse>#DateFormat(now(), 'MM/DD/YYYY')#</cfif></td>
								<td><a href="ViewResume.cfm?r=#getResume.custom1#&P=#Session.EncryptionCode#" target="_blank">#custom2#</a></td>
                              </tr>
							</cfloop>
                         </table>    
					   </td>
					   <td class="divider"></td>
					   <td valign="top" width="200">
					        <p align="right"><a href="Logout.cfm"><img src="/images/btn_logout.gif" width="90" height="20" alt="[Log Out]" border="0"></a></p>
						     <table border="0" cellpadding="0" cellspacing="0" width="100%">
		                       <tr>
		                          <td background="/images/resu_HeadBG.gif"><img src="/images/resuSrch_JobInfo.gif" width="151" height="20" alt="Job Posting InfoBox"></td>
							      <td background="/images/resu_HeadBG.gif" align="right"></td>
		                       </tr>
							   <tr>
							      <td colspan="2">
							        <table border="0" cellpadding="4" cellspacing="1" width="100%" bgcolor="##7088A2">
							          <tr>
									    <td bgcolor="##ffffff">
										  <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                             <tr>
                                               <td><strong><a href="/Careers/CareerDetail.cfm?Jtype=#Session.ResSearch.JobType#&CatID=#Session.ResSearch.Category#&JobID=#Session.ResSearch.JobID#" style="color:##006699;text-decoration: none;">#Session.ResSearch.JobTitle#</a></strong></td>
                                             </tr>
											 <tr>
											   <td><strong>Salary:</strong> #Session.ResSearch.JobSalary#</td>
											 </tr>
											 <tr>
											   <td><strong>Ad Ends:</strong> #Dateformat(Session.ResSearch.EndDate, 'MM/DD/YYYY')#</td>
											 </tr>
                                          </table>
										  
										</td>
									  </tr>
									</table>
								  </td>
							  </tr>	
		                     </table>
							 <!--- <br>
							 <table border="0" cellpadding="0" cellspacing="0" width="100%">
		                       <tr>
		                          <td background="/images/resu_HeadBG.gif"><img src="/images/resuSrch_SavedResume.gif" width="151" height="20" alt="Job Posting InfoBox"></td>
							      <td background="/images/resu_HeadBG.gif" align="right"></td>
		                       </tr>
							   <tr>
							      <td colspan="2">
							        <table border="0" cellpadding="4" cellspacing="1" width="100%" bgcolor="##7088A2">
							          <tr>
									    <td bgcolor="##ffffff">
										  <table border="0" cellpadding="3" cellspacing="0" width="100%">
										     <tr>
										        <td style="color:##a7a7a7;" align="center">Nothing Saved</td>
										     </tr>
										  </table>   
										
										</td>
									  </tr>
									</table>
								  </td>
							  </tr>
		                     </table> --->
							 <br>
							 <table border="0" cellpadding="0" cellspacing="0" width="100%">
		                       <tr>
		                          <td background="/images/resu_HeadBG.gif"><img src="/images/resuSrch_Applicant.gif" width="151" height="20" alt="Job Posting InfoBox"></td>
							      <td background="/images/resu_HeadBG.gif" align="right"></td>
		                       </tr>
							   <tr>
							      <td colspan="2">
							        <cfset getApplicants = request.CareersComponent.getApplied(Session.ResSearch.JobID)>
							        <table border="0" cellpadding="4" cellspacing="1" width="100%" bgcolor="##7088A2">
							          <tr>
									    <td bgcolor="##ffffff">
										   <table border="0" cellpadding="3" cellspacing="0" width="100%">
										     <cfif getApplicants.recordcount GT 0>
											   <cfif Not IsDefined("Session.EncryptionCode")>
						                          <cfset Session.EncryptionCode = CreateUUID()>
						                       </cfif>
											   <cfloop query="getApplicants">
											    <tr>
											      <td><a href="viewResume.cfm?R=#getApplicants.resumeID#&P=#Session.EncryptionCode#" target="_blank">#GetApplicants.ResumeTitle#</a></td>
											    </tr>
											   </cfloop>
											 <cfelse>
											   <tr>
										          <td style="color:##a7a7a7;" align="center">No Applicants</td>
										       </tr>
											 </cfif>
											 
										  </table> 
								  </td>
							  </tr>
		                     </table>    
						     </td>
							  </tr>
		                     </table> 
					   </td>
	                 </tr>
	              </table>  
			 </cfoutput>           
		  </td>
      </tr>
  </table>  

<cfmodule template="#Application.Footer#">
