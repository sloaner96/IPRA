
   <cfset checkOrderExists = request.CoopComponent.CheckOrderExists(Session.UserInfo.MemberID)>


<cfmodule template="#Application.header#" section="0" sectiontitle="Cooperative Purchase Program">
  <cfoutput><br>
	<table border="0" cellpadding="5" cellspacing="0">
       <tr>
         <td><h3>IPRA Cooperative Purchase Program</h3></td>
       </tr>
    </table>
	<cfif IsDefined("Session.CoopConfig")>
		<cfif Session.CoopConfig.recordcount GT 0>
	       <cfif IsDefined("Session.MyCoopReg")>
		      <cflocation url="CoopOrder.cfm" addtoken="NO">
		   <cfelse>
		      <cflocation url="Register.cfm" addtoken="NO">	  
		   </cfif>
		<cfelse>
		    <cfif checkOrderExists>
			  <cflocation url="PreviousorderReport.cfm" addtoken="NO">
			<cfelse>
			   <cflocation url="../index.cfm" addtoken="NO">
			</cfif>   	
		</cfif>
	<cfelse>
	  <cflocation url="../index.cfm" addtoken="NO">	
	</cfif>
<br><br><br><br>

 </cfoutput>		   	
<cfmodule template="#Application.footer#">