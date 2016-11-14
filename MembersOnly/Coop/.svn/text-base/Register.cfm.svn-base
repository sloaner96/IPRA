
<cfparam name="url.e" default="0">  
<cfset getCoopConfig = session.CoopConfig>
<cfset BeginDate = getCoopConfig.CoopEnrollmentBegin>
<cfset EndDate = getCoopConfig.CoopEndDate>

<cfset getEAV = request.CoopComponent.getEAV()>

<cfif Len(Trim(Session.UserInfo.IPRACOID)) GT 0>
   <cfset getAgencyEAV = request.CoopComponent.getAgencyEAV(Session.UserInfo.IPRACOID)>
</cfif>

<cfmodule template="#Application.header#" section="1" sectiontitle="Cooperative Purchase Program">
 <cfoutput>

	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="150"><br>
	         <cfmodule template="#Application.tagdir#/MemberonlyNav.cfm" level=1>
		   </td>
		   <td valign="top"><br>
				<table border="0" cellpadding="5" cellspacing="0">
			       <tr>
			         <td><h3>#DateFormat(begindate, 'yyyy')# IPRA Cooperative Purchase Program Registration</h3></td>
			       </tr>
			    </table>
				<table border="0" cellpadding="0" cellspacing="0" width="100%" align="center">
                  <tr>
                      <td align="center">
					     <table border="0" cellpadding="0" cellspacing="0">
                           <tr>
						      <td><img src="../../images/CoopPersonalOn.gif" width="119" height="27" alt="" border="0"></td>
							  <td><img src="../../images/CoopMemoOff.gif" width="149" height="27" alt="" border="0"></td>
							  <td><img src="../../images/CoopPaymentOff.gif" width="97" height="27" alt="" border="0"></td>
							  <td><img src="../../images/CoopConfirmOff.gif" width="104" height="27" alt="" border="0"></td>
						   </tr>
						 </table>
					  </td>
                  </tr>
				  <tr>
                      <td align="center">
					     <table border="0" cellpadding="0" cellspacing="0">
                           <tr>
						      <td><img src="../../images/coopBubble1on.gif" width="151" height="28" alt="" border="0"></td>
							  <td><img src="../../images/CoopBubble2off.gif" width="146" height="28" alt="" border="0"></td>
							  <td><img src="../../images/CoopBubble3off.gif" width="133" height="28" alt="" border="0"></td>
							  <td><img src="../../images/CoopBubble4off.gif" width="39" height="28" alt="" border="0"></td>
						   </tr>
						 </table>
					  </td>
                  </tr>
                </table><br>
				
				<cfform name="reg1" action="saveform.cfm?l=1" method="POST">
				<table border="0" cellpadding="4" cellspacing="0" width="100%">
				   <tr bgcolor="##006699">
				     <td><strong style="font-face:arial;color:ffffff; font-size:14px;">Primary Contact Information</strong></td>
				   </tr>
				   <tr>
				     <td>The information below is the contact information that we have on file for you. Please look over the information carefully. If there are any errors, you must correct them by selecting <strong>"Manage My Info"</strong> from the left-hand side of the screen. Please then logout and login for the transaction to take place. Please make any changes <i>BEFORE</i> continuing the registration process.</td>
				   </tr>
				</table>  
				<table border="0" cellpadding="4" cellspacing="0"> 
				   <tr>
				     <td><strong>Agency Name:</strong></td>
					 <td>#Session.UserInfo.Company#</td>
				   </tr>		   
				   <tr>
				     <td><strong>Contact Person:</strong></td>
					 <td>#Session.UserInfo.Firstname# #Session.UserInfo.Lastname#</td>
				   </tr>
				   <tr>
				     <td><strong>Address:</strong></td>
					 <td>#Session.UserInfo.Address1#</td>
				   </tr>
				   <tr>
				     <td><strong>Address 2:</strong></td>
					 <td>#Session.UserInfo.Address2#</td>
				   </tr>
				   <tr>
				     <td><strong>City:</strong></td>
					 <td>#Session.UserInfo.City#</td>
				   </tr>
				   <tr>
				     <td><strong>State:</strong></td>
					 <td>#Session.UserInfo.State#</td>
				   </tr>
				   <tr>
				     <td><strong>Zip:</strong></td>
					 <td>#Session.UserInfo.ZipCode#</td>
				   </tr>
				   <tr>
				     <td><strong>Phone:</strong></td>
					 <td>#Session.UserInfo.MainPhone#</td>
				   </tr>
				   <tr>
				     <td><strong>Fax:</strong></td>
					 <td>#Session.UserInfo.Fax#</td>
				   </tr>
				   <tr>
				     <td><strong>Email:</strong></td>
					 <td>#Session.UserInfo.Email#</td>
				   </tr>
				</table>
				<br><a name="E1"></a>
				<cfif URL.E EQ 1>
				  <p class="ErrorText">Error! You Must Include a Firstname for the Secondary Contact</p>
				<cfelseif url.E EQ 2>
				  
				  <p class="ErrorText">Error! You Must Include a Lastname for the Secondary Contact</p>
				<cfelseif url.E EQ 3>
				  
				  <p class="ErrorText">Error! You Must Include a Email Address for the Secondary Contact</p>
				</cfif>
				<table border="0" cellpadding="4" cellspacing="0" width="100%">
				   <tr bgcolor="##006699">
				     <td><strong style="font-face:arial;color:ffffff; font-size:14px;">Secondary Contact Information</strong> <em style="color:ffffff;">*Optional</em></td>
				   </tr>
				   <tr>
				     <td>This person will be allowed to login to the Members Only area of the IPRA to administer the Cooperative Purchasing System for your agency. If you choose to utilize this person, you must include a firstname, lastname and valid email address for this person. Login and password information will automatically e-mailed to the specified address. <strong>IPRA IS NOT RESPONSIBLE FOR E-MAILS THAT ARE NOT RECEIVED DUE TO SPAM FILTERS AT YOUR AGENCY/ORGANIZATION.</strong></td>
				   </tr>
				</table>  
				<cfif IsDefined("Session.CoopForm.LevOne")>
				   <cfset SecFirstname = Session.CoopForm.LevOne.SecFirstname>
				   <cfset SecLastname = Session.CoopForm.LevOne.Seclastname>
				   <cfset SecPhone = Session.CoopForm.LevOne.SecPhone>
				   <cfset SecFax = Session.CoopForm.LevOne.SecFax>
				   <cfset SecEmail = Session.CoopForm.LevOne.SecEmail>
				   <cfset ThisEav = Session.CoopForm.LevOne.Eav>
				<cfelse>
				    <cfset SecFirstname = "">
				    <cfset SecLastname = "">
				    <cfset SecPhone = "">
				    <cfset SecFax = "">
				    <cfset SecEmail = "">
				    <cfset ThisEav = ""> 
				</cfif>
				<table border="0" cellpadding="4" cellspacing="0"> 	   
				   <tr>
				     <td><strong>Firstname:</strong></td>
					 <td><input type="text" name="SecFirstName" size="20" maxlength="50" value="#Trim(SecFirstname)#"></td>
				   </tr>
				   <tr>
				     <td><strong>Lastname:</strong></td>
					 <td><input type="text" name="SecLastName" size="20" maxlength="50" value="#Trim(SecLastname)#"></td>
				   </tr>
				   <tr>
				     <td><strong>Phone:</strong></td>
					 <td><input type="text" name="SecPhone" size="20" maxlength="15" value="#Trim(SecPhone)#"></td>
				   </tr>
				   <tr>
				     <td><strong>Fax:</strong></td>
					 <td><input type="text" name="Secfax" size="20" maxlength="15" value="#Trim(SecFax)#"></td>
				   </tr>
				   <tr>
				     <td><strong>Email:</strong></td>
					 <td><input type="text" name="SecEmail" size="20" maxlength="90" value="#Trim(SecEmail)#"></td>
				   </tr>
				</table>
				<br>
				<cfif url.E EQ 4>
				  <p class="ErrorText">Error! You must choose an EAV for your agency. <a name="E2"></a></p>
				</cfif>  
				<table border="0" cellpadding="4" cellspacing="0" width="100%">
				   <tr bgcolor="##006699">
				     <td><strong style="font-face:arial;color:ffffff; font-size:14px;">Equalized Assessed Valuation (EAV)</strong></td>
				   </tr>
				   <tr>
				     <td>You must choose one of the following EAV's for your agency. <cfif IsDefined("getAgencyEAV")><br><strong>(We Currently Show your Agencies EAV as #getAgencyEAV.productName#)</strong></cfif></td>
				   </tr>
				</table>  
				<table border="0" cellpadding="4" cellspacing="0"> 	   
			      <cfloop query="getEAV">
				    <tr>
					  <td><input Type="radio" name="EAV" value="#GetEav.productID#" <cfif GetEav.productID EQ ThisEAV>Checked</cfif>></td>
					  <td>#ProductName#</td>
					  <td>#DollarFormat(getEAV.MemberPrice)#</td>
					</tr>
				  </cfloop>
				</table>
				<br><br>
				<table border="0" cellpadding="0" cellspacing="0" width="60%">
                   <tr>
                      <td align="center"><input type="submit" name="submit" value="Save and Continue >>"></td>
                   </tr>
                </table>
			  </cfform>	
		   </td>
		</tr>
	</table>
</cfoutput>		   	
<cfmodule template="#Application.footer#">
