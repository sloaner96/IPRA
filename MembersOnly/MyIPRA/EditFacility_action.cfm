
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
	<base target="main">	
</head>

<body>



<font face="arial" size="-1">
<cfif url.action EQ "DEM">
  <cfquery name="UpdateDem" datasource="#Application.dsn#">
    Update Agencies
	  Set Budget = #Form.Budget#,
	      Population = #Form.Population#, 
		  LastUpdated = #CreateODBCDateTime(now())#,
		  UpdatedBy = #Session.UserInfo.MemberID# 
	  Where AgencyID = 	#Form.AgencyID#  
  </cfquery>
  
  <!--- <cflocation url="EditFacility.cfm" addtoken="No"> --->
  <meta http-equiv="refresh" content="0;url=EditFacility.cfm">
<cfelseif url.action EQ "AddFac">
  <cfquery name="AddFac" datasource="#Application.dsn#">
    Insert Into AgencyResources (
	      AgencyID,
		  ResourceType,
		  Quantity,
		  ConcessionStand,
		  Washrooms,
		  AcreageOwned,
		  AcreageLeased,
		  Rentals,
		  Leased,
		  LastUpdated    
	)
	Values (
	     #Form.AgencyID#,
		 <cfif Len(Trim(form.ResourceType)) GT 0>'#Form.ResourceType#'<cfelse>NULL</cfif>,
		 <cfif Len(Trim(form.Quantity)) GT 0>#Form.Quantity#<cfelse>0</cfif>,
		 <cfif ISDefined("form.ConStand")>#form.ConStands#<cfelse>0</cfif>,
		 <cfif ISDefined("form.Washrooms")>#form.Washrooms#<cfelse>0</cfif>,
		 <cfif Len(Trim(form.AcreageO)) GT 0>#Form.AcreageO#<cfelse>0</cfif>,
		 <cfif Len(Trim(form.AcreageL)) GT 0>#Form.AcreageL#<cfelse>0</cfif>,
		 <cfif ISDefined("form.Rentals")>#form.Rentals#<cfelse>0</cfif>,
		 0,
		 #CreateODBCDateTime(now())#
	)
  </cfquery>
  
  <p><strong>You have successfully added a new resource</strong></p>
  
  <p><a href="/MembersOnly/MyIpra/Editfacility.cfm" target="main" onclick="self.close();">Click here</a> to go back to the Edit my Facilities page.</p>
<cfelseif url.action EQ "EditFac">
     <cfif IsDefined("form.RemoveFacility")>
	   <cfquery name="DeleteRes" datasource="#Application.dsn#">
	      Delete From dbo.AgencyResources
		  Where AGResourceID = #Form.AgResourceID#
	   </cfquery>
	     <p><strong>You have successfully Deleted this resource</strong></p>
  
         <p><a href="/MembersOnly/MyIpra/Editfacility.cfm" target="main" onclick="self.close();">Click here</a> to go back to the Edit my Facilities page.</p>
	 <cfelse>
	     
	     <cfquery name="UpdFac" datasource="#Application.dsn#">
		    Update AgencyResources
			  Set ResourceType = '#Form.ResourceType#',
				  Quantity = <cfif Form.Quantity NEQ "">#Form.Quantity#<cfelse>NULL</cfif>,
				  ConcessionStand = <cfif ISDefined("form.ConStand")>#form.ConStands#<cfelse>0</cfif>,
				  Washrooms = <cfif ISDefined("form.Washrooms")>#form.Washrooms#<cfelse>0</cfif>,
				  AcreageOwned = <cfif form.acreageO NEQ "">#Form.AcreageO#<cfelse>NULL</cfif>,
				  AcreageLeased = <cfif form.acreageL NEQ "">#Form.AcreageL#<cfelse>NULL</cfif>,
				  Rentals = <cfif ISDefined("form.Rentals")>#form.Rentals#<cfelse>0</cfif>,
				  Leased = 0,
				  LastUpdated = #CreateODBCDateTime(now())#   
			Where AgResourceID = #form.AgResourceID#
		  </cfquery>
		  
		  	     <p><strong>You have successfully Updated this resource</strong></p>
  
         <p><a href="/MembersOnly/MyIpra/Editfacility.cfm" target="main" onclick="self.close();">Click here</a> to go back to the Edit my Facilities page.</p>
	 </cfif>
</cfif>
</font>


</body>
</html>