<cfparam name="URL.E" default="0">
<cfset AllCoopPeriods = Request.CoopAdminComponent.getAllConfigs()>
<cfmodule template="#Application.header#" section="0" sectiontitle="Coop Maintenance">
  <cfoutput>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="160"><br>
		    <cfmodule template="#Application.tagdir#/adminnav.cfm" level="5">
		   </td>
		   <td valign="top"><br>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>Cooperative Purchase Program: Vendor Email Blast</h3></td>
		        </tr>
		      </table>
			  <table border="0" cellpadding="6" cellspacing="0" width="100%">
		        <tr>
		           <td class="RegText">
				      <table border="0" cellpadding="0" cellspacing="0" width="100%">
                          <tr>
                            <td>Use the form below to send a blast email to all the active vendors of the cooperative purchase program.</td>
                          </tr> 
                      </table>
					  <cfif URl.E EQ 1>
					    <p class="errortext"><strong>Error! The Coop Period ID Could not be found. Please select one below to continue.</strong></p>
					  <cfelseif URl.E EQ 2>
					    <p class="errortext"><strong>Error! You must include a From Email Address to continue.</strong></p>
					  <cfelseif URl.E EQ 3>
					    <p class="errortext"><strong>Error! The From Email Address is not in the proper format. the proper format is you@email.com</strong></p>
					  <cfelseif URl.E EQ 4>
					    <p class="errortext"><strong>Error! You did not include a subject for your email.</strong></p>
					  <cfelseif URl.E EQ 5>
					    <p class="errortext"><strong>Error! You did not include any content for this email</strong></p>
					  </cfif>
					  <form action="VendorEmailBlast.cfm" method="POST">
						  <table border="0" cellpadding="4" cellspacing="0">
	                       <tr>
	                          <td><strong>Choose the Coop Period:</strong></td>
							  <td><select name="CoopID" onchange="this.form.submit();">
							        <option value="">-- Select One --</option>
									<cfloop query="AllCoopPeriods">
							        <option value="#AllCoopPeriods.ConfigID#" <cfif IsDefined("Form.CoopID")><cfif form.CoopID EQ AllCoopPeriods.ConfigID>SELECTED</cfif></cfif>>#AllCoopPeriods.CoopYear# Period</option>
								    </cfloop>
								  </select>
							  </td>	
	                       </tr> 
	                      </table>
					  </form> 
					  <cfif IsDefined("form.CoopID")>
					   <hr noshade size="1">
						<cfform action="VendorEmailBlast_action.cfm" method="POST" name="vendoremail" format="HTML">
						    <input type="hidden" name="coopID" value="#form.CoopID#">
						    <table border="0" cellpadding="4" cellspacing="0">
								<tr>
								  <td><strong>To:</strong></td>
								  <td><select name="SendTo">
								                    <option value="1">All Vendors</option>
													<option value="2">Active Vendors</option>
													<option value="3">In-Active Vendors</option>
													<option value="4">Active Vendors with Current Bids</option>
								                  </select>
								  </td>
								</tr>
								<tr>
	                               <td><strong>From:</strong></td>
								   <td><input type="text" name="FromEmail" value="#trim(Session.AdminInfo.Email)#" size="35" maxlength="150"></td>
	                           </tr>
							   <tr>
	                               <td><strong>Subject:</strong></td>
								   <td><input type="text" name="Emailsubject" value="" size="65" maxlength="200"></td>
	                           </tr>
							   <tr>
							      <td valign="top"><strong>Message:</strong></td>
							      <td><textarea name="emailcontent" rows="15" cols="50"></textarea></td>
							   </tr>
							   <tr>
							     <td colspan="2"><input type="submit" name="submit" value="SEND EMAILS >>"></td>
							   </tr>
	                        </table>
						</cfform>
					  </cfif>
				   </td>
		        </tr>
		       </table>
			   <br><br>
		 </td>
     </tr>
</table>  
</cfoutput>
<cfmodule template="#Application.footer#">