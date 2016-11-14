  <cfif form.keyword EQ "" AND form.posted EQ "">
    <meta http-equiv="refresh" content="0;url=Articles.cfm?e=1">
    <!--- <cflocation url="Articles.cfm?e=1" addtoken="No"> --->
  </cfif>
  
  <cfquery name="GetArticle" datasource="#Application.dsn#">
    Select ArticleID, PostingDate, Headline
	From Articles
	Where 1 = 1
	<cfif form.Keyword NEQ "">
	 AND (Headline Like '#Keyword#%' OR SubHeading Like '#Keyword#%' OR Articletext Like '#Keyword#%')
    </cfif>
	<cfif Form.Posted NEQ "">	
	 AND PostingDate >= #CreateODBCDate(form.Posted)#
	</cfif>
	order By Postingdate desc
</cfquery>
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
		          <td><h3>Search News</h3></td>
		        </tr>
		      </table>
			  <table border="0" cellpadding="6" cellspacing="0" width="100%">
		        <tr>
		           <td class="RegText">
				      <table border="0" cellpadding="0" cellspacing="0" width="100%">
                         <cfif GetArticle.recordcount GT 0>
						   <tr bgcolor="eeeeee">
						   <td><strong>Posted</strong></td>
						   <td><strong>Headline</strong></td>
						 </tr>
						 <cfloop query="GetArticle">
						  <tr>
						    <td><a href="EditNews.cfm?aid=#GetArticle.ArticleID#">#Dateformat(GetArticle.PostingDate, 'MM/DD/YYYY')#</a></td>
						    <td>#GetArticle.Headline#</td>
						  </tr>
						 </cfloop>
						  <cfelse>
						   <tr>
                             <td class="Errortext">Your Search Returned no matches. <a href="Articles.cfm">Click Here</a> to search again</td>
                           </tr>
						  </cfif> 
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