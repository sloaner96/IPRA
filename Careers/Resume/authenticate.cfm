<cfparam name="form.srclogin" default="index.cfm?v=1">
<cfparam name="form.kickto" default="EditResume.cfm">

<!--- Check the Form Variables --->
  <cfif Len(trim(form.username)) EQ 0>
     <cflocation url="#form.srclogin#&e=1" addtoken="NO">
  </cfif>
  
  <cfif Len(trim(form.password)) EQ 0>
    <cflocation url="#form.srclogin#&e=2" addtoken="NO">
  </cfif>
  
<!--- Attempt to authenticate credentials --->
  <cfset ULogin = request.CareersComponent.AuthenUser(trim(form.username), trim(form.password))>
  
  <cfif ULogin.recordcount EQ 0>    
     <!--- If this fails see if they are using there IPRA Member Login, If they are check those credentialsto see if they match  --->
	    <cfinvoke component="IPRA.Login" method="MemberLogin" returnVariable="MLogin">
		   <cfinvokeargument name="username" value="#trim(form.username)#">
	       <cfinvokeargument name="password" value="#trim(form.password)#">
		</cfinvoke>
		
		<cfif MLogin.recordcount EQ 0>
		   <cflocation url="#form.srclogin#&e=3" addtoken="NO">
		<cfelse>
		   <cfset getcontact = request.CareersComponent.getMbrContact(MLogin.MemberID)>
		   
		     <cfif getContact.recordcount GT 0>
		       <cfset Session.resBuilder.Contact = getcontact>
		       <cfset session.userinfo = MLogin> 
		     <cfelse>
			    <cflocation url="#form.srclogin#&e=3" addtoken="NO">
			 </cfif>
		   <cflocation url="#form.kickto#" addtoken="NO">  
		</cfif>
	 
  <cfelse>
      <cfset Session.resBuilder.Contact = ULogin>
     <!--- If we have the user check to see if they are a member --->
	   <cfif ULogin.MemberID NEQ "">
	      <!--- Get The Users Membership Info and Set the Member Login --->
		    <cfinvoke component="IPRA.Login" method="getMemberInfo" returnVariable="MInfo">
		         <cfinvokeargument name="memberID" value="#ULogin.MemberID#">
		    </cfinvoke> 
		    <cfset session.userinfo = MInfo>	
	   </cfif>
	   
	    <cflocation url="#form.kickto#" addtoken="NO">
	   
  </cfif>


