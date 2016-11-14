<cfset GetVendors = request.coopAdminComponent.GetAllVendorInfo()>

<cfset yourFileName="VendorAddress_#DateFormat(now(), 'YYYYMMDD')#.xls">
<cfcontent type="application/msexcel">
<cfheader name="Content-Disposition" value="inline; filename=#yourFileName#">

<table border="0" cellpadding="0" cellspacing="0" width="100%">
 <tr>
    <th>VendorID</th>
	<th>Prefix</th>
	<th>CompanyName</th>
	<th>Firstname</th>
	<th>Lastname</th>
	<th>MI</th>
	<th>VenPosition</th>
	<th>Address</th>
	<th>Address2</th>
	<th>City</th>
	<th>State</th>
	<th>Zip</th>
	<th>ProductGroup</th>
	<th>Phone</th>
	<th>Fax</th>
	<th>Email</th>
 </tr>
<cfoutput query="GetVendors">
 <tr>
    <td>#GetVendors.VendorID#</td>
	<td>#GetVendors.Prefix#</td>
	<td>#GetVendors.CompanyName#</td>
	<td>#GetVendors.Firstname#</td>
	<td>#GetVendors.Lastname#</td>
	<td>#GetVendors.MI#</td>
	<td>#GetVendors.VenPosition#</td>
	<td>#GetVendors.Address#</td>
	<td>#GetVendors.Address2#</td>
	<td>#GetVendors.City#</td>
	<td>#GetVendors.State#</td>
	<td>#GetVendors.Zip#</td>
	<td>#GetVendors.ProductGroup#</td>
	<td>#GetVendors.Phone#</td>
	<td>#GetVendors.Fax#</td>
	<td>#GetVendors.Email#</td>
 </tr>
</cfoutput>
</table>


