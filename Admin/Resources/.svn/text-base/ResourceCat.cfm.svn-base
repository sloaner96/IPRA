
<cfmodule template="#Application.header#" sectiontitle="Resource Directory">
<cfparam name="url.catid" default="0">
<cfparam name="url.subcatid" default="0">
<cfparam name="url.recid" default="0">

 <cfquery name="GetRecs" datasource="#Application.dsn#">
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
   order BY ResourceType, SubCategory
</cfquery>

<table border="0" cellpadding="0" cellspacing="0" width="100%">
  <tr>
    <td width="168" valign="top"><br><cfmodule template="#Application.tagdir#/adminnav.cfm" level="1"></td>
	<td valign="top"> <br>
		 <cfoutput>
		 <table border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr>
               <td><h3>Viewing #GetRecs.CatName# Resources</h3></td>
            </tr>
         </table>
		 </cfoutput>
		 <cfif GetRecs.recordcount GT 0>
		  <cfset RowsPerPage = 25>
			 
			 <cfset TotalRows = Getrecs.recordcount>
			 
			 <cfparam name="url.nstart" default="1">
			 
			 <cfset EndRow = Min(url.Nstart + RowsPerPage - 1, TotalRows)>
			 
			 <cfset StartRowNext = EndRow + 1>
			 
			 <cfset StartRowback = Url.nstart - RowsPerPage>
		   <table border="0" cellpadding="4" cellspacing="1" width="100%">
              <cfoutput>
				  <tr bgcolor="ffffff">
				    <td colspan=3 align="right">
					   <table border="0" cellpadding="3" cellspacing="0" align="right">
		                  <tr>
						   <cfif startrowBack GT 0>
		                     <td align="right"><a href="ResourceCat.cfm?nstart=#StartRowBack#&catid=#url.catid#"><font face="verdana" size="-2"><< BACK</font></a></td>
						   </cfif>
						   <cfif StartRowNext LT TotalRows>
							 <td align="right"><a href="ResourceCat.cfm?nstart=#StartRowNext#&catid=#url.catid#"><font face="verdana" size="-2">NEXT >></font></a></td>
						   </cfif>	
		                  </tr>
		                </table>
					</td>
				  </tr> 
				  
				   <tr>
				     <td colspan=3 align="center">
				       <table border="0" cellpadding="0" cellspacing="0" width="100%">
		                 <tr>
		                   <td><font face="verdana" color="000000" size="-1">Displaying <strong>#Url.nstart#</strong> to <strong>#EndRow#</strong> of <strong>#TotalRows#</strong></font></td>
		                 </tr>
		               </table> 
				     </td>
				   </tr>
		      </cfoutput>
			  <tr bgcolor="#666666">
			      <td>&nbsp;</td>
				  <td><strong style="color:ffffff;">Date Added</strong></td>
				  <td><strong style="color:ffffff;">Type</strong></td>
				  <td><strong style="color:ffffff;">Resource Name</strong></td>
				</tr> 
			  <cfoutput query="GetRecs" startrow="#url.nstart#" maxrows="#RowsPerPage#">
			     <tr <cfif GetRecs.currentrow mod(2) EQ 0>bgcolor="##eeeeee"</cfif>>
				   <td><a href="UpdateResource.cfm?Action=Delete&ResID=#GetRecs.ResourceID#" style="color:##990000;">[DELETE]</a></td>
				   <td>#Dateformat(LastUpdated, 'MM/DD/YY')#</td>
				   <td>#ResourceTypeDesc#</td>
				   <td width="60%"><a href="EditResource.cfm?recid=#ResourceID#">#ResourceLabel#</a></td>
				 </tr>
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