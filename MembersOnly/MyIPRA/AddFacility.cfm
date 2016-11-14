<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Add New Facility</title>
</head>

<body>
<cfquery name="GetFacType" datasource="#Application.dsn#">
  Select CodeValue, CodeDesc  
  From Lookup
  Where Codegroup = 'FACRES'
  Order By CodeDesc 
</cfquery>
<cfoutput>
   <form action="EditFacility_Action.cfm?Action=AddFac" Method="POST">
    <input type="hidden" name="AgencyID" value="#Url.AgencyID#"> 
	<h4 style="font-family:verdana, arial;font-size:14px;">Add A Facility</h4>
	<table border="0" cellpadding="3" cellspacing="0" width="100%" style="font-family:verdana, arial;font-size:11px;">
	  <tr>
	     <td><strong>Resource Type:</strong></td>
		 <td><select name="ResourceType">
				<cfloop query="Getfactype">
				<option value="#Codevalue#">#CodeDesc#</option>
				</cfloop>
				</select>
		 </td>
	  </tr>
	  <tr>
	     <td><strong>Quantity:</strong></td>
		 <td><input type="text" name="Quantity" value="" size="6" maxlength="10"></td>
	  </tr>
	  <tr>
	     <td><strong>Concession Stands:</strong></td>
		 <td><input type="checkbox" name="ConStands" value="1"></td>
	  </tr>
	  <tr>
	     <td><strong>Washrooms:</strong></td>
		 <td><input type="checkbox" name="Washrooms" value="1"></td>
	  </tr>
	  <tr>
	     <td><strong>Rentals:</strong></td>
		 <td><input type="checkbox" name="Rentals" value="1"></td>
	  </tr>
	  <tr>
	     <td><strong>Acreage Owned:</strong></td>
		 <td><input type="text" name="AcreageO" value="" size="6" maxlength="10"> <strong><font color="red">(Enter "0" if unknown)</font></strong></td>
	  </tr>
	  <tr>
	     <td><strong>Acreage Leased:</strong></td>
		 <td><input type="text" name="AcreageL" value="" size="6" maxlength="10"> <strong><font color="red">(Enter "0" if unknown)</font></td>
	  </tr>
	  <tr>
	    <td colspan=2><input type="submit" name="submit" value="Add Facility"></td>
	  </tr>
	</table>
  </form>
</cfoutput>
</body>
</html>
