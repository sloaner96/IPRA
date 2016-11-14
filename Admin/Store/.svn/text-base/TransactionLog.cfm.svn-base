<cfinclude template="#Application.TagDir#/Libraries/ccEscape.cfm">
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
		          <td><h3>IPRA Transaction Log</h3></td>
		        </tr>
		      </table>
			  <table border="0" cellpadding="6" cellspacing="0" width="100%">
		        <tr>
		           <td class="RegText">
				     <form action="TransactionLog.cfm" Method="POST">
				      <table border="0" cellpadding="4" cellspacing="0" width="100%">
                          <tr bgcolor="eeeeee">
                            <td colspan=2><strong>Search for Website Transactions</strong></td>
                          </tr> 
						  <cfquery name="TranType" datasource="#Application.dsn#">
						    Select Codevalue, CodeDesc
							From Lookup
							Where Codegroup = 'TransType'
							order By CodeDesc
						  </cfquery>
						  <tr>
						    <td><strong>Transaction Type:</strong></td>
						    <td><select name="TranType">
							      <option value="">-- All --</option>
							     <cfloop query="TranType">
							        <option value="#TranType.codeValue#">#TranType.CodeDesc#</option>
							     </cfloop>
								</select>
							</td>
						  </tr>
						  <cfquery name="GetPayType" datasource="#Application.dsn#">
						    Select Codevalue, CodeDesc
							From Lookup
							Where Codegroup = 'PayType'
							order By CodeDesc
						  </cfquery>
						  
						  <tr>
						    <td><strong>Payment Type:</strong></td>
							<td><select name="PayType">
							     <option value="">-- All --</option>
							     <cfloop query="GetPayType">
							        <option value="#GetPayType.codeValue#">#GetPayType.CodeDesc#</option>
							     </cfloop>
								</select>
							</td>
						  </tr>
						  <cfset LastThirty = DateAdd('d', -30, now())>
						 <tr>
						   <td><strong>Date Range:</strong></td>
						   <td>BEGIN <input Type="text" name="BeginDate" <cfif IsDefined("form.BeginDate")>value="#DateFormat(form.beginDate, 'MM/DD/YYYY')#"<cfelse>value="#DateFormat(LastThirty, 'MM/DD/YYYY')#"</cfif> size="15" maxlength="15">&nbsp;&nbsp;END <input Type="text" name="EndDate" <cfif IsDefined("form.endDate")>value="#DateFormat(form.enddate, 'MM/DD/YYYY')#"<cfelse>value="#DateFormat(now(), 'MM/DD/YYYY')#"</cfif> size="15" maxlength="15"></td>
						 </tr>
						 <tr>
						   <td colspan=2><input type="submit" name="submit" value="Search >>"</td>
						 </tr>
                      </table>
					 </form> 
					 <cfif IsDefined("form.submit")>
					   <cfif form.Trantype EQ "" AND Form.PayType EQ "" AND Form.BeginDate EQ "" AND Form.EndDate EQ "">
					      <p class="errortext"><strong>Error! Your search must contain at least 1 criteria.</strong></p> 
					   <cfelse>
					      <cfquery name="GetTrans" datasource="#Application.dsn#">
						    Select T.*,
							  (Select CodeDesc
							     From Lookup
							     Where Codegroup = 'TransType'
								 AND Codevalue = T.PurchaseCode) as TranTypeName
							From Transactions T
							Where 1=1
							<cfif form.TranType NEQ "">
							 AND PurchaseCode = '#form.TranType#'
						    </cfif>
							<cfif form.PayType NEQ "">
							  <cfif form.PayType EQ "c">
							    AND TransType = 'Credit'
							  <cfelse>
							    AND TransType = 'PO' 
							  </cfif>
							 
						    </cfif>
							<cfif form.beginDate NEQ "">
							 AND DateAuthorized >= #Createodbcdate(Form.BeginDate)#
							</cfif>
							<cfif form.EndDate NEQ "">
							 AND DateAuthorized <= #Createodbcdate(Form.EndDate)#
							</cfif>
							Order By DateAuthorized, TransType, PurchaseCode
						  </cfquery>
						  
						  <cfif GetTrans.recordcount GT 0>
						  <table border="0" cellpadding="4" cellspacing="1" width="100%" bgcolor="eeeeee">
								<tr bgcolor="##003366">
									<td><strong style="color:ffffff;">Transaction Date</strong></td>
									<td><strong style="color:ffffff;">Transaction Type</strong></td>
									<td><strong style="color:ffffff;">Payment Type</strong></td>
									<td><strong style="color:ffffff;">Name</strong></td>
									<td><strong style="color:ffffff;">Amount</strong></td>
								</tr>
								<cfset TotalTrans = 0.00>
								<cfloop query="GetTrans">
									<tr bgcolor="ffffff">
										<td>#DateFormat(DateAuthorized, 'mm/dd/yyyy')#</td>
										<td>#TranTypeName#</td>
										<td>#UCASE(TransType)#</td>
										<td>#CardHolder#</td>
										<td align="right">#DollarFormat(Amount)#</td>
									</tr>
								  <cfset TotalTrans = TotalTrans + Gettrans.Amount>	
								</cfloop>
								<tr>
								  <td colspan="5" align="right"><strong>Total:</strong> #DollarFormat(TotalTrans)#</td>
								</tr>
							</table>
						  <cfelse>
						     <table border="0" cellpadding="4" cellspacing="0" width="100%">
							   <tr>
							      <td class="ErrorText"><strong>Your Search Returned no matches. Please refine your search above.</strong></td>
							   </tr>
							 </table>
						  </cfif>
					   </cfif>
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