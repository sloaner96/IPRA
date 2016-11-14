<cfmodule template="#Application.Header#" sectiontitle="Job Opportunities Bulletin">
<script type="text/javascript">
   function activeButton(){
     if (document.contactinfo.MemoOfUnderstanding.checked = false){
	   document.contactinfo.thesubmit.disabled = true;
	 } else {
	   document.contactinfo.thesubmit.disabled = false;
	   document.contactinfo.MemoOfUnderstanding.checked = true;
	 }
   }
</script>

<cfset getStates = request.PaymentComponent.GetState()>

<table border="0" cellpadding="3" cellspacing="0" width="100%">
   <tr>
      <td valign="top" width="150">
		<br>
		    <cfmodule template="#Application.tagdir#/aboutusnav.cfm" level="3">
	  </td>
	  <td valign="top"><br>
	     <table border="0" cellpadding="5" cellspacing="0" width="100%">
		    <tr>
		       <td><h3>Resume Builder</h3></td>
		    </tr>
			<tr>
			  <td>Below is the Resume Builder Wizard. Please fill out all required information and answer as much optional information as possible to give potential employers a better overall picture of yourself. All information will be stored with the terms of our privacy agreement.</td>
			</tr>
		 </table><br>
		<cfif Not IsDefined("Session.Userinfo")>
		  <cfoutput> If you are already an IPRA Member <a href="/membersOnly/login.cfm?refer=#cgi.script_name#">click here</a> to login<br><br></cfoutput>
		  
		  <cfset IsLoggedIN = FALSE>
		  <cfset CoFirstname  = "">
		  <cfset CoMiName = "">
		  <cfset CoLastname  = "">
		  <cfset CoAddr1     = "">
		  <cfset CoAddr2     = "">
		  <cfset CoCity      = "">
		  <cfset CoState     = "">
		  <cfset CoZipCode   = "">
		  <cfset CoHomePhone = "">
		  <cfset CoWorkPhone = "">
		  <cfset CoMobile    = "">
		  <cfset CoEmail     = "">
		  <cfset Copassword  = "">
		<cfelse>
		  <cfset IsLoggedIN   = True>
		  <cfset CoFirstname  = Session.UserInfo.FirstName>
		  <cfset CoMiName     = Session.UserInfo.Middlename>
		  <cfset CoLastname   = Session.UserInfo.LastName>
		  <cfset CoAddr1      = Session.UserInfo.Homeaddr1>
		  <cfset CoAddr2      = Session.UserInfo.Homeaddr2>
		  <cfset CoCity       = Session.UserInfo.HomeCity>
		  <cfset CoState      = Session.UserInfo.HomeState>
		  <cfset CoZipCode    = Session.UserInfo.HomeZip>
		  <cfset CoHomePhone  = Session.UserInfo.HomePhone>
		  <cfset CoWorkPhone  = Session.UserInfo.MainPhone>
		  <cfset CoMobile     = Session.UserInfo.MobilePhone>
		  <cfset CoEmail      = Session.UserInfo.Email>
		  <cfset Copassword   = Session.UserInfo.Password>
		</cfif>
		
		 <strong class="errortext">* Required information</strong>
		 <table border="0" cellpadding="4" cellspacing="0" width="100%">
           <tr bgcolor="#006699">
              <td><strong style="color:#ffffff;">Contact Information</strong></td>
           </tr>
         </table>   
		 <cfform name="contactinfo" action="AddContact_action.cfm" Method="POST">
			 <cfoutput>
			     <cfif IsLoggedIN>
				   <input type="hidden" name="MemberID" value="#Session.UserInfo..MemberID#">
				 </cfif>
				 <table border="0" cellpadding="4" cellspacing="0">
		            <tr>
				       <td><strong>First name:</strong></td>
					   <td><input type="text" name="firstname" value="#trim(CoFirstname)#" size="25" maxlength="50"><strong class="errortext">*</strong></td>
				    </tr>
					<tr>
				       <td><strong>Middle Initial:</strong></td>
					   <td><input type="text" name="middleName" value="#Trim(CoMiName)#" size="2" maxlength="2"></td>
				    </tr>
					<tr>
				       <td><strong>Last name:</strong></td>
					   <td><input type="text" name="Lastname" value="#Trim(CoLastname)#" size="25" maxlength="75"><strong class="errortext">*</strong></td>
				    </tr>
					<tr>
				       <td><strong>Home Address:</strong></td>
					   <td><input type="text" name="HomeAddr1" value="#Trim(coAddr1)#" size="45" maxlength="75"></td>
				    </tr>
					<tr>
				       <td><strong>Home Apt/Suite Number:</strong></td>
					   <td><input type="text" name="HomeAddr2" value="#Trim(coAddr2)#" size="20" maxlength="50"></td>
				    </tr>
					<tr>
				       <td><strong>City:</strong></td>
					   <td><input type="text" name="City" value="#Trim(coCity)#" size="25" maxlength="50"></td>
				    </tr>
					<tr>
				       <td><strong>State:</strong></td>
					   <td><select name="State">
					         <option value="">-- Select One --</option>
					         <cfloop query="getStates">
					           <option value="#getStates.CodeValue#" <cfif getStates.Codevalue EQ coState>Selected</cfif>>#getStates.codeDesc#</option>
							 </cfloop> 
						   </select>
					   </td>
				    </tr>
					<tr>
				       <td><strong>ZipCode:</strong></td>
					   <td><input type="text" name="ZipCode" value="#Trim(coZipCode)#" size="10" maxlength="10"></td>
				    </tr>
					<tr>
				       <td><strong>Home Phone:</strong></td>
					   <td><cfinput type="Text" name="homephone" mask="(999) 999-9999" validateat="onSubmit" validate="telephone" value="#Trim(CoHomePhone)#" required="Yes" message="you must include a valid telephone number" size="14" maxlength="14"><strong class="errortext">*</strong></td>
				    </tr>
					<tr>
				       <td><strong>Work Phone:</strong></td>
					   <td><cfinput type="text" name="workphone" mask="(999) 999-9999" validateat="onSubmit" validate="telephone" value="#Trim(CoWorkPhone)#" size="14" maxlength="14"></td>
				    </tr>
					<tr>
				       <td><strong>Mobile Phone:</strong></td>
					   <td><cfinput type="text" name="mobilephone" mask="(999) 999-9999" validateat="onSubmit" validate="telephone" value="#Trim(CoMobile)#" size="14" maxlength="14"></td>
				    </tr>
					<tr>
					  <td><strong>Best to Contact:</strong></td>
					  <td><select name="BestContact">
					       <option value="">-- Select One --</option>
					       <option value="H">Home Phone</option>
					       <option value="W">Work Phone</option>
					       <option value="M">Mobile Phone</option>
					       <option value="E">Email</option>
					      </select>
						  <strong class="errortext">*</strong>
					  </td> 
					</tr>
					
					<tr>
				       <td><strong>Email Address:</strong></td>
					   <td><cfinput type="Text" 
					          name="Email" 
							  value="#Trim(CoEmail)#"
							  validateat="onSubmit"
							  message="You must enter a valid email address formatted (you@email.com)" 
							  validate="email" required="No"><strong class="errortext">*</strong></td>
				    </tr>
		         </table> 
		     </cfoutput><br>
			 <table border="0" cellpadding="4" cellspacing="0" width="100%">
	           <tr bgcolor="#006699">
	              <td><strong style="color:#ffffff;">Resume Builder Login Information</strong></td>
	           </tr>
			   <tr>
			     <td>Enter a username and password combination that you can remember, as you will use this to login and manage your resume. Passwords need to be at least 6 characters long and include both letters and numbers.</td>
			   </tr>
	         </table>
			 <table border="0" cellpadding="4" cellspacing="0" width="100%">
	            <cfoutput>
				<tr>
	              <td><strong>Username:</strong></td>
				  <td><input type="text" name="username" value="#Trim(CoEmail)#" size="30" maxlength="90"></td>
	            </tr>
			    <tr>
	              <td><strong>Password:</strong></td>
				  <td><cfif IsLoggedIN><input type="hidden" name="password" value="#Trim(Copassword)#" size="15" maxlength="15"><strong style="color:##444444;">Password already saved</strong><cfelse><input type="password" name="password" value="#Trim(Copassword)#" size="15" maxlength="15"></cfif></td>
	            </tr>
				</cfoutput>
			    <tr>
				  <td>&nbsp;</td>
				</tr>
				
	         </table> 
			 <table border="0" cellpadding="4" cellspacing="0" width="100%">
               <tr bgcolor="#006699">
	              <td><strong style="color:#ffffff;">Terms and Conditions</strong></td>
	           </tr>
			   <tr>
			     <td><textarea name="termtext" cols="65" rows="10">Please read this carefully and be aware that in electing to participate in the IPRA Resume Builder you are expressly assuming the risk and legal liability and waiving and releasing all claims for injury, civil or criminal, damages or loss against the Illinois Park & Recreation Association in total which you may sustain as a result of participating in any and all connecting current or future activities which may arise from use of the IPRA Resume Builder.

