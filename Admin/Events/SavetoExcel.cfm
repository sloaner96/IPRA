<cfparam name="attributes.query" default="" type="query">
<cfparam name="attributes.file" default="" type="string">

<cfsavecontent variable="Excelfile">
<cfif IsQuery(Attributes.Query)>
   <table border="1" cellpadding="0" cellspacing="1" width="100%">
	<tr>
	  <th>EventID</th>
	  <th>EventName</th>
	  <th>BeginDate</th>
	  <th>Firstname</th>
	  <th>Lastname</th>
	  <th>Company</th>
	  <th>RegisterID</th>
	  <th>TransID</th>
	  <th>TransType</th>
	  <th>PurchaseCode</th>
	  <th>PONumber</th>
	  <th>CardHolder</th>
	  <th>DateAuthorized</th>
	  <th>CardType</th>
	  <th>Amount</th>
	  <th>EvntQty</th>
	  <th>DetailLabel</th>
	  <th>DetailCost</th>
	  <th>TotalRegistrations</th>
	</tr> 
    <cfoutput query="attributes.query">
		<tr>
	      <td>#attributes.query.EventID#</td>
		  <td>#attributes.query.EventName#</td>
		  <td>#DateFormat(attributes.query.BeginDate, 'mm/dd/yyyy')#</td>
		  <td>#attributes.query.Firstname#</td>
		  <td>#attributes.query.Lastname#</td>
		  <td>#attributes.query.Company#</td>
		  <td>#attributes.query.RegisterID#</td>
		  <td>#attributes.query.TransID#</td>
		  <td>#attributes.query.TransType#</td>
		  <td>#attributes.query.PurchaseCode#</td>
		  <td>#attributes.query.PONumber#</td>
		  <td>#attributes.query.CardHolder#</td>
		  <td>#DateFormat(attributes.query.DateAuthorized, 'mm/dd/yyyy')# #TimeFormat(attributes.query.DateAuthorized, 'hh:MM tt')#</td>
		  <td>#attributes.query.CardType#</td>
		  <td>#DollarFormat(attributes.query.Amount)#</td>
		  <td>#attributes.query.EvntQty#</td>
		  <td>#attributes.query.DetailLabel#</td>
		  <td>#DollarFormat(attributes.query.DetailCost)#</td>
		  <td>#attributes.query.TotalRegistrations#</td>
	    </tr>
	</cfoutput>
   </table>           
</cfif>
</cfsavecontent>

<cffile action="WRITE" 
   file="#attributes.File#" 
   output="#ExcelFile#" 
   addnewline="Yes" 
   fixnewline="No">