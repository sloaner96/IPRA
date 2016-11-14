<cfmodule template="#Application.header#" section="0" sectiontitle="Coop Maintenance">
  <cfoutput>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="160"><br>
		    <cfmodule template="#Application.tagdir#/adminnav.cfm" level="5">
		   </td>
		   <td valign="top"><br>
		      <table border="0" cellpadding="4" cellspacing="2" width="100%" bgcolor="##eeeeee">
				<tr bgcolor="##003366">
					<td ><a href="prodReports.cfm" style="color:##ffffff;"><strong style="color:##ffffff;">Product Home</strong></a></td>
					 <td><a href="PeriodUpdate.cfm?t=B" style="color:##ffffff;"><strong>Add Winning Bidder</strong></a></td>
					 <td><a href="PeriodUpdate.cfm?t=V" style="color:##ffffff;"><strong>Add Voting</strong></a></td>
					 <td><strong style="color:##ffffff;"><a href="PeriodUpdate.cfm?t=R" style="color:##ffffff;">Reject Items</a></strong></td>
				     <td bgcolor="##ffffff"><strong style="color:##003366;">Product Reports</strong></td>
					 
				</tr>
	          </table>
			  <br>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
				<tr>
				  <td>Use the Links below to view Reports that pertain to products. These links will take you to the Reports area.</td>
				</tr>
				<tr>
				  <td>&nbsp;</td>
				</tr>
				<tr>
				  <td>
				   <ol>
				     <li><a href="../Reports/OrdersByItem.cfm">Item Order Report</a></li>
				     <li><a href="../Reports/ItemBidders.cfm">Bidders By Item</a></li>
				   </ol>
				 </td>
				</tr>
			  </table>
			   <br><br>
		 </td>
     </tr>
</table>  
</cfoutput>
<cfmodule template="#Application.footer#">