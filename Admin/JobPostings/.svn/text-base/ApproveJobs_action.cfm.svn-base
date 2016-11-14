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
<cfset ErrorList = ArrayNew(1)>
<!--- Check For General Content Errors --->

<!--- Check Agency --->
<CFIF Form.Expire is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Expiration Date</b> field")>
</CFIF>

<CFIF Not ISDate(Form.Expire)>
	<cfset x = ArrayAppend(ErrorList, "The Value you specified for <b>Expiration Date</b> is not valid")>
</CFIF>

<CFIF Not IsDefined("Form.ApprovePost")>
	<cfset x = ArrayAppend(ErrorList, "You did not Approve or Reject this posting")>
</CFIF>

<CFIF Form.AgencyName is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Agency Name</b> field")>
</CFIF>
<CFIF Form.addr1 is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Agency Address</b> field")>
</CFIF>
<CFIF Form.city is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Agency City</b> field")>
</CFIF>
<CFIF Form.State is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Agency State</b> field")>
</CFIF>
<CFIF Form.ZipCode is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Agency ZipCode</b> field")>
</CFIF>

<!--- Check Contact --->
<CFIF Form.Contact is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Contact</b> field")>
</CFIF>
<CFIF Form.Email is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Email</b> field")>
</CFIF>
<CFIF Form.Phone is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Phone</b> field")>
</CFIF>

<!--- Check Job Posting  --->
<CFIF Form.JobType is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Type of Posting</b> field")>
</CFIF>

<CFIF Form.JobCategory is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Job Category</b> field")>
</CFIF>

<CFIF Form.JobTitle is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Job Title</b> field")>
</CFIF>

<CFIF Form.salary is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Salary</b> field")>
</CFIF>

<CFIF Form.Qualifications is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Qualifications</b> field")>
</CFIF>

<CFIF Form.JobDuties is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Job Duties</b> field")>
</CFIF>


<cfif ArrayLen(ErrorList) GT 0>
  	<font face="Verdana,Arial" size="-1">
	<h4><font color="Maroon">Problem(s) were encountered While Attempting to save the job posting</font></h4>
	<p>Your transaction could not be completed because:</p>
	<ol>
	<cfloop INDEX="i" FROM="1" TO="#ArrayLen(ErrorList)#">
	<cfoutput><li><p>#ErrorList[i]#</p></li></cfoutput>
	</cfloop>
	</ol>
	<div align=center><form><input type="Button" name="" value="Click here to correct Errors Now" align="ABSMIDDLE" onclick="history.back()"></form></div>
	</font>
<cfelse>
 <cfquery Name="UpdateJob" Datasource="#Application.DSN#">
	Update JobPostings
	 Set EndDate = #Createodbcdatetime(form.expire)#,
	     DateApproved = #CreateODBCDateTime(Now())#, 
	     Category = '#form.JobType#',
		 JobType = '#form.JobCategory#',
		 Approved = #Form.ApprovePost#,
		 JobTitle = '#form.JobTitle#',
		 JobSalary = '#form.Salary#',
		 JobClosing = <cfif form.closingDate NEQ "">'#form.ClosingDate#',</cfif>
		 JobQualifications = '#form.Qualifications#',
		 JobDuties = '#form.jobDuties#',
		 ContactName = '#form.Contact#',
		 ContactEmail = '#form.Email#',
		 ContactPhone = '#form.Phone#',
		 ContactFax = <cfif form.fax EQ "">'#form.Fax#'<cfelse>NULL</cfif>,
		 AgencyName = '#form.AgencyName#',
		 AgencyAddr = '#form.Addr1#',
		 AgencyAddr2 = <cfif form.addr2 NEQ "">'#form.Addr2#'<cfelse>NULL</cfif>,
		 AgencyZip = '#form.Zipcode#',
		 AgencyCity = '#form.City#',
		 AgencyState = '#form.State#',
		 AgencyURL = <cfif form.Website NEQ "">'#form.Website#'<cfelse>NULL</cfif>,
		 LastUpdated = #CreateODBCDateTime(Now())#
	Where JobID = #form.jobID#	 
</CFQUERY>
  
<!--- <cflocation url="index.cfm" addtoken="No">  ---> 
<meta http-equiv="refresh" content="0;url=index.cfm">
</cfif>
			   <br><br>
		 </td>
     </tr>
</table>  
</cfoutput>
<cfmodule template="#Application.footer#">