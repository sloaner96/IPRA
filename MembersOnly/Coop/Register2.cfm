<cfparam name="url.e" default="0">
<cfset getCoopConfig = Session.CoopConfig>
<cfset BeginDate = getCoopConfig.CoopEnrollmentBegin>
<cfset EndDate = getCoopConfig.CoopEndDate>

<cfset getEAV = request.CoopComponent.getEAV()>

<cfmodule template="#Application.header#" section="2" sectiontitle="Cooperative Purchase Program">
<script type="text/javascript">
   function activeButton(){
     if (document.reg2.MemoOfUnderstanding.checked = false){
	   document.reg2.thesubmit.disabled = true;
	 } else {
	   document.reg2.thesubmit.disabled = false;
	   document.reg2.MemoOfUnderstanding.checked = true;
	 }
	 
   }
</script>
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
							  <td><img src="../../images/CoopMemoOn.gif" width="149" height="27" alt="" border="0"></td>
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
							  <td><img src="../../images/CoopBubble2on.gif" width="146" height="28" alt="" border="0"></td>
							  <td><img src="../../images/CoopBubble3off.gif" width="133" height="28" alt="" border="0"></td>
							  <td><img src="../../images/CoopBubble4off.gif" width="39" height="28" alt="" border="0"></td>
						   </tr>
						 </table>
					  </td>
                  </tr>
                </table><br>
				<cfif url.E EQ 1>
				  <p class="ErrorText">Error! You must choose an agree to the Memorandum of Understanding to continue. <a name="E1"></a></p>
				</cfif>  
				<cfform name="reg2" action="saveform.cfm?l=2" method="POST">
				<table border="0" cellpadding="4" cellspacing="0" width="100%">
				   <tr bgcolor="##006699">
				     <td><strong style="font-face:arial;color:ffffff; font-size:14px;">Memorandum of Understanding</strong></td>
				   </tr>
				   <tr>
				     <td>You must agree to the Memorandum of Understanding in order to continue.</td>
				   </tr>
				</table><br>
				<table border="0" cellpadding="5" cellspacing="0" width="100%"> 
                    <tr>
                      <td>#Replacenocase(getcoopconfig.AgreementText, "[AgencyName]", session.userinfo.company, "all")#</td>
                    </tr>
                </table><br><br>
				<table border="0" cellpadding="0" cellspacing="0" width="100%">
                  <tr>
                      <td><input type="checkbox" name="MemoOfUnderstanding" value="Yes" onclick="activeButton();"> <strong>AGREE</strong>&nbsp;&nbsp;&nbsp;&nbsp;I have read the Memorandum of Understanding and I agree with all terms herein.</td>
                  </tr>
                </table>
				<br><br>
				<table border="0" cellpadding="0" cellspacing="0" width="60%">
                   <tr>
                      <td align="center"><input type="submit" name="back" value="<< Back" onclick="history.go(-1); return false;">&nbsp;&nbsp;&nbsp;<input type="submit" name="thesubmit" value="Save and Continue >>" disabled="true"></td>
                   </tr>
                </table>
			  </cfform>	
		   </td>
		</tr>
	</table>
</cfoutput>		   	
<cfmodule template="#Application.footer#">