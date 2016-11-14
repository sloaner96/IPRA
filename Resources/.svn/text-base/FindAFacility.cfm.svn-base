<cfparam name="url.e" default="0">
<cfmodule template="#Application.header#" sectiontitle="Resource Directory">
  <cfoutput>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top"><br>
	         <cfmodule template="#Application.tagdir#/resourcenav.cfm">
		   </td>
		   <td valign="top"><br>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>Find A Facility</h3></td>
		        </tr>
		      </table>
			  <table border="0" cellpadding="6" cellspacing="0" width="100%">
				<tr>
				  <td class="regtext">
				    <cfif url.e EQ 1>
					 <p class="errorText"><strong>Error! You must choose one of the criteria below</strong></p>
					</cfif>
					<cfquery name="GetFacType" datasource="#Application.dsn#">
					  Select CodeValue, CodeDesc  
					  From Lookup
					  Where Codegroup = 'FACRES'
					  Order By CodeDesc 
					</cfquery>
					
					<cfquery name="GetFacCity" datasource="#Application.dsn#">
					  Select Distinct City 
					  From Agencies
					  Order By City 
					</cfquery>
					
					<cfquery name="GetFacCompany" datasource="#Application.dsn#">
					  Select Distinct AgencyName
					  From Agencies A, AgencyResources R
					  Where A.AgencyID = R.AgencyID
					  order By AgencyName
					</cfquery>
					
					<p>Please select any or all of the criteria by which to search for facilities.</p>
					
					<form action="FacilityFinder_Action.cfm" method="post">
					<table border="0" width="100%" class="regtext">
					<tr>
					<td valign="top"><strong>Facility Type</strong></td>
					
					<td valign="top" align="left">
					<select name="facility">
					<option value="">--Facility Type--</option>
					<cfloop query="Getfactype">
					<option value="#Codevalue#">#CodeDesc#</option>
					</cfloop>
					</select>
					
					</td>
					</tr>
					
					<tr>
					<td valign="top"><strong>City</strong></td>
					
					<td valign="top">
					<select name="city">
					<option value="">-- City --</option>
					<cfloop query="GetFacCity">
					<option value="#city#">#city#</option>
					</cfloop>
					</select>
					</td>
					</tr>
					
					<tr>
					<td valign="top"><strong>Agency</strong></td>
					
					<td valign="top" align="left">
					<select name="company">
					<option value="">--Agency--
					<cfloop query="GetFacCompany">
					<option value="#AgencyName#">#AgencyName#
					</cfloop>
					</select>
					
					</td>
					</tr>
					
					<tr>
					
					<td valign="top" colspan=2>&nbsp;</td>
					
					</tr>
					
					<tr>
					
					<td valign="top" align="center" colspan=2>
					<input type="submit" value="Search">
					
					</td>
					</tr>
					</table>
					</form>
					
					<font size="1" face="Arial, Helvetica, sans-serif">
					[Note: (CC) in the facility field indicates facilities located within a community center.]</font> 
				  </td>
				</tr>
		       </table>
			   
			   
			   <br><br>
		 </td>
     </tr>
</table>  
</cfoutput>
<cfmodule template="#Application.footer#">