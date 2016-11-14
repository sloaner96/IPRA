
<cfset ErrorList = ArrayNew(1)>

<cfif Form.FirstName is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>First Name</b> field")>
</cfif>
<cfif Form.lastname is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Last Name</b> field")>
</cfif>
<cfif Not IsDefined("URL.pass")>
	<cfif Form.company is "">
		<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Company</b> field")>
	</cfif>
</cfif>
<cfif Form.addr is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Address 1</b> field")>
</cfif>
<cfif Form.City is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>City</b> field")>
</cfif>
<cfif Form.State is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>State</b> field")>
</cfif>
<cfif Form.Zip is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Zip Code</b> field")>
</cfif>
<cfif Form.MainPhone is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Phone</b> field")>
</cfif>
<cfif Form.Email is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Email</b> field")>
</cfif>
<cfif Form.Password is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Password</b> field")>
</cfif>

<cfif ArrayLen(ErrorList) EQ 0>
    <cfif Not IsDefined("URL.pass")>
	    <!--- try to match the company name to the AgencyID --->
		<cfquery name="checkCompany" datasource="#Application.dsn#">
		  Select *
		  From Agencies
		  Where AgencyName Like '%#Form.company#%'
		  order By AgencyName, City, Addr1
		</cfquery>
		
		
		<cfif checkcompany.recordcount GT 1>
		      <cfmodule template="#Application.header#" section="0" sectiontitle="Maintaining Member Information">
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
							   <table border="0" cellpadding="4" cellspacing="0" width="100%">
						         <tr>
						           <td>We have found more than one record for the Agency/School you entered. Please choose from the list below and click continue</td>
						         </tr>
								 <tr>
								   <td>
								     <form name="compcheck" action="editInfo_action.cfm?pass=2" method="POST">
								       <cfloop index="x" list="#form.fieldnames#">
									    <input type="hidden" name="#x#" value="#Evaluate(x)#">
									   </cfloop>
									   <table border="0" cellpadding="4" cellspacing="1" bgcolor="##eeeeee" width="100%">
			                             <cfloop query="checkCompany">
										   <tr bgcolor="##ffffff">
			                                 <td  width="10"><input type="radio" name="agencyID" value="#checkcompany.AgencyID#" <cfif checkcompany.currentrow EQ 1>Checked</cfif>></td>
											 <td>#checkcompany.AGENCYNAME#</td>
											 <td>#checkcompany.ADDR1#<br>
											     <cfif checkcompany.ADDR2 NEQ "">#checkcompany.ADDR2#<br></cfif>
											     #checkcompany.City#, #checkcompany.State# #checkcompany.Zip#
											 </td>
			                               </tr>
										 </cfloop>
										 <tr>
										   <td colspan="2"><input type="submit" name="continue" value="continue >>"></td>
										 </tr>
			                           </table> 
									 </form>
								   </td>
								 </tr>
								 
						      </table>
		  			       <br><br>
					   </td>
			        </tr>
			    </table>  
			</cfoutput>
			<cfmodule template="#Application.footer#"> 
			
		<cfelseif checkcompany.recordcount EQ 1>
			  <cfset agencyID = checkcompany.AgencyID>
			  <cfset IPRACOID = checkcompany.IPRAAgencyID>
			  <cfset agname = checkcompany.AgencyName>
			<!--- More than one name was found make them choose --->  	
		<cfelseif checkcompany.recordcount EQ 0>
		   <cfset agencyID ="0">
		   <cfset IPRACOID = "0"> 
		   <cfset agname = "#Trim(Form.company)#">
		</cfif>
	<cfelse>
	  <cfquery name="checkCompany2" datasource="#Application.dsn#">
	    Select *
	    From Agencies
	    Where AgencyID = #Form.agencyID#
	  </cfquery>
	  
	  <cfset agencyID = checkcompany2.AgencyID>
	  <cfset IPRACOID = checkcompany2.IPRAAgencyID>
	  <cfset agname = checkcompany2.AgencyName>	
	</cfif>
	<cfif Not IsDefined("URL.PASS")>
	  <cfif checkcompany.recordcount GT 1>
	    <cfabort>
	  </cfif>
	</cfif>
	<cftransaction action="BEGIN">
	<cfquery name="UpdateMember" datasource="#Application.dsn#">
	  Update Members
	    Set FirstName    = '#Form.firstname#',
		    LastName     = '#Form.lastname#',
			Title        = <cfif form.title NEQ "">'#Form.title#'<cfelse>NULL</cfif>,
			Company      = <cfif agname NEQ "">'#agname#'<cfelse>NULL</cfif>,
			AgencyID	 = <cfif AgencyID NEQ "">#AgencyID#<cfelse>NULL</cfif>,
			IPRACOID     = <cfif IPRACOID NEQ "">#IPRACOID#<cfelse>NULL</cfif>,
			Address1     = '#Form.addr#',
			Address2     = <cfif form.addr2 NEQ "">'#Form.addr2#'<cfelse>NULL</cfif>,
			City         = '#Form.City#',
			State        = '#Form.State#',
			Zipcode      = '#Form.Zip#',
			MainPhone    = '#Form.mainPhone#',
			Fax          = <cfif form.fax NEQ "">'#Form.Fax#'<cfelse>NULL</cfif>,
			Email        = '#Form.Email#',
			Password     = '#Form.password#',
			LastUpdated  = #CreateOdbcDateTime(Now())#
	  Where MemberID = #Session.Userinfo.MemberID#
	</cfquery>
	<cftransaction action="COMMIT" />
	
	 <cfquery name="GetUser" datasource="#Application.dsn#">
		  Select *
		  From Members
		  Where MemberID = #Session.Userinfo.MemberID#
	 </cfquery>
	 </cftransaction>
	 <cfset session.userinfo = getUser>
</cfif>
    <cfmodule template="#Application.header#" section="0" sectiontitle="Maintaining Member Information">
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
			  <cfif ArrayLen(ErrorList) EQ 0>
				  <table border="0" cellpadding="0" cellspacing="0" width="100%">
		               <tr>
		                   <td>You have successfully updated your member information.</td>
		               </tr>
	              </table>
			  <cfelse>
			      <table border="0" cellpadding="0" cellspacing="0" width="100%">
		               <tr>
		                   <td>
						      <font face="Verdana,Arial" size="-1">
								<h4><font color="Maroon">Problem(s) were encountered while updating you member information</font></h4>
								<p>Your transaction could not be completed because:</p>
								<ol>
								<cfloop INDEX="i" FROM="1" TO="#ArrayLen(ErrorList)#">
								<cfoutput><li><p>#ErrorList[i]#</p></li></cfoutput>
								</cfloop>
								</ol>
								<div align=center><form><input type="Button" name="" value="Click here to correct Errors Now" align="ABSMIDDLE" onclick="history.back()"></form></div>
								</font>

						   </td>
		               </tr>
	              </table>
			  </cfif>
			   <br><br>
		 </td>
     </tr>
</table>  
</cfoutput>
<cfmodule template="#Application.footer#">