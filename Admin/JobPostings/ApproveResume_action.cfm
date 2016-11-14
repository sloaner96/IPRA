
<cfif IsDefined("form.Approval")>
   <cfif form.approval EQ 1>
      <cfset approve = request.CareersComponent.ApproveResume(Form.ResumeID, form.Approval)>
	  <cflocation url="/admin/index.cfm" addtoken="NO">
   <cfelseif form.Approval EQ 2>
      <cfif len(trim(form.Reason)) EQ 0>
	    <cflocation url="ApproveResume.cfm?e=2&ResumeID=#Form.ResumeID#" addtoken="NO">
		<cfabort>
	  </cfif> 
      <cfset reject = request.CareersComponent.ApproveResume(Form.ResumeID, form.Approval, trim(form.Reason))>
      <cflocation url="/admin/index.cfm" addtoken="NO">
   </cfif>
<cfelse>
    <cflocation url="ApproveResume.cfm?e=1&ResumeID=#Form.ResumeID#" addtoken="NO">
</cfif>
