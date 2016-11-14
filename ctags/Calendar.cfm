
<cfparam name="month" default="#month(now())#">
<cfparam name="year" default="#year(now())#">
<cfparam name="daylist" default="0">


<cfset dayList = attributes.Daylist>

<cfset firstDay = createDate(year,month,1)>
<cfset firstDOW = dayOfWeek(firstDay)>
<cfset dim = daysInMonth(firstDay)>

<cfset lastMonth = dateAdd("m",-1,firstDay)>
<cfset nextMonth = dateAdd("m",1,firstDay)>


<cfoutput>
	<div class="calendartop" align="center">
		<a href="/Events/ListEvents.cfm?mode=month&month=#month(lastMonth)#&year=#year(lastMonth)#">&lt;&lt;</a>
		<a href="/Events/ListEvents.cfm?mode=month&month=#month#&year=#year#">#monthAsString(month)# #year#</a>
		<a href="/Events/ListEvents.cfm?mode=month&month=#month(nextMonth)#&year=#year(nextMonth)#">&gt;&gt;</a>
	</div>
</cfoutput>



<!--- figure out the pad, ie, how many blank days before 1st --->
<cfset dayCounter = 1>
<cfoutput>
<center><table border=0 class="calendar_table">
<tr><td>Sun</td><td>Mon</td><td>Tue</td><td>Wed</td><td>Thu</td><td>Fri</td><td>Sat</td></tr>
</cfoutput>
<!--- loop until 1st --->
<cfoutput><tr></cfoutput>
<cfloop index="x" from=1 to="#firstDOW-1#">
	<cfoutput><td>&nbsp;</td></cfoutput>
</cfloop>
<cfloop index="x" from="#firstDOW#" to="7">
	<cfoutput><td><cfif listFind(dayList,dayCounter)><a href="#cgi.script_name#?mode=day&day=#dayCounter#&month=#month#&year=#year#" style="text-decoration:underline;">#dayCounter#</a><cfelse>#dayCounter#</cfif></td></cfoutput>
	<cfset dayCounter = dayCounter + 1>
</cfloop>
<cfoutput></tr></cfoutput>
<!--- now loop until month days --->
<cfset rowCounter = 1>
<cfloop index="x" from="#dayCounter#" to="#dim#">
	<cfif rowCounter is 1>
		<cfoutput><tr></cfoutput>
	</cfif>
	<cfoutput>
		<td <cfif x EQ day(now())>bgcolor="999999"</cfif>>
		<cfif listFind(dayList,x)><a href="#cgi.script_name#?mode=day&day=#x#&month=#month#&year=#year#" style="text-decoration:underline;">#x#</a><cfelse>#x#</cfif>
		</td>
  </cfoutput>
	<cfset rowCounter = rowCounter + 1>
	<cfif rowCounter is 8>
		<cfoutput></tr></cfoutput>
		<cfset rowCounter = 1>
	</cfif>
</cfloop>
<!--- now finish up last row --->
<cfloop index="x" from="#rowCounter#" to=7>
	<cfoutput><td>&nbsp;</td></cfoutput>
</cfloop>
<cfoutput></tr></table></center></cfoutput>