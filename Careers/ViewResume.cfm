<cfif Not IsDefined("Session.ResSearch")>
  <cflocation url="reslogin.cfm" addtoken="NO">
</cfif>

<cfparam name="url.e" default="0">
<cfparam name="url.R" default="0">
<cfparam name="url.P" default="0">

<cfif URl.P NEQ Session.EncryptionCode>
 <cflocation url="logout.cfm" addtoken="no">
</cfif>

<cfset getResume = request.CareersComponent.getFullResume(URL.R)>
<cfset TimesViewed = request.CareersComponent.setTimesViewed(URL.R)>
<cfset getWorkHistory = request.CareersComponent.getallWorkHistory(URL.R)>
<cfset getEducHistory = request.CareersComponent.GetAllEduc(URL.R)>
<cfset ThisCatName   = request.CareersComponent.getJobCat(getResume.ResumeCat)>
<cfinclude template="#Application.TagDir#/FormatPhone.cfm">
<style>
 body, table{
  font-family: verdana, arial, times roman;
  font-size: 11px;
 }
 h3{
   
 }
</style>
<html>
<head></head>

<body onload="self.focus();">
<table border="0" cellpadding="3" cellspacing="1" width="640" align="center">
    <tr>
	  <td align="left"><img src="/images/Mainlogo.gif" align="absmiddle"></td>
	</tr>
    <tr>
	  <td align="right"><a href="javascript:void(0);" onclick="window.self.close();">Close X</a></td>
	 </tr>
 </table>
 <table border="0" cellpadding="3" cellspacing="1" width="640" bgcolor="#000000" align="center">
  <tr>
	  <td valign="top" bgcolor="#ffffff">
	    <cfoutput>
		  <table border="0" cellpadding="5" cellspacing="0" width="100%">
	        <tr>
	          <td><h3><!--- (#getResume.ResumeID#) ---> #getResume.ResumeTitle#</h3></td>
	        </tr>
	      </table>
			
			<table border="0" cellpadding="3" cellspacing="0" width="100%">
			<tr bgcolor="##000066">
			 <td colspan="2"><strong style="color:##fff;">Contact Information</strong></td>
			</tr>
			<tr>
			<td valign="top">#getResume.Firstname# <cfif getResume.MiddleInitial NEQ "">#getResume.MiddleInitial# </cfif>#getResume.lastName#<br>
							    #getResume.Address1#<BR>
								<cfif getResume.Address2 NEQ "">#getResume.Address2#<BR></cfif>
								#getResume.City#, #getResume.State# #getResume.ZipCode#<BR>
			</td>
			<td valign="top">
				<cfif getResume.HomePhone NEQ ""> <strong>Home:</strong> #FormatPhone(getResume.HomePhone)#<br></cfif>
				<cfif getResume.WorkPhone NEQ ""><strong>Work:</strong> #FormatPhone(getResume.WorkPhone)#<br></cfif>
				<cfif getResume.Mobile NEQ ""><strong>Mobile:</strong> #FormatPhone(getResume.Mobile)#<br></cfif>
				<strong>Email:</strong> <a href="mailto:#getResume.Email#?subject=Job%20Opening">#getResume.Email#</a><br>
				<strong>Best Contact:</strong> <cfif getResume.BestContact EQ "H">Home<cfelseif getResume.BestContact EQ "W">Work<cfelseif getResume.BestContact EQ "E">Email<cfelseif getResume.BestContact EQ "M">Mobile</cfif>
			</td>
			</tr>
			</table>
			<br>
			<table border="0" cellpadding="3" cellspacing="0" width="100%">
			  <tr bgcolor="##000066">
			 <td colspan="2"><strong style="color:##fff;">Job Target</strong></td>
			</tr>
			<tr>
			  <td>
			 <table border="0" cellpadding="3" cellspacing="0">
				 <tr>
				   <td><strong>Status:</strong></td>
				   <td><cfif getResume.Status EQ 1>Active<cfelse>Not Active</cfif></td>
				 </tr>
				 <tr>
				   <td><strong>Resume Title:</strong></td>
				   <td>#getResume.ResumeTitle#</td>
				 </tr>
				 <tr>
				   <td><strong>Postion Category:</strong></td>
				   <td>#ThisCatName.CatDesc#</td>
				 </tr>
				 <tr>
				   <td><strong>Salary Requirement:</strong></td>
				   <td>#getResume.SalaryRange#</td>
				 </tr>
				 <tr>
			        <td><strong>Objective:</strong></td>
					<td>#trim(getResume.objectivetext)#</td>
			     </tr>
			   </table> 
			   </td>
			</tr>		   
			</table>  
			<br>
			<table border="0" cellpadding="3" cellspacing="0" width="100%">
			            <tr bgcolor="##000066">
			 <td colspan="2"><strong style="color:##fff;">Cover Letter</strong></td>
			</tr>
			<cfif Len(Trim(getResume.coverlettertext)) GT 0>
			<tr>
			  <td>#Replacenocase(Trim(getResume.coverlettertext), "#Chr(13)##Chr(10)#", "<br>", "ALL")#</td>
			</tr>		 
			<cfelse>
			  <tr>
			    <td><strong style="color:##ccc;">Nothing Added</strong></td>
			  </tr>  
			</cfif>
			</table> 
			<br>
			<table border="0" cellpadding="3" cellspacing="0" width="100%">
			<tr bgcolor="##000066">
			   <td colspan="2"><strong style="color:##fff;">Work History</strong></td>
			</tr>
			<tr>
			<td>
			    <table border="0" cellpadding="3" cellspacing="1" width="100%">
			                     <cfif getWorkHistory.recordcount GT 0>
				<cfloop query="GetWorkHistory">
				  <tr bgcolor="##eeeeee">
				    <td><strong>From: #GetWorkHistory.WorkFrom# - To: #GetWorkHistory.WorkTo#</strong></td>
			                          <td><strong>#GetWorkHistory.CompanyName#</strong></td>
					<td><strong>#GetWorkHistory.WorkLocation#</strong></td>
				  </tr>
				  <tr>	
					<td colspan="3"><em>#GetWorkHistory.JobTitle#</em></td>
			                        </tr>
				  <tr>
				    <td colspan="3">#Replacenocase(trim(GetWorkHistory.WorkHistory), "#Chr(13)##Chr(10)#", "<br>", "ALL")#</td>
				  </tr>
			    </cfloop>
			   <cfelse>
			      <tr>
			         <td align="center"><hr noshade size="1"><strong style="color:##777777;">No Work History Added</strong></td>
			      </tr>	
			   </cfif>
			         </table>
			  </td>
			</tr>
			 </table> 
			 <br>
			 <table border="0" cellpadding="3" cellspacing="0" width="100%">
			      <tr bgcolor="##000066">
			  <td colspan="2"><strong style="color:##fff;">Education</strong></td>
			</tr>
			<tr>
			  <td>
			    <table border="0" cellpadding="3" cellspacing="1" width="100%">
					 <cfif GetEducHistory.recordcount GT 0>
						 <cfloop query="GetEducHistory">
						   <tr bgcolor="##eeeeee">
							   <td>Date Obtained: <strong>#GetEducHistory.GraduationYr#</strong></td>
							   <td><strong>#GetEducHistory.SchoolName#</strong></td>
						   </tr>
						   <cfif GetEducHistory.Degreetext NEQ "">
						     <tr>	   
							    <td colspan="2">#GetEducHistory.Degreetext#</td>
			                          </tr>	 
						   </cfif>
						   <tr>
						     <td colspan="2">#GetEducHistory.EducationComment#</td>
						   </tr>
						 </cfloop>
					 <cfelse>
					   <tr>
					      <td align="center"><hr noshade size="1"><strong style="color:##777777;">You currently do not have any Education History saved. Use the form above to add work history.</strong></td>
					   </tr>	
					 </cfif>
			              </table> 
			  </td>
			</tr>
			        </table> 
					  <br>
					  <table border="0" cellpadding="3" cellspacing="0" width="100%">
			                <tr bgcolor="##000066">
						  <td colspan="2"><strong style="color:##fff;">Certifications</strong></td>
						</tr>
						<cfif Len(Trim(getResume.Certifications)) GT 0>
						 <tr>
						   <td>#Replacenocase(Trim(getResume.Certifications), "#Chr(13)##Chr(10)#", "<br>", "ALL")#</td>
						 </tr>		 
						 <cfelse>
						   <tr>
						     <td><strong style="color:##ccc;">Nothing Added</strong></td>
						   </tr>  
						</cfif>
			             </table> 
					  <br>
					  <br>
					  <table border="0" cellpadding="3" cellspacing="0" width="100%">
			                <tr bgcolor="##000066">
						  <td colspan="2"><strong style="color:##fff;">Additional Info</strong></td>
						</tr>
						<cfif Len(Trim(getResume.AdditionalInfo)) GT 0>
						 <tr>
						   <td>#Replacenocase(Trim(getResume.AdditionalInfo), "#Chr(13)##Chr(10)#", "<br>", "ALL")#</td>
						 </tr>		 
						 <cfelse>
						   <tr>
						     <td><strong style="color:##ccc;">Nothing Added</strong></td>
						   </tr>  
						</cfif>
			             </table> 
					  <br>
				  </cfoutput>
		</td>
      </tr>
  </table> 
  </body>
</html>