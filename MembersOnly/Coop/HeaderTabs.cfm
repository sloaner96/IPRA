<cfparam name="Attributes.CoopEndDate" default="1/1/01">
<cfparam name="Attributes.AllowMaintenance" default="False">
<cfparam name="Attributes.Page" default="1">
 
<cfoutput>
<table border="0" cellpadding="4" cellspacing="2" width="100%" bgcolor="##eeeeee">
  <tr bgcolor="##003366">
	<cfif Attributes.CoopEndDate GTE Now()>
		<td <cfif attributes.Page EQ 1>bgcolor="##ffffff"</cfif>><strong <cfif attributes.Page EQ 1>bgcolor="##003366"<cfelse>bgcolor="##ffffff"</cfif>><a href="CoopOrder.cfm" <cfif attributes.Page EQ 1>style="color:##003366;"<cfelse>style="color:##ffffff;"</cfif>>View Current Order</a></strong></td>
	</cfif>
	<cfif Attributes.AllowMaintenance>
		<td <cfif attributes.Page EQ 2>bgcolor="##ffffff"</cfif>><strong <cfif attributes.Page EQ 2>bgcolor="##003366"<cfelse>bgcolor="##ffffff"</cfif>><a href="AddItems.cfm" <cfif attributes.Page EQ 2>style="color:##003366;"<cfelse>style="color:##ffffff;"</cfif>>Add New items</a></strong></td>
	<cfelseif Not Attributes.AllowMaintenance and Attributes.CoopEndDate GTE Now()>
		<td <cfif attributes.Page EQ 3>bgcolor="##ffffff"</cfif>><strong <cfif attributes.Page EQ 3>bgcolor="##003366"<cfelse>bgcolor="##ffffff"</cfif>><a href="VendorOrder.cfm" <cfif attributes.Page EQ 3>style="color:##003366;"<cfelse>style="color:##ffffff;"</cfif>>View Orders by Vendor Report</a></strong></td> 
	</cfif>
	<td <cfif attributes.Page EQ 4>bgcolor="##ffffff"</cfif>><strong <cfif attributes.Page EQ 4>bgcolor="##003366"<cfelse>bgcolor="##ffffff"</cfif>><a href="PreviousOrderReport.cfm" <cfif attributes.Page EQ 4>style="color:##003366;"<cfelse>style="color:##ffffff;"</cfif>>View Previous Orders</a></strong></td>
	<td <cfif attributes.Page EQ 5>bgcolor="##ffffff"</cfif>><strong <cfif attributes.Page EQ 5>bgcolor="##003366"<cfelse>bgcolor="##ffffff"</cfif>><a href="RegMaint.cfm" <cfif attributes.Page EQ 5>style="color:##003366;"<cfelse>style="color:##ffffff;"</cfif>>Registration Maintenance</a></strong></td>
  </tr>
</table>
</cfoutput>