<cfparam name="attributes.level" default="0">
<cfparam name="attributes.sublevel" default="0">

<cfparam name="attributes.month" default="#month(now())#">
<cfparam name="attributes.year" default="#year(now())#">
<cfparam name="attributes.day" default="#day(now())#">
<cfparam name="attributes.showlist" default="0">
<cfquery name="GetDates" datasource="#Application.dsn#">
  Select Distinct Day(BeginDate) as EventDay
  From Events
  Where Approved = 1
  AND Category = 'IPRA'
  AND Month(Begindate) = #attributes.Month# 
  AND Year(Begindate) = #attributes.year# 
  Order BY 1
</cfquery>

<cfoutput>
 <table cellSpacing=0 cellPadding=1 width=197 border=0>
   <tbody>
       <tr>
          <td bgColor="##656565">
             <table cellSpacing=0 cellPadding=0 width=197 bgColor="##ffffff" border=0>
                <tbody>
                     <tr>
                        <td><A href=""><img height=41 src="/images/Events_SecNav.jpg" width="197" border=0></A><br>
							 <div class=sec-nav>
							   <cfif GetDates.Recordcount EQ 0>
							     <cfset Daylist = 0>
							   <cfelse>
								 <cfset Daylist = ValueList(Getdates.EventDay, ",")> 	
 							    </cfif> 
							    <cfmodule template="#Application.tagdir#/Calendar.cfm" month="#Attributes.Month#" year="#Attributes.Year#" daylist="#DayList#">
							 </div>		
							 <cfif Attributes.showlist>
							 <div class=sec-nav align="center">
							   <br><img height=1 src="/images/sec_nav_dline.gif" width=156 align="middle"><br>
							  </div> 
							   <cfquery name="GetList" datasource="#Application.dsn#">
							      SELECT * from Events
									WHERE Approved = 1
									AND Category = 'IPRA'
									AND BeginDate >= #CreateODBCDate("#Attributes.month#/1/#Attributes.year#")#
								
									AND EndDate <= #CreateODBCDateTime("#Attributes.month#/#DaysInMonth(now())#/#Attributes.year#  00:01am")#
								ORDER BY Highlight desc, BeginDate, Enddate
							   </cfquery>
							   <cfloop query="GetList">
							   <div class="sec-nav">
							    <cfif GetList.Highlight EQ 1><b></cfif>
							     #DateFormat(GetList.BeginDate, 'MM/DD/YYYY')#<br>
								 <a href="/Events/ViewEvent.cfm?EventID=#GetList.EventID#" style="color:##003399; text-decoration:underline;">#EventName#</a>
								 <cfif GetList.Highlight EQ 1></b></cfif>
							   </div>
							   </cfloop>
							 </cfif>				
                         </td>
					</tr>
			    </tbody>
		    </table>
		  </td>
	    </tr>
	</tbody>
</table>

</cfoutput>