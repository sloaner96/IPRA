<cfparam name="url.e" default="0">

<cfset getCoopConfig = request.CoopComponent.getCoopConfig(now())>
<cfset BeginDate = getCoopConfig.CoopEnrollmentBegin>
<cfset EndDate = getCoopConfig.CoopEndDate>

<cfset getEAVInfo = request.CoopComponent.getEAVInfo(Session.CoopForm.LevOne.Eav)>

<cfset getPayType = request.PaymentComponent.GetPayType()>
<cfset CCards = request.PaymentComponent.GetCCards()>
<cfset months = request.PaymentComponent.Getmonths()>
<cfset GetState = request.PaymentComponent.GetState()>

															   
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
			         <td><h3>IPRA #DateFormat(begindate, 'yyyy')#-#DateFormat(enddate, 'yy')# Cooperative Purchase Program Registration</h3></td>
			       </tr>
			    </table>
				<table border="0" cellpadding="0" cellspacing="0" width="100%" align="center">
                  <tr>
                      <td align="center">
					     <table border="0" cellpadding="0" cellspacing="0">
                           <tr>
						      <td><img src="../../images/CoopPersonalOn.gif" width="119" height="27" alt="" border="0"></td>
							  <td><img src="../../images/CoopMemoOn.gif" width="149" height="27" alt="" border="0"></td>
							  <td><img src="../../images/CoopPaymentOn.gif" width="97" height="27" alt="" border="0"></td>
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
							  <td><img src="../../images/CoopBubble2on.gif" width="146" height="28" alt="" border="0"></td>
							  <td><img src="../../images/CoopBubble3on.gif" width="133" height="28" alt="" border="0"></td>
							  <td><img src="../../images/CoopBubble4off.gif" width="39" height="28" alt="" border="0"></td>
						   </tr>
						 </table>
					  </td>
                  </tr>
                </table><br>
				<cfform name="reg3" action="saveform.cfm?l=3" method="POST">
				<table border="0" cellpadding="4" cellspacing="0" width="100%">
				   <tr bgcolor="##006699">
				     <td><strong style="font-face:arial;color:ffffff; font-size:14px;">Cooperative Purchase Program Registration</strong></td>
				   </tr>
				</table>  
				<table border="0" cellpadding="5" cellspacing="0" width="100%"> 
                   <tr>
				     <td><img src="/images/coopcheckmark.gif" width="15" height="15" alt="Completed" border="0" align="absmiddle"> <strong>Confirmation of Personal Information</strong></td>
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
				   <tr>
				     <td><img src="/images/coopcheckmark.gif" width="15" height="15" alt="Completed" border="0" align="absmiddle"> <strong>Secondary Contact Information</strong></td>
				   </tr>
				   <tr>
				     <td>
					   <blockquote>
					     #Session.CoopForm.LevOne.SecFirstname# #Session.CoopForm.LevOne.SecLastname#<br>
						 Phone: #Session.CoopForm.LevOne.SecPhone#<br>
						 Fax: #Session.CoopForm.LevOne.SecFax#<br>
						 Email/Login: #Session.CoopForm.LevOne.SecEmail#<br>
					   </blockquote>
					 </td>
				   </tr>
				   <cfelse>
				     <tr>
				     <td><img src="/images/coopcheckmarkoff.gif" width="15" height="15" alt="Undefined" border="0" align="absmiddle"> <strong style="color:##828282;">Secondary Contact Information</strong></td>
				   </tr>
				   <tr>
				     <td style="color:##828282;">&nbsp;&nbsp;&nbsp;&nbsp;None Defined</td>
				   </tr>
				   </cfif>
				   <tr>
				     <td><img src="/images/coopcheckmark.gif" width="15" height="15" alt="Completed" border="0" align="absmiddle"> <strong>Confirmation of EAV (#getEAVInfo.Productname#)</strong></td>
				   </tr>
				   <tr>
				     <td><img src="/images/coopcheckmark.gif" width="15" height="15" alt="Completed" border="0" align="absmiddle"> <strong>Agreement of Memorandum of Understanding</strong></td>
				   </tr>
                </table><br><br>
				
				<table border="0" cellpadding="3" cellspacing="0" width="100%">
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
					<td align="Right"><strong>Total Due:  #DollarFormat(getEAVInfo.MemberPrice)#</strong></td>
				  </tr>
               </table>	 <br> 
			   <table border="0" cellpadding="4" cellspacing="0" width="100%">
				   <tr bgcolor="##006699">
				     <td><strong style="font-face:arial;color:ffffff; font-size:14px;">Payment information</strong></td>
				   </tr>
				</table><br>
			   <table border="0" cellpadding="3" cellspacing="0" width="100%">
			      <tr>
			        <td><font face="Verdana,Arial" size="-1"><b>Payment Type:</b></font></td>
					<td><select name="PayType">
						   <cfloop query="GetPayType">  
							 <option value="#GetPayType.CodeValue#">#GetPayType.CodeDesc#</option>
						   </cfloop>
						 </select>
					</td>
			      </tr>
				  <tr>
				    <td><font face="Verdana,Arial" size="-1"><b>Purchase Order Number:</b></font></td>
					<td><input type="text" name="PONumber" value=""></td>
				  </tr>
				  <tr>
				    <td colspan=2>&nbsp;</td>
				  </tr>
		          <tr>
			        <td width=120 align=left><font face="Verdana,Arial" size="-1"><b>Payee/Card&nbsp;Holder</b></font>:</td>
			        <td width=* align=left><cfinput name="CardName" type="text" size=30 maxlength=40 required="Yes"></td>
		          </tr>
		          <tr>
			        <td width=120 align=left><font face="Verdana,Arial" size="-1"><b>Address</b></font>:</td>
			        <td width=* align=left><cfinput type="Text" name="BillAddress" required="Yes" size="35" maxlength="40" message="Please enter the Billing Address"></td>
		          </tr>
		          <tr>
			        <td width=120 align=left><font face="Verdana,Arial" size="-1"><b>City</b></font>:</td>
			        <td width=* align=left><cfinput type="Text" name="BillCity" required="Yes" size="25" maxlength="30" message="Please enter the Billing City"></td>
		          </tr>
		          <tr>
			        <td width=120 align=left><font face="Verdana,Arial" size="-1"><b>State</b></font>:</td>
			        <td width=* align=left><select name="BillState">
											       <cfloop query="GetState">
											         <option value="#CodeValue#">#CodeValue#</option>
											       </cfloop>
												  </select>
				    </td>
		          </tr>
		          <tr valign=top>
			        <td width=120 align=left><font face="Verdana,Arial" size="-1"><b>Zip</b></font>:</td>
			        <td width=* align=left><cfinput type="Text" name="BillZip" required="Yes" size="5" maxlength="5" message="Please enter the Billing Zip Code"></td>
		          </tr>
		          <tr valign=top>
			        <td colspan=2><font face="Arial" size="-1"><i>Note: the <b>billing address</b> for your credit card or purchase order <b>must match</b> the information you have entered here in order for the transaction to be successful.</i></font><br>&nbsp;</td>
		          </tr>
		          <tr>
			        <td bgcolor="##003366" colspan=2><B style="color:##ffffff;">Credit Card Information</B>></td>
		          </tr>
		          <tr>
			        <td width=120 align=left><font face="Verdana,Arial" size="-1"><b>Credit Card</b></font>:</td>
			        <td width=* align=left><cfselect name="CardType"  query="CCards" value="CodeValue" display="CodeDesc" size="1" message="Please select the Credit Card you wish to use for this transaction" required="Yes"><option selected value="*">--- Select Card ---</option></cfselect></td>
		          </tr>
				  <tr>
					<td width=120 align=left><font face="Verdana,Arial" size="-1"><b>Card Number</b></font>:</td>
					<td width=* align=left><cfinput type="Text" name="CardNbr" validate="creditcard" required="Yes" size="25" maxlength="20"></td>
				  </tr>
				  <tr>
					<td width=120 align=left><font face="Verdana,Arial" size="-1"><b>Expires on</b></font>:</td>
					<td width=* align=left>
							<cfselect name="XMonth" query="Months" value="Codevalue" display="codeDesc" size="1" selected="#NumberFormat(Month(now()), '00')#" message="Please select the Expiration Month of your card" required="Yes"></cfselect>
							<select name="XYear" size=1>
							<cfloop index="Iyr" from="#Year(now())#" to="#Evaluate(Year(now())+6)#"><cfoutput><option value="#IYr#">#IYr#</option></cfoutput></cfloop>
							</select>
					</td>
				  </tr>
				</table>
		        <br>
				<table border="0" cellpadding="0" cellspacing="0" width="80%">
                   <tr>
                      <td align="center"><input type="submit" name="back" value="<< Back" onclick="history.go(-1); return false;">&nbsp;&nbsp;&nbsp;<input type="submit" name="thesubmit" value="Complete Registration >>" onclick="this.disabled=true;this.form.submit();"></td>
                   </tr>
                </table>
			  </cfform>
			  <br>

		
		<br clear=all>
		<font face="Verdana,Arial" size="-1">
		<script src=https://seal.verisign.com/getseal?host_name=www.ilipra.org&size=S&use_flash=YES&use_transparent=YES&lang=en></script>
		 <p>This will initiate a <b>secured</b> transaction to the bank which will validate the credit information you provided and authorize the transfer of funds.  The authorization process may take up to 1 minute to complete so please be patient.</p>
		</font>
		
		   </td>
		</tr>
	</table>
</cfoutput>		   	
<cfmodule template="#Application.footer#">