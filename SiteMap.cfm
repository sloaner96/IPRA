<cfquery name="GetMain" datasource="#Application.dsn#">
  Select *
  From SitePages
  Where ParentID = 0
  Order By ParentID, Ranking
</cfquery>
<cfmodule template="#Application.Header#" section="0" sectiontitle="Ipra SiteMap">

  <table border="0" cellpadding="4" cellspacing="0" width="100%">
<tr>
 <td valign="top"><br>
		    <cfmodule template="#Application.tagdir#/aboutusnav.cfm">
		   </td>
<td valign="Top"><br>
	  <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
	      <td><h3>ILIPRA.ORG Sitemap</h3></td>
	    </tr>
		<tr>
		  <td class="regtext">To help you navigate throughout the IPRA Web site easily, we have included a map of the high level pages below</td>
		</tr>
			<tr>
			  <td class="regtext">
			     <blockquote>
					 <table border="0" cellpadding="4" cellspacing="0" width="100%">
		               <cfoutput query="GetMain">
						   <tr>
			                   <td class="regtext"><a href="#Application.baseurl##PageURL#">#PageName#</a></td>
			               </tr>
					   </cfoutput>
		             </table>  
				 </blockquote> 
			  </td>
			</tr>
	  </table>
   </td>
 </tr>
</table>
<cfmodule template="#Application.Footer#">
