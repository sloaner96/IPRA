<cfmodule template="#Application.header#" section="0" sectiontitle="Project Site">
  <cfoutput>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="150"><br>
	         <cfmodule template="#Application.tagdir#/MemberonlyNav.cfm">
		   </td>
		   <td valign="top"><br>
			  <h3>Project Site</h3>
			  <table border="0" cellpadding="6" cellspacing="0" width="100%">
		        <tr>
		           <td class="RegText">
				     
                      <table border="0" cellpadding="0" cellspacing="0" width="100%">
                  <tr>
                    <td class="ErrorHead" align="Center"><img src="/images/Error.gif" width="26" height="26" alt="" border="0"> YOU ARE NOT AUTHORIZED TO VIEW THIS PAGE</td>
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