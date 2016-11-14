<cfset Error = 0>

<cfif Len(Trim(form.topic)) EQ 0>
  <cfset Error = 1>
</cfif>

<cfif Len(Trim(form.content)) EQ 0>
  <cfset Error = 2>
</cfif>

<cfif Error EQ 0>
  <cfinvoke component="IPRA.Forums" method="AddMessage">
    <cfinvokeargument name="CategoryID" value="#form.catID#">
	<cfinvokeargument name="Status" value="1">
	<cfif IsDefined("form.IsSticky")>
	  <cfinvokeargument name="IsSticky" value="#form.IsSticky#">
	</cfif>
	<cfinvokeargument name="MsgSubject" value="#Trim(form.topic)#">
	<cfinvokeargument name="MsgBody" value="#Trim(form.content)#">
	<cfif Not IsDefined("Session.AdminInfo")>
	  <cfinvokeargument name="CreatedBy" value="#session.UserInfo.memberID#">
	<cfelse>
	    <cfinvokeargument name="CreatedBy" value="#session.AdminInfo.UserID#">
	   <cfinvokeargument name="AdminPost" value="1">
	</cfif>
  </cfinvoke>
  
  <cflocation url="postings.cfm?cid=#form.catid#" addtoken="no">
<cfelse>
<cfmodule template="#Application.header#" section="0" sectiontitle="IPRA FORUMS">

  <cfoutput>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="150"><br>
	         <cfmodule template="#Application.tagdir#/MemberonlyNav.cfm" level="3">
		   </td>
		   <td valign="top"><br>
	 		 <table border="0" cellpadding="4" cellspacing="0" width="100%">
              <cfif Error EQ 1>
			    <tr>
                  <td class="Errortext">Error! You must Include a topic for this posting.</td>
                </tr>
			  <cfelse>
			      <tr>
                   <td class="Errortext">Error! You must Include a message for this posting.</td>
                 </tr>
             </cfif>
			 <tr>
			   <td>&nbsp;</td>
			 </tr>
			 <tr>
			   <td><a href="javascript:window.back();">Click here</a> to go back and correct your error</td>
			 </tr>
			 
			 </table>	 
				  <br><br>
		   </td>
        </tr>
   </table>  
 </cfoutput>
<cfmodule template="#Application.footer#">	   
</cfif>


