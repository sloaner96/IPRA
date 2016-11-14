<cfsavecontent variable="rejectPDF">
<cfif IsDefined("URL.configID")>
	<cfset GetVotes = request.coopAdminComponent.getRejectedItems(URL.ConfigID)>
		<table border="0" cellpadding="5" cellspacing="0" width="100%">
		   <tr>
		     <td><h3>Cooperative Purchase Program: Reports > Rejected Items</h3></td>
		   </tr>
		 </table>
		<cfif getvotes.recordcount GT 0>
		<table border="1" cellpadding="4" cellspacing="1" width="100%" style="font-family:verdana,arial; font-size:8px;">
		<cfoutput query="GetVotes" group="GroupID">
		<tr>
		<td colspan="4"><strong style="font-size:14px">#GroupName#</strong></td> 
		</tr>
		
		<cfoutput group="CatID">
		<tr>
		<td colspan="4"><strong style="font-size:10px">#CategoryName#</strong></td> 
		</tr>
		
		<tr >
		<td><strong>Item ID</strong></td>
		<td><strong>Item</strong></td>
		<td><strong>Unit of measure</strong></td>
		</tr>
		<cfoutput>
		<tr bgcolor="##ffffff">
		<td>#getVotes.ItemCode#</td>
		<td>#getVotes.ItemName#<br>#getVotes.ItemDesc#</td>
		<td>#getVotes.Unitofmeasure#</td>
		</tr>
		<tr>
		<td>&nbsp;</td>
		<td colspan="2"><strong>Rejection Reason:</strong> #RejectReason#</td>
		</tr>
		</cfoutput>
		</cfoutput>
		<tr bgcolor="##ffffff">
		<td colspan="3">&nbsp;</td>
		</tr>
		</cfoutput>
		</table>
	<cfelse>
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
			<tr>
			    <td class="errorText">There are currently no Rejected items for this Coop Period.<br><br><a href="RejectedItems.cfm">Click here</a> to go back and look at another period. </td>
			</tr>
		</table>	   
	</cfif>
</cfif>
</cfsavecontent>

<cfdocument  format="PDF" pagetype="letter" orientation="landscape" unit="in" encryption="none" fontembed="Yes" backgroundvisible="yes"><cfoutput>#rejectPDF#</cfoutput></cfdocument>