<cfmodule template="#Application.header#" section="0" sectiontitle="IPRA Headlines">
<cfquery name="GetArticle" datasource="#Application.dsn#">
  Select *
  From Articles
  Where 1 = 1
  <cfif IsDefined("URL.AID")>
   AND ArticleID = <cfqueryparam value="#Url.AID#" cfsqltype="CF_SQL_INTEGER">
  </cfif>
  AND approved = 1
  Order By PostingDate desc, Highlight desc 
</cfquery>

  <cfoutput>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="160"><br>
		    <cfmodule template="#Application.tagdir#/Aboutusnav.cfm" level="5">
		   </td>
		   <td valign="top"><br>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>IPRA Headlines</h3></td>
		        </tr>
		      </table>
			  <table border="0" cellpadding="6" cellspacing="0" width="100%">
		        <tr>
		           <td class="RegText">
					<p>Welcome to the IPRA Headline News Page</p>
					<cfif IsDefined("URL.AID")>
					<table border="0" cellpadding="3" cellspacing="0" width="100%">
					<tr bgcolor="eeeee">
					<td align="right"><a href="/Articles.cfm">Back to Headline News Archive</a></td>
					</tr>
					</table>
					</cfif>
					<cfif GetArticle.recordcount EQ 1>
						<table border="0" cellpadding="4" cellspacing="0" width="100%">
	                      <cfloop query="GetArticle">
						    <tr>
	                            <td><strong style="color:##003399; font-family:tahoma; font-size:16px;">#GetArticle.Headline#</strong></td>
	                        </tr>
							<tr>
							  <td>Posted: #DateFormat(GetArticle.PostingDate, 'MMMM DD, YYYY')#</td>
							</tr>
							<tr><td>&nbsp;</td></tr>
							<tr>
							  <td><cfif ImgPath NEQ ""><img src="/images/Articles/#GetArticle.ImgPath#" border="0" Alt="#GetArticle.ImgAltText#" align="right" vspace="4" hspace="4"></cfif>
							      <p style="font-family:arial, tahoma; font-size:12px;">#ReplaceNoCase(GetArticle.ArticleText, "#Chr(13)##Chr(10)#", "<br>", "All")#
							  </td>
							</tr>
							<cfif GetArticle.LR1URL NEQ "">
							<tr>
							  <td><strong>Related Links:</strong></td>
							</tr>
							<tr>
							  <td><a href="#GetArticle.LR1URL#" target="_blank">#GetArticle.LR1Head#</a></td>
							</tr>
							<cfif GetArticle.LR2URL NEQ "">
							<tr>
							  <td><a href="#GetArticle.LR2URL#" target="_blank">#GetArticle.LR2Head#</a></td>
							</tr>
							</cfif>
							</cfif>
						  </cfloop>
	                    </table>
					<cfelseif GetArticle.recordcount GT 1>
					  	<table border="0" cellpadding="4" cellspacing="0">
	                      <cfloop query="GetArticle">
						    <tr>
							    <td>#DateFormat(GetArticle.PostingDate, 'MMMM DD, YYYY')#</td>
	                            <td><a href="/Articles.cfm?AID=#GetArticle.ArticleID#"><cfif Highlight EQ 1><strong style="color:##990000;">#GetArticle.Headline#</strong><cfelse><strong>#GetArticle.Headline#</strong></cfif></a></td>
	                        </tr>
						  </cfloop>
	                    </table>
					<cfelseif GetArticle.recordcount EQ 0>
					   <table border="0" cellpadding="0" cellspacing="0" width="100%">
                         <tr>
                           <td><strong style="color:##cc0000;">There are currently no active articles.</strong></td>
                         </tr>
                       </table>	
					</cfif>
				   </td>
		        </tr>
		       </table>
			   <br><br>
		 </td>
     </tr>
</table>  
</cfoutput>
<cfmodule template="#Application.footer#">