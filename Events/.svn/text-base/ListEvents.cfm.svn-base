
<cfparam name="url.month" default="#Month(Now())#">
<cfparam name="url.year" default="#Year(Now())#">
<cfparam name="URL.E" default="0">

<CFSET CurDate = "#URL.month#/1/#URL.year#">

<CFSET IntDate = CreateODBCDate(CurDate)>
<CFSET CurMon  = MonthAsString(MOnth(IntDate))>
<CFSET NextDate = DateAdd("ww", 6, IntDate)>

<CFQUERY Name="GetEvents" Datasource="#Application.DSN#">
	SELECT * from Events
		WHERE Approved = 1
		AND Category = 'IPRA'
		<cfif NOT IsDefined("URL.day")>
		AND BeginDate >= #IntDate#
		AND BeginDate < #NextDate#
		<cfelse>
		AND BeginDate = #CreateODBCDate("#URL.month#/#URL.day#/#URL.year#")#
			OR (BeginDate < #CreateODBCDateTime("#URL.month#/#URL.day#/#URL.year# 11:59pm")#
				 AND EndDate >= #CreateODBCDateTime("#URL.month#/#URL.day#/#URL.year#  00:01am")#)
		</cfif>
	ORDER BY Highlight Desc, BeginDate
</CFQUERY>


<cfmodule template="#Application.header#" section="0" sectiontitle="Upcoming Events">
  <table width="100%" border="0" cellspacing="3" cellpadding="0">
     <tr>
	    <td valign="top" width="205"><br>
		    <cfmodule template="#Application.tagdir#/eventsnav.cfm" month="#Url.Month#" year="#Url.year#" showlist="False">
		   </td>
        <td valign="top"> <br>
	     <cfoutput>
		 <table width="70%" border="0" cellspacing="0" cellpadding="4">
	        <tr>
	           <td><h3>Upcoming IPRA Events for #CurMon#</h3></td>
	        </tr>
	     </table>
		 </cfoutput>
		 <cfif url.E EQ 1>
		 <table border="0" cellpadding="3" cellspacing="0" width="100%">
			 <tr>
			    <td class="errorText"><strong>Error!</strong> You must Choose an Event</td>
			 </tr>
			</table><br>
		 <cfelseif url.e EQ 2>
		   <table border="0" cellpadding="3" cellspacing="0" width="100%">
			 <tr>
			    <td class="errorText"><strong>Error!</strong> The Event you are attempting to register for has already Begun. Registration is now closed.</td>
			 </tr>
			</table><br>
		 </cfif>
		<table border="0" cellpadding="4" cellspacing="0" width="100%">
		  <tr>
             <td>
			
		
			<cfif GetEvents.RecordCount gt 0>
			
				<cfoutput query="GetEvents">
				<cfif GetEvents.CanRegister is True AND Now() LTE CreateODBcdatetime(GetEvents.BeginDate)><a href="#Application.SecureURL#/Events/EventRegister.cfm?EventID=#GetEvents.EventID#"><img src="/images/Register.gif" border=0 align="right" hspace=5 alt="Click here to Register for #EventName#"></a></cfif>
				<font face="Tahoma" color="Maroon" size="-1"><strong>#EventName#</strong></font><br>
				#DateFormat(BeginDate, "mmm d, yyyy")#<cfif Begindate NEQ EndDate> - #DateFormat(endDate, "mmm d, yyyy")#</cfif>
				<cfif DatePart("h", BeginDate) gt 0>#TimeFormat(BeginDate, 'hh:mm tt')# </cfif>
				<cfif Location is not "">at #Location#</cfif><br>
				<cfif Contact is not ""><strong>Contact:</strong><br> #Contact#<br>&nbsp;<a href="mailto:#ContactEmail#">#ContactEmail#</a><br>&nbsp;#ContactPhone#<br></cfif>
				<cfif Charge gt 0.00>Cost: #DollarFormat(Charge)#<br></cfif>
				<cfif AdminFee gt 0.00>Admin Fee: #DollarFormat(AdminFee)#<br></cfif>
				<cfif MaxQuantity NEQ "">Limit #MaxQuantity#<br></cfif>
				
				<cfif WebURL is not ""><br><i>more info at <a href="#WebURL#" target="_blank">#WebURL#</a></i><br></cfif></font>
				<br clear=left>
				
				#ParagraphFormat(Description)#
				<font face="Arial"><cfif OnlineForm is not ""><i><b>Click <a target="_blank" href="/Forms/#OnlineForm#">here</a> to download printable Form!</i></b><br><br></cfif></font>
				<br>
				<cfif GetEvents.RecordCount gt 1>
				 <hr noshade="1">
				</cfif>
				</cfoutput>
			
			<cfelse>
				<br>
				<cfif NOT IsDefined("URL.d")>
				<font color="##990000" face="tahoma" size="+1" align=center>Sorry, no events listed during the month of <cfoutput>#CurMon#</cfoutput></font>
				<cfelse>
				<font color="##990000" face="tahoma" size="+1" align=center>Sorry, no events listed for <cfoutput>#URL.m#/#URL.d#/#URL.y#</cfoutput></font>
				</cfif>
			</cfif>
		
		<br><br>

		 </td>
       </tr>
      </table>
	 </td>
   </tr>		 
 </table>
<cfmodule template="#Application.footer#" section="0">	   