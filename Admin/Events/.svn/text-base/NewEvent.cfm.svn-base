
<CFSET CurDate	=	#CreateODBCDate(DateFormat(now(), "mm/dd/yyyy"))#>
<cfmodule template="#Application.header#" section="0" sectiontitle="Site Admin">
  <cfoutput>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="160"><br>
		    <cfmodule template="#Application.tagdir#/adminnav.cfm" level="1">
		   </td>
		   <td valign="top"><br>
			  <table border="0" cellpadding="2" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>IPRA Administrative Site</h3></td>
		        </tr>
		      </table>
<p>Use this form to enter a new event for the web site. This information will be displayed on the Events page if the event's date has not already passed.<br><i>Note: Although start and ending dates are optional, events without ending dates will not automatically disappear from the Events page.</i></p>

<CFFORM Action="EventsProcess.cfm" method="post" enctype="multipart/form-data" Name="AddEvent" scriptsrc="/scripts/cfform.js">

<table border=0 cellspacing=1 cellpadding=3>
<tr>
	<td width=120 align=left><font face="Verdana,Arial" size="-1"><b>Category</b></font>:</td>
	<td align=left><select name="Category">
	                 <option value="IPRA">IPRA Events</option> 
					 <option value="PCAL">Illinois-Wide Events</option>
	               </select>
	</td>
</tr>
<tr>
	<td width=120 align=left><font face="Verdana,Arial" size="-1"><b>Highlight on Homepage</b></font>:</td>
	<td align=left><input name="Highlight" type="Checkbox" value="1"></td>
</tr>
<tr>
	<td width=120 align=left><font face="Verdana,Arial" size="-1"><b>Event Name</b></font>:</td>
	<td align=left><cfinput name="Heading" type="text" size=40 maxlength=200 required="Yes" Message="A Name for this Event is required"></td>
</tr>

<tr>
	<td width=120 align=left><font face="Verdana,Arial" size="-1"><b>Starts:</b></font></td>
	<td align=left><cfinput name="SDate" type="text" size=25 maxlength=25> <font size="-2"><i>(Format: mm/dd/yyyy hh:mm)</i></font></td>
</tr>

<tr>
	<td width=120 align=left><font face="Verdana,Arial" size="-1"><b>Ends:</b></font></td>
	<td align=left><cfinput name="EDate" type="text" size=25 maxlength=25> <font size="-2"><i>(Format: mm/dd/yyyy hh:mm)</i></font></td>
</tr>

<tr>
	<td width=120 align=left><font face="Verdana,Arial" size="-1"><b>Location:</b></font></td>
	<td align=left><cfinput name="Location" type="text" size=40 maxlength=80></td>
</tr>
<tr>
	<td width=120 align=left><font face="Verdana,Arial" size="-1"><b>Contact:</b></font></td>
	<td align=left><cfinput name="Contact" type="text" value="" size=40 maxlength=150></td>
</tr>
<tr>
	<td width=120 align=left><font face="Verdana,Arial" size="-1"><b>Contact Phone:</b></font></td>
	<td align=left><cfinput name="ContactPhone" type="text" value="" size=15 maxlength=15> <font size="-2"><i>(Format: xxx-xxx-xxxx)</i></font></td>
</tr>
<tr>
	<td width=120 align=left><font face="Verdana,Arial" size="-1"><b>Contact Email:</b></font></td>
	<td align=left><cfinput name="ContactEmail" type="text" value="" size=40 maxlength=150> <font size="-2"><i>(Format: joesmith@email.com)</i></font></td>
</tr>

<tr>
	<td width=120 align=left><font face="Verdana,Arial" size="-1"><b>Web URL:</b></font></td>
	<td align=left><cfinput name="WebURL" type="text" value="" size=40 maxlength=150> <font size="-2"><i>(include 'http://')</i></font></td>
</tr>

<tr>
	<td width=120 align=left><font face="Verdana,Arial" size="-1"><b>Register Online?</b></font></td>
	<td align=left><input name="CanRegister" type="checkbox" value="1"> <font face="verdana" color="747474" size="-2">(You must first save this Event before you can Add a charge)</font></td>
</tr>
<tr>
	<td width=120 align=left><font face="Verdana,Arial" size="-1"><b>Show Quantity</b></font></td>
	<td align=left><input name="allowQty" type="checkbox" value="1"></td>
</tr>
<!--- <tr>
	<td width=120 align=left><font face="Verdana,Arial" size="-1"><b>Charge:</b></font></td>
	<td align=left>$<cfinput name="Price" type="text" value="0.00" size=10 maxlength=10 required="no" validate="float"></td>
</tr> --->
<tr>
	<td width=120 align=left><font face="Verdana,Arial" size="-1"><b>Administrative Charge:</b></font></td>
	<td align=left>$<cfinput name="AdminPrice" type="text" value="0.00" size=10 maxlength=10 required="no" validate="float"></td>
</tr>
<tr valign=top>
	<td width=120 align=left><font face="Verdana,Arial" size="-1"><b>Registration PDF:</b></font></td>
	<td width=* align=left><input type="file" name="PDFForm" size="30"></td>
</tr>

<tr>
	<td colspan=2 align=left>
		<br><font face="Verdana,Arial" size="-1"><b>Announcement Text:</b></font><br>
		<textarea name="Description" cols="50" rows="8" wrap="VIRTUAL"></textarea>
	</td>
</tr>

<tr>
	<td colspan=2 align=center><br>
		<input type="Submit" name="Cmd" value="Save Event"> 
		<input type="reset"  name="Cmd" value="Clear Form">
	</td>
</tr>

</table>
</cfform>
			   <br><br>
		 </td>
     </tr>
</table>  
</cfoutput>
<cfmodule template="#Application.footer#">