In participating and checking the box below in the IPRA Resume Builder, you hereby fully release and forever discharge the Illinois Park & Recreation Association, Board of Directors, Staff, Volunteers and association in total from any and all claims for injuries, damages or loss which may accrue and rising out of, connected with, or in any way associated with use of the IPRA Resume Builder.  

If you elect to participate in the IPRA Resume Builder, your resume will be viewable to potential employers. If you opt to keep your information confidential, it is YOUR responsibility to remove all personal information from your resume in regards to current and past employers or any other information you determine to be detrimental to your current employment status or future career decisions. 
 
You acknowledge and agree that you are solely responsible for content and accuracy of any resume or material contained therein placed by you on the IRPA website. Agencies, companies, or any other organization are solely responsible for their postings on the IPRA Website. 

The Illinois Park & Recreation Association (IPRA) is not involved in the actual transaction between member agencies, companies, organizations and/or candidates. As a result, the Illinois Park & Recreation Association has no control over the quality, safety or legality of the jobs or profiles posted the truth or accuracy of the listings, the ability of member agencies, companies, or organizations to offer job opportunities to candidates or the ability of candidates to fill job openings.  You assume all risks associated with dealing with other users with whom you come in contact through posting a resume on this site.

The Illinois Park & Recreation Association does not warrant or guarantee that a resume or job posting will be viewed by any specific number of users, or that it will be viewed by any user. The Illinois Park & Recreation Association is not to be considered to be an employer with respect to your use of this website, and the Illinois Park & Recreation Association shall not be responsible for any employment decisions, for whatever reason, made by any entity posting jobs on the Illinois Park and Recreation Association website. 

If you have any questions regarding the information above, please contact the Illinois Park & Recreation Association at 630-376-1911 or webmaster@ilipra.org. For more information regarding our privacy policy, please go to http://www.ilipra.org/privacy.cfm. 
                     </textarea></td>
			   </tr>
			   <tr>
                  <td><input type="checkbox" name="MemoOfUnderstanding" value="Yes" onclick="activeButton();"> <strong>AGREE</strong>&nbsp;&nbsp;&nbsp;&nbsp;I have read the Terms and Conditions and I agree with all terms herein.</td>
                </tr>
				<tr>
				  <td><input type="submit" name="thesubmit" value="Save and Continue >>" disabled="true"></td>
				</tr> 
             </table>   
		 </cfform>  
	   </td>
     </tr>
</table>  

<cfmodule template="#Application.Footer#">
  