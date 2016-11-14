<cfinclude template="#Application.TagDir#/Libraries/ccEscape.cfm">

<CFQUERY Name="GetDonor" Datasource="#Application.DSN#">
	Select D.*
	From Donors D
	Where DonorID=#Url.DonorID#
</CFQUERY>

					  


<cfmodule template="#Application.header#" section="0" sectiontitle="Site Admin">
  <cfoutput query="GetDonor">
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="160"><br>
		    <cfmodule template="#Application.tagdir#/adminnav.cfm" level="4">
		   </td>
		   <td valign="top"><br>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>IPRF Contribution</h3></td>
		        </tr>
		      </table>
			  <div align="right"><a href="Donors.cfm">Back to Donation Home</a></div>
			  <table border="0" cellpadding="6" cellspacing="0" width="100%">
		        <tr>
		           <td class="RegText">
				      <table border="0" cellpadding="0" cellspacing="0" width="100%">
                          <tr>
                            <td>
							  
							  <table border="0" cellpadding="4" cellspacing="0" width="100%">
		                         <tr bgcolor="##eeeeee">
		                           <td><strong>Donation Information</strong></td>
		                        </tr>
							    <tr>
								  <td><br><strong>Date Donation Made:</strong> #DateFormat(GetDonor.DonationDate, 'mm/dd/yyyy')#<br>
								      <strong>To Recognize:</strong> #GetDonor.ToRecognize#<br>
									  <strong>Donation Amount:</strong> #DollarFormat(GetDonor.DonationAmt)#<br><br>
								      <strong>Name:</strong> #GetDonor.DonorName#<br>
								      <strong>Address:</strong><br>
									    #GetDonor.addr1#<br>
									    <cfif getdonor.addr2 NEQ "">#GetDonor.Addr2#<br></cfif>
										#GetDonor.City#,  #GetDonor.StAbbr#,  #GetDonor.Zip#  <br>
										<strong>Phone:</strong>  #GetDonor.Phone#<br>
										<strong>Email:</strong>  <a href="#GetDonor.Email#">#GetDonor.Email#</a><br><br>                  
									    
										
										
								  </td>
								</tr> 
								
								
								 
		                      </table>
							</td>
                          </tr> 
                      </table>
				   </td>
		        </tr>
		       </table>
			   <br><br>
		 </td>
     </tr>
</table>  
</cfoutput>
<cfmodule template="#Application.footer#">