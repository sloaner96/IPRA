<CFIF NOT IsDefined("URL.EventID")>
	<!--- <CFLOCATION URL="EventSearch.cfm"> --->
	<meta http-equiv="refresh" content="0;url=EventSearch.cfm">
</CFIF>

<CFQUERY Name="GetEvent" Datasource="#Application.DSN#">
	SELECT * from Events
		WHERE EventID = #URL.EventID#
</CFQUERY>
<cfset SDate = "">
<cfset EDate = "">

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
		          <td><h3>Modify Events</h3></td>
		        </tr>
		      </table>
			  <cfquery name="GetDetailCount" datasource="#Application.dsn#">
			     Select Count(*) as ChargeCount
				 From EventDetail
				 Where EventID = #url.EventID#
			  </cfquery> 
			  <table border="0" cellpadding="3" cellspacing="1" width="100%" bgcolor="eeeeee">
                 <tr>
                   <td bgcolor="##6699cc" width="50%"><strong><a href="UpdEvent.cfm?EventID=#GetEvent.EventID#" style="color:ffffff;">Event Information</a></strong></td>
				   <cfif GetEvent.CanRegister EQ 1><td bgcolor="##003366"><strong><a href="EventCharges.cfm?EventID=#GetEvent.EventID#"  style="color:ffffff;">Event Charges</a></strong> <font color="ffffff" size="-1">(#GetDetailCount.ChargeCount#)</font></td><cfelse><td><strong  style="color:eeeeee;">Event Charges</strong></td></cfif>
                 </tr>
              </table>
<p>Use this form to modify or delete the event information below. This information will be displayed on the Events page if the event's date has not already passed.<br><i>Note: Although start and ending dates are optional, events without ending dates will not automatically disappear from the Events page.</i></p>


<CFLOOP Query="GetEvent">
<cfif BeginDate neq "">
	<CFSET SDate = #DateFormat(GetEvent.BeginDate, "mm/d/yyyy")# & " " & #TimeFormat(GetEvent.BeginDate, "h:mm TT")#>
</cfif>
<cfif EndDate neq "">
	<CFSET EDate = #DateFormat(GetEvent.EndDate, "mm/d/yyyy")# & " " & #TimeFormat(GetEvent.EndDate, "h:mm TT")#>
</cfif>

<CFFORM Action="EventsProcess.cfm" method="post" enctype="multipart/form-data" Name="ModEvent" scriptsrc="/scripts/cfform.js">
<CFOUTPUT><input name="EventID" type="hidden" value="#URL.EventID#"></CFOUTPUT>


<table border=0 cellspacing=1 cellpadding=3 width="100%">
<tr>
	<td width=120 align=left><font face="Verdana,Arial" size="-1"><b>Category</b></font>:</td>
	<td align=left><select name="Category">
	                 <option value="IPRA" <cfif Category EQ "IPRA">Selected</cfif>>IPRA Events</option> 
					 <option value="PCAL" <cfif Category EQ "PCAL">Selected</cfif>>Illinois-Wide Events</option>
	               </select>
	</td>
</tr>
<tr>
  <td width=120 align=left><font face="Verdana,Arial" size="-1"><b> Approved</b></font>:</td>
  <td> <input name="Approved" type="Checkbox" value="1" <cfif Approved EQ 1>Checked</cfif>></td>
</tr>
<tr>
	<td width=120 align=left><font face="Verdana,Arial" size="-1"><b>Highlight on Homepage</b></font>:</td>
	<td align=left><input name="Highlight" type="Checkbox" value="1" <cfif Highlight EQ 1>Checked</cfif>></td>
</tr>

<tr>
	<td width=120 align=left><font face="Verdana,Arial" size="-1"><b>Event Name:</b></font></td>
	<td align=left><cfinput name="Heading" type="text" value="#EventName#" size=40 maxlength=200 required="Yes" Message="A Name for this Event is required"></td>
</tr>

<tr>
	<td width=120 align=left><font face="Verdana,Arial" size="-1"><b>Starts:</b></font></td>
	<td align=left><cfinput name="SDate" type="text" value="#SDate#" size=25 maxlength=25> <font size="-2"><i>(Format: mm/dd/yyyy hh:mm)</i></font></td>
</tr>

<tr>
	<td width=120 align=left><font face="Verdana,Arial" size="-1"><b>Ends:</b></font></td>
	<td align=left><cfinput name="EDate" type="text" value="#EDate#" size=25 maxlength=25> <font size="-2"><i>(Format: mm/dd/yyyy hh:mm)</i></font></td>
</tr>

<tr>
	<td width=120 align=left><font face="Verdana,Arial" size="-1"><b>Location:</b></font></td>
	<td align=left><cfinput name="Location" type="text" value="#Location#" size=40 maxlength=80></td>
</tr>
<tr>
	<td width=120 align=left><font face="Verdana,Arial" size="-1"><b>Contact:</b></font></td>
	<td align=left><cfinput name="Contact" type="text" value="#Contact#" size=40 maxlength=150></td>
</tr>
<tr>
	<td width=120 align=left><font face="Verdana,Arial" size="-1"><b>Contact Phone:</b></font></td>
	<td align=left><cfinput name="ContactPhone" type="text" value="#ContactPhone#" size=15 maxlength=15> <font size="-2"><i>(Format: xxx-xxx-xxxx)</i></font></td>
</tr>
<tr>
	<td width=120 align=left><font face="Verdana,Arial" size="-1"><b>Contact Email:</b></font></td>
	<td align=left><cfinput name="ContactEmail" type="text" value="#ContactEmail#" size=40 maxlength=150> <font size="-2"><i>(Format: joesmith@email.com)</i></font></td>
</tr>

<tr>
	<td width=120 align=left><font face="Verdana,Arial" size="-1"><b>Web URL:</b></font></td>
	<td align=left><cfinput name="WebURL" type="text" value="#WebURL#" size=40 maxlength=150> <font size="-2"><i>(include 'http://')</i></font></td>
</tr>

<tr>
	<td width=120 align=left><font face="Verdana,Arial" size="-1"><b>Register Online?</b></font></td>
	<td align=left><input name="CanRegister" type="checkbox" value="1" <cfif CanRegister is True>Checked</cfif>></td>
</tr>

<tr>
	<td width=120 align=left><font face="Verdana,Arial" size="-1"><b>Show Quantity</b></font></td>
	<td align=left><input name="AllowQty" type="checkbox" value="1" <cfif AllowQty EQ 1>Checked</cfif>></td>
</tr>
<tr>
	<td width=120 align=left><font face="Verdana,Arial" size="-1"><b>Maximum Quantity</b></font></td>
	<td align=left><input name="MaxQty" type="text" value="#MaxQuantity#" size=3 maxlength=3></td>
</tr>
<tr>
  <td>&nbsp;</td>
</tr>

<tr>
	<td width=120 align=left><font face="Verdana,Arial" size="-1"><b>Administrative Charge:</b></font></td>
	<td align=left>$<cfinput name="AdminPrice" type="text" value="#NumberFormat(AdminFee, 0.00)#" size=10 maxlength=10 required="no" validate="float"></td>
</tr>

<tr valign=top>
	<td width=120 align=left><font face="Verdana,Arial" size="-1"><b>Registration PDF:</b></font></td>
	<td width=* align=left><input type="file" name="PDFForm" size="30"></td>
</tr>

<tr>
	<td colspan=2 align=left>
		<br><font face="Verdana,Arial" size="-1"><b>Announcement Text:</b></font><br>
		<CFOUTPUT><textarea name="Description" cols="50" rows="8" wrap="VIRTUAL">#HTMLEditFormat(Description)#</textarea></CFOUTPUT></td>
</tr>

<tr>
	<td colspan=2 align=center><br>
		<input type="Submit" name="Cmd" value="Update Event"> 
		<input type="submit" name="Cmd" value="Delete Event" onClick="return confirm('Are you sure you want to delete this?');">
		<input type="reset" value="Reset Form">
	</td>
</tr>

</table>

</CFFORM>
</CFLOOP>
			   <br><br>
		 </td>
     </tr>
</table>  
</cfoutput>
<cfmodule template="#Application.footer#">
