<cfquery name="GetEvents" datasource="#Application.DSN#">
	SELECT  * From Events
		WHERE EndDate >= #CreateODBCDate(DateFormat(Now(),'mm/dd/yyyy'))#
			OR EndDate is NULL
		ORDER BY Category, BeginDate
</cfquery>
<cfif GetEvents.RecordCount is 0>
	<cfquery name="GetEvents" datasource="#Application.DSN#">
		SELECT  * From Events
			WHERE EndDate >= #DateAdd("m", -3, Now())#
				OR EndDate is NULL
			ORDER BY Category, BeginDate
	</cfquery>
</cfif>
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
				<form action="ListEvents.cfm" method="POST">
				<table width=200 border=0 cellspacing=8 cellpadding=1 align=right bgcolor="#f3f3f3">
				<tr>
				  <td colspan=2 align="right"><a href="/admin/events/NewEvent.cfm">[ADD NEW EVENT]</a></td>
				</tr>
				<tr valign="top" bgcolor="#BEBEBE">
					<th colspan=2>Event Search</th>
				</tr>
				<tr>
					<td width=90 align=left><font face="Verdana" size="-2"><b>Keywords:</b></font></td>
					<td width=110><input type="text" name="keywords" value="" size=20 maxlength=40></td>
				</tr>
				<tr>
					<td width=90 align=left><font face="Verdana" size="-2"><b>Dated since:</b></font></td>
					<td width=110><input name="EventDate" value="" type="text" size=15 maxlength=25></td>
				</tr>
				<tr>
					<td width=90 align=left><font face="Verdana" size="-2"><b>Category:</b></font></td>
					<td width=110><select name="Category">
	                 <option value="IPRA">IPRA Events</option> 
					 <option value="PCAL">Illinois-Wide Events</option>
	               </select></td>
				</tr>
				
				<tr>
					<td colspan=2 align=center><br><input type="submit" value="Search the Events"></td>
				</tr>
				</table>
				</form>
				
				<p>Search the Events database for entries that you may want to modify or delete by using the form to the right.</p>
				<p>To quickly modify or delete events that are currently visible on the <b>Events Page</b> of the web site, you can click on an Event name listed below.</p>
				
				<br clear=right>
				<h4>Events currently visible to the public</h4>
				<table border=0 cellspacing=4 width=400 class="regtext">
				<cfoutput query="GetEvents" group="Category">
				<tr>
				  <td colspan=2><strong style="font-size:14px;"><cfif Category EQ "IPRA">IPRA Event Calendar<cfelse>Illinois Wide Calendar</cfif></strong></td>
				</tr>
				<tr valign=top bgcolor="##f3f3f3">
					<th align=left>Starts</th>
					<th align=left>Event Name</th>
				</tr>
				<cfoutput>
				<tr valign=top>
					<td width=90><font face="Verdana,Arial" size="-1">#DateFormat(BeginDate, "m/d/yyyy")#</font></td>
					<td width=100%><a href="UpdEvent.cfm?EventID=#EventID#"><font face="Verdana,Arial" size="-1">#EventName#</font></a> <cfif Approved EQ 0><font color="##cc0000" size="-2">(awaiting approval)</font></cfif></td>
				</tr>
				</cfoutput>
				<tr>
				  <td></td>
				</tr>
				</cfoutput>
				</table>
			   <br><br>
		 </td>
     </tr>
</table>  

<cfmodule template="#Application.footer#">
