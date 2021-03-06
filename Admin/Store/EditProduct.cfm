<cfquery name="GetProdCat" datasource="#Application.dsn#">
	Select *
		From Lookup
	 Where CodeGroup = 'ORDERCAT'
	 Order By Ranking, CodeValue, codeDesc
</cfquery>

<cfquery name="GetProdType" datasource="#Application.dsn#">
	Select *
		From Lookup
	 Where CodeGroup = 'PRODCAT'
	 Order By Ranking, CodeValue, codeDesc
</cfquery>

<cfquery name="GetMeasure" datasource="#Application.dsn#">
	Select *
		From Lookup
	 Where CodeGroup = 'PRODMEAS'
	 Order By Ranking, CodeValue, codeDesc
</cfquery>

<cfquery name="GetProd" datasource="#Application.dsn#">
	Select *
		From Products
	 Where productID = #Url.ProdID#
</cfquery>

<cfmodule template="#Application.header#" section="0" sectiontitle="Site Admin">
  <cfoutput>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="160"><br>
		    <cfmodule template="#Application.tagdir#/adminnav.cfm" level="4">
		   </td>
		   <td valign="top"><br>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>Update Product List</h3></td>
		        </tr>
		      </table>
			  <table border="0" cellpadding="6" cellspacing="0" width="100%">
		        <tr>
		           <td class="RegText">
				     <p>Use the form below to add a new product to the product list</p>
					  <strong style="color:##cc0000;">* Required Fields</strong> 
					  <cfform name="addprod" action="UpdateProduct.cfm?action=UPDATE" method="POST" enctype="multipart/form-data" scriptsrc="/scripts/cfform.js">
					    <input type="hidden" name="ProductID" value="#GetProd.ProductID#"> 
					      <table border="0" cellpadding="3" cellspacing="0" width="100%">
	                           <tr bgcolor="##fff0f0">
	                            <td><strong>Product Active:</strong></td>
								<td><input type="checkbox" name="isActive" value="1" <cfif getProd.IsActive EQ 1>Checked</cfif>></td>
	                          </tr> 
							  <tr>
	                            <td><strong style="color:##cc0000;">*</strong><strong>Product Name:</strong></td>
								<td><input type="text" name="ProdName" size="30" value="#GetProd.ProductName#" maxlength="200"></td>
	                          </tr> 
							  <tr>
	                            <td><strong style="color:##cc0000;">*</strong><strong>Product Type:</strong></td>
								<td><select name="ProdType">
								       <option value="">--Select One--</option>
									   <cfloop query="GetProdType">
									   <option value="#GetProdType.CodeValue#" <cfif getProd.ProductType EQ GetProdType.CodeValue>Selected</cfif>>#GetProdType.CodeDesc#</option>
									   </cfloop>
									</select>
								</td>
	                          </tr> 
							  <tr>
	                            <td><strong style="color:##cc0000;">*</strong><strong>Product Category:</strong></td>
								<td><select name="ProdCat">
								       <option value="">--Select One--</option>
									   <cfloop query="GetProdCat">
									   <option value="#GetProdCat.CodeValue#" <cfif getProd.ProductCategory EQ GetProdCat.CodeValue>Selected</cfif>>#GetProdCat.CodeDesc#</option>
									   </cfloop>
									</select></td>
	                          </tr> 
							  <tr>
	                            <td><strong style="color:##cc0000;">*</strong><strong>Per Unit Price:</strong></td>
								<td>$<input type="text" name="PerunitPrice" size="7" value="#NumberFormat(GetProd.PerUnitPrice, 0.00)#" maxlength="9"></td>
	                          </tr> 
							  <tr>
	                            <td><strong>Member Price:</strong><br><font face="arial" color="757575" size="-2">(If Applicable)</font></td>
								<td>$<input type="text" name="MbrPrice" size="7" value="#NumberFormat(GetProd.MemberPrice, 0.00)#" maxlength="9"></td>
	                          </tr> 
							  <tr>
	                            <td><strong>Non-Member Price:</strong><br><font face="arial" color="757575" size="-2">(If Applicable)</font></td>
								<td>$<input type="text" name="NMbrPrice" size="7" value="#NumberFormat(GetProd.NonMemberPrice, 0.00)#" maxlength="9"></td>
	                          </tr> 
							  <tr>
	                            <td><strong style="color:##cc0000;">*</strong><strong>Quantity:</strong></td>
								<td><input type="text" name="ProdQty" size="4" value="#GetProd.ProductQty#" maxlength="9"></td>
	                          </tr> 
							  <tr>
	                            <td><strong style="color:##cc0000;">*</strong><strong>Quantity Measure:</strong></td>
								<td><select name="QtyMeasure">
								       <option value="">--Select One--</option>
									   <cfloop query="GetMeasure">
									   <option value="#GetMeasure.CodeValue#" <cfif getProd.QuantityMeasure EQ GetMeasure.CodeValue>Selected</cfif>>#GetMeasure.CodeDesc#</option>
									   </cfloop>
									</select></td>
	                          </tr>
							   <cfif getProd.ProductImg NEQ "">
							  <tr>
							    <td colspan="2"><strong>Existing Image:</strong> <a href="/images/Products/#GetProd.ProductImg#" target="_blank">[View Image]</td>
							  </tr>
							  </cfif>
							  <tr>
	                            <td><strong>NEW Product Image:</strong><br><font face="arial" color="757575" size="-2">(Maximum: 120 X 120)</font></td>
								<td><input type="file" name="ProdImg" size="30" value="" maxlength="80"></td>
	                          </tr> 
							  <cfif getProd.ImgThumb NEQ "">
							  <tr>
							    <td colspan="2"><strong>Existing Image:</strong> <a href="/images/Products/#GetProd.ImgThumb#" target="_blank">[View Image]</td>
							  </tr>
							  </cfif>
							  <tr>
	                            <td><strong>NEW Product Thumbnail:</strong><br><font face="arial" color="757575" size="-2">(Maximum: 66 X 66)</font></td>
								<td><input type="file" name="ProdThmb" size="30" value="" maxlength="80"></td>
	                          </tr> 
							  <tr>
	                            <td><strong>Sell In Store?</strong></td>
								<td><input type="checkbox" name="SellInStore" value="1" <cfif getProd.SellInStore EQ 1>Checked</cfif>></td>
	                          </tr> 
							  <tr>
	                            <td><strong>Allow Bonus:</strong><br><font face="arial" color="757575" size="-2">(If Applicable)</font></td>
								<td><input type="checkbox" name="BonusSection" value="1" <cfif getProd.BonusSection EQ 1>Checked</cfif>> USE ONLY FOR MEMBER SPECIAL INTEREST SECTIONS</td>
	                          </tr> 
							  <tr>
	                            <td><strong>Short Description:</strong></td>
								<td><input type="text" name="ShortDesc" size="50" value="#GetProd.ShortDesc#" maxlength="100"></td>
	                          </tr> 
							  <tr>
	                            <td><strong>Long Description:</strong></td>
								<td><textarea name="LongDesc" rows="6" cols="45">#GetProd.LongDesc#</textarea></td>
	                          </tr> 
							  <tr>
	                            <td colspan=2><input type="submit" name="submit" value="Update Product >>"></td>
	                          </tr> 
	                      </table>
					  </cfform>
				   </td>
		        </tr>
		       </table>
			   <br><br>
		 </td>
     </tr>
</table>  
</cfoutput>
<cfmodule template="#Application.footer#">