<cfset GetVendors = request.coopAdminComponent.GetAllAgencyInfo()>

 <cfset yourFileName="AgencyAddress_#DateFormat(now(), 'YYYYMMDD')#.xls">
<cfcontent type="application/msexcel">
<cfheader name="Content-Disposition" value="inline; filename=#yourFileName#">

<table border="0" cellpadding="0" cellspacing="0" width="100%">
 <tr>
    <th>MemberID</th>
	<th>AgencyID</th>
	<th>CompanyName</th>
	<th>Firstname</th>
	<th>Lastname</th>
	<th>MI</th>
	<th>Title</th>
	<th>Address</th>
	<th>Address2</th>
	<th>City</th>
	<th>State</th>
	<th>Zip</th>
	<th>Phone</th>
	<th>Fax</th>
	<th>Email</th>
 </tr>
<cfoutput query="GetVendors">
 <tr>
    <td>#GetVendors.MemberID#</td>
	<td>#GetVendors.AgencyID#</td>
	<td>#GetVendors.Company#</td>
	<td>#GetVendors.Firstname#</td>
	<td>#GetVendors.Lastname#</td>
	<td>#GetVendors.Middlename#</td>
	<td>#GetVendors.Title#</td>
	<td>#GetVendors.Address1#</td>
	<td>#GetVendors.Address2#</td>
	<td>#GetVendors.City#</td>
	<td>#GetVendors.State#</td>
	<td>#GetVendors.ZipCode#</td>
	<td>#GetVendors.MainPhone#</td>
	<td>#GetVendors.Fax#</td>
	<td>#GetVendors.Email#</td>
 </tr>
</cfoutput>
</table>