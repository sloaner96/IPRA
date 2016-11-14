  
<!--- Get My Current order items --->
<cfset MyOrderItems = request.CoopComponent.getAllOrderItems(url.OrderID)>


<cfsavecontent variable="ReportData">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>IPRA Cooperative Purchase Order</title>
	<style>
	  .Grouphead{
	  	border : 1px solid #9dabc4;
	  }
	  .Sectionhead{
	  	border : 1px solid #006699;
	  }
	  .CatTotal{
	  	background-color : Gray;
	  }
	  .GroupTotal{
	  	background-color : Silver;
	  }
</style>
</head>

<body>
<table border="0" cellpadding="3" cellspacing="1" width="100%">
 <tr>
   <td align="Center" colspan="7"><strong  style="color:##009966; font-family: tahoma; font-size:12pt;">IPRA Cooperative Purchase Order Confirmation</strong></td>
 </tr>
 
<cfif MyOrderItems.recordcount GT 0>
<cfif MyOrderItems.AgencyName NEQ "">
 <cfoutput>
 <tr>
   <td colspan="7" align="Center" ><h3 style="font-family:Tahoma; font-size:10pt;">Agency: #MyOrderItems.AgencyName#</h3></td>
 </tr>
 </cfoutput>
</cfif>
<cfset ordertotal = 0>

	<cfoutput query="MyOrderItems" group="GroupID"> 
		<cfset Grouptotal = 0>
		<tr  style="font-family: sans-serif; font-size:8pt;">
			<td colspan="8" class="Grouphead"><strong style="font-family: sans-serif; font-size:14px;padding-left:5px;padding-top:5px;padding-bottom:5px;">#MyOrderItems.GroupName#</strong></td>
		</tr>
		<cfset CategoryTotal = 0>
		<cfoutput group="CatID">
		  <tr  style="font-family: sans-serif; font-size:8pt;">
			<td colspan="8" class="Sectionhead"><strong style="font-family: sans-serif; font-size:11px; padding-left:20px;padding-top:5px;padding-bottom:5px;">#MyOrderItems.CategoryName#</strong></td>
		  </tr>
		
		<tr style="font-family: sans-serif; font-size:8pt;">
		  <td><strong style="font-family: sans-serif; font-size:8pt;">Item ID</strong></td>
		  <td><strong style="font-family: sans-serif; font-size:8pt;">Product Name</strong></td>
		  <td><strong style="font-family: sans-serif; font-size:8pt;">Unit of Measure</strong></td>
		  <td align="center"><strong style="font-family: sans-serif; font-size:8pt;">Previous Cost</strong></td>
		  <td align="center"><strong style="font-family: sans-serif; font-size:8pt;">Current Cost</strong></td>
		  <td align="center"><strong style="font-family: sans-serif; font-size:8pt;">Order Quantity</strong></td>
		  <td align="center"><strong style="font-family: sans-serif; font-size:8pt;">Total Cost</strong></td>
		</tr>
		<cfoutput> 
		<cfset CategoryTotal = CategoryTotal + (numberformat(MyOrderItems.CurrentCost, 0.00) * Quantity)>
		<cfset TotalItemCost = (numberformat(MyOrderItems.CurrentCost, 0.00) * MyOrderItems.Quantity)>
		<tr style="font-family: sans-serif; font-size:8pt;">
		   <td valign="top">#MyOrderItems.ItemCode#</td>
		   <td valign="top"><strong>#MyOrderItems.ItemName#</strong></td>
		   <td valign="top">#MyOrderItems.UnitofMeasure#</td>
		   <td align="right" valign="top">#DollarFormat(MyOrderItems.PreviousCost)#</td>
		   <td align="right" valign="top">#DollarFormat(MyOrderItems.CurrentCost)#</td>
		   <td align="Center" valign="top" bgcolor="##eeeeee;">#MyOrderItems.Quantity#</td>
		   <td align="right">#Dollarformat(TotalItemCost)#</td>
		</tr> 
		<tr>
		  <td>&nbsp;</td>
		  <td colspan="7" style="font-family:san-serif; font-size:8pt;">#MyOrderItems.ItemDesc#</td>
		</tr>
		</cfoutput>
		
		<tr>
		   <td colspan="7" align="right"><hr size="1" noshade><strong style="font-family: sans-serif; font-size:10pt;">Category Total:</strong> <font face="arial" size="-2">#DollarFormat(CategoryTotal)#</font></td>
		</tr>
		<cfset OrderTotal = (OrderTotal + CategoryTotal)>
		<cfset Grouptotal = (GroupTotal + CategoryTotal)>
		</cfoutput>	
		<tr>
		   <td colspan="8" align="right"><strong style="font-family: sans-serif; font-size:10pt;">Group Total:</strong> <font face="arial" size="-2">#DollarFormat(Grouptotal)#</font></td>
		</tr>
		<tr>
		  <td colspan="8">&nbsp;</td>
		</tr>
	</cfoutput>

<cfoutput>
<tr>
<td colspan="8" align="right"><hr><hr><strong style="font-family: sans-serif; font-size:10pt;">Order Total:</strong> <font face="arial" size="-2">#DollarFormat(OrderTotal)#</font></td>
</tr>
</cfoutput>
<cfelse>
<tr>
<td align="center"><strong>You do not currently have any products in your order.<br><br>Click "Add New Items" above to Add items to your order</strong></td>
</tr>
</cfif>
</table>
</body>
</html>
</cfsavecontent>
<!--- <cfreport template="IPRAOrderReport.cfr" format="PDF" query="MyOrderItems"/> --->
<cfdocument  format="PDF" pagetype="letter" orientation="portrait" unit="in" encryption="none" fontembed="Yes" backgroundvisible="Yes"><cfoutput>#ReportData#</cfoutput></cfdocument>
