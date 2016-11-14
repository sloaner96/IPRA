
<cfset getCoopConfig = request.CoopComponent.getCoopConfig(now())>
<cfset BeginDate = getCoopConfig.CoopEnrollmentBegin>
<cfset EndDate = getCoopConfig.CoopEndDate>
<cfset CoopDesc = "IPRA #DateFormat(begindate, 'yyyy')#-#DateFormat(enddate, 'yy')# Cooperative Purchase Program">

<cfset getEAVInfo = request.CoopComponent.getEAVInfo(Session.CoopForm.LevOne.Eav)>
<cfset GettransactionInfo = request.PaymentComponent.getTransactionInfo(Session.CoopRegOrderNumber, Application.EnKey, Session.UserInfo.MemberID)>

<cfif Len(Trim(Session.UserInfo.Email)) GT 0>
	<cfinvoke component="IPRA.Coop" method="SendConfirmationEmail">
	    <cfinvokeargument name="senderEmail" value="#Session.UserInfo.Email#">
		<cfinvokeargument name="EmailSubject" value="Welcome to the #CoopDesc#">
		<cfinvokeargument name="CoopDesc" value="#CoopDesc#">
		<cfinvokeargument name="orderBegin" value="#DateFormat(BeginDate, 'MM/DD/YYYY')#">
		<cfinvokeargument name="orderEnds" value="#DateFormat(GetCoopConfig.OrderEnd, 'MM/DD/YYYY')#">
	    <cfinvokeargument name="CoopEndDate" value="#DateFormat(EndDate, 'MM/DD/YYYY')#">
	</cfinvoke>

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
			         <td><h3>#CoopDesc# Registration</h3></td>
			       </tr>
			    </table>
				<table border="0" cellpadding="0" cellspacing="0" width="100%" align="center">
                  <tr>
                      <td align="center">
					     <table border="0" cellpadding="0" cellspacing="0">
                           <tr>
						      <td><img src="../../images/CoopPersonalOn.gif" width="119" height="27" alt="" border="0"></td>
							  <td><img src="../../images/CoopMemoon.gif" width="149" height="27" alt="" border="0"></td>
							  <td><img src="../../images/CoopPaymentOn.gif" width="97" height="27" alt="" border="0"></td>
							  <td><img src="../../images/CoopConfirmOn.gif" width="104" height="27" alt="" border="0"></td>
						   </tr>
						 </table>
					  </td>
                  </tr>
				  <tr>
                      <td align="center">
					     <table border="0" cellpadding="0" cellspacing="0">
                           <tr>
						      <td><img src="../../images/coopBubble1on.gif" width="151" height="28" alt="" border="0"></td>
							  <td><img src="../../images/CoopBubble2on.gif" width="146" height="28" alt="" border="0"></td>
							  <td><img src="../../images/CoopBubble3on.gif" width="133" height="28" alt="" border="0"></td>
							  <td><img src="../../images/CoopBubble4on.gif" width="39" height="28" alt="" border="0"></td>
						   </tr>
						 </table>
					  </td>
                  </tr>
                </table><br>
                <table border="0" cellpadding="4" cellspacing="0" width="100%">
                   <tr>
                     <td><p>Thank You for your Registration.</p> 
					 <p><strong>PLEASE READ</strong>: Due to reported problems last year regarding Internet connections at member agencies using Novell BorderManager attempting to connect to the IPRA COOP Online Program, IPRA suggests establishing a connection outside BorderManager or any proxy server/software to ensure that individuals may participate without issues. For more information, please contact your IT administrator or review <a href="http://support.novell.com/cgi-bin/search/searchtid.cgi?10095442.htm" target="_blank">Novell's tech article</a>.</p>
					     <p>Beginning <strong>#DateFormat(GetCoopConfig.OrderBegin, 'mm/dd/yyyy')#</strong> you may begin entering your order for the #DateFormat(begindate, 'yyyy')#-#DateFormat(enddate, 'yy')# Cooperative Purchasing program by clicking the <a href="index.cfm" style=""><strong>HERE</strong></a>.</p>
						 <p><em><strong>Please note:</strong></em> Orders must be completed by #DateFormat(GetCoopConfig.OrderEnd, 'MM/DD/YYYY')# at the latest. Orders not completed by that date will be filled "as-is". You may check the Coop Calendar under the Cooperative Purchase Program Link to the right for more dates.</p></td>
                   </tr>
                </table> 
				<table border="0" cellpadding="4" cellspacing="0" width="100%">
				   <tr bgcolor="##006699">
				     <td><strong style="font-face:arial;color:ffffff; font-size:14px;">Cooperative Purchase Program Registration</strong></td>
				   </tr>
				</table>  
				<table border="0" cellpadding="5" cellspacing="0" width="100%"> 
                   <tr bgcolor="eeeeee">
				     <td><strong>Personal Information</strong></td>
				   </tr>
				   <tr>
				     <td>
					   <blockquote>
					     #Session.UserInfo.Company#<br> 
					     #Session.UserInfo.Firstname# #Session.UserInfo.Lastname#<br>
						 #Session.UserInfo.Address1#<br>
						 #Session.UserInfo.Address2#<br>
						 #Session.UserInfo.City#, #Session.UserInfo.State# #Session.UserInfo.ZipCode#<br>
						 #Session.UserInfo.MainPhone#<br>
						 #Session.UserInfo.Fax#<br>
						 #Session.UserInfo.Email#
					   </blockquote>
					 </td>
				   </tr>
				   <cfif Session.CoopForm.LevOne.SecFirstname NEQ "" AND Session.CoopForm.LevOne.SecEmail NEQ ""> 
				   <tr bgcolor="eeeeee">
				     <td><strong>Secondary Contact Information</strong></td>
				   </tr>
				   <tr>
				     <td>
					   <blockquote>
					     #Session.CoopForm.LevOne.SecFirstname# #Session.CoopForm.LevOne.SecLastname#<br>
						 Phone: #Session.CoopForm.LevOne.SecPhone#<br>
						 Fax: #Session.CoopForm.LevOne.SecFax#<br>
						 Email/Login: #Session.CoopForm.LevOne.SecEmail# (email sent to this address with login information)
					   </blockquote>
					 </td>
				   </tr>
				   <cfelse>
				     <tr bgcolor="eeeeee">
				     <td><strong style="color:##828282;">Secondary Contact Information</strong></td>
				   </tr>
				   <tr>
				     <td style="color:##828282;">&nbsp;&nbsp;&nbsp;&nbsp;None Defined</td>
				   </tr>
				   </cfif>
				   <tr bgcolor="eeeeee">
				     <td><strong>Confirmation of EAV (#getEAVInfo.Productname#)</strong></td>
				   </tr>
				   <tr><td></td></tr>
				   <tr bgcolor="eeeeee">
				     <td><strong>Agreement of Memorandum of Understanding</strong></td>
				   </tr>
				   <tr>
				     <td><blockquote>#Replacenocase(getcoopconfig.AgreementText, "[AgencyName]", session.userinfo.company, "all")#<br><br><strong>DIGITALLY SIGNED BY #Session.UserInfo.Firstname# #Session.UserInfo.Lastname# on #DateFormat(Session.CoopForm.Levtwo.MOUConfirmDate, 'MM/DD/YYY')# at #TimeFormat(Session.CoopForm.Levtwo.MOUConfirmDate, 'hh:mm tt')#</strong></blockquote></td>
				   </tr>
				   
                </table>
				
				<table border="0" cellpadding="3" cellspacing="0" width="100%">
				<tr>
				   <p align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="index.cfm"><img src="../../images/continue.jpg" border="0"></a></p>
				   </tr>
                  <tr bgcolor="eeeeee">
				    <td colspan=2><strong style="font-face:arial;font-size:14px;">Registration Fee:</strong></td>
				  </tr>
				  <tr>
                     <td>Cooperative Purchase Program Registration Fee<br>EAV: #getEAVInfo.Productname#</td>
					 <td align="right">#DollarFormat(getEAVInfo.MemberPrice)#</td> 
                  </tr>
				  <tr>
				    <td colspan=2><hr noshade size="1"></td>
				  </tr>
				  <tr>
				    <td></td>
					<td align="Right"><strong>Total Paid:  #DollarFormat(getEAVInfo.MemberPrice)#</strong></td>
				  </tr>
				  <tr>
				    <td><strong>Paid Via:</strong> #GettransactionInfo.TransType#</td>
				  </tr>
				  
               </table>	
			   
				<table border="0" cellpadding="0" cellspacing="0" width="100%">
                   <tr>
                      <td></td>
                   </tr>
               </table>
			</td>
		</tr>
	</table>	
		   
</cfoutput>	
<!--- This will Set the MyCoopRegVariable --->
<cfset Session.MyCoopReg = request.CoopComponent.ChkCoopEnrollment(Session.UserInfo.MemberID, Session.CoopConfig.ConfigID)>
<!--- Kill the Session Variables  ---> 
<cfset Session.CoopForm = ""> 	
<cfmodule template="#Application.footer#">
