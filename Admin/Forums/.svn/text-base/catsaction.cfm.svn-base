<cfif url.action EQ "ADD">
   <cfinvoke component="ipra.forums" method="AddCategory">
	 <cfinvokeargument name="GroupID" value="#form.GroupID#">
	 <cfinvokeargument name="CategoryStatus" value="1">
	 <cfinvokeargument name="CategoryName" value="#trim(form.CatName)#">
	 <cfinvokeargument name="CategoryDesc" value="#trim(form.CatDesc)#">
	 <cfinvokeargument name="CreatedBy" value="#Session.admininfo.userid#">
   </cfinvoke> 	
   
   <cflocation url="maintainCats.cfm" addtoken="NO">	   
<cfelseif url.action EQ "UPDATE">
   <cfinvoke component="ipra.forums" method="EditCategory">
     <cfinvokeargument name="CategoryID" value="#form.categoryID#">
     <cfinvokeargument name="GroupID" value="#form.GroupID#">
	 <cfinvokeargument name="CategoryName" value="#trim(form.CatName)#">
	 <cfinvokeargument name="CategoryDesc" value="#trim(form.CatDesc)#">
	 <cfinvokeargument name="UpdatedBy" value="#Session.admininfo.userid#">
   </cfinvoke> 	
   
   <cflocation url="maintainCats.cfm" addtoken="NO">	
<cfelseif url.action EQ "DELETE">
   <cfset delcats = request.forumcomponent.InactivateCategory(URL.CID)>
   
   <cflocation url="maintainCats.cfm" addtoken="NO">	
</cfif>
