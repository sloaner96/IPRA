
<cfquery name="GetOldAg" datasource="ipra_master">
  Select [Agency ID] as AgID, Budget, Population
  From FacilityDemographics
</cfquery>

<cfoutput query="GetOldAg">

<cfquery name="update" datasource="IPRA">
  Update Agencies
   Set Budget = <cfif Budget NEQ "">#getOldAg.Budget#<cfelse>NULL</cfif>,
       Population = <cfif Population NEQ "">#GetOldAg.Population#<cfelse>NULL</cfif>,
	   LastUpdated = #Createodbcdatetime(now())#,
	   LastSync = #Createodbcdatetime(now())#
	Where IPRAAgencyID = #GetOldAg.AgID#   
</cfquery>

<!---   <cfquery name="GetAgID" datasource="IPRA">
     Select Top 1 AgencyID
	 From Agencies
	 Where IPRAAgencyID = #GetOldAg.AgencyID#
  </cfquery>
  
  <cfif GetAgID.RecordCount GT 0>
    <cfquery name="InsertAg" datasource="IPRA">
	   Insert Into AgencyResources(AgencyID, 
	                               ResourceType, 
								   Quantity, 
								   ConcessionStand, 
								   Washrooms, 
								   AcreageOwned, 
								   AcreageLeased,
								   Rentals,
								   Leased,
								   LastUpdated)
	   Values(#GetAgID.AgencyID#,
	          '#GetoldAg.FacilityType#',
			  <cfif GetoldAg.Quantity NEQ "">#GetoldAg.Quantity#<cfelse>0</cfif>,
			  <cfif GetoldAg.Concession_Stand NEQ "">#GetoldAg.Concession_Stand#<cfelse>0</cfif>,
			  <cfif GetoldAg.Washrooms NEQ "">#GetoldAg.Washrooms#<cfelse>0</cfif>,
			  <cfif GetoldAg.AcreageO NEQ "">#GetoldAg.AcreageO#<cfelse>0</cfif>, 
			  <cfif GetoldAg.AcreageL NEQ "">#GetoldAg.AcreageL#<cfelse>0</cfif>, 
			  <cfif GetoldAg.Rentals NEQ "">#GetoldAg.Rentals#<cfelse>0</cfif>, 
			  <cfif GetoldAg.Leased NEQ "">#GetoldAg.Leased#<cfelse>0</cfif>, 
			  #Createodbcdatetime(now())#)
	</cfquery>
  
  </cfif> --->

  
  
<!---   <CFQUERY NAME="InsertNew" DATASOURCE="ipra">
    Insert Into Agencies(IPRAAgencyID, 
	                     AgencyName,
						 AgencyCat, 
						 Addr1, 
						 Addr2,
						 City, 
						 State,
						 Zip, 
						 County,
						 Phone, 
						 Fax, 
						 Email,
						 WebSite,
						 LastUpdated
						 )
	Values(#ID#,
	       '#Company#',
		   '#Category#',
		   '#ADDRESS_1#',
		   '#ADDRESS_2#', 
		   '#CITY#',
		   '#STATE_PROVINCE#',
		   '#ZIP#',
		   '#COUNTY#',
		   '#WORK_PHONE#',
		   '#FAX#',
		   '#EMAIL#',
		   '#UF_10#',
		   #Createodbcdatetime(now())#
		  )
  </CFQUERY> --->

</cfoutput>
