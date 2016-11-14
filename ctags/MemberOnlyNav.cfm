<cfparam name="attributes.level" default="0">
<cfparam name="attributes.sublevel" default="0">
<cfparam name="attributes.IsCoopAdmin" default="false">
<cfif Attributes.ISCoopAdmin>
  <cfset Attributes.level = 2>
</cfif>

<cfoutput>
<cfset checkResumeContact = request.CareersComponent.getMbrContact(Session.UserInfo.MemberID)>

 <table cellSpacing=0 cellPadding=1 width=154 border=0>
   <tbody>
       <tr>
          <td bgColor="##656565">
             <table cellSpacing=0 cellPadding=0 width=152 bgColor="##ffffff" border=0>
                <tbody>
                     <tr>
                        <td><A href="/membersOnly/index.cfm"><img height=41 src="/images/MbrOnly_SecNavHead.jpg" width=155 border=0></A><br>
							<cfif Not Attributes.ISCoopAdmin>
							 <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
                             <div class=sec-nav>
							    <a href="#Application.baseurl#/membersOnly/MyIpra/EditInfo.cfm">My IPRA</a>
							 </div>
							 <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
							 <cfif attributes.level EQ 1>
								   <div class=tert-nav>
								        <strong><a href="/MembersOnly/MyIPRA/EditInfo.cfm">Manage My Info</a></strong><br>
								   </div> 
								   <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
								   <div class=tert-nav>
								        <strong><a href="/MembersOnly/MyIPRA/EditFacility.cfm">Manage My Facilities</a></strong><br>
								   </div> 
								   <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
								   <div class=tert-nav>
								        <strong><a href="/MembersOnly/MyIPRA/CheckCEUS.cfm">Check My CEUs</a></strong><br>
								   </div> 
								   <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
								   
								   
								   
								   <cfif checkResumeContact.recordcount GT 0>
								      <div class=tert-nav>
								        <strong><a href="/Careers/Resume/EditResume.cfm">Maintain My Resume</a></strong><br>
								      </div> 
								      <img height=1 src="/images/sec_nav_dline.gif" width=156><br> 
								   <cfelse>
								      <div class=tert-nav>
								        <strong><a href="/Careers/Resume/CreateContact.cfm">Post My Resume</a></strong><br>
								      </div> 
								      <img height=1 src="/images/sec_nav_dline.gif" width=156><br> 
								   </cfif>
								   
								 </cfif> 
								 	
							      <!--- <div class=sec-nav>
								    <a href="#Application.baseurl#/MembersOnly/OrderHistory.cfm">View Order History</a>
								  </div>
								 <img height=1 src="/images/sec_nav_dline.gif" width=156><br> --->
								 <div class=sec-nav>
								    <a href="#Application.baseurl#/MembersOnly/MemberDirectory.cfm">Member Directory</a>
								 </div>
								 <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
								 <div class=sec-nav>
								    <a href="#Application.baseurl#/MembersOnly/forums/index.cfm">Forums</a>
								 </div>
								 <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
								 <div class=sec-nav>
								    <a href="http://ilipra.projectpath.com" target="_blank">Projects</a>
								 </div>
								 <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
								 <div class=sec-nav>
								    <a href="#Application.baseurl#/resources/library.cfm">Resources</a>
								 </div>
								 
								 <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
								 <div class=sec-nav>
								    <a href="#Application.baseurl#/MembersOnly/Surveys/index.cfm">Surveys</a>
								 </div>
							 </cfif>
							 <cfif IsDefined("Session.CoopConfig")>
							   <cfif Session.CoopConfig.Recordcount GT 0>
							    <cfset GetAnyRegistration = request.CoopComponent.ChkCoopEnrollment(Session.UserInfo.MemberID, Session.CoopConfig.ConfigID)>
							   <cfelse>
							    <cfset getAnyRegistration = Querynew('FakeQuery')>
							   </cfif> 	
							 <cfelse>
							    <cfset getAnyRegistration = Querynew('FakeQuery')>
							 </cfif>
							 <cfset CheckThisOrder = request.CoopComponent.CheckOrderExists(Session.UserInfo.MemberID)>
							
							 <cfif CheckThisOrder OR getAnyRegistration.recordcount GT 0>
								 <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
								  <div class=sec-nav>
								    <a href="/MembersOnly/Coop/index.cfm">Cooperative Purchase</a>
								  </div>
							 
								 <cfif attributes.level EQ 2>
								   <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
									   <cfif Session.MyCoopReg.recordcount EQ 1>
										   <cfif Session.CoopConfig.OrderBegin LTE now() AND Session.CoopConFig.OrderEnd GTE now()>
											   <div class=tert-nav>
											        <strong><a href="/MembersOnly/coop/index.cfm">Maintain Order</a></strong><br>
											   </div> 
										   </cfif>
									   </cfif> 
								   <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
								   <div class=tert-nav>
								        <strong><a href="/MembersOnly/coop/PreviousOrderReport.cfm">View Past Orders</a></strong><br>
								   </div> 
						
								 </cfif>	
							 </cfif>				
                         </td>
					</tr>
			    </tbody>
		    </table>
		  </td>
	    </tr>
	</tbody>
</table>

</cfoutput>
