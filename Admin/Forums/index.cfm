<cfmodule template="#Application.header#" section="0" sectiontitle="Forum Maintenance">
  <cfoutput>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="160"><br>
		    <cfmodule template="#Application.tagdir#/adminnav.cfm" level="1">
		   </td>
		   <td valign="top"><br>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>IPRA Member Forums</h3></td>
		        </tr>
		      </table>
			  <table border="0" cellpadding="6" cellspacing="0" width="100%">
		        <tr>
		           <td class="RegText" valign="top" width="48%">
				      <table border="0" cellpadding="3" cellspacing="0" width="100%">
                          <tr bgcolor="##9dabc4">
                            <td><strong style="font-family:arial, tahoma, verdana;">Groups</strong></td>
                          </tr> 
						  <tr>
						    <td>
							  <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                  <tr>
                                    <td><a href="maintainGroups.cfm">Maintain Forum Groups</a></td>
                                  </tr>	  
                              </table>
							</td>
						  </tr>
                      </table><br>
					  <table border="0" cellpadding="3" cellspacing="0" width="100%">
                          <tr bgcolor="##9dabc4">
                            <td><strong style="font-family:arial, tahoma, verdana;">Categories</strong></td>
                          </tr> 
						  <tr>
						    <td>
						       <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                  <tr>
                                    <td><a href="MaintainCats.cfm">Maintain Categories</a></td>
                                  </tr> 
                               </table>
							</td>    
						 </tr>	  
                      </table><br>
					  <table border="0" cellpadding="3" cellspacing="0" width="100%">
                          <tr bgcolor="##9dabc4">
                            <td><strong style="font-family:arial, tahoma, verdana;">Posts/Threads</strong></td>
                          </tr> 
						  <tr>
						    <td>
						       <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                  <tr>
                                    <td><a href="#Application.Baseurl#/membersonly/forums/index.cfm">Maintain Posts & Threads</a></td>
                                  </tr> 
								  <tr>
                                    <td><font face="verdana" size="-2">* Note: This link will take you to the membersonly section of the site.</font></td>
                                  </tr> 
								  
                               </table>
							</td>    
						 </tr>	
                      </table><br>
							</td>    
						 </tr>
                      </table><br><br>
				   </td>
		        </tr>
		       </table>
			   <br><br>
		 </td>
     </tr>
</table>  
</cfoutput>
<cfmodule template="#Application.footer#">