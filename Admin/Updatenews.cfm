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
		          <td><h3>News Articles</h3></td>
		        </tr>
		      </table>
           <cfset ErrorList = ArrayNew(1)>
<cfif action EQ "add">
   <cfif form.headline EQ "">
     <cfset x = ArrayAppend(ErrorList, "No value specified for the <b>headline</b> field")>
   </cfif>
   
   <cfif form.Postingdate EQ "">
     <cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Post Date</b> field")>
   </cfif>
   
   <cfif Not IsDate(form.Postingdate)>
     <cfset x = ArrayAppend(ErrorList, "The value specified for the <b>Post Date</b> field is not valid. Format (MM/DD/YYYY)")>
   </cfif>
   
   <cfif form.Articletext EQ "">
     <cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Article/b> field")>
   </cfif>
   
   <cfif Len(trim(form.ArticleImg)) GT 0>
      <cffile action="UPLOAD" filefield="form.ArticleImg" destination="#Application.sitepath#/images/articles/" nameconflict="MAKEUNIQUE">
   
      <cfset NewImg = file.serverfile>
   <cfelse>
     <cfset NewImg = "">
   </cfif>
   
   <cfif ArrayLen(ErrorList) GT 0>
	     	<font face="Verdana,Arial" size="-1">
			<h4><font color="Maroon">Problem(s) were encountered While Attempting to save this Article</font></h4>
			<p>Your transaction could not be completed because:</p>
			<ol>
			<cfloop INDEX="i" FROM="1" TO="#ArrayLen(ErrorList)#">
			<cfoutput><li><p>#ErrorList[i]#</p></li></cfoutput>
			</cfloop>
			</ol>
			<div align=center><form><input type="Button" name="" value="Click here to correct Errors Now" align="ABSMIDDLE" onclick="history.back()"></form></div>
			</font> 
	<cfelse>
			  <cfset TempText = trim(form.ArticleText)>
			  <cfquery name="InsArticle" datasource="#Application.dsn#">
			    Insert Into dbo.Articles (
				   Headline,
				   SubHeading,
				   SubmittedBy,
				   PostingDate,
				   Approved,
				   Category,
				   ImgPath,
				   ImgPosition,
				   ImgAltText,
				   ArticleText,
				   Highlight,
				   LR1Head,
				   LR1URL,
				   LR2Head,
				   LR2URL,
				   DateSubmitted
				)
				Values(
				  '#form.headline#',
				  <cfif form.subheading NEQ "">'#form.subheading#'<cfelse>NULL</cfif>,
				  #Session.admininfo.userid#,
				  #createodbcdate(form.postingdate)#,
				  1,
				  0,
				  <cfif NewImg NEQ "">'#NewImg#'<cfelse>NULL</cfif>,
				  <cfif IsDefined("form.imgPosition")>'#form.imgPosition#'<cfelse>NULL</cfif>,
				  <cfif form.imgtext NEQ "">'#form.imgtext#'<cfelse>NULL</cfif>,
				  '#TempText#',
				  <cfif IsDefined("form.Highlight")>1<cfelse>0</cfif>,
				  <cfif form.Link1Label NEQ "">'#form.Link1Label#'<cfelse>NULL</cfif>,
				  <cfif form.Link1URL NEQ "">'#form.Link1URL#'<cfelse>NULL</cfif>,
				  <cfif form.Link2Label NEQ "">'#form.Link2Label#'<cfelse>NULL</cfif>,
				  <cfif form.Link2URL NEQ "">'#form.Link2URL#'<cfelse>NULL</cfif>,
				  #CreateODBCDateTime(Now())#
				)
			  </cfquery>
			  <meta http-equiv="refresh" content="0;url=Articles.cfm">
			  <!--- <cflocation url="Articles.cfm" addtoken="No"> --->
  </cfif>
