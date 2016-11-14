<cfif Not IsDefined("Session.UserInfo.IsCoopSecAdmin")>
  <cfset Session.ISCoopAdmin = false>
<cfelse>
   <cfset Session.ISCoopAdmin = true> 
</cfif>

  <!--- Check to see if the coop registration period is open --->
  <cfset CoopRegPeriod = request.CoopComponent.getCoopConfig(now())>
  
	  <cfif CoopRegPeriod.recordCount GT 0>
	    <cfset Session.CoopConfig = CoopRegPeriod>
	  
		 <!--- Check to see if I am registered for the Coop --->
		  <cfif Not IsDefined("Session.MyCoopReg")>
		     <cfset Session.MyCoopReg = request.CoopComponent.ChkCoopEnrollment(Session.UserInfo.MemberID, Session.CoopConfig.ConfigID)>
		  </cfif> 
	  <cfelse>
	    <cfset Session.CoopConfig = QueryNew('FakeQuery')>
	  </cfif>
<cfmodule template="#Application.header#" section="0" sectiontitle="Members Only Home">
  <cfoutput>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="150"><br>
	         <cfmodule template="#Application.tagdir#/MemberonlyNav.cfm" isCoopAdmin="#Session.ISCoopAdmin#">
		   </td>
		   <td valign="top"><br>
			  <table border="0" cellpadding="5" cellspacing="0">
		        <tr>
		          <td><h3>Members Only Home</h3></td>
		        </tr>
		      </table>
			  <table border="0" cellpadding="6" cellspacing="0" width="100%">
		        <tr>
		           <td class="RegText">
				   <cfif Not Session.ISCoopAdmin>
				     <p>Welcome <strong>#Session.Userinfo.FirstName# #Session.Userinfo.lastname#</strong> to the IPRA Members Only Homepage.</p>
<p>To make changes to your IPRA Member Information and/or your agency facilities, please select the applicable link(s) below.</p>
				   <cfelse>
				      <p>Welcome <strong>#Session.Userinfo.FirstName# #Session.Userinfo.lastname#</strong>, To maintain the Cooperative Purchase program for your Agency Use the Menu to the left.
				   </cfif>
				     <table border="0" cellpadding="6" cellspacing="0" width="100%" class="regtext">
					      <tr> 
					         <td>
							  <cfif IsDefined("Session.CoopConfig")>
								    <cfif ISDefined("Session.MyCoopReg")>
									    <cfif Session.MyCoopReg.recordcount EQ 0>
											  <cfif Session.CoopConfig.CoopEnrollmentEnd GT now()>
											       <a href="/MembersOnly/coop/register.cfm"><img src="/images/coopbanner.jpg" alt="Coop Program Sign-up!" border="1" align="right" style="border-color:000000: 1px;"></a>
										      </cfif>
										<cfelse>
											  <cfif Session.CoopConfig.OrderBegin LTE now() AND Session.CoopConFig.OrderEnd GTE now()>
										          <a href="/MembersOnly/coop/index.cfm"><img src="/images/coopOrderBanner.jpg" alt="Coop Program Sign-up!" border="1" align="right" style="border-color:000000: 1px;"></a>
											  </cfif>
										</cfif> 
								  </cfif>
							  </cfif>
							  <cfif Not Session.ISCoopAdmin>
								
								<a href="/Careers/index.cfm"><img src="/images/mojobs.jpg" border="0"></a>&nbsp;&nbsp;&nbsp;<a href="/MembersOnly/MyIPRA/checkceus.cfm"><img src="/images/moceus.jpg" border="0"></a><br>
<a href="/MembersOnly/MyIpra/EditInfo.cfm"><img src="/images/moinfo.jpg" border="0"></a>&nbsp;&nbsp;&nbsp;<a href="/MembersOnly/MyIpra/EditFacility.cfm"><img src="/images/mofacility.jpg" border="0"></a><br>
<a href="/MembersOnly/MemberDirectory.cfm"><img src="/images/modirectory.jpg" border="0"></a>&nbsp;&nbsp;&nbsp;<a href="/MembersOnly/forums/index.cfm"><img src="/images/moforum.jpg" border="0"></a>
<br>
<a href="/MembersOnly/ListServ/ListServ.cfm"><img src="/images/molistserv.jpg" border="0"></a>&nbsp;&nbsp;&nbsp;<a href="/MembersOnly/staff.cfm"><img src="/images/mostaff.jpg" border="0"></a>
<br>
<a href="/Resources/findafacility.cfm"><img src="/images/mofindfacility.jpg" border="0"></a>&nbsp;&nbsp;&nbsp;<a href="/Resources/library.cfm"><img src="/images/molibrary.jpg" border="0"></a>
<br>
<hr noshade>
								  <p><b>Other Items of Interest</b></p>
								  <li><a href="/forms/MembersOnly/StrategicPlan2006-2007.pdf" target="_blank">2006 Strategic Plan</a>&nbsp;<img src="/images/new_yell.gif" border="0">
								  <br>
								  <br>
								  <li><a href="/forms/MembersOnly/2007_BOD_NominationForm.doc" target="_blank">2006/2007 Elections</a>&nbsp;<img src="/images/new_yell.gif" border="0">
								  <br>
								  <br>
								  <li><a href="/membersOnly/MemberToMember/topiclist.cfm">Member-to-Member Resource Network</a></li>
<hr noshade>
								  <p><b>IPRA Knowledge Base</b> (Research Compiled as an IPRA Member Resource)</b></p>
<li><a href="/forms/budgeting.pdf">Budgeting</a></li>
<br>
<li><a href="/Forms/electronic_fundraising.pdf">Fundraising in an Electronic Age</a></li>
<br>
<li><a href="/Forms/grant_writing.pdf">Grant Writing</a></li>
<br>
<li><a href="/Forms/partnerships.pdf">Partnering</a></li>
<br>
<li><a href="/Forms/programming.pdf">Programming</a></li>
<br>
<li><a href="/Forms/time_management.pdf">Time Management</a>
<hr noshade>
								  <p><b>Travel-Related Discounts for IPRA Members</b></p>
<li><a href="http://www.avis.com/AvisWeb/html/bridge/assoc/members/go.html?B771300" target="_new">Members-Only Discount Rates From Avis Rental Cars</a></li>
<br>
<li><a href="http://www.alamo.com/hotdeals/Template.asp?msg=affil_ilipra_page" target="_new">Members-Only Discount Rates From Alamo Rental Cars</a></li>
<br>
<li><a href="http://www.wildvacationsca.com">Members-Only Discount Rates to California-based Vacation Services</a><br>(<i>Select New User button and enter Illinois Parks &amp; Recreation as your Company. Register as a new user and you're all set</i>.)</li>
<br>
<li><a href="http://www.adventureclubonline.com/_login/adventure_club_login.aspx?ReturnUrl=/Default.aspx">Members-Only Discount Rates to Anheuser-Busch Adventure Parks </a>*<br>(Once you click on the Busch Gardens link, select "New Employees - Click Here to Register" Fill in your info & a confirmation email will be sent to you. 
Remember to use Club ID 5178 when registering.)<br>
								    <br>
								    <i>* SeaWorld San Diego, SeaWorld Orlando, SeaWorld San Antonio, Busch Gardens Williamsburg, Busch Gardens Tampa Bay, Adventure Island, Water Country USA and Sesame Place</i></li>
<br>
<hr noshade>
							</cfif>	
								  
				  </td>
              </tr>
            </table>

				   </td>
		        </tr>
		       </table>
			   <br><br>
		 </td>
     </tr>
</table>  
</cfoutput>
<cfmodule template="#Application.footer#">

