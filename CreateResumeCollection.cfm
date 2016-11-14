<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<cfmodule template="#Application.Header#" >  <br>
<!--- <cfcollection action="DELETE" collection="IPRARESUME"> --->

<!--- <cfcollection action="CREATE" collection="IPRARESUME" path="#Application.Sitepath#collection" language="English" categories="Yes">
 --->

<!--- <CFINDEX ACTION="PURGE" COLLECTION="IPRA">

<cfindex action="Update"
         collection="IPRA"
         key="#Application.Sitepath#"
         type="PATH"
		 URLpath="http://www.ilipra.org/"
		 Extensions=".cfm, .htm, .html"
		 Recurse="yes">
Completed WebSite Collection<br>	 
<cfindex action="Update"
         collection="IPRA"
         key="#Application.Sitepath#/forms"
         type="PATH"
		 URLpath="http://www.ilipra.org/Forms"
		 Extensions=".pdf, .doc, .xls, .ppt"
		 Recurse="No">
Completed Document Collection	 --->


<!--- <cfquery name="getAllApprovedResumes" datasource="#Application.dsn#">
  Select  M.ResumeID, M.ResumeTitle, M.SalaryRange, M.ObjectiveText, M.CoverLetterText, M.LastUpdated, M.Certifications, M.AdditionalInfo, M.ResumeCat,
          W.CompanyName, W.JobTitle, W.WorkFrom, W.WorkTo, W.WorkLocation, W.WorkHistory,
		  E.SchoolName, E.Degree, E.GraduationYr, E.EducationComment,
		  C.City, C.State, C.ZipCode,
		  (Select CodeDesc
		    From Lookup
			Where CodeGroup = 'JOBCAT'
			AND CodeValue = M.ResumeCat) as ResCategory
	From ResumeMaster M, ResuWorkHistory W, resuEducation E, resuContact C
	Where ((M.ContactID = C.ContactID
	AND M.ResumeID = W.ResumeID
	AND M.ResumeID = E.ResumeID)
	AND (M.Status = 1
	AND M.Viewable = 1) )
	Order By M.LastUpdated Desc, M.ResumeTitle, M.ResumeID, M.ContactID 
</cfquery>
<!--- <CFINDEX ACTION="PURGE" COLLECTION="IPRARESUME"> --->


<cfindex action="REFRESH" 
collection="IPRARESUME" 
key="ResumeID" 
type="CUSTOM" 
title="resumes" 
query="getAllApprovedResumes" 
body="ResumeTitle,SalaryRange,ObjectiveText,CoverLetterText,Certifications,AdditionalInfo,CompanyName,JobTitle,WorkFrom,WorkTo,WorkLocation,WorkHistory,SchoolName,Degree,GraduationYr,EducationComment,City,State,ZipCode,ResCategory" 
custom1="ResumeID" 
custom2="ResumeTitle" 
custom3="LastUpdated" 
custom4="ResCategory"
category="ResumeCat">  --->
<cfquery name="getAllApprovedResumes" datasource="#Application.dsn#">
  Select  M.ResumeID, M.ResumeTitle, M.SalaryRange, M.ObjectiveText, M.CoverLetterText, M.LastUpdated, M.Certifications, M.AdditionalInfo, rtrim(M.ResumeCat) as rescat, M.ResumeCat,
          <!--- W.CompanyName, W.JobTitle, W.WorkFrom, W.WorkTo, W.WorkLocation, W.WorkHistory,
		  E.SchoolName, E.Degree, E.GraduationYr, E.EducationComment, --->
		  C.City, C.State, C.ZipCode,
		  (Select CodeDesc
		    From Lookup
			Where CodeGroup = 'JOBCAT'
			AND CodeValue = M.ResumeCat) as ResCategory
	From ResumeMaster M, resuContact C
	Where ((M.ContactID = C.ContactID)
	AND (M.Status = 1
	AND M.Viewable = 1))
	Order By M.LastUpdated Desc, M.ResumeTitle, M.ResumeID, M.ContactID 
</cfquery>

<cfset EdArray = arrayNew(1)>
<cfset WorkArray = arrayNew(1)>

<cfoutput query="getAllApprovedResumes">
  <cfset edstring = "">
  <cfset WorkString = "">
  
  <!--- check education --->
  <cfquery name="geteduc" datasource="#Application.dsn#">
    Select *,
	  (Select codeDesc
					  From Lookup
					  Where codegroup = 'DEGREE'
					  AND Codevalue = E.Degree) as Degreetext
	From dbo.resuEducation E
	where ResumeID = #getAllApprovedResumes.resumeID#
  </cfquery>
  
  <cfloop query="geteduc">
    <cfset edstring = edString & "#geteduc.SchoolName# #geteduc.Degreetext# #geteduc.GraduationYr# #geteduc.EducationComment#">
  </cfloop>
  
  <cfset x = ArrayAppend(EdArray, edstring)>
  
  <!--- check work history --->
  <cfquery name="getWC" datasource="#Application.dsn#">
    Select *
	From dbo.ResuWorkHistory
	where ResumeID = #getAllApprovedResumes.resumeID#
  </cfquery>
  
  <cfloop query="getWC">
    <cfset WorkString = WorkString & "#getWC.CompanyName# #getWC.JobTitle# #getWC.WorkFrom# #getWC.WorkTo# #getWC.WorkLocation# #getWC.WorkHistory#">
  </cfloop>
  
  <cfset y = ArrayAppend(WorkArray, WorkString)>
  
</cfoutput>

<cfset z = QueryAddColumn(getAllApprovedResumes, "EdInfo", "varchar", EdArray)>
<cfset t = QueryAddColumn(getAllApprovedResumes, "workInfo", "varchar", WorkArray)>

<!---  <CFINDEX ACTION="PURGE" COLLECTION="IPRARESUME"> --->

<!---  <cfindex action="UPDATE" 
 collection="IPRARESUME" 
 key="0" 
 body="@3454=4-44 $$Thisisat~^empbody$$"
 type="CUSTOM" 
 category="1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20"> --->

 <cfset thestatus = "">
 
<cfindex action="UPDATE" 
collection="IPRARESUME" 
key="ResumeID" 
type="CUSTOM" 
title="resumes" 
query="getAllApprovedResumes" 
body="ResumeTitle,SalaryRange,ObjectiveText,CoverLetterText,Certifications,AdditionalInfo,EdInfo,workInfo,City,State,ZipCode,ResCategory" 
custom1="ResumeID" 
custom2="ResumeTitle" 
custom3="LastUpdated" 
custom4="#now()#" 
category="ResCat" 
status="thestatus">  	 	 	
Completed Index of Resumes	 <br>
<!--- <cfcollection action="OPTIMIZE" collection="IPRARESUME">
Optimized Collection   --->
<!--- <cfinclude template="viewrescollection.cfm"> ---> 

<cfmodule template="#Application.Footer#"> 