<cfelseif action EQ "edit">
          <cfif form.headline EQ "">
		     <cfset x = ArrayAppend(ErrorList, "No value specified for the <b>headline</b> field")>
		   </cfif>
		   
		   <cfif form.Postingdate EQ "">
		     <cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Post Date</b> field")>
		   </cfif>
		   
		   <cfif Not IsDate(form.Postingdate)>
		     <cfset x = ArrayAppend(ErrorList, "The value specified for the <b>Post Date</b> field is not valid. Format (MM/DD/YYYY)")>
		   </cfif>
		   
		   <cfif form.Articletext EQ "">
		     <cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Article Text</b> field")>
		   </cfif>
		   
		   <cfif Len(trim(form.ArticleImg)) GT 0>
		      <cffile action="UPLOAD" filefield="form.ArticleImg" destination="#Application.sitepath#/images/articles/" nameconflict="MAKEUNIQUE">
		   
		      <cfset NewImg = file.serverfile>
		   <cfelse>
		     <cfset NewImg = "">
		   </cfif>
        <cfif ArrayLen(ErrorList) GT 0>
	     	<font face="Verdana,Arial" size="-1">
			<h4><font color="Maroon">Problem(s) were encountered While Attempting to save this article</font></h4>
			<p>Your transaction could not be completed because:</p>
			<ol>
			<cfloop INDEX="i" FROM="1" TO="#ArrayLen(ErrorList)#">
			<cfoutput><li><p>#ErrorList[i]#</p></li></cfoutput>
			</cfloop>
			</ol>
			<div align=center><form><input type="Button" name="" value="Click here to correct Errors Now" align="ABSMIDDLE" onclick="history.back()"></form></div>
			</font> 
	<cfelse>
          <cfset TempText = trim(form.ArticleText)>
		  <cfquery name="InsArticle" datasource="#Application.dsn#">
		    Update Articles 
			  Set Headline= '#form.headline#',
			      SubHeading=<cfif form.subheading NEQ "">'#form.subheading#'<cfelse>NULL</cfif>,
			      SubmittedBy=#Session.admininfo.userid#,
			      PostingDate=#createodbcdate(form.postingdate)#,
			      Approved=1,
			      Category=0,
			      <cfif NewImg NEQ "">ImgPath='#NewImg#',</cfif>
			      <cfif IsDefined("form.imgPosition")>ImgPosition='#form.imgPosition#',</cfif>
			      ImgAltText=<cfif form.imgtext NEQ "">'#form.imgtext#'<cfelse>NULL</cfif>,
			      ArticleText='#TempText#',
			      Highlight=<cfif IsDefined("form.Highlight")>1<cfelse>0</cfif>,
			      LR1Head=<cfif form.Link1Label NEQ "">'#form.Link1Label#'<cfelse>NULL</cfif>,
			      LR1URL=<cfif form.Link1URL NEQ "">'#form.Link1URL#'<cfelse>NULL</cfif>,
			      LR2Head=<cfif form.Link2Label NEQ "">'#form.Link2Label#'<cfelse>NULL</cfif>,
			      LR2URL=<cfif form.Link2URL NEQ "">'#form.Link2URL#'<cfelse>NULL</cfif>,
			      DateSubmitted = #CreateODBCDateTime(Now())#
			Where ArticleID = #form.ArticleID#
		  </cfquery>
		  <meta http-equiv="refresh" content="0;url=Articles.cfm">
		  <!--- <cflocation url="Articles.cfm" addtoken="No"> --->
	</cfif>  
<cfelseif url.action EQ "REMOVE">
   	 <cfquery name="DelArticle" datasource="#Application.dsn#">
		Delete From Articles 
		Where ArticleID = #url.AID#
	 </cfquery>		
	 <cflocation url="Articles.cfm" addtoken="No">
</cfif>
			<br><br>
		 </td>
     </tr>
</table>  
</cfoutput>
<cfmodule template="#Application.footer#">