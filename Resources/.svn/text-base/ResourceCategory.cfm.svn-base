
<cfmodule template="#Application.header#" sectiontitle="Resource Directory">
<cfparam name="url.catid" default="0">
<cfparam name="url.subcatid" default="0">
<cfparam name="url.recid" default="0">

 <cfquery name="GetRecs" datasource="#Application.dsn#" maxrows="100">
   Select R.*,
     (Select CodeDesc
	    From Lookup
		Where CodeGroup = 'RESTYPE'
		 AND CodeValue = R.ResourceType) As ResourceTypeDesc,
	 (Select CodeDesc
	    From Lookup
		Where CodeGroup = 'RESCAT'
		 AND CodeValue = R.Category) As CatName 	 
   From Resources R
   Where Category = #url.catid#
   AND Active = 1 
   <cfif NOT IsDefined("session.userinfo.memberID")>
	  AND R.MembersOnly = 0
   </cfif>
   order BY ResourceType, SubCategory
</cfquery>

<table border="0" cellpadding="0" cellspacing="0" width="100%">
  <tr>
    <td width="168" valign="top"><br><cfmodule template="#Application.tagdir#/resourcenav.cfm"></td>
	<td valign="top"> <br>
		 <cfoutput>
		 <table border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr>
               <td><h3>#GetRecs.CatName# Resources</h3></td>
            </tr>
         </table>
		 </cfoutput>
		 <table border="0" cellpadding="0" cellspacing="0" width="100%">
           <tr>
              <td>The output is limited to 100 resources. If you would like to search for a specific resource do so below.</td>
           </tr>
         </table>
		 <cfform name="Search" action="ResourceSearch.cfm" Method="POST" scriptsrc="/scripts/cfform.js">
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
	            <tr>
				   
	               <td valign="top"><font face="arial" color="#003366" size="-1"><strong>Search</strong></font><br><cfinput type="text" name="search" required="yes" message="You must enter a search term." size="10" maxlength="100">&nbsp;&nbsp;<input type="submit" name="submit" value="GO"></td>
				   
				   <td align="center" valign="bottom"><a href="http://www.adobe.com/products/acrobat/readstep2.html" target="_blank"><img src="http://www.adobe.com/images/get_adobe_reader.gif" alt="Download Adobe Reader" border="0"></a></td>
	            </tr>
	         </table>
		 </cfform>
		 <cfif GetRecs.recordcount GT 0>
		   <table border="0" cellpadding="4" cellspacing="0" width="100%">
              <cfoutput query="GetRecs" Group="ResourceType">
			   <tr bgcolor="##eeeee">
                <td colspan=2><strong style="size:14px;">#ResourceTypeDesc#</strong></td>
               </tr>
			    <tr bgcolor="##eeeeee">
				  <td><strong>Date Added</strong></td>
				  <td><strong>Resource Name</strong></td>
				</tr> 
			   <cfoutput>
			     <tr>
				   <td width="100">#Dateformat(LastUpdated, 'MM/DD/YY')#</td>
				   <td><a href="ResourceDetail.cfm?recid=#ResourceID#">#ResourceLabel#</a></td>
				 </tr>
			   </cfoutput> 
			  </cfoutput>
           </table>  
		 <cfelse>
		   <table border="0" cellpadding="0" cellspacing="0" width="100%">
             <tr>
               <td><font face="verdana" size="-1"><strong>There are currently no resources for that category.</strong></font></td>
             </tr>
           </table>
		 </cfif>  

			   <br><br>
		 </td>
     </tr>
</table>  
<cfmodule template="#Application.footer#">