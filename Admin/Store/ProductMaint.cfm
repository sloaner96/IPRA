<cfmodule template="#Application.header#" section="0" sectiontitle="Site Admin">

	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="160"><br>
		    <cfmodule template="#Application.tagdir#/adminnav.cfm" level="4">
		   </td>
		   <td valign="top"><br>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>IPRA Administrative Site</h3></td>
		        </tr>
		      </table>
			  <cfquery name="GetProd" datasource="#Application.dsn#">
			    Select P.*,
				   (Select CodeDesc
				      From Lookup
					   Where CodeGroup = 'PRODCAT'
					   AND CodeValue = P.ProductType) as ProdTypeName,
					(Select CodeDesc
				      From Lookup
					   Where CodeGroup = 'OrderCat'
					   AND CodeValue = P.ProductCategory) as ProdCatName
					   
				From Products P
				Order By ProductType, ProductCategory, ProductName, ISActive
			  </cfquery>
			  <table border="0" cellpadding="6" cellspacing="0" width="100%">
		        <tr>
		           <td class="RegText">
				      <table border="0" cellpadding="0" cellspacing="0" width="100%">
                          <tr>
                            <td><a href="AddProduct.cfm"><strong>Add New Product</strong></a></td>
                          </tr> 
                      </table><br>
					  <table border="0" cellpadding="4" cellspacing="1" width="100%" bgcolor="eeeee">
                        <cfoutput query="GetProd" group="ProductType">
						  <tr bgcolor="##003366">
						      <td colspan="4"><strong style="color:##ffffff;">#ProdTypeName#</strong></td>
						  </tr>
						   <tr bgcolor="eeeee">
                              <td>Product Name</td>
						      <td>Category</td>
							  <td>Cost</td>
							  <td>Status</td>
                           </tr>
						   <cfoutput>
						   <tr bgcolor="ffffff">
                              <td valign="top" width="40%"><a href="EditProduct.cfm?action=Edit&prodID=#GetProd.ProductID#">#GetProd.ProductName#</a><br><font face="arial" color="757575" size="-2">#GetProd.ShortDesc#</font></td>
						      <td valign="top">#GetProd.ProdCatName#</td>
							  <td valign="top"><cfif GetProd.PerUnitPrice GT 0.00>#DollarFormat(GetProd.PerUnitPrice)# <font face="arial" color="757575" size="-2">Per Unit</font><br></cfif>
							                   <cfif GetProd.MemberPrice GT 0.00>#DollarFormat(GetProd.MemberPrice)# <font face="arial" color="757575" size="-2">Member</font><br></cfif>
							                   <cfif GetProd.NonMemberPrice GT 0.00>#DollarFormat(GetProd.NonMemberPrice)# <font face="arial" color="757575" size="-2">Non-Member</font></cfif>
							  </td>
							  <td valign="top"><cfif GetProd.IsActive EQ 1>Active<cfelse>InActive</cfif></td>
							  
                            </tr>
						 
						 </cfoutput>
						</cfoutput> 
                      </table>
				   </td>
		        </tr>
		       </table>
			   <br><br>
		 </td>
     </tr>
</table>  

<cfmodule template="#Application.footer#">