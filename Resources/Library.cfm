<cfmodule template="#Application.header#" sectiontitle="IPRA Resource Library">
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top"><br>
	         <cfmodule template="#Application.tagdir#/resourcenav.cfm">
		   </td>
		   <td valign="top"><br>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>IPRA Resource Library</h3></td>
		        </tr>
		      </table>
			  <table border="0" cellpadding="6" cellspacing="0" width="100%">
		        <tr>
		           <td class="RegText">
                        <p>Welcome to the IPRA Resource Library. Here you will find a vast assortment of documentation related to the park and recreation field. Please choose an available category below or enter a search term that meets your criteria. If you would like to have a document posted in the Resource Library, please forward your document to Dean Comber at 630-376-1911. To gain access to all resources, please remember to login to the Members Only area. Please note: IPRA will be adding documentation on a continual basis.</p>
				   </td>
		        </tr>
		       </table>
			   <br>
					<cfquery name="GetCats" datasource="#Application.dsn#">
					   Select Distinct R.Category, L.CodeDesc
					   From Resources R, Lookup L
					   Where R.Category = L.CodeValue
					   AND L.CodeGroup = 'RESCAT'
					   AND R.Active = 1
					   <Cfif Not IsDefined("session.userinfo.memberID")>
						 AND R.MembersOnly = 0
					   </CFIF>
					   Order BY L.CodeDesc
					</cfquery>
					<cfset NRows = Round(GetCats.RecordCount / 1)>

				  <table border="0" cellpadding="3" cellspacing="0">
				  <tr>
				    <td>
					  <cfform name="Search" action="ResourceSearch.cfm" Method="POST" scriptsrc="/scripts/cfform.js">
						  <table border="0" cellpadding="5" cellspacing="0" width="100%">
				            <tr>
							   
				               <td valign="top"><font face="arial" color="#003366" size="-1"><strong>Search</strong></font><br><cfinput type="text" name="search" required="yes" message="You must enter a search term." size="10" maxlength="100">&nbsp;&nbsp;<input type="submit" name="submit" value="GO"></td>
							   
							   <td align="center" valign="bottom"><a href="http://www.adobe.com/products/acrobat/readstep2.html" target="_blank"><img src="http://www.adobe.com/images/get_adobe_reader.gif" alt="Download Adobe Reader" border="0"></a></td>
				            </tr>
				         </table>
					 </cfform>
					</td>
				  </tr>
				  <tr>
				    <td>&nbsp;</td>
				  </tr>
				  <tr>
				    <td ><font face="arial" color="#990000" size="+1"><strong>Resource Categories</strong></font></td>
				  </tr>
				 </table>  
				  <table border="0" cellpadding="3" cellspacing="0" width="100%">
				   
				  <cfset Lines = 0>
				  <tr valign="top">
					 <td>
						<table cellpadding=1 cellspacing=0 border=0>
							<CFOUTPUT Query="GetCats">
							   <cfset Category = Getcats.Category>
								<cfset Lines = Lines + 1>
								<cfif (Lines MOD NRows) eq 0>
										</table>
									</td>
									<td>
										<table cellpadding=1 cellspacing=0 border=0>
								</cfif>
								<tr>
									<td><a href="ResourceCategory.cfm?CatID=#Category#" style="font-family:arial; font-size: 3;color:##000099;"><font face="arial" size="3"><strong>#GetCats.Codedesc#</strong></font></a></td>
								</tr>
				
							<cfset Lines = Lines + 1>
							
							
							<cfif (Lines MOD NRows) eq 0>
									</table>
								</td>
								<td>
									<table cellpadding=1 cellspacing=0 border=0>
							</cfif>
							</CFOUTPUT>
					   </table>
					</td>
				  </tr>
				</table>
			   <br><br>
		 </td>
     </tr>
</table>  
<cfmodule template="#Application.footer#">
