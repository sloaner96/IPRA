<cfquery name="GetIPRAProducts" datasource="#Application.dsn#">
  Select ItemID, ItemCode, ItemCodeInt
  From CoopProducts
  order By GroupID, CatID
</cfquery>


<cfdump var="#GetIPRAProducts#">
<font face = "Arial" size="-2">
<!--- <cfoutput query="GetIPRAProducts">

    <cfset ThisItemCode = GetIPRAProducts.ItemCode>
	<cfset ItemLength = Len(ThisItemCode)>
	

	<cfif ItemLength EQ 4>
	  <cfset ThisItemInt = Right(ThisItemCode, 3)>
	<cfelseif ItemLength EQ 5>
	  <cfset ThisItemInt = Right(ThisItemCode, 4)>
	</cfif>
	

	<cfquery name="GetProducts" datasource="#Application.dsn#">
	  Update dbo.CoopProducts
	  Set ItemCodeInt = #ThisItemInt#
	  Where ItemID = #GetIPRAProducts.ItemID#
	</cfquery>
</cfoutput> --->
</font>