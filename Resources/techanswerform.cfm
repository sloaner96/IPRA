<cfmodule template="#Application.header#" section="0" sectiontitle="Tech KnowHow Volunteer Submission Form (Beta)">
  <cfoutput>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="160"><br>
		    <cfmodule template="#Application.tagdir#/resourcenav.cfm" level="4">
		   </td>
		   <td valign="Top"><br>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>Tech KnowHow Volunteer Submission Form</h3></td>
		        </tr>
		      </table>
			  <table border="0" cellpadding="6" cellspacing="0" width="100%">
		        <tr>
		           <td class="RegText">
				      <cfform name="question" action="techvolunteerform_action.cfm" Method="POST" scriptsrc="/scripts/cfform.js">
				      <table cellpadding=4 width="100%" border=0>
	                    <tr>
	                      <td>
						   <p><img src="/images/ipratechlogo.jpg" alt="" border="0"><p/>
						  <p>Please complete the following form to become a volunteer for the Tech KnowHow <br>page. If a question requested meets your profile, IPRA will contact you with the<br> question and await your answer within 7 days. While we trust all answers may <br>in fact be a recommended solution, IPRA will not be held responsible for any <br>answers posted.</p>
						  </td>
						</tr>
                        <tr>
                            <td>
							   <table cellpadding="2" width="450" border="0">
		                          <tr>
		                            <td valign=top width=66>Name :</td>
		                            <td valign=top width=338><cfinput Type="text" size="45" name="Name" required="yes" Message="You must include your name"></td>
								  </tr>
		                          <tr>
		                            <td valign=top width=66>Agency:</td>
		                            <td valign=top width=338><cfinput Type="text" size="45" name="Agency" required="yes" Message="You must include your name"></td>
								  </tr>
		                         
		                          <tr>
		                            <td valign=top width=66>Phone:</td>
		                            <td valign=top width=338><cfinput Type="text" size="45" name="Phone" required="yes" Message="You must include your Phone number"></td>
								  </tr>
		                          <tr>
		                            <td valign=top width=66>Email:</td>
		                            <td valign=top width=338><cfinput Type="text" size="45" name="Email" required="yes" Message="You must include your email address"></td>
								  </tr>
								  
		                          
		<tr>
		                            <td valign=top width=100>Include Name &amp Agency?</td>
		                            <td valign=top width=300><input name="InfoYes" type="checkbox" id="InfoYES" value="SELECTED">YES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input name="InfoNo" type="checkbox" id="InfoNo" value="SELECTED">NO</td>
								  </tr>
		                          <tr>
		                            <td colspan=2>
		                              <hr>
		                              <b>IT Expertise</b> (Choose each that apply)</td>
								 </tr>
		                          <tr>
		                            <td colspan=2>
		                              <table cellpadding=2 width="100%" border=0>
		                                <tr valign=top>
		                                <td width="42%">
										<input type="checkbox" value="Networking_SysAdmin" name="Section">Networking/System Administration<br>
										<input type="checkbox" value="Web Development" name="Section">Web Development<br>
										<input type="checkbox" value="Internet" name="Section">Internet<br>
		                                <input type="checkbox" 
		                                value="E-Mail" name="Section">E-Mail<br>
										<input type="checkbox" 
		                                value="Databases" name="Section">Databases<br>
										<input 
		                                type="checkbox" value="Desktop Publishing" 
		                                name="Section">Desktop Publishing<br>
										<input type="checkbox" 
		                                value="Microsoft Office" 
		                                name="Section">Microsoft Office<br>
										<input type="checkbox" 
		                                value="Other" 
		                                name="Section">Other (Please explain below)</font></td>
										</tr>
										
									</table>
								   </td>
								 </tr>
								 <table cellpadding="2" width="450" border="0">
								 <tr>
		                            
		                            <td valign=top width=338><textarea name="Other" rows="5" cols="35"></textarea></td>
								  </tr></table>
		                          </tbody></table></td></tr>
		                          <tr>
		
		                            <td colspan=2>&nbsp;</td></tr>
		                          <tr>
		                            <td colspan=2>
		                              <div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Submit Volunteer Information" name="Submit"> 
		                           
		                              </div>
									</td>
								  </tr>
								 </tbody>
								</table>
							 </cfform>
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
