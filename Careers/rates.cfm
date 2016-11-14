<cfmodule template="#Application.Header#" sectiontitle="Job Opprotunities Bulletin">
 
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top">
		     <br>
		    <cfmodule template="#Application.tagdir#/aboutusnav.cfm" level="3">
		   </td>
		   <td valign="top">
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>Job Posting Rates</h3></td>
		        </tr>
		      </table>
			  <table border="0" cellpadding="6" cellspacing="0" width="100%">
		        <tr>
		           <td class="RegText">					  
					  <p><strong>Current Rates as of May 2006</strong></p> 
 <p>Rates are subject to change and will be reflected in the table below.</p> <p>Rates are determined by category, length posted, and whether the job is being posted as an IPRA Member or Non-Member.</p>
 <p>At approximately 1/10th of the cost of an ad in the Chicago Tribune, we'll get you qualified applicants in record time!</p>
 </td>
		        </tr>
				<tr class="RegText">
				  <td></td>
				</tr>
				<tr class="RegText">
				  <cfoutput>
				  <td></td>
				</cfoutput> 
				</tr>
				<cfquery name="GetPricing" datasource="#Application.dsn#">
				  Select P.*, L.Codedesc as jobcategory 
				  From Products P, Lookup L
				  Where P.ProductType = '01'
				  AND L.CodeGroup = 'ORDERCAT'
				  AND L.CodeValue = P.ProductCategory
				  Order By L.Ranking, P.ProductQty 
				</cfquery>
				<tr>
				  <td class="RegText" align="left">
				     <table border="0" cellpadding="5" cellspacing="1" bgcolor="eeeee" class="RegText">
                       <cfoutput query="GetPricing" group="ProductCategory">
					    <tr bgcolor="##003366">
                          <td colspan="3"><strong style="color:ffffff;">#JobCategory#</strong></td>
                        </tr>
						<tr>
						  <td><strong>Term</strong></td>
					      <td><strong>Member Price</strong></td>
						  <td><strong>Non-Member Price</strong></td>
					    </tr>
						 <cfoutput>
							<tr bgcolor="##ffffff">
							  <td>#ProductName#</td>
							  <td>#DollarFormat(MemberPrice)#</td>
							  <td>#DollarFormat(NonMemberPrice)#</td>
							</tr>
						 </cfoutput>
						  <tr bgcolor="##ffffff"><td colspan=3>&nbsp;</td></tr>
					   </cfoutput>	
                     </table>
                  </td>
				</tr>
				<tr><td>&nbsp;</td></tr>
				<tr><td class="regtext">Questions? Contact Dean Comber at 630-376-1911</td></tr>
		       </table>
			   <br><br>
		 </td>
     </tr>
</table>  

<cfmodule template="#Application.Footer#">