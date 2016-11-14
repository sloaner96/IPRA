
<cfparam name="URL.E" default="0">
<cfmodule template="#Application.header#" section="0" sectiontitle="Contact Us Form">
  <table width="100%" border="0" cellspacing="3" cellpadding="0">
     <tr>
	    <td valign="top"><br>
		    <cfmodule template="#Application.tagdir#/aboutusnav.cfm">
		   </td>
        <td valign="top"> <br>
	     <table width="70%" border="0" cellspacing="0" cellpadding="4">
	        <tr>
	           <td><h3>Contact Us</h3></td>
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
					       <td class="ErrorText">The email address you entered is invalid. Please enter a valid email address</td>
					   </tr>
	                </table><br>
				 </cfif>
	
				
				  <cfform Name="SendInfo" action="contact_action.cfm" method="POST" scriptsrc="/scripts/cfform.js">
				  <table border=0 cellpadding=4 cellspacing=0 width="30%">
                    <tr>
                       <td class="regtext" colspan=2><font face="arial" color="black" size="-2"><font color="#cc0000">*</font> Required Fields</font></td>
                    </tr>
				    <tr>
				       <td class="regtext" width="10%"><strong>Name:</strong>&nbsp;<font color="#cc0000">*</font></td>
					   <td><cfinput type="text" name="Visname" size="25" maxlength="75" required="YES" message="Please enter your full name"></td>
				    </tr>
				    <tr>
				       <td class="regtext" width="10%"><strong>Company/Organization:</strong></td>
					   <td><cfinput type="text" name="VisCompany" size="25" maxlength="100"></td>
				    </tr>
				    <tr>
				       <td class="regtext" width="10%"><strong>Title:</strong></td>
					   <td><cfinput type="text" name="VisTitle" size="25" maxlength="100"></td>
				    </tr>
				    <tr>
				       <td class="regtext" width="10%"><strong>Phone:</strong></td>
					   <td><cfinput type="text" name="VisPhone" size="25" maxlength="75" validate="telephone" message="You must enter a valid telephone number formated xxx-xxx-xxxx"></td>
				    </tr>
				    <tr>
				       <td <cfif url.e NEQ 1>class="regtext"<cfelse>class="errortext"</cfif> width="10%"><strong>Email Address:</strong>&nbsp;<font color="#cc0000">*</font></td>
					   <td><cfinput type="text" name="VisEmail" size="25" maxlength="75" required="YES" message="Please enter in a valid email address example (you@email.com)" validate="regular_expression" pattern="^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*\.(([a-z]{2,3})|(aero|coop|info|museum|name))$"></td>
				    </tr>
				    <tr>
				       <td colspan=2 width=400><hr size=1 color="black"></td>
				    </tr>
				    <tr>
                       <td class="regtext"><strong>Subject:</strong>&nbsp;
						    <td><select name="service">
                                    <option value="1">General Feedback</option>
                                    <option value="2">Information Request</option>
                                    <option value="3">Please Contact Me</option>
                                    <option value="4">Other</option>
									<option value="5" SELECTED>IPRA Staff Member</option>
							</select></td>
						</td>
				    </tr>
				    <tr>
		                <td colspan=2 class="regtext"><strong>Comments:</strong><br>
			              <textarea cols="50" rows="10" name="visComment" wrap="virtual"></textarea> 
		                </td>
		            </tr> 
				    <tr>
		                <td align="center" colspan=2><input type="reset" name="reset" value="Clear">&nbsp;&nbsp;<input type="submit" name="submit" value="Submit"></td>
		           </tr> 
				   
                 </table> 
			  </cfform>
			</td>
          </tr>
       </table>
	 </td>
   </tr>		 
 </table>
<cfmodule template="#Application.footer#" section="0">	   