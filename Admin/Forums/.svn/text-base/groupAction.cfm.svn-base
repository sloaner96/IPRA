
<cfif url.action EQ "ADD">
   <cfinvoke component="ipra.forums" method="AddGroups">
		   <cfinvokeargument name="GroupName" value="#trim(form.groupname)#">
		   <cfinvokeargument name="Status" value="1">
		   <cfinvokeargument name="AddedBY" value="#Session.admininfo.userid#">
   </cfinvoke> 	
   
   <cflocation url="maintaingroups.cfm" addtoken="NO">	   
<cfelseif url.action EQ "UPDATE">
   <cfinvoke component="ipra.forums" method="UpdateGroups">
      <cfinvokeargument name="GroupID" value="#form.groupID#">
	  <cfinvokeargument name="GroupName" value="#trim(form.groupname)#">
	  <cfinvokeargument name="UpdatedBy" value="#Session.admininfo.userid#">
   </cfinvoke> 	
   
   <cflocation url="maintaingroups.cfm" addtoken="NO">	
<cfelseif url.action EQ "DELETE">
   <cfset delgroup = request.forumcomponent.InactivateGroups(URL.GID)>
   
   <cflocation url="maintaingroups.cfm" addtoken="NO">	
</cfif>