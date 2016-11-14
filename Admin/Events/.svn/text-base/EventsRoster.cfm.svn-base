<cfmodule template="#Application.header#" section="0" sectiontitle="Event Roster">

  
  <cfif IsDefined("url.EventID")>
    <cfset EvtID = URl.eventID>
  <cfelseif IsDefined("form.EventID")>
  <cfset EvtID = Form.EventID>
  </cfif>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="160"><br>
		    <cfmodule template="#Application.tagdir#/adminnav.cfm" level="1">
		   </td>
		   <td valign="top"><br>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>Event Roster</h3></td>
		        </tr>
			  </table>
				<cfif NOT IsDefined("EvtID")>
					<cfquery name="GetEvents" datasource="#Application.DSN#">
						SELECT EventID, EventName, BeginDate
						 From Events
							WHERE BeginDate >= #now()#
								AND CanRegister = 1
							ORDER BY BeginDate, EventName
					</cfquery>
				
					<cfform name="Rosterlist" action="EventsRoster.cfm" scriptsrc="/scripts/cfform.js">
					Generate Event Roster for: <select name="EventID"><cfoutput Query="GetEvents"><option value="#EventID#">#DateFormat(BeginDate, 'MM/DD/YY')#-#EventName#</option></cfoutput></select><br>
					<br><input type="submit" value="Generate Roster">
					</cfform>
				
				<cfelse>
				
					<CFQUERY Name="GetEvents" Datasource="#Application.DSN#">
						SELECT E.EventID,  e.EventName, e.BeginDate, r.Firstname, r.Lastname, r.Company, R.RegisterID,
						       T.TransID, t.TransType, T.PurchaseCode, T.PONumber, T.CardHolder, T.DateAuthorized, 
							   T.CardType, T.Amount, RD.EvntQty, D.DetailLabel, D.DetailCost,
							 (Select Count(*)
							   From Registrations
							   Where EventID = E.EventID)as TotalRegistrations  
						  from Events e, Registrations r, Transactions t, EventDetail D, dbo.RegDetail RD
							WHERE r.EventID = #EvtID#
								AND e.EventID = r.EventID
								AND D.EventID = E.EventID
								AND D.EventDetailID = RD.EventDetailID
								AND RD.RegistrationID = R.RegisterID
								AND t.RegisterID = r.RegisterID
							ORDER BY r.Lastname, r.Firstname
					</CFQUERY>
				
					<CFIF GetEvents.RecordCount gt 0>
						<cfset XlsFile = "#Application.sitepath#Admin\Downloads\EventTrans#Getevents.EventID#.XLS">
						<cfif FileExists(XlsFile)>
							<cffile action="DELETE" file="#XlsFile#">
						</cfif>
						<cf_savetoExcel Query="#GetEvents#" File="#XlsFile#">
				        <!--- <CFX_Excel Query="GetEvents" File="#XlsFile#" Version="95">--->
						<br>
						<cfoutput>
						<p>There were <b>#GetEvents.TotalRegistrations#</b> people who have registered for '<b>#GetEvents.EventName[1]#</b> on #DateFormat(GetEvents.beginDate[1], 'MM/DD/yyyy')#'.<br>Click <a target="_blank" href="/Admin/downloads/EventTrans#Getevents.EventID#.xls">here</a> to download the transactions for this event.</p>
						</cfoutput>
				
						<table border=0 cellpadding=5 cellspacing=1 width="100%">
						<tr bgcolor="eeeee">
							<td align=left><strong>Register Date</strong></td>
							<td align=left><strong>Attendee Name</strong></td>
							<td align=left><strong>Company</strong></td>
						</tr>
				
						<CFoutput Query="GetEvents" group="RegisterID">
						<tr valign=top bgcolor="eeeeee">
							<td>#DateFormat(GetEvents.DateAuthorized, "mm/d/yyyy")#</font></td>
							<td>#GetEvents.Firstname# #GetEvents.Lastname#</font></td>
							<td>#GetEvents.Company#</td>
						</tr>
						<cfoutput>
						  <tr >
						    <td colspan=3>
							  <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                   <tr>
								      <td>&nbsp;</td>
                                      <td>#GetEvents.DetailLabel# (#DollarFormat(GetEvents.DetailCost)#) X #GetEvents.EvntQty#</td>
                                   </tr>
                              </table>
							</td>
						  </tr>
						</cfoutput>
						</CFOutput>
				
						</table>
						<br>
				
					<CFELSE>
						<h3 align=center>Sorry, no one has registered for this event!</h3>
					</CFIF>
				
				</CFIF>
			   <br><br>
		 </td>
     </tr>
</table>  

<cfmodule template="#Application.footer#">