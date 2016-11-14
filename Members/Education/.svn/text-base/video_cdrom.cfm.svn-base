<cfmodule template="#Application.Header#" heading="Video &amp; CDROM Library">
<cfoutput>
<table border="0" cellpadding="3" cellspacing="0" width="100%">
  <tr> 
     <td valign="top" width="150"><br>
	    <cfmodule template="#Application.tagdir#/MembersNav.cfm" level=1>
	 </td>
	 
     <td valign="top">
	 <br>
	  <table border="0" cellpadding="4" cellspacing="0" width="100%">
	    <tr>
	      <td><h3>Video &amp; CD-ROM Library</h3></td>
	    </tr>
		<tr>
		  <td class="regtext"> 
		     <cfquery name="GetVideos" datasource="#application.dsn#">
			   Select Distinct R.Category, CodeDesc as CatName
			   From Resources R, Lookup L
			   Where R.ResourceType = '05'
			   AND  R.Category = L.Codevalue
			   AND L.CodeGroup = 'RESCAT'
			   Order By Category
			 </cfquery>
			 <table border="0" cellpadding="6" cellspacing="0" width="100%" class="regtext">
              <tr> 
                <td>
                  <p>The Video / CD-ROM library is composed of media designed 
                  for individual/group development and <u>many have been 
                  approved for CEUs.</u>&nbsp; <b>If you are interested 
                  acquiring CEUs, please use the &quot;CEU Video Library&quot; link below.</b> 
                  Otherwise, please browse the other links for media in the 
                  special interest sections.</p>
                  <p>If you know of a specific
                  resource that would be appropriate for the library, please call 
                    the IPRA office at 630-376-1911, or fax to 630-376-1919.</p>
                  <table border="0" cellpadding="4" width="100%">
                    <tr>
                      <td valign="top"><a href="Video_howto.cfm"><b>Using IPRA's Training Library</b></a><br><br>
					     <cfloop Query="GetVideos">
					       <a href="/Resources/ResourceCategory.cfm?Catid=#GetVideos.Category#"><b>#GetVideos.catname#</b></a><br><br>
                         </cfloop>
                       
                      </td>
                      <td valign="top" align="right">
                         <br clear="All">
					     <table border="0" cellpadding="0" cellspacing="0" width="100%">
                         
                         </table>
                      </td>
                    </tr>
                    
                  </table>
                 </td>
              </tr>
            </table>
		  </td>
		</tr>
	  </table>
	 </td>
   </tr>
</table> 
</cfoutput>
<cfmodule template="#Application.Footer#">