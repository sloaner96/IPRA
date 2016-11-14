<!--- Error Check the Form --->
<cfif Len(Trim(form.SecFirstname)) GT 0 OR Len(Trim(form.Seclastname)) GT 0>  
	<cfif Len(Trim(Form.Secfirstname)) EQ 0>
	   <cflocation url="RegMaint.cfm?e=1##E1" addtoken="no">
	</cfif>
	<cfif Len(Trim(Form.Seclastname)) EQ 0>
	   <cflocation url="RegMaint.cfm?e=2##E1" addtoken="no">
	</cfif>
	<cfif Len(Trim(Form.SecEmail)) EQ 0>
	   <cflocation url="RegMaint.cfm?e=3##E1" addtoken="no">
	</cfif>
<cfelseif Len(Trim(form.SecEmail)) GT 0>    
	<cfif Len(Trim(Form.Secfirstname)) EQ 0>
	   <cflocation url="RegMaint.cfm?e=5##E1" addtoken="no">
	</cfif>
	
	<cfif Len(Trim(Form.Seclastname)) EQ 0>
	   <cflocation url="RegMaint.cfm?e=6##E1" addtoken="no">
	</cfif>
	
	<cfif Len(Trim(Form.SecEmail)) EQ 0>
	   <cflocation url="RegMaint.cfm?e=7##E1" addtoken="no">
	</cfif>
</cfif>

<!--- Create an Password for the User --->
   <cfset GeneratedPassword = request.CoopComponent.GeneratePassword()>
   
<cfinvoke component="IPRA.Coop" method="updateSecondaryAdmin">
     <cfinvokeArgument name="CoopID" value="#Session.MyCoopReg.CoopID#">
     <cfinvokeArgument name="RegistrationID" value="#Session.MyCoopReg.RegistrationID#">
	 <cfinvokeArgument name="memberID" value="#Session.MyCoopReg.memberID#">
	 <cfinvokeArgument name="SecFirstame" value="#Trim(form.SecFirstname)#">
     <cfinvokeArgument name="Seclastname" value="#Trim(form.SecLastname)#">
     <cfinvokeArgument name="SecEmail" value="#Trim(form.SecEmail)#">
     <cfinvokeArgument name="SecPassword" value="#GeneratedPassword#">
     <cfinvokeArgument name="SecPhone" value="#Trim(form.SecPhone)#">
     <cfinvokeArgument name="SecFax" value="#Trim(form.SecFax)#">
</cfinvoke>

<cfset Session.MyCoopReg = request.CoopComponent.ChkCoopEnrollment(Session.UserInfo.MemberID, Session.CoopConfig.ConfigID)>

<cflocation url="RegMaint.cfm" addtoken="NO">