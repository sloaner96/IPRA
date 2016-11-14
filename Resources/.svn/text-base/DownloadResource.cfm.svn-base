<cfif IsDefined("url.ResID") AND ISNumeric(URL.ResID)>
   <cfquery name="GetResource" datasource="#application.dsn#">
      Select *
	  From Resources
	  Where ResourceID = <cfqueryparam value="#URL.ResID#" cfsqltype="CF_SQL_INTEGER">
   </cfquery>
   
   
 
   
   
	   <cfif GetResource.MembersOnly EQ 1>
	     <cfset MbrsONly = "\membersOnly\">
	   <cfelse>
	      <cfset MbrsONly = "\"> 	 
	   </cfif>
	   
	   <cfset FileString ="#Application.Sitepath#\forms#MbrsONly#\#GetResource.ResourceFile#">
	   
	   <cfif FileExists("#FileString#")>
		   <cfif GetResource.recordcount GT 0>
			      <cfif GetResource.MembersOnly EQ 1 AND NOT IsDefined("session.userinfo.memberid")>
					   <link rel="STYLESHEET" type="text/css" href="/main.css">
					   <p class="ErrorHead"><img src="/images/Error.gif" width="26" height="26" alt="" border="0">The Resource You are attempting to Download is only viewable by members. </p>
					   <p class="ErrorText">If you are a member You must login first to download this Resource</p>
					   <br><br>
					   <a href="javascript:void(0);" onclick="self.close();">X Close</a>
				<cfelseif GetResource.MembersOnly EQ 1 AND IsDefined("session.userinfo.memberid")>
					  <cfswitch expression="#Right(GetResource.ResourceFile, 3)#">
					      <cfcase value="pdf">
						    <cfset Mime =  "application/pdf">
						  </cfcase>
						  <cfcase value="doc">
						    <cfset Mime =  "application/msword">
						  </cfcase>
						  <cfcase value="excel">
						    <cfset Mime =  "application/msexcel">
						  </cfcase>
						  <cfcase value="xls">
						    <cfset Mime =  "application/msexcel">
						  </cfcase>
						  <cfcase value="ppt">
						    <cfset Mime = "application/mspowerpoint">
						  </cfcase>
						  <cfdefaultcase>
						    <cfset Mime =  "application/pdf">
						  </cfdefaultcase>
					   </cfswitch>
					   
				       <cfcontent type="#Mime#" file="#FileString#" deletefile="No"> 
				<cfelseif GetResource.MembersOnly EQ 0>
					   <cfswitch expression="#Right(GetResource.ResourceFile, 3)#">
					      <cfcase value="pdf">
						    <cfset Mime =  "application/pdf">
						  </cfcase>
						  <cfcase value="doc">
						    <cfset Mime =  "application/msword">
						  </cfcase>
						  <cfcase value="excel">
						    <cfset Mime =  "application/msexcel">
						  </cfcase>
						  <cfcase value="xls">
						    <cfset Mime =  "application/msexcel">
						  </cfcase>
						  <cfcase value="ppt">
						    <cfset Mime = "application/mspowerpoint">
						  </cfcase>
						  <cfdefaultcase>
						    <cfset Mime =  "application/pdf">
						  </cfdefaultcase>
					   </cfswitch>
					   
				       <cfcontent type="#Mime#" file="#FileString#" deletefile="No"> 
				</cfif>
		       
		   </cfif>
	  <cfelse>  
		   <link rel="STYLESHEET" type="text/css" href="/main.css">  
		   <p class="ErrorHead"><img src="/images/Error.gif" width="26" height="26" alt="" border="0">The Resource You are attempting to Download can not be found. </p>
		   <p class="ErrorText">If you continue to receive this error please <a href="mailto:webmaster@ilipra.org?subject=missing resource file (Resource ID ###url.resid#)">contact the administrator.</a></p>
		   <br><br>
		   <a href="javascript:void(0);" onclick="self.close();">X Close</a>
	  </cfif>   

<cfelse>
	    <link rel="STYLESHEET" type="text/css" href="/main.css">
	  	<p class="ErrorHead"><img src="/images/Error.gif" width="26" height="26" alt="" border="0">The Resource You are attempting to Download can not be found. </p>
		   <p class="ErrorText">If you continue to receive this error please <a href="mailto:webmaster@ilipra.org?subject=missing resource file (Resource ID ###url.resid#)">contact the administrator.</a></p>
		   <br><br>
		   <a href="javascript:void(0);" onclick="self.close();" class="regtext">X Close</a>
</cfif>