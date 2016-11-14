<cfparam name="url.e" default="0">
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
		          <td><h3>News Article Admin</h3></td>
		        </tr>
		      </table>
			  <table border="0" cellpadding="6" cellspacing="0" width="100%">
		        <tr>
		           <td class="RegText">
				      <table border="0" cellpadding="3" cellspacing="0" width="100%">
                          <tr>
                            <td valign="top"><a href="AddNews.cfm"><strong>Add a New News Article</strong></a><br>
							  <cfif url.e EQ 1>
							    <p class="errorText">Error! You must Define a search criteria</p>
							  </cfif>
							  <cfform name="search" action="SearchNews.cfm" method="Post" scriptsrc="/scripts/cfform.js">
								  <table border="0" cellpadding="1" cellspacing="1" width="200" bgcolor="eeeeee">
	                                  <tr>
									    <td>
										  <table border="0" cellpadding="3" cellspacing="0" width="100%" bgcolor="ffffff">
	                                         <tr bgcolor="eeeeee">
	                                            <td colspan=2><strong>Search the News Archive</strong></td>
	                                         </tr>
									         <tr>
											   <td>Search:</td>
											   <td><input type="text" name="keyword" value="" size="20" maxlength="50"></td>
											 </tr>
											 <tr>
											   <td>Posted Since:</td>
											   <td><input type="text" name="Posted" value="" size="12" maxlength="15"></td>
											 </tr>
											 <tr>
											   <td colspan=2><input type="submit" name="submit" value="Search"></td>
											 </tr>
	                                       </table>
										   
										</td>
									  </tr>
	                              </table>
							 </cfform>
							</td>
							
                          </tr> 
                      </table><br>
					  <cfset LastThirty = DateAdd('d', -30, now())> 
					  
					  <cfquery name="GetArticle" datasource="#Application.dsn#">
					    Select ArticleID, PostingDate, Headline
						From Articles
						Where Approved = 1
						AND PostingDate >= #LastThirty#
						order By Postingdate desc
					  </cfquery>
					  <table border="0" cellpadding="3" cellspacing="0" width="100%">
                         <tr bgcolor="##003366">
                           <td colspan=3><strong style="color:ffffff;">Last Thirty Days News</strong></td>
                         </tr>
						 <tr bgcolor="eeeeee">
						   <td></td>
						   <td><strong>Posted</strong></td>
						   <td><strong>Headline</strong></td>
						 </tr>
						 <cfloop query="GetArticle">
						  <tr>
						    <td><a href="UpdateNews.cfm?aid=#GetArticle.ArticleID#&Action=Remove" style="color:red;font-size:10px;" title="Permanently Delete Article">X</a></td>
						    <td><a href="EditNews.cfm?aid=#GetArticle.ArticleID#">#Dateformat(GetArticle.PostingDate, 'MM/DD/YYYY')#</a></td>
						    <td>#GetArticle.Headline#</td>
						  </tr>
						 </cfloop>
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