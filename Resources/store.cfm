<cfquery name="GetProducts" datasource="#Application.dsn#">
  Select ProductID, ProductName, ProductType, ProductCategory, ShortDesc, PerUnitPrice, 
         MemberPrice, NonMemberPrice, ImgThumb, ProductQty, QuantityMeasure,SellInStore,
	(Select CodeDesc
	   From Lookup
	    Where CodeGroup = 'ORDERCAT'
		AND CodeValue = P.ProductCategory) as ProdCatName,
	(Select CodeDesc
	   From Lookup
	    Where CodeGroup = 'PRODCAT'
		AND CodeValue = P.ProductType) as ProdTypeName
  From Products P
  Where SellInStore = 1
  AND IsActive = 1
  <cfif IsDefined("url.cat")>
    And ProductType = <cfqueryparam value="#url.cat#" cfsqltype="CF_SQL_VARCHAR" maxlength="4">
  </cfif>
  Order By productType, productCategory, productName, PerUnitPrice
</cfquery>

<cfmodule template="#Application.header#" sectiontitle="IPRA Marketplace">

	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top"><br>
	         <cfmodule template="#Application.tagdir#/resourcenav.cfm">
		   </td>
		   <td valign="top"><br>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>IPRA Marketplace</h3></td>
		        </tr>
		      </table>
			  <table border="0" cellpadding="6" cellspacing="0" width="100%">
		        <tr>
		           <td class="RegText">
				     
                      <table border="0" cellpadding="4" cellspacing="0" width="100%" class="RegText">
                         <tr>
                            <td width="70%" valign="Top">
							   <table border="0" cellpadding="3" cellspacing="0" width="100%">
                                <cfoutput query="GetProducts" group="ProductType">
								  <tr bgcolor="##006699">
                                     <td colspan=2><strong style="color:##ffffff; font-size:16px; font-family:arial;">#Getproducts.ProdTypeName#</strong></td>
                                  </tr>
								  <cfoutput group="ProductCategory">
								     <tr bgcolor="##eeeee">
									   <td colspan=2>&nbsp;&nbsp;&nbsp;&nbsp;<strong>#Getproducts.ProdCatName#</strong></td>
									 </tr>
									 <cfoutput>
									   <tr>
									     
										 <td valign="top">
										 <form name="store" action="#Application.secureURL#/Resources/Checkout.cfm" method="POST">
										   <input type="hidden" name="ProdID" value="#GetProducts.productID#">
										   <table border="0" cellpadding="4" cellspacing="0" width="100%">
                                             <tr>
                                                <td width="10%"><cfif Getproducts.ImgThumb NEQ ""><img src="/images/Products/#GetProducts.imgthumb#" width="66" height="55" alt="" border="0"><cfelse><img src="/images/noprodimage.jpg" width="66" height="55" alt="" border="0"></cfif></td>
												<td width="90%" valign="top"><br><strong>#productName#</strong><br>
												                             <cfif ShortDesc NEQ "">#ShortDesc#<br></cfif>
																			 Cost: #DollarFormat(PerunitPrice)#<br>
																			 Quantity:<input type="text" name="quantity" value="#GetProducts.ProductQty#" size=3 maxlength="3"> <input type="image" name="submit" value="1" src="/images/BTN_buynow.gif" alt="Buy #productName# Today!" align="absmiddle" width="72" height="22" hspace="8" vspace="3" border="0"></td>
                                              </tr>
											  
											  <tr>
											    <td colspan="2"></td>
											  </tr>
                                           </table>
										   </form>
										 </td>
										 <td valign="top" align="right"></td>
									   </tr>
									   <tr>
									     <td colspan=2><hr noshade size=1></td>
									   </tr>
									 </cfoutput>
								  </cfoutput>
								    <tr><td>&nbsp;</td></tr>
								 </cfoutput> 
                               </table>
							</td>
							<td width="30%" valign="top">
							  <table border="0" cellpadding="4" cellspacing="0" width="100%" style="border: solid #000000 1px;">
                                 <tr>
                                   <td align="center"><strong>Place your advertisement here *</strong><br>
										Ads run 60 days for just $10
										(Items being given-away may be posted free-of-charge)<br><br>
										
										<strong>To place your ad, (50 word maximum)
										Dean Comber at 630-376-1911. </strong>
										(Include P.O. # or credit card number & expiration date.)
                                   </td>
                                 </tr>
                              </table>
							</td>
                         </tr>
                      </table> 
					  
				   </td>
		        </tr>
		       </table>
			   <br>
			   
			   <br><br>
		 </td>
     </tr>
</table>  

<cfmodule template="#Application.footer#">