<cfsetting enablecfoutputonly="YES">
<cfparam name="attributes.Server" default="REQ">
<cfparam name="attributes.SJName" default="REQ">
<cfparam name="attributes.Email" default="REQ">
<cfparam name="attributes.StreetAddress" default="REQ">
<cfparam name="attributes.City" default="REQ">
<cfparam name="attributes.State" default="REQ">
<cfparam name="attributes.Zipcode" default="REQ">
<cfparam name="attributes.OrderNumber" default="REQ">
<cfparam name="attributes.AccountNumber" default="REQ">
<cfparam name="attributes.Month" default="REQ">
<cfparam name="attributes.Year" default="REQ">
<cfparam name="attributes.SerialNumber" default="REQ">
<cfparam name="attributes.Transactionamount" default="REQ">
<cfparam name="attributes.OrderString" default="REQ">
<cfparam name="attributes.ShipToPhone" default="REQ">

<cfhttp url="https://#attributes.Server#" method="POST" useragent="Mozilla/4.0 (compatible; MSIE 6.01; Windows NT 5.0)">
	<cfhttpparam type="Formfield" value="#Attributes.SJNAME#" name="SJNAME">
	<cfhttpparam type="Formfield" value="#Attributes.Email#" name="Email">
	<cfhttpparam type="Formfield" value="#Attributes.StreetAddress#" name="StreetAddress">
	<cfhttpparam type="Formfield" value="#Attributes.City#" name="City">
	<cfhttpparam type="Formfield" value="#Attributes.State#" name="State">
	<cfhttpparam type="Formfield" value="#Attributes.ZipCode#" name="ZipCode">
	<cfhttpparam type="Formfield" value="#Attributes.OrderNumber#" name="OrderNumber">
	<cfhttpparam type="Formfield" value="#Attributes.AccountNumber#" name="AccountNumber">
	<cfhttpparam type="Formfield" value="#Attributes.Month#" name="Month">
	<cfhttpparam type="Formfield" value="#Attributes.Year#" name="Year">
	<cfhttpparam type="Formfield" value="#Attributes.SerialNumber#" name="SerialNumber">
	<cfhttpparam type="Formfield" value="#Attributes.TransactionAmount#" name="TransactionAmount">
	<cfhttpparam type="Formfield" value="#Attributes.OrderString#" name="OrderString">
	<cfhttpparam type="Formfield" value="#Attributes.ShipToPhone#" name="ShipToPhone">
</cfhttp>


<cfset Caller.TransInfo	 = "#Attributes.AccountNumber#" & "-" & "#Attributes.Month#/#Attributes.Year#" & "-" & "#Attributes.TransactionAmount#">

<cfset Response = cfhttp.filecontent>

 <cfoutput>
	<cfset LoopAround = 1>
	<cfset FileBack = ReplaceNocase(CFHTTP.FileContent, '",', '"|', 'ALL')>
	
	<cfloop index="i" list="#FileBack#" delimiters="#Chr(13)##Chr(10)#">
	   <cfloop index="x" from="1" to="#ListLen(i, "|")#">
		  <cfif LoopAround EQ 1>
			 <cfset Header = i>
			 
		  <cfelse>
		      <cfset ResContent = i>
			  
	      </cfif>
	   </cfloop><br>
	   <cfset loopAround = LoopAround +1>
	</cfloop> 
</cfoutput> 

<cfif Find(",", CFHTTP.FileContent) eq 0>
	<cfset Caller.Response.Authcode 			=   "EMPTY">
	<cfset Caller.Response.SerialNumber 		=	"">
	<cfset Caller.Response.TransAmount 			=	"">
	<cfset Caller.Response.AuthDeclinedMessage 	=	"An internal processing problem has occurred during your transaction.  Nothing has been charged to your credit card.  Please try again later.">
	<cfset Caller.Response.AVSResponseCode 		=	"">
	<cfset Caller.Response.AVSResponseMessage 	=	"">
	<cfset Caller.Response.orderNumber 			=	"">
	<cfset Caller.Response.AuthResponseCode 	=	"">
	<cfset Caller.Response.ISApproved 			=	"0">
	<cfset Caller.Response.CVV2ResponseCode 	=	"">
	<cfset Caller.Response.CVV2ReponseMessage 	=	"">
	<cfset Caller.Response.ReturnCode 			=	"4">
	<cfset Caller.Response.TransFileName 	 	=	"0">
	<cfset Caller.Response.CAVVResponseCode 	=	"">

<cfelse>
     
	<cfset Caller.Response.Authcode 			=   "#ReplaceNocase(ListGetAt(ResContent, 1, "|"), '"', '', 'ALL')#">
	<cfset Caller.Response.SerialNumber 		=	"#ReplaceNocase(ListGetAt(ResContent, 2, "|"), '"', '', 'ALL')#">
	<cfset Caller.Response.TransAmount 			=	"#ReplaceNocase(ListGetAt(ResContent, 3, "|"), '"', '', 'ALL')#">
	<cfset Caller.Response.AuthDeclinedMessage 	=	"#ReplaceNocase(ListGetAt(ResContent, 4, "|"), '"', '', 'ALL')#">
	<cfset Caller.Response.AVSResponseCode 		=	"#ReplaceNocase(ListGetAt(ResContent, 5, "|"), '"', '', 'ALL')#">
	<cfset Caller.Response.AVSResponseMessage 	=	"#ReplaceNocase(ListGetAt(ResContent, 6, "|"), '"', '', 'ALL')#">
	<cfset Caller.Response.orderNumber 			=	"#ReplaceNocase(ListGetAt(ResContent, 7, "|"), '"', '', 'ALL')#">
	<cfset Caller.Response.AuthResponseCode 	=	"#ReplaceNocase(ListGetAt(ResContent, 8, "|"), '"', '', 'ALL')#">
	<cfset Caller.Response.ISApproved 			=	"#ReplaceNocase(ListGetAt(ResContent, 9, "|"), '"', '', 'ALL')#">
	<cfset Caller.Response.CVV2ResponseCode 	=	"#ReplaceNocase(ListGetAt(ResContent, 10, "|"), '"', '', 'ALL')#">
	<cfset Caller.Response.CVV2ReponseMessage 	=	"#ReplaceNocase(ListGetAt(ResContent, 11, "|"), '"', '', 'ALL')#">
	<cfset Caller.Response.ReturnCode 			=	"#ReplaceNocase(ListGetAt(ResContent, 12, "|"), '"', '', 'ALL')#">
	<cfset Caller.Response.TransFileName 	 	=	"#ReplaceNocase(ListGetAt(ResContent, 13, "|"), '"', '', 'ALL')#">
	<cfset Caller.Response.CAVVResponseCode 	=	"#ReplaceNocase(ListGetAt(ResContent, 14, "|"), '"', '', 'ALL')#">
    
	<cfif Caller.Response.ReturnCode LT 1>
	  <cfquery name="GetAuthError" datasource="#Application.dsn#">
	     Select CodeDesc
		 From Lookup
		 Where CodeGroup = 'SJERROR'
		 AND codeValue = '#Caller.Response.ReturnCode#'
	  </cfquery>
	  <cfset Caller.Response.AuthDeclinedMessage2 	=	"#GetAuthError.CodeDesc#">
	</cfif>
</cfif>


<cfif Caller.Response.ReturnCode LT 1>
	<CFMODULE Template="#Application.TagDir#/AuditLog.cfm" 
	          Action="Authorize" 
			  Message="SkipJack Error While Processing: #ReplaceNocase(ResContent, '"', '', 'ALL')#">
</cfif>
<cfsetting enablecfoutputonly="No">