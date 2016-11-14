<cfswitch expression="#URL.Action#">
  <cfcase value="ADD">
     <cfif Len(Trim(form.GroupID)) EQ 0>
	   <cflocation url="CatMaint.cfm?E=1" addtoken="NO">
	 </cfif>
	 <cfif Len(Trim(form.CategoryID)) EQ 0>
	   <cflocation url="CatMaint.cfm?E=2" addtoken="NO">
	 </cfif>
	 
	 <cfset AddCategory = Request.CoopAdminComponent.AddCategory(Form.GroupID, trim(form.CategoryID))>
	 
	<cflocation url="CatMaint.cfm" addtoken="NO">
  </cfcase>
  <cfcase value="UPDATE">
     <cfif Len(Trim(url.CatID)) EQ 0>
	   <cflocation url="CatMaint.cfm?E=3" addtoken="NO">
	 </cfif>
	 
	 <cfset UpdateCat = Request.CoopAdminComponent.UpdateCategory(URL.CatID, URL.S)>
	 
	 <cflocation url="CatMaint.cfm" addtoken="NO">
	 
  </cfcase>
  <cfcase value="DELETE">
     <cfif Len(Trim(url.CatID)) EQ 0>
	   <cflocation url="CatMaint.cfm?E=3" addtoken="NO">
	 </cfif>
	 
	 <cfset DeleteCat = Request.CoopAdminComponent.DeleteCategory(URL.CatID)>
	 
	 <cflocation url="CatMaint.cfm" addtoken="NO">
	 
  </cfcase>
</cfswitch>
