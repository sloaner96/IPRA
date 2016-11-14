<cfset GetVendor = request.CoopAdminComponent.GetVendorInfo(URL.VendorID)>
<cfset GetVendorPayment = request.CoopAdminComponent.GetVendorPayment(URL.VendorID)>
<cfmodule template="#Application.header#" section="0" sectiontitle="Coop Vendor Maintenance">
  <cfoutput>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="160"><br>
		    <cfmodule template="#Application.tagdir#/adminnav.cfm" level="5">
		   </td>
		   <td valign="top"><br>
			  <table border="0" cellpadding="4" cellspacing="2" width="100%" bgcolor="##eeeeee">
				<tr bgcolor="##003366">
					<td><strong style="color:##ffffff;"><a href="VendorMaint.cfm" style="color:##ffffff;">Vendor Home</a></strong></td>
					 <td><strong style="color:##ffffff;"><a href="VendorDetail.cfm?vendorID=#URL.VendorID#" style="color:##ffffff;">Vendor Detail</a></strong></td>
					 <td><strong style="color:##ffffff;"><a href="VendorBids.cfm?vendorID=#URL.VendorID#" style="color:##ffffff;">Vendor Bids</a></strong></td>
					 <td bgcolor="##ffffff"><strong style="color:##003366;">Vendor History</strong></td>
				</tr>
	          </table>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>Cooperative Purchase Program: Vendor History</h3></td>
		        </tr>
		      </table>
		 	<br><br>
		 </td>
     </tr>
</table>  
</cfoutput>
<cfmodule template="#Application.footer#">	  