<cfparam name="url.e" default="0">
<cfmodule template="#Application.header#" section="0" sectiontitle="Member Directory">
  <cfoutput>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="150"><br>
	         <cfmodule template="#Application.tagdir#/MemberonlyNav.cfm">
		   </td>
		   <td valign="top"><br>
			  <table border="0" cellpadding="5" cellspacing="0">
		        <tr>
		          <td><h3>Members Directory</h3></td>
		        </tr>
		      </table>
			  <cfquery name="Companies" datasource="#Application.dsn#">
			      Select Distinct Company
				  From Members
				  Where Company IS NOT NULL
				  AND Company <> ' '
				  AND MembershipExpire >= #CreateDate(2004, 12, 31)#
				  Order by Company
			  </cfquery>
			  <cfquery name="GetFacCity" datasource="#Application.dsn#">
				 Select Distinct City 
				 From Members
				 Where MembershipExpire >= #CreateDate(2004, 12, 31)#
				 Order By City 
			  </cfquery>
			  <table border="0" cellpadding="6" cellspacing="0" width="100%">
		        <tr>
		           <td class="RegText">
				     <cfif Not IsDefined("url.action")>
					     <cfform name="" action="MemberDirectory.cfm?action=search" Method="POST" scriptsrc="/scripts/cfform.js">
						     <table border="0" cellpadding="6" cellspacing="0" class="regtext">
							      <cfif url.e EQ 1>
								    <tr> 
							         <td colspan=2><strong class="errortext">Error! Your Search did not have any criteria. Please Refine your search.</strong></td>
					              </tr>
								  <cfelseif url.e EQ 2>
								  <tr> 
							         <td colspan=2><strong class="errortext">Error! You must enter either the city or the company of the Member you are looking for.</strong></td>
					              </tr>
								  </cfif>
								  <tr> 
							         <td colspan=2><strong>Search for a member</strong></td>
					              </tr>
								  <tr> 
							         <td>Company:</td>
									 <td><select name="Company">
										<option value="">-- Companies --</option>
										<cfloop query="Companies">
										<option value="#Company#">#Company#</option>
										</cfloop>
										</select></td>
					              </tr>
								  <tr> 
							         <td>City:<br><font color="##737373" size="-2">(Optional)</font></td>
									 <td>
									   <select name="city">
										<option value="">-- City --</option>
										<cfloop query="GetFacCity">
										<option value="#city#">#city#</option>
										</cfloop>
										</select>
										</td>
									 </td>
					              </tr>
								  <tr> 
							         <td>Firstname:<br><font color="##737373" size="-2">(Optional)</font></td>
									 <td><input type="text" name="firstname" value="" size="15" maxlength="50"></td>
					              </tr>
								  <tr> 
							         <td>Lastname:</td>
									 <td><input type="text" name="lastname" value="" size="15" maxlength="50"></td>
					              </tr>
								  <tr>
								    <td colspan=2><input type="submit" name="submit" value="Search now >>"></td>
								  </tr>
					            </table>
	                       </cfform>
					   <cfelse>
					        <cfif form.City EQ "" AND form.firstname EQ "" AND form.lastname EQ "">
							 
							</cfif>
							
							
						
					        <cfquery name="GetMember" datasource="#Application.dsn#">
							   Select Top 100 Lastname, Firstname, Title, Company, Address1, Address2, City, State, Zipcode, MainPhone, Fax, Email
							   From Members 
							   Where MembershipExpire >= #CreateDate(2004, 12, 31)#
							   <cfif form.company NEQ "">
								   AND Company = '#form.company#'
							   </cfif>
							   <cfif form.city NEQ "">
								   AND City = '#form.city#'
							   </cfif>
							   <cfif form.lastname NEQ "">
								   AND Lastname Like '%#form.lastname#%'
							   </cfif>
							   <cfif form.firstname NEQ "">
								   AND firstname Like '%#Form.Firstname#%'
							   </cfif>
							   Order By Company, Lastname, Firstname
							</cfquery>
							
							<table border="0" cellpadding="4" cellspacing="1" width="100%">
                             <tr>
                               <td colspan=2>Your Search Returned <strong>#GetMember.recordcount#</strong> possible matches. <a href="MemberDirectory.cfm">Search Again</a></td>
                             </tr>
							 <tr bgcolor="##eeeee">
							   <td><strong>Name</strong></td>
							   <td><strong>Company</strong></td>
							   <td><strong>Phone/FAX</strong></td>
							   <td><strong>Email</strong></td>
							 </tr>
							 <cfloop query="GetMember">
							   <tr <cfif GetMember.currentRow MOD(2) EQ 0>bgcolor="##eeeeee"</cfif>>
							     <td valign="top">#GetMember.FirstName# #GetMember.LastName#<br>#GetMember.Title#</td>
								 <td valign="top">#GetMember.Company#<br>#GetMember.Address1#<br>
								     <cfif GetMember.address2 NEQ "">#GetMember.Address2#<br></cfif> 
								     #GetMember.City#, #GetMember.State# #GetMember.Zipcode#</td>
								 <td valign="top">Phone: #GetMember.MainPhone#<br>Fax: #GetMember.Fax#</td>
								 <td valign="top"><a href="mailto:#Email#">#GetMember.Email#</a></td>
							   </tr>
							 </cfloop>
                            </table>
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