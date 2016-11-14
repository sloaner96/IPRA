<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Edit Facility</title>
</head>

<body>
<cfquery name="GetFac" datasource="#Application.dsn#">
  Select *
  From AgencyResources
  Where AgencyID = #URl.AgencyID#
  AND AGResourceID = #URL.AgRes#
</cfquery>

<cfquery name="GetFacType" datasource="#Application.dsn#">
  Select CodeValue, CodeDesc  
  From Lookup
  Where Codegroup = 'FACRES'
  Order By CodeDesc 
</cfquery>
<cfoutput>
   <form action="EditFacility_Action.cfm?Action=EditFac" Method="POST">
    <input type="hidden" name="AgencyID" value="#Url.AgencyID#"> 
	<input type="hidden" name="AgResourceID" value="#Url.AgRes#">
	<h4 style="font-family:verdana, arial;font-size:14px;">Update A Facility</h4>
	<table border="0" cellpadding="3" cellspacing="0" width="100%" style="font-family:verdana, arial;font-size:11px;">
	  <tr>
	    <td><strong style="color:##990000;">Remove Facility:</strong></td>
		<td><input type="checkbox" name="RemoveFacility" value="1"></td>
	  </tr>
	  <tr>
	     <td><strong>Resource Type:</strong></td>
		 <td><select name="ResourceType">
				<cfloop query="Getfactype">
				<option value="#Codevalue#" <cfif GetFac.ResourceType EQ GetFacType.Codevalue>selected</cfif>>#CodeDesc#</option>
				</cfloop>
				</select>
		 </td>
	  </tr>
	  <tr>
	     <td><strong>Quantity:</strong></td>
		 <td><input type="text" name="Quantity" value="#GetFac.Quantity#" size="6" maxlength="10"></td>
	  </tr>
	  <tr>
	     <td><strong>Concession Stands:</strong></td>
		 <td><input type="checkbox" name="ConStands" value="1" <cfif GetFac.ConcessionStand EQ 1>Checked</cfif>></td>
	  </tr>
	  <tr>
	     <td><strong>Washrooms:</strong></td>
		 <td><input type="checkbox" name="Washrooms" value="1" <cfif GetFac.WashRooms EQ 1>Checked</cfif>></td>
	  </tr>
	  <tr>
	     <td><strong>Rentals:</strong></td>
		 <td><input type="checkbox" name="Rentals" value="1" <cfif GetFac.Rentals EQ 1>Checked</cfif>></td>
	  </tr>
	  <tr>
	     <td><strong>Acreage Owned:</strong></td>
		 <td><input type="text" name="AcreageO" value="#GetFac.AcreageOwned#" size="6" maxlength="10"></td>
	  </tr>
	  <tr>
	     <td><strong>Acreage Leased:</strong></td>
		 <td><input type="text" name="AcreageL" value="#GetFac.AcreageLeased#" size="6" maxlength="10"></td>
	  </tr>
	  <tr>
	    <td colspan=2><input type="submit" name="submit" value="Update Facility"></td>
	  </tr>
	</table>
  </form>
</cfoutput>
</body>
</html>