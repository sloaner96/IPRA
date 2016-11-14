<cfif form.action EQ "ADD">
   
   <cfif form.username EQ "">
      <!--- <cflocation url="index.cfm?e=1&Type=Add" addtoken="No"> --->
	  <meta http-equiv="refresh" content="0;url=index.cfm?e=1&Type=Add">
   </cfif>
   
   <cfif form.password EQ "">
     <!--- <cflocation url="index.cfm?e=2&Type=Add" addtoken="No"> --->
	 <meta http-equiv="refresh" content="0;url=index.cfm?e=2&Type=Add">
   </cfif>
   
   <cfif form.firstname EQ "">
     <!--- <cflocation url="index.cfm?e=3&Type=Add" addtoken="No"> --->
	 <meta http-equiv="refresh" content="0;url=index.cfm?e=3&Type=Add">
   </cfif>
   
   
   <cfif form.lastname EQ "">
     <!--- <cflocation url="index.cfm?e=4&Type=Add" addtoken="No"> --->
	 <meta http-equiv="refresh" content="0;url=index.cfm?e=4&Type=Add">
   </cfif>
   
   <cfif form.email EQ "">
     <<!--- cflocation url="index.cfm?e=5&Type=Add" addtoken="No"> --->
	 <meta http-equiv="refresh" content="0;url=index.cfm?e=5&Type=Add">
   </cfif>
   
   <cfif Not IsDefined("form.AllowAdmin") AND Not IsDefined("form.AllowFinance") AND Not IsDefined("form.AllowMember")>
      <!--- <cflocation url="index.cfm?e=6&Type=Add" addtoken="No"> --->
	  <meta http-equiv="refresh" content="0;url=index.cfm?e=6&Type=Add">
   </cfif>
   
    <cfquery name="AddUser" datasource="#Application.dsn#">
      Insert Into SiteUsers (
	              Username,
				  Password,
				  Email,
				  Firstname,
				  Lastname,
				  Title,
				  MemberID,
				  AllowAdmin,
				  AllowFinance,
				  AllowMember,
				  LastUpdated
			 ) 
	  Values (
	            '#Form.Username#',
				'#form.password#',
				'#form.email#',
				'#form.firstname#',
				'#form.lastname#',
				'#form.title#',
				0,
				<cfif IsDefined("form.AllowAdmin")>1<cfelse>0</cfif>,
				<cfif IsDefined("form.AllowFinance")>1<cfelse>0</cfif>,
				<cfif IsDefined("form.AllowMember")>1<cfelse>0</cfif>,
				#CreateODBCDateTime(Now())#
			 )
   </cfquery>
   
   <!--- <cflocation url="index.cfm" addtoken="No">   --->
   <meta http-equiv="refresh" content="0;url=index.cfm">
<cfelseif form.action EQ "Edit">
     <cfif form.username EQ "">
      <!--- <cflocation url="index.cfm?e=1&Type=Edit" addtoken="No"> --->
	  <meta http-equiv="refresh" content="0;url=index.cfm?e=1&Type=Edit">
   </cfif>
   
   <cfif form.password EQ "">
     <!--- <cflocation url="index.cfm?e=2&Type=Edit" addtoken="No"> --->
	 <meta http-equiv="refresh" content="0;url=index.cfm?e=2&Type=Edit">
   </cfif>
   
   <cfif form.firstname EQ "">
     <!--- <cflocation url="index.cfm?e=3&Type=Edit" addtoken="No"> --->
	 <meta http-equiv="refresh" content="0;url=index.cfm?e=3&Type=Edit">
   </cfif>
   
   
   <cfif form.lastname EQ "">
     <!--- <cflocation url="index.cfm?e=4&Type=Edit" addtoken="No"> --->
	 <meta http-equiv="refresh" content="0;url=index.cfm?e=4&Type=Edit">
   </cfif>
   
   <cfif form.email EQ "">
     <!--- <cflocation url="index.cfm?e=5&Type=Edit" addtoken="No"> --->
	 <meta http-equiv="refresh" content="0;url=index.cfm?e=5&Type=Edit">
   </cfif>
   
   <cfif Not IsDefined("form.AllowAdmin") AND Not IsDefined("form.AllowFinance") AND Not IsDefined("form.AllowMember")>
      <!--- <cflocation url="index.cfm?e=6" addtoken="No"> --->
	  <meta http-equiv="refresh" content="0;url=index.cfm?e=6&Type=Edit">
   </cfif>
   
	<cfif IsDefined("form.RevokeMbr")>
	   <cfquery name="DeleteUser" datasource="#Application.dsn#">
	      Delete From SiteUsers
		  Where UserID = #Form.UserID#
	   </cfquery>
	<cfelse>
	    <cfquery name="UpdateUser" datasource="#Application.dsn#">
		      Update SiteUsers 
			    Set  Username = '#Form.Username#',
					 Password = '#form.password#',
						  Email = '#form.email#',
						  Firstname = '#form.firstname#',
						  Lastname = '#form.lastname#',
						  Title = '#form.title#',
						  AllowAdmin = <cfif IsDefined("form.AllowAdmin")>1<cfelse>0</cfif>,
						  AllowFinance = <cfif IsDefined("form.AllowFinance")>1<cfelse>0</cfif>,
						  AllowMember = <cfif IsDefined("form.AllowMember")>1<cfelse>0</cfif>,
						  LastUpdated = #CreateODBCDateTime(Now())#
			   Where UserID = #Form.UserID#			  
        </cfquery>
	</cfif>
	 <meta http-equiv="refresh" content="0;url=index.cfm">
    <!--- <cflocation url="index.cfm" addtoken="No"> ---> 
</cfif>