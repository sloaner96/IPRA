<cfcomponent displayname="Payment">
 
	<!--- Create Instance Structure --->
	<cfset instance = StructNew()>
	
	<!--- Set Datasource --->
	<cfif IsDefined("Application.dsn")>
	  <cfset Instance.IpraDSN = Application.dsn>
	
	<cfelse>
	  <cfset Instance.IpraDSN = "ILIPRA">
	</cfif>
	
	<!--- Set Lock Name --->
	<cfset Instance.Lock = "Payment_lock">
	
	<cfset Instance.EnKey = "IPRA13105xY">
	<!--- Initialize --->
	<cfset init()> 
	
	<!--- ********************
	  Set Initialization 
	 **********************--->
	<cffunction name="init" returnType="Void" access="Private" output="false">
	  <cfset Initialized = True>
	</cffunction>

	<!--- ********************
	  Set Initialization 
	 **********************--->
	<cffunction name="ProcessSkipJack" returnType="Struct" access="public" output="false">
	    <cfargument name="server" type="string" required="Yes">
		<cfargument name="SJName" type="string" required="Yes">
		<cfargument name="Email" type="string" required="Yes">
		<cfargument name="StreetAddress" type="string" required="Yes">
		<cfargument name="City" type="string" required="Yes">
		<cfargument name="state" type="String" required="Yes">
		<cfargument name="ZipCode" type="string" required="Yes">
		<cfargument name="OrderNumber" type="string" required="Yes">
		<cfargument name="AccountNumber" type="numeric" required="Yes">
		<cfargument name="Month" type="numeric" required="Yes">
		<cfargument name="Year" type="numeric" required="Yes">
		<cfargument name="SerialNumber" type="numeric" required="Yes">
		<cfargument name="TransactionAmount" type="string" required="yes">
		<cfargument name="orderString" type="string" required="Yes">
		<cfargument name="ShipToPhone" type="string" required="yes">
		
		
		<cfhttp url="https://#arguments.Server#" method="POST" useragent="Mozilla/4.0 (compatible; MSIE 6.01; Windows NT 5.0)">
			<cfhttpparam type="Formfield" value="#arguments.SJNAME#" name="SJNAME">
			<cfhttpparam type="Formfield" value="#arguments.Email#" name="Email">
			<cfhttpparam type="Formfield" value="#arguments.StreetAddress#" name="StreetAddress">
			<cfhttpparam type="Formfield" value="#arguments.City#" name="City">
			<cfhttpparam type="Formfield" value="#arguments.State#" name="State">
			<cfhttpparam type="Formfield" value="#arguments.ZipCode#" name="ZipCode">
			<cfhttpparam type="Formfield" value="#arguments.OrderNumber#" name="OrderNumber">
			<cfhttpparam type="Formfield" value="#arguments.AccountNumber#" name="AccountNumber">
			<cfhttpparam type="Formfield" value="#arguments.Month#" name="Month">
			<cfhttpparam type="Formfield" value="#arguments.Year#" name="Year">
			<cfhttpparam type="Formfield" value="#arguments.SerialNumber#" name="SerialNumber">
			<cfhttpparam type="Formfield" value="#arguments.TransactionAmount#" name="TransactionAmount">
			<cfhttpparam type="Formfield" value="#arguments.OrderString#" name="OrderString">
			<cfhttpparam type="Formfield" value="#arguments.ShipToPhone#" name="ShipToPhone">
		</cfhttp>
		
		
		<cfset TransInfo	 = "#arguments.AccountNumber#" & "-" & "#arguments.Month#/#arguments.Year#" & "-" & "#arguments.TransactionAmount#">
		
		
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
		
		<cfset response = structNew()>
		<cfif Find(",", CFHTTP.FileContent) eq 0>
			<cfset Response.Authcode 			=   "EMPTY">
			<cfset Response.SerialNumber 		=	"">
			<cfset Response.TransAmount 			=	"">
			<cfset Response.AuthDeclinedMessage 	=	"An internal processing problem has occurred during your transaction.  Nothing has been charged to your credit card.  Please try again later.">
			<cfset Response.AVSResponseCode 		=	"">
			<cfset Response.AVSResponseMessage 	=	"">
			<cfset Response.orderNumber 			=	"">
			<cfset Response.AuthResponseCode 	=	"">
			<cfset Response.ISApproved 			=	"0">
			<cfset Response.CVV2ResponseCode 	=	"">
			<cfset Response.CVV2ReponseMessage 	=	"">
			<cfset Response.ReturnCode 			=	"4">
			<cfset Response.TransFileName 	 	=	"0">
			<cfset Response.CAVVResponseCode 	=	"">
		
		<cfelse>
		     
			<cfset Response.Authcode 			=   "#ReplaceNocase(ListGetAt(ResContent, 1, "|"), '"', '', 'ALL')#">
			<cfset Response.SerialNumber 		=	"#ReplaceNocase(ListGetAt(ResContent, 2, "|"), '"', '', 'ALL')#">
			<cfset Response.TransAmount 			=	"#ReplaceNocase(ListGetAt(ResContent, 3, "|"), '"', '', 'ALL')#">
			<cfset Response.AuthDeclinedMessage 	=	"#ReplaceNocase(ListGetAt(ResContent, 4, "|"), '"', '', 'ALL')#">
			<cfset Response.AVSResponseCode 		=	"#ReplaceNocase(ListGetAt(ResContent, 5, "|"), '"', '', 'ALL')#">
			<cfset Response.AVSResponseMessage 	=	"#ReplaceNocase(ListGetAt(ResContent, 6, "|"), '"', '', 'ALL')#">
			<cfset Response.orderNumber 			=	"#ReplaceNocase(ListGetAt(ResContent, 7, "|"), '"', '', 'ALL')#">
			<cfset Response.AuthResponseCode 	=	"#ReplaceNocase(ListGetAt(ResContent, 8, "|"), '"', '', 'ALL')#">
			<cfset Response.ISApproved 			=	"#ReplaceNocase(ListGetAt(ResContent, 9, "|"), '"', '', 'ALL')#">
			<cfset Response.CVV2ResponseCode 	=	"#ReplaceNocase(ListGetAt(ResContent, 10, "|"), '"', '', 'ALL')#">
			<cfset Response.CVV2ReponseMessage 	=	"#ReplaceNocase(ListGetAt(ResContent, 11, "|"), '"', '', 'ALL')#">
			<cfset Response.ReturnCode 			=	"#ReplaceNocase(ListGetAt(ResContent, 12, "|"), '"', '', 'ALL')#">
			<cfset Response.TransFileName 	 	=	"#ReplaceNocase(ListGetAt(ResContent, 13, "|"), '"', '', 'ALL')#">
			<cfset Response.CAVVResponseCode 	=	"#ReplaceNocase(ListGetAt(ResContent, 14, "|"), '"', '', 'ALL')#">
		    
			<cfif Response.ReturnCode LT 1>
			  <cfquery name="GetAuthError" datasource="#Instance.IpraDSN#">
			     Select CodeDesc
				 From Lookup
				 Where CodeGroup = 'SJERROR'
				 AND codeValue = '#Response.ReturnCode#'
			  </cfquery>
			  <cfset Response.AuthDeclinedMessage2 	=	"#GetAuthError.CodeDesc#">
			</cfif>
		</cfif>
		
		
		<cfif Response.ReturnCode LT 1>
			<CFMODULE Template="/ipra/AuditLog.cfm" 
			          Action="Authorize" 
					  Message="SkipJack Error While Processing: #ReplaceNocase(ResContent, '"', '', 'ALL')#">
		</cfif>
	    <cfreturn Response />
	</cffunction>
	
	<!--- ********************
	  Set ProcessPurchaseOrder 
	 **********************--->
	<cffunction name="ProcessPurchaseOrder" returnType="Void" access="public" output="false">
	  <cfset Initialized = True>
	</cffunction>
	

	<!--- ********************
	 Create Transaction Record 
	 **********************--->
	<cffunction name="CreateTransaction" returnType="Void" access="public" output="false">
	        <cfargument name="MemberID" type="numeric" required="Yes">
			<cfargument name="registerID" type="numeric" required="Yes">
			<cfargument name="OrderNum" type="string" required="Yes">
			<cfargument name="TransType" type="string" required="Yes">
			<cfargument name="PurchaseCode" type="string" required="Yes">
			<cfargument name="CardHolder" type="String" required="Yes">
			<cfargument name="CardAddress" type="string" required="Yes">
			<cfargument name="CardCity" type="string" required="Yes">
			<cfargument name="CardState" type="string" required="Yes">
			<cfargument name="CardZip" type="string" required="Yes">
			<cfargument name="TransAmount" type="numeric" required="yes">
			
			<cfargument name="CardNbr" type="String" required="No">
			<cfargument name="CardType" type="string" required="No">
			<cfargument name="CardExpMonth" type="numeric" required="No">
			<cfargument name="CardExpyear" type="numeric" required="No">
			<cfargument name="Status" type="string" required="No">
			<cfargument name="AuthResponse" type="string" required="No">
			<cfargument name="AuthTransID" type="string" required="No">
			<cfargument name="AuthDate" type="date" required="No">
			
			 <cfargument name="PONUmber" type="string" required="No">
			
			
		 <cfquery name="createTrans" datasource="#Instance.IpraDSN#">
		     Insert Into Transactions (
			 	MemberID,
				RegisterID,
				OrderNum,
				TransType,
				PurchaseCode,
				CardHolder,
				CardAddress,
				CardCity,
				CardState,
				CardZip,
				Amount,
				<cfif Arguments.TransType EQ "CREDIT">
					Status,
					CardNbr,
					CardType,
					CardExpMonth,
					CardExpYear,
					AuthResponse,
					AuthTransID,
				<cfelseif Arguments.TransType EQ "PO">
					PONumber,
				</cfif>
				DateAuthorized
			 )
			 Values(
			   	#Arguments.MemberID#,
				#Arguments.registerID#,
			   	'#Arguments.OrderNum#',
			   	'#Arguments.TransType#',
				'#Arguments.PurchaseCode#',
				'#Arguments.CardHolder#',
				'#Arguments.CardAddress#',
				'#Arguments.CardCity#',
				'#Arguments.CardState#',
				'#Arguments.CardZip#',
				#Arguments.TransAmount#,
			<cfif Arguments.TransType EQ "CREDIT">
			    '#Arguments.Status#',
				'#Arguments.CardNbr#',
				'#Arguments.CardType#',
				#Arguments.CardExpMonth#,
				#Arguments.CardExpyear#,
				'#Arguments.AuthResponse#',
				'#Arguments.AuthTransID#',
			<cfelseif Arguments.TransType EQ "PO">
			   	'#Arguments.PONUmber#',
			</cfif>
			   #CreateODBCDateTime(Arguments.AuthDate)#
			 )
		  </cfquery>
	</cffunction>	
	
	<!--- 
	   Get The TransactionID from the OrderNumber
	 --->
	<cffunction name="GetTransactionID" access="public" returntype="numeric">
	  <cfargument name="OrderNum" type="string" required="YES">
	  <cfquery name="getTrans" datasource="#Instance.IpraDSN#">
	    Select TransID
		From Transactions
		Where OrderNum = '#Arguments.OrderNum#'
	  </cfquery>
	  
	  <cfreturn  getTrans.TransID />
	</cffunction>
	
		<!--- 
	   Get The TransactionInfo from the OrderNumber
	 --->
	<cffunction name="getTransactionInfo" access="public" returntype="query">
	  
	  <cfargument name="OrderNum" type="string" required="YES">
	  <cfargument name="Enckey" type="string" required="YES">
	  <cfargument name="MemberID" type="numeric" required="YES">
	  
	  <cfif Compare(Arguments.EncKey, Instance.EnKey) EQ 0>
	  <cfquery name="getTrans" datasource="#Instance.IpraDSN#">
	    Select ORDERNUM, TransType, PONumber, CardType, CardNbr, CardExpMonth, CardExpYear
		From Transactions
		Where OrderNum = '#Arguments.OrderNum#'
		AND MemberID = #Arguments.MemberID#
	  </cfquery>
	    <cfif getTrans.RecordCount GT 0>
		  <cfset getTransInfo = QueryNew('ORDERNUM, TransType, PONumber, CardType, CardNbr, CardExpMonth, CardExpYear')>
		  <cfset temp = QueryAddRow(getTransInfo)>
		  <cfset temp = QuerySetCell(getTransInfo, 'ORDERNUM', getTrans.ORDERNUM)>
		  <cfset temp = QuerySetCell(getTransInfo, 'TransType',getTrans.TransType)>
		  <cfset temp = QuerySetCell(getTransInfo, 'PONumber', getTrans.PONumber)>
		  <cfset temp = QuerySetCell(getTransInfo, 'CardType', getTrans.CardType)>
		  <cfif Len(Trim(getTrans.CardNbr)) GT 4>
		    <cfset temp = QuerySetCell(getTransInfo, 'CardNbr', CCEscape(getTrans.CardNbr))>
		  <cfelse>
		    <cfset temp = QuerySetCell(getTransInfo, 'CardNbr', getTrans.CardNbr)> 
		  </cfif>
		  <cfset temp = QuerySetCell(getTransInfo, 'CardExpMonth', getTrans.CardExpMonth)>
		  <cfset temp = QuerySetCell(getTransInfo, 'CardExpYear', getTrans.CardExpYear)>
		<cfelse>
		  <cfset getTransInfo = QueryNew('ORDERNUM, TransType, PONumber, CardType, CardNbr, CardExpMonth, CardExpYear')>
		</cfif>
	  <cfelse>
	    <cfset getTransInfo = QueryNew('ORDERNUM, TransType, PONumber, CardType, CardNbr, CardExpMonth, CardExpYear')>
		<cfset temp = QueryAddRow(getTransInfo)>
		<cfset temp = QuerySetCell(getTransInfo, 'ORDERNUM', '00000')>
		<cfset temp = QuerySetCell(getTransInfo, 'TransType', '00000')>
		<cfset temp = QuerySetCell(getTransInfo, 'PONumber', '00000')>
		<cfset temp = QuerySetCell(getTransInfo, 'CardType', '0VOID')>
		<cfset temp = QuerySetCell(getTransInfo, 'CardNbr', '0000000000000000')>
		<cfset temp = QuerySetCell(getTransInfo, 'CardExpMonth', '01')>
		<cfset temp = QuerySetCell(getTransInfo, 'CardExpYear', '99')>
	  </cfif>
	  <cfreturn  getTransInfo />
	</cffunction>
	
	<!--- 
	   Create a Unique OrderNumber
	 --->
	<cffunction name="createOrderNumber" access="public" returntype="string">
	   <cfargument name="orderType" type="string" required="yes">
	   <cfset OrderNumber = "#Arguments.orderType#-#RandRange(1,9)##RandRange(1,9)##chr(RandRange(65,90))##RandRange(1,9)##chr(RandRange(65,90))#">
	  <cfreturn orderNumber />
	</cffunction>
	
	<!--- 
	   Get The Distinct Payment Types
	 --->
	<cffunction name="GetPayType" access="public" returntype="Query">
	  <cfquery name="PayType" datasource="#Instance.IpraDSN#" cachedwithin="#CreateTimeSpan(0,0,10,0)#">
	     Select *
	      From Lookup
	       Where CodeGroup = 'Paytype'
	       Order By Ranking, Codevalue, CodeDesc
	  </cfquery>
	  <cfreturn PayType />
    </cffunction>
	
	<!--- 
	   Get The Distinct Credit Card Types Accepted
	 --->
	<cffunction name="getCCards" access="public" returntype="Query">
			  <cfquery name="CCards" datasource="#Instance.IpraDSN#" cachedwithin="#CreateTimeSpan(0,0,10,0)#">
				SELECT * From Lookup
					WHERE CodeGroup = 'CCTYPE'
					ORDER By Ranking, CodeDesc
			</cfquery>
		<cfreturn CCards />	
     </cffunction>
    
	<!--- 
	   Get The Months
	 --->
	 <cffunction name="GetMonths" access="public" returntype="Query">
			<cfquery name="Months" datasource="#Instance.IpraDSN#" cachedwithin="#CreateTimeSpan(0,0,10,0)#">
				SELECT * From Lookup
					WHERE CodeGroup = 'MONTH'
					ORDER By CodeValue
			</cfquery>
		<cfreturn Months />	
     </cffunction>
    
	<!--- 
	   Get The Distinct States
	 --->
	 <cffunction name="GetState" access="public" returntype="Query">
			<cfquery name="States" datasource="#Instance.IpraDSN#" cachedwithin="#CreateTimeSpan(0,0,10,0)#">
			     Select CodeDesc, CodeValue
			     From Lookup
			     Where CodeGroup = 'STATE'
			     Order BY CodeDesc
			</cfquery> 
			
			<cfreturn States />
     </cffunction>
	 
	 <cffunction name="CCEscape" access="Public" returntype="String">
	   <cfargument name="ccstring" type="string" required="yes">
	      
	      <cfscript>
		    var CleanString = "";
			CleanString = RepeatString("*",val(Len(ccstring)-4))&Right(ccstring,4);
	      </cfscript>
	    <cfreturn CleanString />
	 </cffunction>
</cfcomponent>
