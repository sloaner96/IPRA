<cfmodule template="#Application.header#" section="0" sectiontitle="Events Admin">

	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="160"><br>
		    <cfmodule template="#Application.tagdir#/adminnav.cfm" level="1">
		   </td>
		   <td valign="top"><br>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>IPRA Administrative Site</h3></td>
		        </tr>
		      </table>
				<cfset ErrorList = ArrayNew(1)>
				
				<CFIF Form.EventDate is not "" AND NOT IsDate(Form.EventDate)>
					<cfset x = ArrayAppend(ErrorList, "An invalid date has been specified.  Please enter dates in the format mm/dd/yyyy")>
				</CFIF>
				
				<cfset NErrors = ArrayLen(ErrorList)>
				<cfif NErrors gt 0>
				
					<cfoutput>
					<h4><font face="" color="Maroon">#NErrors# problem(s) encountered with your Submission</font></h4>
					</cfoutput>
					<p>Errors have been found while processing your request.  Please return to the form, correct these errors, and resubmit.</p>
					<ol>
					<cfloop INDEX="i" FROM="1" TO="#NErrors#">
					<cfoutput><li><p>#ErrorList[i]#</p></li></cfoutput>
					</cfloop>
					</ol>
					<div align=center><form><input type="Button" name="" value="Correct Errors Now" align="ABSMIDDLE" onclick="history.back()"></form></div>
				
				<cfelse>
				
					<CFQUERY Name="GetEvents" Datasource="#Application.DSN#">
						SELECT E.*,
						   (Select Count(*)
						     From Registrations) as RegCount 
						   from Events E
							WHERE 1=1
						<CFIF Form.keywords is not "">
								AND ((Description LIKE '%#Form.keywords#%') OR
								 (EventName LIKE '%#Form.keywords#%'))
						</CFIF>
						<CFIF IsDate(Form.EventDate)>
							AND BeginDate >= #CreateODBCDateTime(Form.EventDate)#
						</CFIF>
						<cfif Len(Trim(Form.Category)) GT 0>
						   And category = '#form.Category#'
						</cfif>
						ORDER BY BeginDate, EndDate
					</CFQUERY>
				
					<CFIF #GetEvents.RecordCount# gt 0>
					
						<br>
						<cfoutput>
						<p>There were <b>#GetEvents.RecordCount#</b> event(s) that matched your search criteria:</p>
						</cfoutput>
				
						<table border=0 cellpadding=1 cellspacing=5 width=100%>
						<tr bgcolor="#eeeee">
							<th width=110>Event Date</th>
							<th width=*>Event Name</th>
							<th>Event Roster</th>
						</tr>
				
						<CFOUTPUT Query="GetEvents">
						<tr valign=top>
							<td align=center><font face="Verdana,Arial" size="-1">#DateFormat(BeginDate, "mm/d/yyyy")#</font></td>
							<td align=left><a href="UpdEvent.cfm?EventID=#EventID#"><font face="Verdana,Arial" size="-1"><cfif EventName NEQ "">#EventName#<cfelse>NULL</cfif></font></a></td>
							<td></td>
						</tr>
						</CFOUTPUT>
				
						</table>
						<br>
				
					<CFELSE>
						<h3 align=center>Sorry, no events matched your criteria</h3>
						<div align=center><form><input type="Button" name="" value="Search Again" align="ABSMIDDLE" onclick="history.back()"></form></div>
					</CFIF>
				
				</CFIF>
			   <br><br>
		 </td>
     </tr>
</table>  

<cfmodule template="#Application.footer#">
