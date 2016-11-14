<cfparam name="URL.V" default="0">
<cfparam name="URL.ConfigID" default="0">
<cfparam name="URL.ShowWinner" default="0">
<cfparam name="URL.ShowComment" default="0">

<cfset ThisVendorID = URL.V>

<cfsavecontent variable="PrintPDFVendor">
  <cfset GetVendor = request.CoopAdminComponent.GetVendorInfo(thisVendorID)>
  <cfif URL.ShowWinner EQ 0>
              <cfset GetBids = request.CoopAdminComponent.GetVendorBids(URL.ConfigID,thisVendorID)>
           <cfelse>
              <cfset GetBids = request.CoopAdminComponent.GetVendorWinningBids(URL.ConfigID,thisVendorID)>
           </cfif>
  <cfoutput>
    <table border="0" cellpadding="5" cellspacing="0" style="font-family:verdana,arial; font-size:8px;">
            <tr>
              <td><h3>IPRA Cooperative Purchase Program: Bids By Vendor Report</h3></td>
           </tr>
          </table>
<table border="0" cellpadding="4" cellspacing="1" width="100%" bgcolor="##000000" style="font-family:verdana,arial; font-size:8px;">
  <tr bgcolor="##ffffff">
   <td><strong style="font-size:16px;">Vendor Information</strong></td>
 </tr>
 <tr>
    <td bgcolor="##ffffff">
       <table border="0" cellpadding="4" cellspacing="0" width="100%" style="font-family:verdana,arial; font-size:8px;">
           <tr>
             <td><strong style="font-size:11px;">#GetVendor.CompanyName#</strong></td>
               </tr>
		 <tr>
		   <td>#GetVendor.Address#<br><cfif GetVendor.Address2 NEQ "">#GetVendor.Address2#<br></cfif>#GetVendor.City#, #GetVendor.State# #GetVendor.Zip#</td>
		 </tr>
		 <tr>
		   <td><strong>Contact:</strong> #GetVendor.Firstname# #GetVendor.Lastname#<br>Phone: #GetVendor.Phone#<br>Fax: #GetVendor.Fax#<br>Email: #GetVendor.Email#<br>Website: #GetVendor.Website#</td>
		 </tr>
                 </table>
   </td>
             </tr>
            </table>

</cfoutput>
<br>
<cfif GetBids.recordcount GT 0> 
  <table border="0" cellpadding="3" cellspacing="1" width="100%" bgcolor="#666666" style="font-family:verdana,arial; font-size:8px;">
		 <cfoutput query="GetBids" group="GroupName">
		   <tr bgcolor="##ffffff" style="border: 1px solid Black;">
		     <td colspan="8"><strong style="font-family:arial; font-size:12px;padding-left:5px;padding-top:5px;padding-bottom:5px;">#getBids.groupName#</strong></td>
		   </tr>
		   <cfoutput group="CatID">
		      <tr bgcolor="##ffffff" style="border: 1px solid Black;">
		         <td colspan="8"><strong style="font-family:arial; font-size:10px; color: ##ffffff; padding-left:20px;padding-top:5px;padding-bottom:5px;">#getBids.CategoryName#</strong></td>
		      </tr>
			  <tr bgcolor="##ffffff" style="border: 1px solid Black;">
				    <td><strong>Item ID</strong></td>
					<td><strong>Item</strong></td>
					<td><strong>Brand</strong></td>
					<td><strong>UOM</strong></td>
					<td><strong>Previous</strong></td>
					<td><strong>Bid</strong></td>
					<td><strong>Bid Date</strong></td>
			  </tr>
				 <cfoutput> 
				   <tr bgcolor="##ffffff" style="border: 1px solid Black;">
				      <td valign="top">#GetBids.ITEMCODE#</td>
					  <td valign="top"><strong>#GetBids.ItemName#</strong><br><font style="font-size:9px;">#ItemDesc#</font></td>
					  <td valign="top">#GetBids.VendorProdName#</td>
					  <td valign="top">#GetBids.UNITOFMEASURE#</td>
					  <td valign="top">#DollarFormat(GetBids.PreviousCost)#</td>
					  <td valign="top">#DollarFormat(GetBids.VendorPrice)#</td>
					  <td valign="top">#DateFormat(GetBids.BidDate, 'MM/DD/YYYY')#</td>
				   </tr>
				   <tr bgcolor="##ffffff" style="border: 1px solid Black;">
				         <td></td>
                         <td colspan="8"><strong>SHIPPING TERMS:</strong> #GetBids.ShippingTerms#<br></td>
  					   </tr>
				   <cfif URL.ShowComment NEQ 0>
				     <cfif GetBids.BIDCOMMENT NEQ "">
					   <tr bgcolor="##ffffff" style="border: 1px solid Black;">
					      <td></td>
                          <td colspan="8" style="font-size:10px;"><strong>COMMENTS:</strong> #GetBids.BIDCOMMENT#<br></td>
   					   </tr>
				      </cfif>
				   </cfif>
		    </cfoutput>
		  </cfoutput>	
		    <tr bgcolor="##ffffff">
			  <td colspan="8">&nbsp;</td>
			</tr>	   
		 </cfoutput>
		</table> 
	  <cfelse>
		    <table border="0" cellpadding="3" cellspacing="1" width="100%" style="border: 1px solid Black;">
		    <cfif url.ShowWinner EQ 0>
		      <tr>
	                   <td class="errortext" align="center">There are currently no bids for this vendor. Use the form above to add a new bid.</td>
	                </tr>
			<cfelse>
	          <tr>
	                        <td><strong class="Errortext">This Vendor Has not Currently Won any Bids</strong></td>
	                     </tr>
	        </cfif>
		  </table>	
	  </cfif>
</cfsavecontent>

<cfdocument  format="PDF" pagetype="letter" orientation="landscape" unit="in" encryption="none" fontembed="Yes" backgroundvisible="YES"><cfoutput>#PrintPDFVendor#</cfoutput></cfdocument>