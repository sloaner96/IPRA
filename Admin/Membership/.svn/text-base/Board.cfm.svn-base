<cfparam name="url.action" default="">
<cfparam name="url.e" default="0">
<cfmodule template="#Application.header#" level="3" sectiontitle="Site Admin">
  <cfoutput>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="160"><br>
		    <cfmodule template="#Application.tagdir#/adminnav.cfm" level="1">
		   </td>
		   <td valign="top"><br>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>IPRA Board Administration</h3></td>
		        </tr>
		      </table>
			  <cfif URL.Action EQ "">
			  <cfquery name="GetBoard" datasource="#Application.dsn#">
			    Select *
				From Board
			  </cfquery>
			  <table border="0" cellpadding="4" cellspacing="0" width="100%">
                <tr> 
                  <td>Below are Members that are designated as IPRA Board members. This allows them to view information in the Board section of the site. Click the appropriate link to maintain these members.</td>
                </tr>
              </table>
			  <table border="0" cellpadding="0" cellspacing="0" width="100%">
                 <tr>
                    <td><a href="board.cfm?action=New">Add New Board Member</a></td>
                 </tr>       
              </table>
			  <table border="0" cellpadding="4" cellspacing="0" width="100%">
                 <tr bgcolor="eeeee">
				    <td></td>
                    <td><strong>FIRSTNAME</strong></td>
					<td><strong>LASTNAME</strong></td>
					<td><strong>EMAIL</strong></td>
                </tr>
				<cfloop query="GetBoard">
					<tr>
					  <td><a href="Board.cfm?Action=Remove&BID=#GetBoard.Num_ID#" style="color:red;">[Remove]</a></td>
					  <td>#First#</td>
					  <td>#Last#</td>
					  <td>#Email#</td>
					</tr>
				</cfloop>
              </table>
			   <br><br>
			   <cfelseIf URL.Action EQ "New">
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
				  <cfform name="search" action="Board.cfm?action=search" method="POST" scriptsrc="/scripts/cfform.js">
					  <table border="0" cellpadding="6" cellspacing="0" width="100%">
				        <tr>
						  <td>Below you can search the membership database to add a . You must include any combination of lastname, company, city.</td>
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
			   <cfelseIf URL.Action EQ "Search">
			     <cfif form.firstname EQ "" AND form.lastname EQ "" AND Form.Company EQ "" AND Form.City EQ "">
				   <!--- <cflocation url="Srchboard.cfm?e=1" addtoken="No"> --->
				   <meta http-equiv="refresh" content="0;url=Srchboard.cfm?e=1">
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
				   AND IPRAMemberID Not IN (Select Num_ID From Board)
				  Order By Company, Lastname, Firstname 
				 </cfquery> 
				 
				 <cfif getmember.recordcount GT 0>
				   <table border="0" cellpadding="4" cellspacing="0" width="100%">
                      <tr>
					    <td>Your search returned <strong>#GetMember.recordcount#</strong> possible matches. Please click the name of the member you are looking for to add them as a board member.</td>
					  </tr>
					  <tr><td>&nbsp;</td></tr> 
					 <cfloop query="getmember">
					   <tr>
                         <td><a href="Board.cfm?mbrID=#getMember.MemberID#&action=Add">#GetMember.Firstname# #GetMember.lastname#</a><br>
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
			   <cfelseif URL.Action EQ "Add">
			      <cfquery name="GetMember" datasource="#Application.dsn#">
				    Select Firstname, Lastname, IPRAMemberID, Email
					From Members
					Where MemberID = #URL.mbrID#
				  </cfquery>
			      <cfquery name="AddNew" datasource="#Application.dsn#">
				   Insert Into Board(FIRST, LAST, MbrID, EMAIL)
				   Values('#GetMember.Firstname#', '#getMember.LastName#', #GetMember.IPRAMemberID#, <cfif GetMember.Email NEQ "">'#GetMember.Email#'</cfif>)
				 </cfquery>
				 You have Successfully Added this Board member<br>
				 <a href="board.cfm">Click Here to Go back</a>
			   <cfelseif URL.Action EQ "Remove">
			     <cfquery name="Remove" datasource="#Application.dsn#">
				   Delete From Board
				   Where Num_ID = #Url.BID#
				 </cfquery>
				 You have Successfully Deleted this Board member<br>
				  <a href="board.cfm">Click Here to Go back</a>
			   </cfif>
		 </td>
     </tr>
</table>  
</cfoutput>
<cfmodule template="#Application.footer#">