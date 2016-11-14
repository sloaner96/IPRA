  <cfparam name="url.PrinterFriendly" default="false">
  
  <cfif IsDefined("URL.VendorID")>
     <cfset ThisVendorID = URL.VendorID>
 <cfelseif IsDefined("Form.VendorID")>
     <cfset ThisVendorID = Form.VendorID>	
  <cfelse>
      <cfset ThisVendorID = "">	  
  </cfif>
  
<cfmodule template="#Application.header#" section="0" sectiontitle="Cooperative Purchase Program">
  <br>
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
      <tr>
	    <cfif ThisVendorID EQ "" Or url.printerfriendly>
         <td valign="top" width="160"><br>
		    <cfmodule template="#Application.tagdir#/adminnav.cfm" level="5">
         </td>
         <td valign="top">
        </cfif> 

	<table border="0" cellpadding="5" cellspacing="0">
       <tr>
         <td><h3>IPRA Cooperative Purchase Program: Bids by Vendor</h3></td>
       </tr>
    </table>

     <table border="0" cellpadding="4" cellspacing="0" width="100%">
       <cfif ThisVendorID EQ "">
	   <tr>
	     <td>Use the Form below to select the product group and related categories you would like to report on.</td>
	   </tr>
	   </cfif>
	   <tr>
	     <td>
		   <cfif ThisVendorID EQ "">
		     <cfoutput>
		     <cfset getconfigs = request.CoopAdminComponent.getAllConfigs()>
		   <form name="coopItems" action="BidsByVendor.cfm" method="post"> 
		    <table border="0" cellpadding="4" cellspacing="0">
			  <tr>
			    <td><strong>Coop Period:</strong> 
				    <select name="ConfigID" onchange="this.form.submit();"> 
					  <option value="">-- select one --</option>
					  <cfloop query="GetConfigs">
				      <option value="#getConfigs.ConfigID#" <cfif IsDefined("form.ConfigID")><cfif form.ConfigID EQ getConfigs.ConfigID>Selected</cfif></cfif>>#getconfigs.CoopYear#</option>
					  </cfloop>
					</select>
				</td>
			  </tr>
			  <cfif IsDefined("form.ConfigID")>
			     <cfset GetVendor = request.CoopAdminComponent.GetVendorsWithBids(form.ConfigID)>
			  <tr>
			    <td><strong>Select Vendor:</strong>
				    <select name="VendorID"> 
					  <option value="">-- select one --</option>
					  <cfloop query="GetVendor">
				      <option value="#GetVendor.VendorID#">#GetVendor.CompanyName#</option>
					  </cfloop>
					</select>
				</td>
			  </tr>
			  <tr>
			    <td><strong>Filter:</strong> <input type="radio" name="ShowWinner" value="0"> Show All Bids&nbsp;&nbsp;&nbsp;<input type="radio" name="ShowWinner" value="1"> Show Winning Bids</td>
			  </tr>
			  <tr>
			    <td><strong>Show Bid Comments:</strong> <input type="radio" name="ShowBidComments" value="1"> YES&nbsp;&nbsp;&nbsp;<input type="radio" name="ShowBidComments" value="0" checked> NO</td>
			  </tr>
			  
			  <tr>
			    <td><input type="submit" name="submit" value="Run Report >>"></td>
			  </tr>
			  </cfif>
			</table>
			</form>
			
 </cfoutput>	
			</cfif>
			<cfif ThisVendorID NEQ "">
			   <cfset GetVendor = request.CoopAdminComponent.GetVendorInfo(thisVendorID)>
			   <cfif form.ShowWinner EQ 0>
                  <cfset GetBids = request.CoopAdminComponent.GetVendorBids(form.ConfigID,thisVendorID)>
               <cfelse>
                  <cfset GetBids = request.CoopAdminComponent.GetVendorWinningBids(form.ConfigID,thisVendorID)>
               </cfif>
			   <cfoutput>
			   <div align="right">
			     <a href="index.cfm"><< Back to Reports Home</a><br><br>
			     <a href="BidsByVendor_PDF.cfm?V=#ThisVendorID#&ConfigID=#form.ConfigID#&ShowWinner=#form.ShowWinner#&ShowComment=#form.ShowBidComments#&r=#RandRange(1,10000)#" target="_blank"><img src="/images/pdficon.gif" width="22" height="24" alt="" border="0" align="absmiddle">  Print as PDF</a>
			   </div>
			   <br>
		
				<table border="0" cellpadding="4" cellspacing="1" width="100%" bgcolor="##000000">
                 <tr bgcolor="##aec8d5">
				   <td><strong>Vendor Information</strong></td>
				 </tr>
				 <tr>
                   <td bgcolor="##ffffff">
				     <table border="0" cellpadding="4" cellspacing="0" width="100%">
                         <tr>
                            <td><strong style="font-size:14px;">#GetVendor.CompanyName#</strong></td>
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
				  <table border="0" cellpadding="3" cellspacing="1" width="100%" bgcolor="#666666">
						 <cfoutput query="GetBids" group="GroupName">
						   <tr bgcolor="##9dabc4">
						     <td colspan="8"><strong style="font-family:arial; font-size:16px;padding-left:5px;padding-top:5px;padding-bottom:5px;">#getBids.groupName#</strong></td>
						   </tr>
						   <cfoutput group="CatID">
						      <tr bgcolor="##006699">
						         <td colspan="8"><strong style="font-family:arial; font-size:14px; color: ##ffffff; padding-left:20px;padding-top:5px;padding-bottom:5px;">#getBids.CategoryName#</strong></td>
						      </tr>
							  <tr bgcolor="##f7f7f7">
								    <td><strong>Item ID</strong></td>
									<td><strong>Item</strong></td>
									<td><strong>Brand</strong></td>
									<td><strong>UOM</strong></td>
									<td><strong>Previous</strong></td>
									<td><strong>Bid</strong></td>
									<td><strong>Bid Date</strong></td>
							  </tr>
								 <cfoutput> 
								   <tr bgcolor="##ffffff">
								      <td valign="top">#GetBids.ITEMCODE#</td>
									  <td valign="top"><strong>#GetBids.ItemName#</strong><br><font style="font-size:9px;">#ItemDesc#</font></td>
									  <td valign="top">#GetBids.VendorProdName#</td>
									  <td valign="top">#GetBids.UNITOFMEASURE#</td>
									  <td valign="top">#DollarFormat(GetBids.PreviousCost)#</td>
									  <td valign="top">#DollarFormat(GetBids.VendorPrice)#</td>
									  <td valign="top">#DateFormat(GetBids.BidDate, 'MM/DD/YYYY')#</td>
								   </tr>
								   <tr bgcolor="##fbfbfb">
								      <td></td>
			                          <td colspan="8"><strong>SHIPPING TERMS:</strong> #GetBids.ShippingTerms#<br></td>
			   					   </tr>
								   <cfif form.ShowBidComments NEQ 0>
								     <cfif GetBids.BIDCOMMENT NEQ "">
									   <tr bgcolor="##f4f4f4">
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
					    <table border="0" cellpadding="3" cellspacing="1" width="100%">
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
			</cfif>
		 </td>
	   </tr>
     </table>
	  <br><br><br><br>
  </td>
</tr>
</table>
	   	
<cfmodule template="#Application.footer#">