<cfmodule template="#Application.header#" section="0" sectiontitle="Site Admin">
  <cfoutput>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="160"><br>
		    <cfmodule template="#Application.tagdir#/adminnav.cfm" level="1">
		   </td>
		   <td valign="top"><br>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>IPRA Administrative Site</h3></td>
		        </tr>
		      </table>
			  <table border="0" cellpadding="6" cellspacing="0" width="100%">
		        <tr>
		           <td class="RegText">
				      <table border="0" cellpadding="0" cellspacing="0" width="100%">
                          <tr>
                            <td><h3>Process Master Table File</h3></td>
                          </tr> 
						  <tr>
						    <td>The Following Program will Update the IPRA Members Table. <strong class="errortext">WARNING!</strong> This Process will update all user data. Please make sure that you have all of the Correct/Most Recent Data in the IMIS System. If you are not sure, Please download the Updates Spreadsheet <a href="/admin/MbrUpdates.cfm">HERE</a></td>
						  </tr>
                      </table>
					  <br><p>* THE IPRA MASTER FILE MUST BE A PIPE (|)DELIMITED FILE WITH A MS-DOS RETURN CHARACTER AT THE END OF EACH LINE. IF YOU DO NOT KNOW WHAT THIS IS PLEASE CONTACT THE ADMINISTRATOR</p> 
					 <cfform name="imisprocess" action="ProcessMaster_action.cfm?RequestTimeout=2000" Method="POST" enctype="multipart/form-data" scriptsrc="/scripts/cfform.js">
						  <table border="0" cellpadding="3" cellspacing="0">
							<tr>
							  <td><input name="Submit" submit="Submit" value="Process File >>"></td>
							</tr>
	                      </table>
					 </cfform> 
				   </td>
		        </tr>
		       </table>
			   <br><br>
		 </td>
     </tr>
</table>  
</cfoutput>
<cfmodule template="#Application.footer#">