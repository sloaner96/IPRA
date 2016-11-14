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
		          <td><h3>Resource Library</h3></td>
		        </tr>
		      </table>
           <cfset ErrorList = ArrayNew(1)>

			<cfif url.action EQ "Add">
			     <cfif form.resname EQ "">
				   <cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Resource Name</b> field")>
				 </cfif>
			     
				 <cfif form.resType EQ "">
				    <cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Resource Type</b> field")>
				 </cfif>
				 
			     <cfif form.ResCat EQ "">
				   <cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Category</b> field")>
				 </cfif>
			     
				  <cfif ArrayLen(ErrorList) GT 0>
				     	<font face="Verdana,Arial" size="-1">
						<h4><font color="Maroon">Problem(s) were encountered While Attempting to save this resource</font></h4>
						<p>Your transaction could not be completed because:</p>
						<ol>
						<cfloop INDEX="i" FROM="1" TO="#ArrayLen(ErrorList)#">
						<cfoutput><li><p>#ErrorList[i]#</p></li></cfoutput>
						</cfloop>
						</ol>
						<div align=center><form><input type="Button" name="" value="Click here to correct Errors Now" align="ABSMIDDLE" onclick="history.back()"></form></div>
						</font> 
				 <cfelse>
				 
				  <cfif IsDefined("form.MembersOnly")>
				    <cfset fileString = "#Application.sitepath#/forms/MembersOnly/">
				  <cfelse>
				    <cfset fileString = "#Application.sitepath#/forms/">
				  </cfif>
				  
				  <cfif Len(Trim(form.resourceFile)) GT 0>
				    <cffile action="UPLOAD" filefield="form.resourceFile" destination="#FileString#" NameConflict="MAKEUNIQUE"> 
					<cfset NewFile = File.ServerFile>
				  <cfelse>
				    <cfset NewFile = "">
				  </cfif>
				  
				 
				  
				  <cfquery name="InsertRes" datasource="#Application.dsn#">
				    Insert Into Resources (
					        ResourceLabel,
							ResourceType,
							ResourceDesc,
							ResourceFile,
							ResFileType,
							ResourceLink,
							Category,
							Active,
							Highlight,
							MembersOnly,
							ContactName,
							ContactEmail,
							ContactPhone,
							AddedBy,
							LastUpdated
					)
					Values (
					  '#form.resname#',
					  '#form.ResType#',
					  <cfif form.resdesc NEQ "">'#form.ResDesc#'<cfelse>NULL</cfif>,
					  <cfif NewFile NEQ "">'#NewFile#'<cfelse>NULL</cfif>,
					  <cfif NewFile NEQ "">'#Right(NewFile, 3)#'<cfelse>NULL</cfif>,
					  <cfif form.website NEQ "">'#form.website#'<cfelse>NULL</cfif>,
					  '#form.ResCat#',
					  1,
					  0,
					  <cfif IsDefined("form.MembersOnly")>1<cfelse>0</cfif>,
					  <cfif form.contact NEQ "">'#Form.Contact#'<cfelse>NULL</cfif>,
					  <cfif form.email NEQ "">'#form.email#'<cfelse>NULL</cfif>,
					  <cfif form.Phone NEQ "">'#form.phone#'<cfelse>NULL</cfif>,
					  #Session.AdminInfo.UserID#,
					  #CreateODBCDateTime(now())#
					) 
				  </cfquery>
				  
				  <!--- <cflocation url="ResourceCat.cfm?catid=#form.rescat#" addtoken="No"> --->
				  <meta http-equiv="refresh" content="0;url=ResourceCat.cfm?catid=#form.rescat#">
				</cfif>  
			<cfelseif url.action EQ "Edit">
			     <cfif form.resname EQ "">
				   <cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Resource Name</b> field")>
				 </cfif>
			     
				 <cfif form.resType EQ "">
				    <cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Resource Type</b> field")>
				 </cfif>
				 
			     <cfif form.ResCat EQ "">
				   <cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Category</b> field")>
				 </cfif>
				 
				 <cfif ArrayLen(ErrorList) GT 0>
				     	<font face="Verdana,Arial" size="-1">
						<h4><font color="Maroon">Problem(s) were encountered While Attempting to save this resource</font></h4>
						<p>Your transaction could not be completed because:</p>
						<ol>
						<cfloop INDEX="i" FROM="1" TO="#ArrayLen(ErrorList)#">
						<cfoutput><li><p>#ErrorList[i]#</p></li></cfoutput>
						</cfloop>
						</ol>
						<div align=center><form><input type="Button" name="" value="Click here to correct Errors Now" align="ABSMIDDLE" onclick="history.back()"></form></div>
						</font> 
				 <cfelse>
				 
				  <cfif IsDefined("form.MembersOnly")>
				    <cfset fileString = "#Application.sitepath#/forms/MembersOnly/">
				  <cfelse>
				    <cfset fileString = "#Application.sitepath#/forms/">
				  </cfif>
				  
				  
				  
				  <cfif Len(Trim(form.resourceFile)) GT 0>
				    <cffile action="UPLOAD" filefield="form.resourceFile" destination="#FileString#" NameConflict="MAKEUNIQUE"> 
					<cfset NewFile = File.ServerFile>
				  <cfelse>
				    <cfset NewFile = "">
				  </cfif>
				  
				  <cfquery name="UpdateRes" datasource="#Application.dsn#">
				    Update Resources 
					    Set ResourceLabel = '#form.resname#',
							ResourceType = '#form.ResType#',
							ResourceDesc = <cfif form.resdesc NEQ "">'#form.ResDesc#'<cfelse>NULL</cfif>,
							<cfif NewFile NEQ "">ResourceFile = '#NewFile#',</cfif>
							<cfif NewFile NEQ "">ResFileType =  '#Right(NewFile, 3)#',</cfif>
							ResourceLink = <cfif form.website NEQ "">'#form.ResLink#'<cfelse>NULL</cfif>,
							Category =  '#form.ResCat#',
							<cfif isDefined("form.active")>Active =  0,<</cfif>
							MembersOnly = <cfif IsDefined("form.MembersOnly")>1<cfelse>0</cfif>,
							ContactName = <cfif form.contact NEQ "">'#Form.Contact#'<cfelse>NULL</cfif>,
							ContactEmail =  <cfif form.email NEQ "">'#form.email#'<cfelse>NULL</cfif>,
							ContactPhone = <cfif form.Phone NEQ "">'#form.phone#'<cfelse>NULL</cfif>,
							AddedBy =  #Session.AdminInfo.UserID#,
							LastUpdated = #CreateODBCDateTime(now())#
					Where ResID = #form.ResID#
				  </cfquery>
			    <!--- <cflocation url="ResourceCat.cfm?catid=#form.rescat#" addtoken="No"> --->
				<meta http-equiv="refresh" content="0;url=ResourceCat.cfm?catid=#form.rescat#">
				
			  </cfif>	
			<cfelseif url.action EQ "Delete">
			    <cfquery name="DelRes" datasource="#Application.dsn#">
				  Delete From Resources
				  Where ResourceID = #url.ResID#
				</cfquery>
				<!--- <cflocation url="index.cfm?s=1" addtoken="No"> --->
				<meta http-equiv="refresh" content="0;url=index.cfm?s=1">
			</cfif>
			<br><br>
		 </td>
     </tr>
</table>  
</cfoutput>
<cfmodule template="#Application.footer#">