<cfparam name="url.month" default="#Month(Now())#">
<cfparam name="url.year" default="#Year(Now())#">
<cfparam name="url.e" default="0">

<CFIF NOT IsDefined("URL.EventID")>
	 <CFLOCATION URL="ListEvents.cfm?m=#Month(now())#&y=#Year(now())#" addtoken="NO"> 
	<!---<cfoutput><meta http-equiv="refresh" content="0;url=ListEvents.cfm?m=#Month(now())#&y=#Year(now())#"></cfoutput>--->
	<cfabort>
</CFIF>
<CFIF Len(Trim(URL.EventID)) EQ 0>
	 <CFLOCATION URL="ListEvents.cfm?m=#Month(now())#&y=#Year(now())#" addtoken="NO"> 
	<!---<cfoutput><meta http-equiv="refresh" content="0;url=ListEvents.cfm?m=#Month(now())#&y=#Year(now())#"></cfoutput>--->
	<cfabort>
</CFIF>
<CFIF Not IsNumeric(URL.EventID)>
	 <CFLOCATION URL="ListEvents.cfm?m=#Month(now())#&y=#Year(now())#" addtoken="NO"> 
	<!---<cfoutput><meta http-equiv="refresh" content="0;url=ListEvents.cfm?m=#Month(now())#&y=#Year(now())#"></cfoutput>--->
	<cfabort>
</CFIF>


<CFQUERY Name="Viewer" Datasource="#Application.DSN#">
	SELECT e.* From Events e
		WHERE e.EventID = #URL.EventID#
		AND Approved = 1
</CFQUERY>
<CFIF Viewer.RecordCount eq 0>
	<!--- <CFLOCATION URL="ListEvents.cfm?m=#Month(now())#&y=#Year(now())#" addtoken="NO"> --->
	<cfoutput><meta http-equiv="refresh" content="0;url=ListEvents.cfm?m=#Month(now())#&y=#Year(now())#"></cfoutput>
</CFIF>

<CFMODULE Template="#Application.Header#" Heading="Event: #Viewer.EventName#" section="2">
  <table width="100%" border="0" cellspacing="3" cellpadding="0">
     <tr>
	    <td valign="top" width="205"><br>
		    <cfmodule template="#Application.tagdir#/eventsnav.cfm" month="#Url.Month#" year="#Url.year#" showList="True">
		   </td>
        <td valign="top" class="regtext"> <br>
		<cfoutput>
	     <table width="70%" border="0" cellspacing="0" cellpadding="4">
	        <tr>
	           <td><h3>#Viewer.EventName#</h3></td>
	        </tr>
	     </table>
		</cfoutput>
		<cfif url.e EQ 2><br>
		   <table border="0" cellpadding="3" cellspacing="0" width="100%">
			 <tr>
			    <td class="errorText"><strong>Error!</strong> The Event you are attempting to register for has already begun. Registration is now closed.</td>
			 </tr>
			</table><br>
		</cfif>
			<CFOUTPUT Query="Viewer">
			<cfif CanRegister is True and now() LTE Begindate><a href="#Application.SecureURL#/Events/EventRegister.cfm?EventID=#EventID#"><img src="/images/Register.gif" border=0 align=right hspace=5 alt="Click here to Register for #EventName#"></a></cfif>
			<table border=0 cellpadding=0>
			<tr valing=top>
				<td><b>Event Date</b>:</td>
				<td>#DateFormat(BeginDate, "mmm d, yyyy")# <cfif DatePart("h", BeginDate) gt 0>#TimeFormat(BeginDate, "h:mm tt")#</cfif> <cfif EndDate is not ""> -  #DateFormat(EndDate, "mmm d, yyyy")# <cfif DatePart("h", EndDate) neq 23 AND DatePart("n", EndDate) neq 59>#TimeFormat(EndDate, "h:mm tt")#</cfif></cfif></td>
			</tr>
			<cfif Location is not "">
			<tr valign=top>
				<td><b>Location</b>:</td>
				<td>#Location#</td>
			</tr>
			</cfif>
			<cfif Contact is not "">
			 <tr valign=top>
				<td><b>Contact</b>:</td>
				<td>#Contact#<br>#ContactPhone#<br>#ContactEmail#</td>
			</tr>
			</cfif>
			<cfif WebURL is not "">
			<tr valign=top>
				<td><b>Web site</b>:</td>
				<td>Visit <a href="#WebURL#">#WebURL#</a> for more information</td>
			</tr>
			</cfif>
			<cfif Charge gt 0.00>
			<tr valign=top>
				<td><b>Charge</b:</td>
				<td>#DollarFormat(Charge)#</td>
			</tr>
			</cfif>
			</table>
			
			<br>
			#ParagraphFormat(Description)#
			<font face="Arial"><small><cfif OnlineForm is not ""><i><b>Click <a target="_blank" href="/Forms/#OnlineForm#">here</a> to download printable Form!</i></b><br><br></cfif></small>
			
			</CFOUTPUT><br><br>
	 </td>
   </tr>		 
 </table>
<cfmodule template="#Application.footer#" section="0">	   
