<cfmodule template="#Application.header#" section="0" sectiontitle="Maintaining Member Information">
  <cfquery name="GetMember" datasource="#Application.dsn#">
      Select *
	  From Members  
	  Where MemberID = #Session.Userinfo.MemberID# 
  </cfquery>
  <cfquery name="GetState" datasource="#Application.dsn#" cachedwithin="#CreateTimeSpan(0,0,10,0)#">
     Select CodeDesc, CodeValue
      From Lookup
      Where CodeGroup = 'STATE'
      Order BY CodeDesc
  </cfquery> 
  <cfoutput>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="150"><br>
	         <cfmodule template="#Application.tagdir#/MemberonlyNav.cfm" level=1>
		   </td>
		   <td valign="top"><br>
			  <table border="0" cellpadding="5" cellspacing="0">
		        <tr>
		          <td><h3>Manage Your Member Information</h3></td>
		        </tr>
		      </table>
			  <table border="0" cellpadding="6" cellspacing="0" width="100%">
		        <tr>
		           <td class="RegText">
				     <cfform name="updatembr" action="EditInfo_action.cfm" method="POST" scriptsrc="/scripts/cfform.js">
				      <table border="0" cellpadding="4" cellspacing="0">
                         <tr>
                            <td>Firstname</td>
							<td><input type="text" name="firstname" size="25" maxlength="50" value="#GetMember.Firstname#" required="Yes" message="You must include your firstname"></td>
                         </tr>
						 <tr>
                            <td>Lastname</td>
							<td><input type="text" name="lastname" size="25" maxlength="50" value="#GetMember.lastname#" required="Yes" message="You must include your lastname"></td>
                         </tr>
						 <tr>
                            <td>Title</td>
							<td><input type="text" name="Title" size="25" maxlength="75" value="#GetMember.title#" ></td>
                         </tr>
						 <tr>
                            <td>Agency / School</td>
							<td><input type="text" name="Company" size="35" maxlength="80" value="#GetMember.Company#" required="Yes" message="You must include your company/school"></td>
                         </tr>
						 <tr>
                            <td>Address</td>
							<td><input type="text" name="Addr" size="30" maxlength="90" value="#GetMember.Address1#" required="Yes" message="You must include your Address"></td>
                         </tr>
						 <tr>
                            <td>Address 2</td>
							<td><input type="text" name="Addr2" size="30" maxlength="90" value="#GetMember.Address2#"></td>
                         </tr>
						  <tr>
                            <td>City</td>
							<td><input type="text" name="City" size="25" maxlength="50" value="#GetMember.City#" required="Yes" message="You must include your city"></td>
                          </tr> 
						  <tr>
                            <td>State</td>
							<td><select name="State">
									       <cfloop query="GetState">
									         <option value="#CodeValue#" <cfif getMember.state EQ GetState.codevalue>Selected</cfif>>#CodeValue#</option>
									       </cfloop>
										  </select></td>
                          </tr>
						  <tr>
                            <td>Zip</td>
							<td><input type="text" name="Zip" size="9" maxlength="10" value="#GetMember.ZipCode#" required="Yes" message="You must include your zipcode"></td>
                          </tr>
						  <tr>
                            <td>Phone</td>
							<td><input type="text" name="MainPhone" size="12" maxlength="12" value="#GetMember.mainPhone#" required="Yes" message="You must include your phone numbere"></td>
                          </tr>
						  <tr>
                            <td>Fax</td>
							<td><input type="text" name="fax" size="12" maxlength="12" value="#GetMember.Fax#" required="Yes" message="You must include your firstname"></td>
                          </tr>
						  <tr>
                            <td>Email/Login:</td>
							<td><input type="text" name="email" size="35" maxlength="90" value="#GetMember.Email#" required="Yes" message="You must include your email address"></td>
                          </tr>
						  <tr>
                            <td>Password:</td>
							<td><input type="password" name="password" size="15" maxlength="15" value="#Getmember.Password#" required="Yes" message="You must include your password"></td>
                          </tr>
						  <tr>
						    <td colspan=2 align="center"><input type="submit" name="submit" value="Update Information"></td>
						  </tr>
                      </table>
					  </cfform>
				   </td>
		        </tr>
		       </table>
			   <br><br>
		 </td>
     </tr>
</table>  
</cfoutput>
<cfmodule template="#Application.footer#">