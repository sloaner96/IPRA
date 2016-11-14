

<cfmodule template="#Application.header#" sectiontitle="Resource Library Search">
<table border="0" cellpadding="0" cellspacing="0" width="100%">
   <tr>
      <td width="168" valign="top"><br><cfmodule template="#Application.tagdir#/resourcenav.cfm"></td>
	  <td width="5">&nbsp;</td>
	  <td valign="top"><br>
	    <table border="0" cellpadding="0" cellspacing="0" width="100%">
           <tr>
              <td><h3>Resource Library Search</h3></td>
           </tr>
        </table>
		<cfif IsDefined("form.search")>
  <cfif Len(Trim(form.search)) GT 0>
<cfquery name="GetRes" datasource="#Application.dsn#">
  Select R.*,
      (Select Codedesc
	    From Lookup
	    where CodeValue = R.Category
	    AND CodeGroup = 'RESCAT') as CatName,
      (Select CodeDesc
	    From Lookup
		Where CodeGroup = 'RESTYPE'
		 AND CodeValue = R.ResourceType) As ResourceTypeDesc
  From Resources R
  Where R.Active = 1
  AND R.ResourceLabel Like '%#form.search#%' 
       OR ResourceDesc Like '%#form.search#%' 
	   OR ContactName Like '%#form.search#%'
   <cfif NOT IsDefined("session.userinfo.memberID")>
	  AND R.MembersOnly = 0
   </cfif>	   
  order by Category, ResourceType, ResourceLabel  
</cfquery>
		<table border="0" cellpadding="3" cellspacing="0" width="100%">
		  <tr>
		     <td colspan=2><font face="arial" size="-1">Below are your search results. Click the resource name to view more detailed information about this resource.</font></td>
		  </tr>
		  <tr>
		    <td colspan=2><hr noshade size=1></td>
		  </tr>
		  <tr>
		    <td colspan=2>
			  <cfform name="Search" action="ResourceSearch.cfm" Method="POST" scriptsrc="/scripts/cfform.js">
						  <table border="0" cellpadding="5" cellspacing="0" width="100%">
				            <tr>
							   
				               <td valign="top"><font face="arial" color="#003366" size="-1"><strong>Search</strong></font><br><cfinput type="text" name="search" required="yes" message="You must enter a search term." size="10" maxlength="100">&nbsp;&nbsp;<input type="submit" name="submit" value="GO"></td>
							   
							   <td align="center" valign="bottom"><a href="http://www.adobe.com/products/acrobat/readstep2.html" target="_blank"><img src="http://www.adobe.com/images/get_adobe_reader.gif" alt="Download Adobe Reader" border="0"></a></td>
				            </tr>
				         </table>
					 </cfform>
			</td>
		  </tr>
		  <cfoutput>
		  <tr>
		    <td colspan=2><font face="verdana" size="-1">Your search returned <font color="cc0000"><strong>#GetRes.recordcount#</strong></font> results for <strong>#form.search#</strong> </font></td>
		  </tr>
		  </cfoutput>
		  <tr>
		    <td>&nbsp;</td>
		  </tr>
		  <cfif GetRes.recordcount GT 0>
			  <cfoutput Query="GetRes" group="CatName">
			    <tr>
			       <td colspan=2><font face="arial" color="##990000" size="+1"><strong><cfif Catname NEQ "">#CatName#<cfelse>No Category Assigned</cfif></strong></font></td>
			    </tr>
					<cfoutput group="ResourceType">
					  <tr bgcolor="##eeeee">
                        <td colspan=2><strong>#ResourceTypeDesc#</strong></td>
                       </tr>
					   <tr bgcolor="##eeeeee">
				          <td><strong>Date Added</strong></td>
				          <td><strong>Resource Name</strong></td>
				       </tr>  
					  <cfoutput>
						  
									  <tr>
									    <td width="100">#Dateformat(LastUpdated, 'MM/DD/YY')#</td>
									    <td><a href="ResourceDetail.cfm?RecID=#Getres.ResourceID#">#GetRes.ResourceLabel#</a></td>
									  </tr>
							
						  <tr>
						    <td><img src="/images/blank.gif" height="8" width="1" border="0" alt=""></td>
						  </tr>
					  </cfoutput>
					</cfoutput>
					<tr>
					  <td>&nbsp;</td>
					</tr>
			  </cfoutput>
		  </cfif>
		</table>
	   <cfelse>
	     <table border="0" cellpadding="0" cellspacing="0" width="100%">
	        <tr>
	            <td class="errortext">Error! You Must Enter a criteria to search by.</td>
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
	  </cfif>	
	 <cfelse>
     <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td class="errortext">Error! You Must Enter a criteria to search by.</td>
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
	 </cfif>	
		<br><br>
     </td>
   </tr>
</table><br>
<cfmodule template="#Application.footer#">