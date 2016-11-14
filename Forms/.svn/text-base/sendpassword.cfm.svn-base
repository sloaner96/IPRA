
<cfparam name="URL.E" default="0">
<cfmodule template="#Application.header#" section="0" sectiontitle="Lost Password">
  <table width="100%" border="0" cellspacing="3" cellpadding="0">
     <tr>
	    <td valign="top"><br>
		    <cfmodule template="#Application.tagdir#/aboutusnav.cfm">
		   </td>
        <td valign="top"> <br>
	     <table width="70%" border="0" cellspacing="0" cellpadding="4">
	        <tr>
	           <td><h3>Lost Password</h3></td>
	        </tr>
	     </table><hr noshade size="1">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
           <tr>
               <td><img src="/images/blank.gif" height="1" width="25" alt="" border="0"></td>
			   <td>
				 <cfif Url.E EQ 1><br>
					<table width="70%" border="0" cellspacing="0" cellpadding="4">
	                  <cfoutput>
					   <tr>
	                       <td class="ErrorText"><img src="#Application.baseurl#/Images/Error.gif" width="26" height="26" alt="Error" border="0" vspace=0 hspace=4 align="absmiddle"><strong>An Error Occurred:</strong></td>
	                   </tr>
					  </cfoutput>
					   <tr>
					       <td class="ErrorText">You must enter your email address to be sent your login information.</td>
					   </tr>
	                </table><br>
				 <cfelseif url.e EQ 2>
				   <table width="70%" border="0" cellspacing="0" cellpadding="4">
	                  <cfoutput>
					   <tr>
	                       <td class="ErrorText"><img src="#Application.baseurl#/Images/Error.gif" width="26" height="26" alt="Error" border="0" vspace=0 hspace=4 align="absmiddle"><strong>An Error Occurred:</strong></td>
	                   </tr>
					  </cfoutput>
					   <tr>
					       <td class="ErrorText">You must enter your last name to be sent your login information.</td>
					   </tr>
	                </table><br>	
				<cfelseif url.e EQ 3>
				  <table width="70%" border="0" cellspacing="0" cellpadding="4">
	                  <cfoutput>
					   <tr>
	                       <td class="ErrorText"><img src="#Application.baseurl#/Images/Error.gif" width="26" height="26" alt="Error" border="0" vspace=0 hspace=4 align="absmiddle"><strong>An Error Occurred:</strong></td>
	                   </tr>
					  </cfoutput>
					   <tr>
					       <td class="ErrorText">We could not locate your user information, please try another email address. If you continue to see this message, please contact the IPRA.</td>
					   </tr>
	                </table><br>	
				 </cfif>
	
				<cfif Not IsDefined("form.email")>
				  <cfform Name="SendInfo" action="sendpassword.cfm" method="POST" scriptsrc="/scripts/cfform.js">
				    <table border="0" cellpadding="4" cellspacing="0">
                       <tr>
                          <td>Please enter your email address:</td>
						  <td><input type="text" name="email" value=""></td>
                       </tr>
					   <tr>
					      <td>For Verification Purposes, Please enter your last name:</td>
						  <td><input type="text" name="lastname" value=""></td>
					   </tr>
					   <tr>
					     <td colspan=2><input type="submit" name="submit" value="Send Password >>"></td>
					   </tr>
                    </table> 
			      </cfform>
				<cfelse>
				    <cfif Len(Trim(form.Email)) EQ 0>
					   <meta http-equiv="refresh" content="0;url=/SendPassword.cfm?e=1">
					   <!--- <cflocation url="/SendPassword.cfm?e=1" addtoken="No"> --->
					</cfif> 
					<cfif Len(Trim(form.lastname)) EQ 0>
					<meta http-equiv="refresh" content="0;url=/SendPassword.cfm?e=2">
					   <!--- <cflocation url="/SendPassword.cfm?e=2" addtoken="No"> --->
					</cfif> 
					
					<cfquery name="GetUser" datasource="#Application.dsn#">
					  Select Firstname, Lastname, Email, Password, IPRAMemberID
					  From Members
					  Where LastName = '#form.lastname#'
					  AND email = '#form.email#' 
					</cfquery>
					
					<cfif getuser.recordcount EQ 0>
					   <meta http-equiv="refresh" content="0;url=/SendPassword.cfm?e=3">
					   <!--- <cflocation url="/SendPassword.cfm?e=3" addtoken="No"> --->
					<cfelse>
<cfmail to="#getuser.email#" from="webmaster@ilipra.org" subject="IPRA Website Login Information" server="#Application.mailserver#" username="#Application.MailUser#" password="#Application.MailPassword#">
	Thank you for requesting your login information for the IPRA website. Below you will find the information you will need to login to the Members Only area of the site. If you have any questions, please contact the IPRA.
	<cfif getuser.Password EQ "">
	  Username: #getUser.lastname#
	  Password: #getUser.IPRAMemberID#
	<cfelse>
	  Username: #getUser.email#
	  Password: #getUser.Password# 				
	</cfif>   
	
	If you did not request this message. Please contact the IPRA at webmaster@ilipra.org
</cfmail>
					   <br><br>
					   <table border="0" cellpadding="4" cellspacing="0" width="100%">
                         <cfoutput>
						   <tr>
                               <td><strong>#GetUser.Firstname#, Your login information has been sent to #GetUser.email#</strong></td>
                           </tr>
						   <tr>
						      <td><a href="/index.cfm">Click Here</a> to go back to the homepage</td>
						   </tr>
						 </cfoutput>
                       </table>
					</cfif>
				</cfif>  
			</td>
          </tr>
       </table>
	 </td>
   </tr>		 
 </table>
<cfmodule template="#Application.footer#" section="0">	