<cfmodule template="#Application.header#" section="0" sectiontitle="Site Admin">
  <cfquery name="GetArticle" datasource="#Application.dsn#">
    Select *
	From Articles
	Where ArticleID = #url.AID#
  </cfquery>
  <cfoutput>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="160"><br>
		    <cfmodule template="#Application.tagdir#/adminnav.cfm" level="1">
		   </td>
		   <td valign="top"><br>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>Edit News Article</h3></td>
		        </tr>
		      </table>
			  <table border="0" cellpadding="6" cellspacing="0" width="100%">
		        <tr>
		           <td class="RegText">
				      <cfform name="editarticle" action="UpdateNews.cfm?action=edit" method="POST" enctype="multipart/form-data" scriptsrc="/scripts/cfform.js">
					    <input type="hidden" name="ArticleID" value="#GetArticle.ArticleID#">
				      <table border="0" cellpadding="3" cellspacing="0">
                          <tr>
                            <td><strong>Headline:</strong></td>
							<td><input type="text" name="Headline" value="#GetArticle.Headline#" size="30" maxlength="255"></td>
                          </tr> 
						  <tr>
                            <td><strong>Sub Heading:</strong></td>
							<td><input type="text" name="subheading" value="#GetArticle.SubHeading#" size="30" maxlength="50"></td>
                          </tr> 
						  <tr>
                            <td><strong>Highlight on Homepage:</strong><br><font color="757575">(Show in middle column)</font></td>
							<td><input type="checkbox" name="Highlight" value="1" <cfif GetArticle.Highlight EQ 1>Checked</cfif>></td>
                          </tr> 
						  
						  <tr>
                            <td><strong>Post By:</strong><br><font color="757575">(mm/dd/yyyy)</font></td>
							<td><input type="text" name="Postingdate" value="#DateFormat(GetArticle.PostingDate, 'MM/DD/YYYY')#" size="15" maxlength="15"></td>
                          </tr> 
						  <cfif GetArticle.ImgPath NEQ "">
						  <tr>
						    <td><strong>Existing Image:</strong></td>
							<td><a href="#Application.baseurl#/images/Articles/#GetArticle.ImgPath#" target="_blank">View Image</a></td>
						  </tr>
						  </cfif>
						  <tr>
                            <td><strong>Upload New Image:</strong></td>
							<td><input type="file" name="articleimg" value="" size="20"></td>
                          </tr> 
						  <tr>
                            <td><strong>Image Alignment:</strong></td>
							<td><input type="radio" name="imgPosition" value="left" <cfif GetArticle.ImgPosition EQ "Left">checked</cfif>> Left&nbsp;&nbsp;<input type="radio" name="imgPosition" value="right" <cfif GetArticle.ImgPosition EQ "Left">checked</cfif>> Right</td>
                          </tr> 
						  <tr>
                            <td><strong>Image Text:</strong></td>
							<td><input type="text" name="imgtext" value="#GetArticle.ImgAltText#" size="20" maxlength="75"></td>
                          </tr> 
						  
						  <tr>
                            <td><strong>Link 1 Label:</strong></td>
							<td><input type="text" name="Link1Label" value="#Getarticle.LR1Head#" size="20" maxlength="75"></td>
                          </tr> 
						  <tr>
                            <td><strong>Link 1 URL:</strong></td>
							<td><input type="text" name="Link1Url" value="#Getarticle.LR1URL#" size="20" maxlength="75"></td>
                          </tr> 
						  
						  <tr>
                            <td><strong>Link 2 Label:</strong></td>
							<td><input type="text" name="Link2Label" value="#Getarticle.LR2Head#" size="20" maxlength="75"></td>
                          </tr> 
						  <tr>
                            <td><strong>Link 2 URL:</strong></td>
							<td><input type="text" name="Link2URL" value="#Getarticle.LR2URl#" size="20" maxlength="75"></td>
                          </tr> 
						  <tr>
                            <td colspan=2><strong>Article:</strong><br>
							       <textarea name="ArticleText" rows="8" cols="50">#Getarticle.ArticleText#</textarea>     
							</td>
                          </tr> 
						  <tr>
						    <td colspan=2><input type="submit" name="submit" value="Update Article"></td>
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