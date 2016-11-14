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
		          <td><h3>ERROR!</h3></td>
		        </tr>
		      </table>
			  <cfset ErrorList = ArrayNew(1)>
			  <table border="0" cellpadding="6" cellspacing="0" width="100%">
		        <tr>
		           <td class="RegText">
				      <cfif action EQ "ADD">
					    
						 <!--- Do Error Check --->
					      <cfif form.ProdName EQ "">
				              <cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Product Name</b> field")>
				          </cfif> 
						  <cfif form.ProdType EQ "">
				              <cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Product Type</b> field")>
				          </cfif> 
						  <cfif form.ProdCat EQ "">
				              <cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Product Category</b> field")>
				          </cfif> 
						  <cfif form.PerUnitPrice EQ "">
				              <cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Per Unit Price</b> field")>
				          </cfif> 
						  <cfif form.ProdQty EQ "">
				              <cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Product Quantity</b> field")>
				          </cfif> 
						  <cfif form.QtyMeasure EQ "">
				              <cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Product Quantity Measurement/b> field")>
				          </cfif> 
						  
						   
						    <cfset fileString = "#Application.sitepath#/images/products">
						  
						  
						  
						  <!--- Upload Product Image --->
						  <cfif Len(Trim(form.ProdImg)) GT 0>
						    <cffile action="UPLOAD" filefield="form.ProdImg" destination="#FileString#" NameConflict="MAKEUNIQUE"> 
							<cfset NewProdImage = File.ServerFile>
						  <cfelse>
						    <cfset NewProdImage = "">
						  </cfif>
						  
						    <!--- Upload Product Thumbnail --->
						  <cfif Len(Trim(form.ProdThmb)) GT 0>
						    <cffile action="UPLOAD" filefield="form.ProdThmb" destination="#FileString#" NameConflict="MAKEUNIQUE"> 
							<cfset NewProdThmb = File.ServerFile>
						  <cfelse>
						    <cfset NewProdThmb = "">
						  </cfif>
						  
						 <!--- If No Error Insert, Else Throw Error --->
						 <cfif Arraylen(ErrorList) EQ 0>
						   <cfquery name="InsertProd" datasource="#Application.dsn#">
						      Insert Into Products (ProductName, 
							               ProductType, 
										   ProductCategory,
										    ShortDesc, 
											LongDesc, 
											PerUnitPrice,
											MemberPrice, 
											NonMemberPrice,
											ProductImg, 
										    ImgThumb, 
											ProductQty, 
											QuantityMeasure, 
											BonusSection, 
											SellInStore,
											IsActive,
											LastUpdated
											)
							  VALUES( '#form.prodName#',
							          '#form.ProdType#',
									  '#form.ProdCat#',
									  <cfif LEN(Trim(form.ShortDesc)) GT 0>'#form.ShortDesc#'<cfelse>NULL</cfif>,
									  <cfif LEN(Trim(form.LongDesc)) GT 0>'#form.LongDesc#'<cfelse>NULL</cfif>,
									  #form.PerUnitPrice#,
									  <cfif LEN(Trim(form.MbrPrice)) GT 0>#form.MbrPrice#<cfelse>NULL</cfif>,
									  <cfif LEN(Trim(form.NMbrPrice)) GT 0>#form.NMbrPrice#<cfelse>NULL</cfif>,
									  <cfif LEN(Trim(NewProdImage)) GT 0>'#NewProdImage#'<cfelse>NULL</cfif>,
									  <cfif LEN(Trim(NewProdThmb)) GT 0>'#NewProdThmb#'<cfelse>NULL</cfif>,
									  #form.ProdQty#,
									  '#form.QtyMeasure#',
									  <cfif IsDefined("form.BonusSection")>1<cfelse>0</cfif>,
									  <cfif IsDefined("form.SellInStore")>1<cfelse>0</cfif>,
									  1,
									  #CreateODBCDateTime(now())#
							  )
						   </cfquery>
						   
						   <!--- <cflocation url="productMaint.cfm" addtoken="NO"> --->
						   <meta http-equiv="refresh" content="0;url=productMaint.cfm">
						 <cfelse>
						  <!--- If Error Display --->
						  <font face="Verdana,Arial" size="-1">
							<h4><font color="Maroon">Problem(s) were encountered While Attempting to save this product</font></h4>
							<p>Your transaction could not be completed because:</p>
							<ol>
							<cfloop INDEX="i" FROM="1" TO="#ArrayLen(ErrorList)#">
							<cfoutput><li><p>#ErrorList[i]#</p></li></cfoutput>
							</cfloop>
							</ol>
							<div align=center><form><input type="Button" name="" value="Click here to correct Errors Now" align="ABSMIDDLE" onclick="history.back()"></form></div>
						    </font>
							 </cfif>
					  <cfelseif action EQ "UPDATE">
					      					    
						 <!--- Do Error Check --->
					      <cfif form.ProdName EQ "">
				              <cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Product Name</b> field")>
				          </cfif> 
						  <cfif form.ProdType EQ "">
				              <cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Product Type</b> field")>
				          </cfif> 
						  <cfif form.ProdCat EQ "">
				              <cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Product Category</b> field")>
				          </cfif> 
						  <cfif form.PerUnitPrice EQ "">
				              <cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Per Unit Price</b> field")>
				          </cfif> 
						  <cfif form.ProdQty EQ "">
				              <cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Product Quantity</b> field")>
				          </cfif> 
						  <cfif form.QtyMeasure EQ "">
				              <cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Product Quantity Measurement/b> field")>
				          </cfif> 
						  
						   
						    <cfset fileString = "#Application.sitepath#/images/products">
						  
						  
						  
						  <!--- Upload Product Image --->
						  <cfif Len(Trim(form.ProdImg)) GT 0>
						    <cffile action="UPLOAD" filefield="form.ProdImg" destination="#FileString#" NameConflict="MAKEUNIQUE"> 
							<cfset NewProdImage = File.ServerFile>
						  <cfelse>
						    <cfset NewProdImage = "">
						  </cfif>
						  
						    <!--- Upload Product Thumbnail --->
						  <cfif Len(Trim(form.ProdThmb)) GT 0>
						    <cffile action="UPLOAD" filefield="form.ProdThmb" destination="#FileString#" NameConflict="MAKEUNIQUE"> 
							<cfset NewProdThmb = File.ServerFile>
						  <cfelse>
						    <cfset NewProdThmb = "">
						  </cfif>
						  
						 <!--- If No Error Insert, Else Throw Error --->
						 <cfif Arraylen(ErrorList) EQ 0>
						   <cfquery name="InsertProd" datasource="#Application.dsn#">
						      Update Products 
							   SET ProductName =  '#form.prodName#',
							       ProductType =  '#form.ProdType#',
								   ProductCategory = '#form.ProdCat#',
								   ShortDesc =  <cfif LEN(Trim(form.ShortDesc)) GT 0>'#form.ShortDesc#'<cfelse>NULL</cfif>,
								   LongDesc =  <cfif LEN(Trim(form.LongDesc)) GT 0>'#form.LongDesc#'<cfelse>NULL</cfif>,
								   PerUnitPrice = #form.PerUnitPrice#,
								   MemberPrice = <cfif LEN(Trim(form.MbrPrice)) GT 0>#form.MbrPrice#<cfelse>NULL</cfif>, 
								   NonMemberPrice = <cfif LEN(Trim(form.NMbrPrice)) GT 0>#form.NMbrPrice#<cfelse>NULL</cfif>,
								  <cfif LEN(Trim(NewProdImage)) GT 0> ProductImg =  '#NewProdImage#',</cfif>
								  <cfif LEN(Trim(NewProdThmb)) GT 0> ImgThumb =  '#NewProdThmb#',</cfif>
								   ProductQty =  #form.ProdQty#,
								   QuantityMeasure =  '#form.QtyMeasure#',
								   BonusSection =  <cfif IsDefined("form.BonusSection")>1<cfelse>0</cfif>,
								   SellInStore = <cfif IsDefined("form.SellInStore")>1<cfelse>0</cfif>,
								   IsActive = <cfif IsDefined("form.IsActive")>1<cfelse>0</cfif>,
								   LastUpdated =#CreateODBCDateTime(now())#
										
							Where ProductID = #form.ProductID#
						   </cfquery>
						   
						   <!--- <cflocation url="productMaint.cfm" addtoken="NO"> --->
						   <meta http-equiv="refresh" content="0;url=productMaint.cfm">
						 <cfelse>
						  <!--- If Error Display --->
						  <font face="Verdana,Arial" size="-1">
							<h4><font color="Maroon">Problem(s) were encountered While Attempting to save this product</font></h4>
							<p>Your transaction could not be completed because:</p>
							<ol>
							<cfloop INDEX="i" FROM="1" TO="#ArrayLen(ErrorList)#">
							<cfoutput><li><p>#ErrorList[i]#</p></li></cfoutput>
							</cfloop>
							</ol>
							<div align=center><form><input type="Button" name="" value="Click here to correct Errors Now" align="ABSMIDDLE" onclick="history.back()"></form></div>
							</font>
					     </cfif>
					  
					  <cfelseif action EQ "REMOVE">
					  
					  
					  </cfif>
					  
					  
					  
					  
					  
				   </td>
		        </tr>
		       </table>
			   <br><br>
		 </td>
     </tr>
</table>  
</cfoutput>
<cfmodule template="#Application.footer#">