<cfmodule template="#Application.header#" sectiontitle="e-Newsletter Request Form">
  <cfoutput>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top"><br>
	         <cfmodule template="#Application.tagdir#/resourcenav.cfm">
		   </td>
		   <td valign="top"><br>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>e-Newsletter Request Form</h3></td>
		        </tr>
		      </table>
			  <table border="0" cellpadding="6" cellspacing="0" width="100%">
		        <tr>
		           <td class="RegText">
                     <cfform method="POST" action="/Resources/newsletter_action.cfm" scriptsrc="/scripts/cfform.js">
                        <table border="0" cellpadding="2" class="RegText">
    
							<tr>
                              <td colspan="2" valign="top">
							    <p>Does your IPRA Section need help promoting an event or educational seminar?  Each month the IPRA e-Newsletter is sent to over 2,700 members of IRPA in a user-friendly, cost-efficient and fun format!  If you have information you would like shared with the members of IRPA please complete the request form below.  Space is limited and not all requests will be honored.  IPRA must maintain a professional and educational e-Newsletter geared toward IRPA Sections…this is not an open forum for individual agencies.</p>
                                <p>The e-Newsletter Request Form must be completed and submitted by the first of the month to be considered for the next month’s e-Newsletter. (example: submit information by April 1, 2005 for May e-Newsletter)

</p>
								</td>
                            </tr>
							<tr> 
                              <td colspan="2"> 
                                <hr noshade >
                              </td>
                            </tr>
                            <tr> 
                              <td valign="top"><strong>Name:</strong></td>
                              <td valign="top"> 
                              &nbsp;<cfinput type="text" name="name" size="45">
                              </td>
                            </tr>
							<tr> 
                              <td valign="top"><strong>E-Mail:</strong></td>
                              <td valign="top"> 
                              &nbsp;<cfinput type="text" name="email" size="45">
                              </td>
                            </tr>
							<tr> 
                              <td valign="top"><strong>Work Phone:</strong></td>
                              <td valign="top"> 
                              &nbsp;<cfinput type="text" name="phone" size="45">
                              </td>
                            </tr>
                            <tr> 
                              <td valign="top"><strong>Agency:</strong></td>
                              <td valign="top"> 
                                &nbsp;<cfinput type="text" name="agency" size="45">
                              </td>
                            </tr>
                            <tr> 
                              <td valign="top"><strong>Fax:</strong></td>
                              <td valign="top"> 
                                &nbsp;<cfinput type="text" name="fax" size="45">
                              </td>
                            </tr>
                            <tr>
                              <td valign="top"><strong>Address:</strong></td>
                              <td valign="top"> 
                                &nbsp;<cfinput type="text" name="address" size="45">
                              </td>
                            </tr>
							<tr>
                              <td valign="top"><strong>City:</strong></td>
                              <td valign="top"> 
                                &nbsp;<cfinput type="text" name="city" size="45">
                              </td>
                            </tr>
							<tr>
                              <td valign="top"><strong>State:</strong></td>
                              <td valign="top"> 
                                &nbsp;<cfinput type="text" name="state" size="2" value="IL">
                              </td>
                            </tr>
							<tr>
                              <td valign="top"><strong>Zip Code:</strong></td>
                              <td valign="top"> 
                                &nbsp;<cfinput type="text" name="ZipCode" size="8" maxlength="5">
                              </td>
                            </tr>
							<tr>
                              <td valign="top"><strong>Name of Event:</strong></td>
                              <td valign="top"> 
                                &nbsp;<cfinput type="text" name="eventname" size="45">
                              </td>
                            </tr>
							<tr>
                              <td valign="top"><strong>Date of Event:</strong></td>
                              <td valign="top"> 
                                &nbsp;<cfinput type="text" name="eventdate" size="10" maxlength="10">
                              </td>
                            </tr>
							
                            <tr> 
							<td valign="top"><strong>Detail:</strong></td>
                              <td width="500" valign="top" colspan="2">                                
								
                                <p>&nbsp;&nbsp;<textarea cols="40" name="eventdetail">(125 word max)</textarea></p>
                              </td>
                            </tr>
                            <tr> 
                              <td colspan="2"> 
                                <hr noshade >
                              </td>
                            </tr>
                            <tr> 
                              <td colspan="2"> 
                            <input type="submit" value="Submit Event! >>">
							

                              </td>
                            </tr>
							
                            
                          </table>
                        </cfform>
				   </td>
		        </tr>
		       </table>
			   <br>
			   
			   <br><br>
		 </td>
     </tr>
</table>  
</cfoutput>
<cfmodule template="#Application.footer#">