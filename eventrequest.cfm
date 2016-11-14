<cfmodule template="#Application.header#" sectiontitle="Event Request Form">
  <cfoutput>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top"><br>
	         <cfmodule template="#Application.tagdir#/aboutusnav.cfm">
		   </td>
		   <td valign="top"><br>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>Event Request Form</h3></td>
		        </tr>
		      </table>
			  <table border="0" cellpadding="6" cellspacing="0" width="100%">
		        <tr>
		           <td class="RegText">
                     <cfform method="POST" action="eventrequest_action.cfm" scriptsrc="/scripts/cfform.js">
                        <table border="0" cellpadding="2" class="RegText">
    
							<tr>
                              <td colspan="2" valign="top">
							    <p>Thank you for your event request.  Please complete the following form and every effort will be made to promptly post your event to the IPRA website.  Please note, all information is subject to approval by IPRA staff (<strong>Please review the Event Planning Flowchart for instructions on how to submit IPRA Section and Committee related events</strong>).</p>
<p><img src="/images/EventPlanningFlowchart.jpg" border="0"></p>
                                <p>Please send any documents (Word or PDF) to <script type="text/javascript">
user ="mike"
domain ="ilipra.org"
subCon ="Event Submission Documents"
document.write('<a href="mailto:' + user + '@' + domain +'?subject=' +subCon+' " ' +' >Mike Selep</a>');
</script>.
</p>
								</td>
                            </tr>
							<tr> 
                              <td colspan="2"> 
                                <hr noshade >
                              </td>
                            </tr>
                            <tr> 
                              <td valign="top"><strong>Event Name:</strong></td>
                              <td valign="top"> 
                              &nbsp;<cfinput type="text" name="eventname" size="45">
                              </td>
                            </tr>
							<tr> 
                              <td valign="top"><strong>Start Date/Time:</strong></td>
                              <td valign="top"> 
                              &nbsp;<cfinput type="text" name="startdate" size="20" maxlength="20">&nbsp;<i>(mm/dd/yyyy hh:mm AM/PM)</i>
                              </td>
                            </tr>
							<tr> 
                              <td valign="top"><strong>End Date/Time:</strong></td>
                              <td valign="top"> 
                              &nbsp;<cfinput type="text" name="enddate" size="20" maxlength="20">&nbsp;<i>(mm/dd/yyyy hh:mm AM/PM)</i>
                              </td>
                            </tr>
							<tr> 
                              <td valign="top"><strong>Location:</strong></td>
                              <td valign="top"> 
                                &nbsp;<cfinput type="text" name="location" size="45">
                              </td>
                            </tr>
							<!---  <tr> 
                              <td valign="top"><strong>Start Time:</strong></td>
                              <td valign="top"> 
                              &nbsp;<cfinput type="text" name="starttime" size="10" maxlength="8">&nbsp;<i>(hh:mm AM/PM)</i>
                              </td>
                            </tr>
							<tr> 
                              <td valign="top"><strong>End Time:</strong></td>
                              <td valign="top"> 
                              &nbsp;<cfinput type="text" name="endtime" size="10" maxlength="8">&nbsp;<i>(hh:mm AM/PM)</i>
                              </td>
                            </tr>
							<tr> 
                              <td valign="top"><strong>Presented By:</strong></td>
                              <td valign="top"> 
                              &nbsp;<cfinput type="text" name="presentedby" size="45">
                              </td>
                            </tr>
                            <tr> 
                              <td valign="top"><strong>Agency:</strong></td>
                              <td valign="top"> 
                                &nbsp;<cfinput type="text" name="agency" size="45">
                              </td>
                            </tr>--->
                            
                            <tr>
                              <td valign="top"><strong>Contact:</strong></td>
                              <td valign="top"> 
                                &nbsp;<cfinput type="text" name="contact" size="45">
                              </td>
                            </tr>
							<tr>
                              <td valign="top"><strong>Contact Phone:</strong></td>
                              <td valign="top"> 
                                &nbsp;<cfinput type="text" name="phone" size="10" maxlength="12">&nbsp;<i>(123-456-7890)</i>
                              </td>
                            </tr>
							<tr>
                              <td valign="top"><strong>Contact E-Mail:</strong></td>
                              <td valign="top"> 
                                &nbsp;<cfinput type="text" name="email" size="45">
                              </td>
                            </tr>
							<!---  <tr> 
                              <td valign="top"><strong>Registration Deadline:</strong></td>
                              <td valign="top"> 
                              &nbsp;<cfinput type="text" name="regdeadline" size="10" maxlength="10">&nbsp;<i>(mm/dd/yyyy)</i>
                              </td>
                            </tr>
							<tr> 
                              <td valign="top"><strong>IPRA Member Cost:</strong></td>
                              <td valign="top"> 
                              &nbsp;<cfinput type="text" name="ipramembercost" size="10" maxlength="7">&nbsp;<i>($0.00)</i>
                              </td>
                            </tr>
							<tr> 
                              <td valign="top"><strong>Non-Member Cost:</strong></td>
                              <td valign="top"> 
                              &nbsp;<cfinput type="text" name="nonipramembercost" size="10" maxlength="7">&nbsp;<i>($0.00)</i>
                              </td>
                            </tr>--->
                            <tr> 
							<td valign="top"><strong>Announcement Text:</strong></td>
                              <td width="500" valign="top" colspan="2">                                
								
                                <p>&nbsp;&nbsp;<textarea rows="10" cols="40" name="eventdetail">Please provide additional information that will help entice individuals to attend, such as a brief description of the speaker’s credentials, relevance of topic to today’s professional, benefits to attendee, Number of CEUs offered, or special features of the meeting/seminar/conference</textarea></p>
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