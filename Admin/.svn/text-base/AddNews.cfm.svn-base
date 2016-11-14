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
		          <td><h3>Add a News Article</h3></td>
		        </tr>
		      </table>
			  <table border="0" cellpadding="6" cellspacing="0" width="100%">
		        <tr>
		           <td class="RegText">
				      <cfform name="addarticle" action="UpdateNews.cfm?action=add" method="POST" scriptsrc="/scripts/cfform.js" enctype="multipart/form-data">
				      <table border="0" cellpadding="3" cellspacing="0">
                          <tr>
                            <td><strong>Headline:</strong></td>
							<td><input type="text" name="Headline" value="" size="30" maxlength="255"></td>
                          </tr> 
						  <tr>
                            <td><strong>Sub Heading:</strong></td>
							<td><input type="text" name="subheading" value="" size="30" maxlength="50"></td>
                          </tr> 
						  <tr>
                            <td><strong>Highlight on Homepage:</strong><br><font color="757575">(Show in middle column)</font></td>
							<td><input type="checkbox" name="Highlight" value="1"></td>
                          </tr> 
						  
						  <tr>
                            <td><strong>Post By:</strong><br><font color="757575">(mm/dd/yyyy)</font></td>
							<td><input type="text" name="Postingdate" value="" size="15" maxlength="15"></td>
                          </tr> 
						  <tr>
                            <td><strong>Upload Image:</strong></td>
							<td><input type="file" name="articleimg" value="" size="20"></td>
                          </tr> 
						  <tr>
                            <td><strong>Image Alignment:</strong></td>
							<td><input type="radio" name="imgPosition" value="left"> Left&nbsp;<input type="radio" name="imgPosition" value="right" checked> Right</td>
                          </tr> 
						  <tr>
                            <td><strong>Image Text:</strong></td>
							<td><input type="text" name="imgtext" value="" size="20" maxlength="75"></td>
                          </tr> 
						  
						  <tr>
                            <td><strong>Link 1 Label:</strong></td>
							<td><input type="text" name="Link1Label" value="" size="20" maxlength="75"></td>
                          </tr> 
						  <tr>
                            <td><strong>Link 1 URL:</strong></td>
							<td><input type="text" name="Link1Url" value="" size="20" maxlength="75"></td>
                          </tr> 
						  
						  <tr>
                            <td><strong>Link 2 Label:</strong></td>
							<td><input type="text" name="Link2Label" value="" size="20" maxlength="75"></td>
                          </tr> 
						  <tr>
                            <td><strong>Link 2 URL:</strong></td>
							<td><input type="text" name="Link2URL" value="" size="20" maxlength="75"></td>
                          </tr> 
						  <tr>
                            <td colspan=2><strong>Article:</strong><br>
							       <textarea name="ArticleText" rows="8" cols="50"></textarea>     
							</td>
							
                          </tr> 
						  <tr>
						    <td colspan=2><input type="submit" name="submit" value="Add Article"></td>
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