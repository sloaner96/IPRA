<cfparam name="url.e" default="0">
<cfmodule template="#Application.header#" section="0" sectiontitle="Site Admin">
  <cfoutput>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="160"><br>
		    <cfmodule template="#Application.tagdir#/adminnav.cfm" level="3">
		   </td>
		   <td valign="top"><br>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>Member Search</h3></td>
		        </tr>
		      </table>
			  <cfif Not IsDefined("form.submit")>
			  <cfquery name="GetCompany" datasource="#application.dsn#" cachedwithin="#CreateTimeSpan(0,0, 30, 0)#">
			    Select Distinct Company 
				From Members
				Where MembershipExpire >= #CreateDate(2004, 12, 31)#
				AND Company IS NOT NULL
				AND Company <> ''
				Order By Company
			  </cfquery>
			  <cfquery name="GetCity" datasource="#application.dsn#" cachedwithin="#CreateTimeSpan(0,0, 30, 0)#">
			    Select Distinct City
				From Members
			  </cfquery>
			  <cfform name="search" action="MbrSearch.cfm" method="POST" scriptsrc="/scripts/cfform.js">
				  <table border="0" cellpadding="6" cellspacing="0" width="100%">
			        <tr>
					  <td>Below you can search the membership database. You must include any combination of lastname, company, city.</td>
					</tr>
					<cfif url.e eq 1>
					 <tr>
					   <td class="ErrorText"><strong>Error!</strong> You must include one of the fields below to search.</td>
					 </tr>
					</cfif>
				    <tr>
			           <td class="RegText">
					      <table border="0" cellpadding="4" cellspacing="0" width="100%">
	                          <tr>
	                            <td><strong>Firstname:</strong></td>
								<td><input type="text" name="firstname" value="" size="25" maxlength="50"></td>
	                          </tr> 
							  <tr>
	                            <td><strong>Lastname:</strong></td>
								<td><input type="text" name="lastname" value="" size="25" maxlength="50"></td>
	                          </tr> 
							  <tr>
	                            <td><strong>Company:</strong></td>
								<td><select name="company">
								     <option value="">-- Select One --</option>
									 <cfloop query="GetCompany">
									   <option value="#Company#">#Company#</option>
									 </cfloop>
								    </select>
							     </td>
	                          </tr> 
							  <tr>
	                            <td><strong>City</strong>:</td>
								<td><select name="city">
								     <option value="">-- Select One --</option>
									 <cfloop query="GetCity">
									  <option value="#City#">#City#</option>
									 </cfloop>
								    </select></td>
	                          </tr> 
							  <tr>
							    <td colspan=2><input type="submit" name="submit" value="Search >>"></td>
							  </tr>
	                      </table>
					   </td>
			        </tr>
			       </table>
			   </cfform>
			   <br><br>
			  <cfelse>
			     <cfif form.firstname EQ "" AND form.lastname EQ "" AND Form.Company EQ "" AND Form.City EQ "">
				     <meta http-equiv="refresh" content="0;url=MbrSearch.cfm?e=1">
				   <!--- <cflocation url="MbrSearch.cfm?e=1" addtoken="No"> --->
				 </cfif>
			     
				 <cfquery name="Getmember" datasource="#Application.dsn#">
				   Select memberID, Firstname, Lastname, Company
				   From Members
				   Where 1 = 1
				   <cfif Len(Trim(form.company)) GT 0>
				   AND Company = '#form.company#'
				   </cfif>
				   <cfif Len(Trim(form.City)) GT 0>
				   AND City = '#form.City#'
				   </cfif>
				   <cfif Len(trim(form.firstname)) GT 0>
				   AND LastName Like '%#form.lastname#%'
				   </cfif>
				   <cfif Len(trim(form.lastname)) GT 0>
				   AND FirstName Like '%#form.firstname#%'
				   </cfif>
				  Order By Company, Lastname, Firstname 
				 </cfquery> 
				 
				 <cfif getmember.recordcount GT 0>
				   <table border="0" cellpadding="4" cellspacing="0" width="100%">
                      <tr>
					    <td>Your search returned <strong>#GetMember.recordcount#</strong> possible matches. Please click the name of the member you are looking for.</td>
					  </tr>
					  <tr><td>&nbsp;</td></tr> 
					 <cfloop query="getmember">
					   <tr>
                         <td><a href="MembershipDetail.cfm?mbrID=#getMember.MemberID#">#GetMember.Firstname# #GetMember.lastname#</a><br>
						     #Getmember.Company#
						 </td>
                       </tr>
					 </cfloop>
                   </table> 
				 <cfelse><br>
				   <table border="0" cellpadding="0" cellspacing="0" width="100%">
                       <tr>
                         <td><strong>Your search did not return any members, please <a href="MbrSearch.cfm">click here</a> to search again.</strong></td>
                       </tr>
                   </table>  
				 </cfif><br><br>
			  </cfif> 
		 </td>
     </tr>
</table>  
</cfoutput>
<cfmodule template="#Application.footer#">