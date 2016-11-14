<cfcomponent displayname="Coop">
		
		<!--- Create Instance Structure --->
		<cfset instance = StructNew()>
		
		<!--- Set Datasource --->
		<cfset Instance.IpraDSN = "ILIPRA">
		
		<!--- Set Lock Name --->
		<cfset Instance.Lock = "coop_lock">
		
		<!--- Initialize --->
		<cfset init()> 
		
		<!--- ********************
		  Set Initialization 
		 **********************--->
		<cffunction name="init" returnType="Void" access="Private" output="false">
		  <cfset Initialized = True>
		</cffunction>
		
<!--- /////////////////////////////////////////////
		  Get Coop Configuration, 
		  This will be set into a Session Variable
////////////////////////////////////////////////--->	
    	<!--- ********************
	  Get Coop Configuration, 
	 **********************--->
		<cffunction name="getCoopConfigByID" returnType="Query" access="Public">
			  <cfargument name="ConfigID" type="Numeric" required="Yes">
			  
			  <cfquery name="getConfigbyID" datasource="#Instance.IpraDSN#">
			    Select *
				From CoopConfig
				Where ConfigID = #Arguments.ConfigID#
			  </cfquery>
			  <cfreturn getConfigbyID />
		</cffunction>
		
	<!--- ********************
	  Get Coop Configuration, 
	  This will be set into a Session Variable
	 **********************--->
		<cffunction name="getCoopConfig" returnType="Query" access="Public">
			  <cfargument name="thisDate" type="date" required="Yes">
			  <cfquery name="getConfig" datasource="#Instance.IpraDSN#">
			    Select *
				From CoopConfig
				Where CoopEnrollmentBegin <= #CreateODBCDateTime(arguments.thisdate)#
				AND CoopEndDate >= #CreateODBCDateTime(arguments.thisdate)#
			  </cfquery>
			  <cfreturn getConfig />
		</cffunction>
		
   <!--- ********************
	  Get Coop Configuration, 
	  This will be set into a Session Variable
	 **********************--->
		<cffunction name="getAllConfigs" returnType="Query" access="Public">
			  <cfquery name="getAllConfig" datasource="#Instance.IpraDSN#">
			    Select *
				From CoopConfig
				order by CoopYear
			  </cfquery>
			  <cfreturn getAllConfig />
		</cffunction>
		
	 <!--- ********************
	  Get Coop Configuration, 
	  This will be set into a Session Variable
	 **********************--->
		<cffunction name="getFutureConfigs" returnType="Query" access="Public">
			  <cfargument name="thisDate" type="date" required="Yes">
			  <cfquery name="getFConfig" datasource="#Instance.IpraDSN#">
			    Select *
				From CoopConfig
				Where CoopEnrollmentBegin >= #CreateODBCDateTime(arguments.thisdate)#
				AND CoopEndDate >= #CreateODBCDateTime(arguments.thisdate)#
			  </cfquery>
			  <cfreturn getFConfig />
		</cffunction>	
		 <!--- ********************
	  Get Coop Configuration, 
	  This will be set into a Session Variable
	 **********************--->
		<cffunction name="getPastConfigs" returnType="Query" access="Public">
			  <cfargument name="thisDate" type="date" required="Yes">
			  <cfquery name="getFConfig" datasource="#Instance.IpraDSN#">
			    Select *
				From CoopConfig
				Where CoopEnrollmentBegin < #CreateODBCDateTime(arguments.thisdate)#
				AND CoopEndDate < #CreateODBCDateTime(arguments.thisdate)#
				Order By CoopYear desc
			  </cfquery>
			  <cfreturn getFConfig />
		</cffunction>	
	<!--- ********************
	  Add Coop Configuration, 
	  This will be set into a Session Variable
	 **********************--->
		<cffunction name="AddCoopConfig" returnType="void" access="Public">
		    <cfargument name="CoopEnrollmentBegin" required="yes" type="date" >
			<cfargument name="CoopEnrollmentEnd"   required="Yes" Type="date">
			<cfargument name="orderBegin"          required="Yes" Type="date">
			<cfargument name="OrderEnd"            required="Yes" Type="date">
			<cfargument name="CoopYear"            required="Yes" Type="numeric">
			<cfargument name="CoopEndDate"         required="Yes" Type="date">
			<cfargument name="AgreementText"       required="Yes" Type="string">
			<cfargument name="AddedBy"             required="Yes" Type="numeric">
			
			
		     <cfquery name="getFConfig" datasource="#Instance.IpraDSN#">
			    Insert Into CoopConfig(
				   CoopEnrollmentBegin,
				   CoopEnrollmentEnd,
				   orderBegin,
				   OrderEnd,
				   CoopYear,
				   CoopEndDate,
				   AgreementText,
				   DateAdded,
				   AddedBy
				   )
				 VALUES(
				   #CreateOdbcDateTime(Arguments.CoopEnrollmentBegin)#,
				   #CreateOdbcDateTime(Arguments.CoopEnrollmentEnd)#,
				   #CreateOdbcDateTime(Arguments.orderBegin)#,
				   #CreateOdbcDateTime(Arguments.OrderEnd)#,
				   #Arguments.CoopYear#,
				   #CreateOdbcDateTime(Arguments.CoopEndDate)#,
				   '#Arguments.AgreementText#',
				   #CreateOdbcDateTime(now())#,
				   #Arguments.AddedBy#
				 )  
			  </cfquery>
		</cffunction>
		
	<!--- ********************
	  Update Coop Configuration, 
	  This will be set into a Session Variable
	**********************--->
		<cffunction name="UpdateCoopConfig" returnType="void" access="Public">
		    <cfargument name="ConfigID" required="yes" type="Numeric">
		    <cfargument name="CoopEnrollmentBegin" required="yes" type="date">
			<cfargument name="CoopEnrollmentEnd"   required="Yes" Type="date">
			<cfargument name="orderBegin"          required="Yes" Type="date">
			<cfargument name="OrderEnd"            required="Yes" Type="date">
			<cfargument name="CoopYear"            required="Yes" Type="numeric">
			<cfargument name="CoopEndDate"         required="Yes" Type="date">
			<cfargument name="AgreementText"       required="Yes" Type="string">
			<cfargument name="UpdateBy"            required="Yes" Type="numeric">
			
			
		     <cfquery name="getFConfig" datasource="#Instance.IpraDSN#">
			    Update CoopConfig
				 Set  CoopEnrollmentBegin = #CreateOdbcDateTime(Arguments.CoopEnrollmentBegin)#,
				   CoopEnrollmentEnd = #CreateOdbcDateTime(Arguments.CoopEnrollmentEnd)#,
				   orderBegin = #CreateOdbcDateTime(Arguments.orderBegin)#,
				   OrderEnd = #CreateOdbcDateTime(Arguments.OrderEnd)#,
				   CoopYear = #Arguments.CoopYear#,
				   CoopEndDate = #CreateOdbcDateTime(Arguments.CoopEndDate)#,
				   AgreementText = '#Arguments.AgreementText#',
				   LastUpdated = #CreateOdbcDateTime(now())#,
				   UpdatedBy = #Arguments.UpdateBy# 
				Where ConfigID = #Arguments.ConfigID# 
			  </cfquery>
		</cffunction>
<!--- /////////////////////////////////////////////
     Coop Agency Section
////////////////////////////////////////////////--->		
    <!--- ********************
	  Get Coop Registered Count 
	  This will be set into a Session Variable
	 **********************--->
		<cffunction name="getRegisteredCount" returnType="numeric" access="Public">
			  <cfargument name="CoopID" required="YES" type="Numeric">
			  
			  <cfquery name="GetRegCount" datasource="#Instance.IpraDSN#">
			    Select Count(*) as RegCount
				From CoopRegistration
				Where CoopID = #Arguments.CoopID#
			  </cfquery>
			   <cfset RegCount = getRegCount.RegCount>
			  <cfreturn RegCount />
		</cffunction>
	<!--- ********************
	  Get Registered Agencies
	  This will be set into a Session Variable
	 **********************--->
		<cffunction name="getRegisteredAgency" returnType="query" access="Public">
			  <cfargument name="CoopID" required="YES" type="Numeric">
			  
			  <cfquery name="GetRegAgencies" datasource="#Instance.IpraDSN#">
			    Select R.*, M.Firstname, M.Lastname, M.AgencyID, M.Company, M.Email,
				  (Select Count(*)
				     From CoopOrders O, CoopOrderItems I
					 Where O.OrderID = I.orderID
					 AND O.RegistrationID =  R.RegistrationID) as TotalItems,
					 
				 (Select Sum(Cost)
				     From CoopOrders CO, CoopOrderItems OI, CoopProductPrice P
					 Where CO.OrderID = OI.orderID
					 AND CO.RegistrationID =  R.RegistrationID
					 AND OI.ProductID = P.ItemID
					 AND P.CoopYearID = R.CoopID) as OrderTotal,
					 	 
				  (Select orderID
				      From CoopOrders C
					  Where C.RegistrationID =  R.RegistrationID) as OrderID,
					  
				  (Select AgencyName
				    From Agencies
					Where IPRAAgencyID = M.IPRACOID) as AgencyName	
					 
				 From CoopRegistration R, Members M
				  Where R.MemberID = M.MemberID
				  AND R.CoopID = #Arguments.CoopID#
				 Order By R.RegistrationDate, M.LastName, M.FirstName
			  </cfquery>
			   
			  <cfreturn GetRegAgencies />
		</cffunction>	
 
     <!--- get the Distinct First Letter for the vendor navigation --->
	   <cffunction name="AgencySearch" returnType="query" access="Public">
	      <cfargument name="AgencyName" Required="Yes" type="string">
			  <cfquery name="GetAg" datasource="#Instance.IpraDSN#">
			    Select Distinct M.Company, R.RegistrationID, R.MemberID, C.CoopYear
				From Members M, CoopRegistration R, CoopConfig C
				Where R.MemberID = M.MemberID
				AND R.CoopID = C.ConfigID
				AND M.Company Like '%#arguments.AgencyName#%'
				Order by Company
			  </cfquery>
			   
			  <cfreturn getag />
		</cffunction>	
		
		<!--- get the DAgency Registration Info --->
	   <cffunction name="getAgencyRegistrationInfo" returnType="query" access="Public">
	      <cfargument name="OrderID" Required="Yes" type="numeric">
			  <cfquery name="GetRegInfo" datasource="#Instance.IpraDSN#">
			    Select R.*, C.CoopYear,
				 (Select ProductName
				    From Products
					Where ProductID = R.RegEAV) as AgencyEAV	   
				From CoopRegistration R, CoopOrders O, dbo.CoopConfig C
				Where R.RegistrationID =  O.RegistrationID
				AND R.CoopID = C.ConfigID
				AND O.OrderID = #Arguments.OrderID#
			  </cfquery>
			   
			  <cfreturn GetRegInfo />
		</cffunction>	
		
		<!--- gget the AgencyInfo --->
	   <cffunction name="getAgencyInfo" returnType="query" access="Public">
	      <cfargument name="MemberID" Required="Yes" type="numeric">
			  <cfquery name="GetMemberInfo" datasource="#Instance.IpraDSN#">
			    Select M.Company, M.Firstname, M.LastName, M.MainPhone, M.Fax, M.Address1, 
				       M.Address2, M.City, M.State, M.Zipcode, M.Email   
				From Members M
				Where M.MemberID = #Arguments.MemberID#
				Order by Company
			  </cfquery>
			   
			  <cfreturn GetMemberInfo />
		</cffunction>	
		
 <!--- /////////////////////////////////////////////
     Coop Vendor Section
////////////////////////////////////////////////--->		
     
		
		<!--- Get All Vendors --->
		<cffunction name="getAllVendors" returnType="query" access="Public">
			 
			  <cfquery name="GetAllVendor" datasource="#Instance.IpraDSN#">
			    Select V.*
				From CoopVendors V
				where Removed = 0
				Order By CompanyName
			  </cfquery>
			   
			  <cfreturn GetAllVendor />
		</cffunction> 	
	   
	   <!--- Get All Active Vendors --->
		<cffunction name="getactiveVendors" returnType="query" access="Public">
			 
			  <cfquery name="GetActiveVendor" datasource="#Instance.IpraDSN#">
			    Select V.*
				From CoopVendors V
				Where isActive = 1
				AND Removed = 0
				Order By CompanyName
			  </cfquery>
			   
			  <cfreturn GetActiveVendor />
		</cffunction> 
		
		 <!--- Get All Inactive Vendors --->
		<cffunction name="getinactiveVendors" returnType="query" access="Public">
			 
			  <cfquery name="GetActiveVendor" datasource="#Instance.IpraDSN#">
			    Select V.*
				From CoopVendors V
				Where isActive = 0
				AND Removed = 0
				Order By CompanyName
			  </cfquery>
			   
			  <cfreturn GetActiveVendor />
		</cffunction> 
		
	     <!--- Get The vendors With Bids --->
		<cffunction name="GetVendorWithBids" returnType="query" access="Public">
		     <cfargument name="CoopID" type="numeric" required="Yes">
			 
			  <cfquery name="GetVendor" datasource="#Instance.IpraDSN#">
			    Select V.*
				From CoopVendors V
				Where Exists(Select Top 1 VenItemID From CoopVendorProducts 
				             Where vendorID = V.VendorID
							 And CoopID = #Arguments.CoopID#)
				order By V.CompanyName, V.VendorSince
			  </cfquery>
			   
			  <cfreturn GetVendor />
		</cffunction>	
		
			
       <!--- get the Distinct First Letter for the vendor navigation --->
	   <cffunction name="GetVendorFirstLetter" returnType="query" access="Public">
			  <cfquery name="GetVendorLetter" datasource="#Instance.IpraDSN#">
			    Select Distinct Left(CompanyName, 1) as VendorLetter
				From CoopVendors
				Where Removed = 0
				Order By 1
			  </cfquery>
			   
			  <cfreturn GetVendorLetter />
		</cffunction>	
		
		<!--- Get The vendors that Begin with the passed letter --->
		<cffunction name="GetVendorByFirstLetter" returnType="query" access="Public">
		     <cfargument name="TheLetter" type="String" required="Yes">
			 
			  <cfquery name="GetVendorLetter" datasource="#Instance.IpraDSN#">
			    Select CompanyName, VendorID
				From CoopVendors
				Where Left(CompanyName, 1) = '#Arguments.TheLetter#'
				AND Removed = 0
				order By CompanyName
			  </cfquery>
			   
			  <cfreturn GetVendorLetter />
		</cffunction>	
		
		<!--- Get All Vendors --->
		<cffunction name="getVendorCosts" returnType="query" access="Public">
			<cfargument name="prodID" type="Numeric" required="NO">
			 
			  <cfquery name="vendorCosts" datasource="#Instance.IpraDSN#">
			    Select *
				From Products
				Where productType = '09'
				<cfif IsDefined("Arguments.ProdID")>
				 AND ProductID = #Arguments.ProdID#
				</cfif>
				Order By PerUnitPrice
			  </cfquery>
			   
			  <cfreturn VendorCosts />
		</cffunction> 	
		
		<!--- Get The vendors By ID --->
		<cffunction name="GetAllVendorInfo" returnType="query" access="Public">
		     
			  <cfquery name="GetVendor" datasource="#Instance.IpraDSN#">
			    Select V.*
				From CoopVendors V
				Where IsActive = 1
				AND Removed = 0
				order By CompanyName, VendorSince
			  </cfquery>
			   
			  <cfreturn GetVendor />
		</cffunction>
		
		<!--- Get The vendors By ID --->
		<cffunction name="GetVendorInfo" returnType="query" access="Public">
		     <cfargument name="VendorID" type="numeric" required="Yes">
			 
			 <cfset var getVendor = "">
			  <cfquery name="GetVendor" datasource="#Instance.IpraDSN#">
			    Select V.*
				From CoopVendors V
				Where VendorID = #Arguments.VendorID#
				<!--- AND Removed = 0 --->
				order By CompanyName
			  </cfquery>
			   
			  <cfreturn GetVendor />
		</cffunction>
		
		<!--- Get The vendors Payment --->
		<cffunction name="GetVendorPayment" returnType="query" access="Public">
		     <cfargument name="VendorID" type="numeric" required="Yes">
			 
			 <cfset var GetVendorpay ="">
			  <cfquery name="GetVendorpay" datasource="#Instance.IpraDSN#">
			    Select V.*
				From CoopVendorPayment V
				Where VendorID = #Arguments.VendorID#
			  </cfquery>
			   
			  <cfreturn GetVendorpay />
		</cffunction>	 	
		
		<!--- Add vendors Payment --->
		<cffunction name="AddVendorPayment" returnType="void" access="Public">
		     <cfargument name="VendorID" type="numeric" required="Yes">
			 <cfargument name="PaymentDate" type="date" required="Yes">
			 <cfargument name="PaidVia" type="string" required="Yes">
			 <cfargument name="PaymentAmount" type="numeric" required="Yes">
			 
			  <cfquery name="AddPayment" datasource="#Instance.IpraDSN#">
			    Insert into CoopVendorPayment(VendorID, PaymentDate, PaidVia, PaymentAmount, DateAdded)
				Values(#Arguments.VendorID#, #CreateODBCDateTime(Arguments.PaymentDate)#, '#arguments.PaidVia#', #Arguments.PaymentAmount#,#CreateODBCDateTime(now())#)
			  </cfquery>
		</cffunction>	
		
		<!--- Update vendors Payment --->
		<cffunction name="UpdateVendorPayment" returnType="void" access="Public">
		     <cfargument name="VendorPaymentID" type="numeric" required="Yes">
		     <cfargument name="VendorID" type="numeric" required="Yes">
			 <cfargument name="PaymentDate" type="date" required="Yes">
			 <cfargument name="PaidVia" type="string" required="Yes">
			 <cfargument name="PaymentAmount" type="numeric" required="Yes">
			 
			  <cfquery name="AddPayment" datasource="#Instance.IpraDSN#">
			    Update CoopVendorPayment 
				  SET PaymentDate = #CreateODBCDateTime(Arguments.PaymentDate)#
					  PaidVia ='#arguments.PaidVia#',
					  PaymentAmount = #Arguments.PaymentAmount#
					  LastUpdated =#CreateODBCDateTime(now())#
				Where VendorPaymentID = #Arguments.VendorPaymentID#	  
					  
			  </cfquery>
		</cffunction>	
		
		<!--- Check inactive --->
		<cffunction name="ActivateViaPayment" returnType="void" access="Public">
		     <cfargument name="VendorID" type="numeric" required="Yes">
			 
			  <cfquery name="AddPayment" datasource="#Instance.IpraDSN#">
			    Update CoopVendors
				  SET IsActive = 1
				  Where VendorID = #Arguments.VendorID# 
			  </cfquery>
		</cffunction>	
		
		<!--- Check inactive --->
		<cffunction name="RemoveVendor" returnType="void" access="Public">
		     <cfargument name="VendorID" type="numeric" required="Yes">
			 
			  <cfquery name="delvendor" datasource="#Instance.IpraDSN#">
			    Update CoopVendors
				  SET IsActive = 0,
				      Removed = 1
				  Where VendorID = #Arguments.VendorID# 
			  </cfquery>
		</cffunction>	
		
		<!--- Check inactive --->
		<cffunction name="IsNewVendor" returnType="void" access="Public">
		     <cfargument name="VendorID" type="numeric" required="Yes">
			 
			  <cfquery name="AddVendorSince" datasource="#Instance.IpraDSN#">
			    Update CoopVendors
				  SET  VendorSince = #CreateODBCDateTime(Now())#
				  Where VendorID = #Arguments.VendorID# 
				  AND VendorSince IS NULL
			  </cfquery>
		</cffunction>	
		
		<!--- Check if the Bid Already Exists --->
		 <cffunction name="CheckBidExists" returnType="boolean" access="Public">
		     <cfargument name="ItemID" type="numeric" required="YES">
			 <cfargument name="CoopID" type="numeric" required="YES">
			 <cfargument name="VendorID" type="numeric" required="YES">
			 
			 <cfquery name="QCheckBidExists" datasource="#Instance.IpraDSN#">
			   Select VenItemID 
			   From CoopVendorProducts
			   Where VendorID = #arguments.VendorID#
			   AND CoopID = #Arguments.CoopID#
			   AND ItemID = #Arguments.ItemID#
			  </cfquery>
			  
			  <cfif QCheckBidExists.recordcount EQ 0>
			    <cfset BidExists = false>
			  <cfelse>
			    <cfset BidExists = True>	
			  </cfif>
			 <cfreturn BidExists />
		 </cffunction>
		
		<!--- Check if the Bid has Already Been Won --->
		 <cffunction name="CheckBidWon" returnType="boolean" access="Public">
		   <cfargument name="ItemID" type="numeric" required="YES">
			 <cfargument name="CoopID" type="numeric" required="YES">
			 
			 <cfquery name="QCheckWinBidExists" datasource="#Instance.IpraDSN#">
			   Select VenItemID 
			   From CoopVendorProducts
			   Where CoopID = #Arguments.CoopID#
			   AND ItemID = #Arguments.ItemID#
			   AND WinningBid = 1
			  </cfquery>
			  
			  <cfif QCheckWinBidExists.recordcount EQ 0>
			    <cfset WinningBidExists = false>
			  <cfelse>
			    <cfset WinningBidExists = True>	
			  </cfif>
			 <cfreturn WinningBidExists />
		 </cffunction>
		 
		 
		 <!--- Add a New Bid --->
		   <cffunction name="AddNewBid" returnType="void" access="Public">
		     <cfargument name="VendorID" type="numeric" required="YES">
			 <cfargument name="ItemID" type="numeric" required="YES">
			 <cfargument name="CoopID" type="numeric" required="YES">
			 <cfargument name="VendorProdName" type="string" required="YES">
			 <cfargument name="VendorPrice" type="numeric" required="YES">
			 <cfargument name="ShippingTerms" type="string" required="YES">
			 <cfargument name="BidComment" type="string" required="NO">
			 
			 <cfquery name="AddBid" datasource="#Instance.IpraDSN#">
			   Insert into CoopVendorProducts(
			       vendorID, 
				   ItemID, 
				   CoopID, 
				   VendorProdName, 
				   VendorPrice, 
				   ShippingTerms, 
				   BidDate, 
				   BidComment,
				   DateAdded
				   )
			   Values(
			       #Arguments.VendorID#, 
				   #Arguments.ItemID#, 
				   #Arguments.CoopID#, 
				   '#Arguments.VendorProdName#', 
				   #Arguments.VendorPrice#, 
				   '#Arguments.ShippingTerms#', 
				   #CreateODBCDateTime(NOW())#,
				   <cfif IsDefined("Arguments.BidComment")>'#Arguments.BidComment#'<cfelse>NULL</cfif>,
				   #CreateODBCDateTime(NOW())#
				   )
			 </cfquery>
			 
		   </cffunction>
		  
		   <!--- Update Bid --->
		   <cffunction name="UpdateBid" returnType="void" access="Public">
		     <cfargument name="VenItemID" type="numeric" required="YES">
			 <cfargument name="VendorProdName" type="string" required="YES">
			 <cfargument name="VendorPrice" type="numeric" required="YES">
			 <cfargument name="ShippingTerms" type="string" required="YES">
			 <cfargument name="BidComment" type="string" required="NO">
			 
			 <cfquery name="UpdBid" datasource="#Instance.IpraDSN#">
			   UPDATE CoopVendorProducts
			     SET VendorProdName =  '#Arguments.VendorProdName#',
				     VendorPrice    =  #Arguments.VendorPrice#, 
				     ShippingTerms  =  '#Arguments.ShippingTerms#',
				     BidComment     =  <cfif IsDefined("Arguments.BidComment")>'#Arguments.BidComment#'<cfelse>NULL</cfif>,
				     LastUpdated    =  #CreateODBCDateTime(NOW())#
               WHERE VenItemID = #Arguments.VenItemID#
			 </cfquery>
			 
		   </cffunction>
		   
		   <!--- Add a New Bid --->
		   <cffunction name="DeleteBid" returnType="void" access="Public">
		     <cfargument name="VenItemID" type="numeric" required="YES">
			 
			 <cfquery name="DelBid" datasource="#Instance.IpraDSN#">
			   Delete From CoopVendorProducts
               WHERE VenItemID = #Arguments.VenItemID#
			 </cfquery>
			 
		   </cffunction>
		   
		    <!--- Get Bid Detail --->
		   <cffunction name="getBidItem" returnType="query" access="Public">
		     <cfargument name="VenItemID" type="numeric" required="YES">
			 
			 <cfquery name="getBidIno" datasource="#Instance.IpraDSN#">
			   Select * 
			   From CoopVendorProducts P, CoopProducts I
               WHERE P.ItemID = I.ItemID 
			   AND VenItemID = #Arguments.VenItemID#
			 </cfquery>
			 
			 <cfreturn getBidIno />
		   </cffunction>
		   
		    <!--- Get Bid Detail --->
		   <cffunction name="getVendorBidByItem" returnType="query" access="Public">
		     <cfargument name="ItemID" type="numeric" required="YES">
			 <cfargument name="VendorID" type="numeric" required="YES">
			 <cfargument name="CoopID" type="numeric" required="YES">
			 
			 <cfquery name="getBidByI" datasource="#Instance.IpraDSN#">
			   Select * 
			   From CoopVendorProducts P
               WHERE P.VendorID = #Arguments.VendorID# 
			   AND P.CoopID = #Arguments.CoopID# 
			   AND P.ItemID = #Arguments.ItemID#
			 </cfquery>
			 
			 <cfreturn getBidByI />
		   </cffunction> 
		   
		   <!--- Get Bid Detail --->
		   <cffunction name="GetVendorsWithBids" returnType="query" access="Public">
			 <cfargument name="CoopID" type="numeric" required="YES">
			 
			 <cfquery name="getBidByI" datasource="#Instance.IpraDSN#">
			   Select Distinct P.VendorID, V.CompanyName
			   From CoopVendors V, CoopVendorProducts P
               WHERE V.VendorID = P.VendorID 
			   AND P.CoopID = #Arguments.CoopID# 
			   order By V.CompanyName, P.vendorID
			 </cfquery>
			 
			 <cfreturn getBidByI />
		   </cffunction> 
		   
		<!--- Get The vendors bids --->
		<cffunction name="GetVendorBids" returnType="query" access="Public">
		     <cfargument name="CoopID" type="numeric" required="Yes">
			 <cfargument name="VendorID" type="numeric" required="Yes">
			 
			  <cfquery name="GetVendorBids" datasource="#Instance.IpraDSN#">
			    Select B.VendorProdName, B.VenItemID, B.VendorPrice, B.BidDate, B.WinningBid, B.BidComment, B.ShippingTerms,
				       P.*,
					(Select CodeDesc
				       From lookup
				       Where CodeGroup = 'CoopUOM'
				       AND Codevalue = P.UOM) as UnitofMeasure,  
				    (Select CodeDesc 
				       From Lookup L
				       Where L.CodeGroup = 'COOPGROUP' 
					   AND L.Codevalue = P.GroupID) as GroupName,
					(Select CategoryDescription
					   From CoopCategories
					   Where CategoryCode = P.CatID) as CategoryName,
					(Select Cost 
					   From CoopProductPrice
					   Where ItemID = P.ItemID
					   AND CoopYearId = (Select Top 1 ConfigID
						                 From CoopConfig
										 Where CoopEndDate <= #CreateODBCDateTime(now())#
										 Order By ConfigID desc
										 )) as PreviousCost	  
				From CoopVendorProducts B, CoopProducts P
				Where B.ItemID = P.ItemID 
				AND B.vendorID = #Arguments.VendorID# 
				AND B.CoopID = #Arguments.CoopID#
				Order By P.GroupID, P.CatID, P.ItemName
			  </cfquery>
			   
			  <cfreturn GetVendorBids />
		</cffunction>	
		
		<!--- Get The vendors With winning bids --->
		<cffunction name="GetVendorWinningBids" returnType="query" access="Public">
		    <cfargument name="CoopID" type="numeric" required="Yes">
			 <cfargument name="VendorID" type="numeric" required="Yes">
			 
			  <cfquery name="GetWonBids" datasource="#Instance.IpraDSN#">
			    Select B.VendorProdName, B.VenItemID, B.VendorPrice, B.BidDate, B.WinningBid, B.BidComment, B.ShippingTerms,
				       P.*,
					(Select CodeDesc
				       From lookup
				       Where CodeGroup = 'CoopUOM'
				       AND Codevalue = P.UOM) as UnitofMeasure,  
				    (Select CodeDesc 
				       From Lookup L
				       Where L.CodeGroup = 'COOPGROUP' 
					   AND L.Codevalue = P.GroupID) as GroupName,
					(Select CategoryDescription
					   From CoopCategories
					   Where CategoryCode = P.CatID) as CategoryName,
					(Select Cost 
					   From CoopProductPrice
					   Where ItemID = P.ItemID
					   AND CoopYearId = (Select Top 1 ConfigID
						                 From CoopConfig
										 Where CoopEndDate <= #CreateODBCDateTime(now())#
										 Order By ConfigID desc
										 )) as PreviousCost	  
				From CoopVendorProducts B, CoopProducts P
				Where B.ItemID = P.ItemID 
				AND B.vendorID = #Arguments.VendorID# 
				AND B.CoopID = #Arguments.CoopID#
				AND B.WinningBid = 1
				Order By P.GroupID, P.CatID, P.ItemName
			  </cfquery>
			   
			  <cfreturn GetWonBids />
		</cffunction>	
		
		<cffunction name="UpdateVendor" access="Public" return="Void">
			   <cfargument name="VendorID" required="Yes" type="Numeric">
			   <cfargument name="VendorName" required="Yes" type="String"> 
			   <cfargument name="VendorPrefix" required="No" type="String">
			   <cfargument name="VendorFirstname" required="Yes" type="String">
			   <cfargument name="VendorLastname" required="Yes" type="String">
			   <cfargument name="VendorMI" required="No" type="String">
			   <cfargument name="VendorTitle" required="No" type="String">
			   <cfargument name="Address" required="Yes" type="String">
			   <cfargument name="Address2" required="No" type="String">
			   <cfargument name="City" required="Yes" type="String">
			   <cfargument name="State" required="Yes" type="String"> 
			   <cfargument name="Zip" required="Yes" type="String">
			   <cfargument name="Phone" required="Yes" type="String"> 
			   <cfargument name="PhoneExt" required="No" type="String"> 
			   <cfargument name="Fax" required="No" type="String">
			   <cfargument name="Email" required="Yes" type="String">
			   <cfargument name="Website" required="No" type="String">
			   <cfargument name="ProductInterest" required="Yes" type="String">
			   <cfargument name="SpecSent" required="NO" type="date">
			   <cfargument name="VendorNotes" required="NO" type="string">
			   <cfargument name="IsActive" required="NO" type="String">
			   <cfargument name="BondRcvd" required="NO" type="String">
			   <cfargument name="ContractRcvd" required="NO" type="numeric">
			   
			   <cfquery name="UpdateVendor" datasource="#Instance.IpraDSN#">
			     UPDATE CoopVendors
				   SET  CompanyName =  '#Trim(Arguments.VendorName)#', 
				        Prefix =  <cfif IsDefined("Arguments.VendorPrefix")>'#Trim(Arguments.VendorPrefix)#'<cfelse>NULL</cfif>,
					    Firstname = '#Trim(Arguments.VendorFirstname)#',
					    Lastname =  '#Trim(Arguments.VendorLastname)#',
					    MI = <cfif IsDefined("Arguments.VendorMI")>'#Trim(Arguments.VendorMI)#'<cfelse>NULL</cfif>,
					    VenPosition =  <cfif IsDefined("Arguments.VendorTitle")>'#Trim(Arguments.VendorTitle)#'<cfelse>NULL</cfif>,
					    Address = '#Trim(Arguments.Address)#', 
					    Address2 = <cfif IsDefined("Arguments.Address2")>'#Trim(Arguments.Address2)#'<cfelse>NULL</cfif>,
					    City =  '#Trim(Arguments.City)#',
					    State =  '#Trim(Arguments.State)#', 
					    Zip =  '#Trim(Arguments.Zip)#', 
					    Phone =  '#ReplaceList(Trim(Arguments.Phone), "/,(,),.,-,\", "")#', 
					    Extension = <cfif ISDefined("Arguments.PhoneExt")>'#Trim(Arguments.PhoneExt)#'<cfelse>NULL</cfif>,
					    Fax = <cfif ISDefined("Arguments.Fax")>'#ReplaceList(Trim(Arguments.Fax), "/,(,),.,-,\", "")#'<cfelse>NULL</cfif>,
					    Email = '#Trim(Arguments.Email)#',
					    Website = <cfif ISDefined("Arguments.Website")>'#Trim(Arguments.Website)#'<cfelse>NULL</cfif>,
					    ProductGroup = '#Arguments.ProductInterest#',
					    SpecSent = <cfif IsDefined("Arguments.SpecSent")>#CreateODBCDateTime(Arguments.SpecSent)#<cfelse>NULL</cfif>,
					    VendorSince = <cfif IsDefined("Arguments.VendorSince")>#CreateODBCDateTime(Arguments.VendorSince)#<cfelse>NULL</cfif>,
					    VendorNotes = <cfif IsDefined("Arguments.VendorNotes")>'#Trim(Arguments.VendorNotes)#'<cfelse>NULL</cfif>,
					    IsActive = <cfif IsDefined("Arguments.IsActive")>#Arguments.IsActive#<cfelse>0</cfif>,
					    BondRcvd = <cfif IsDefined("Arguments.BondRcvd")>#Arguments.BondRcvd#<cfelse>0</cfif>,
					    ContractRcvd = <cfif IsDefined("Arguments.ContractRcvd")>#Arguments.ContractRcvd#<cfelse>0</cfif>,
					    DateModified = #CreateODBCDateTime(Now())#
				 Where VendorID = #Arguments.VendorID#		
			   </cfquery>
      </cffunction> 	
	  
 <!--- /////////////////////////////////////////////
     Coop Catergory Maintenance Section
 ////////////////////////////////////////////////--->
  <!--- ********************
    get the Item Categories from the dbo.CoopCategories table
  **********************--->
		<cffunction name="GetItemCategories" returnType="Query" access="Public">
		   <cfargument name="CategoryCode" type="string" required="No">
		   
		   <cfquery name="getCat" datasource="#Instance.IpraDSN#">
		      Select CategoryCode, CategoryDescription, GroupID, IsActive
			  From CoopCategories
			  Where IsActive = 1
			  <cfif IsDefined("Arguments.CategoryCode")>
			    AND CategoryCode = '#Arguments.categoryCode#'
			  </cfif>
		   </cfquery>
		
		   <cfreturn getCat />
		</cffunction>
  <!--- ********************
     get the Item Groups and Categories
  **********************--->
		<cffunction name="GetAllCats" returnType="Query" access="Public">

		   <cfquery name="GetAllCats" datasource="#Instance.IpraDSN#">
		      Select C.CategoryCode, C.CategoryDescription, C.GroupID, C.IsActive, 
			    (Select CodeDesc 
				  From Lookup L
				  Where L.CodeGroup = 'COOPGROUP' AND 
				  L.Codevalue = C.GroupID) as GroupName,
				(Select Count(*) 
				  From CoopProducts P
			      Where P.CatID = C.CategoryCode
				  AND P.Isactive = 1) as ProductCount 
			  From CoopCategories C
			  order By C.groupID, C.IsActive desc, C.CategoryCode
		   </cfquery>
		
		   <cfreturn GetAllCats />
		</cffunction>
<!--- ********************
     get the Item Groups and Categories
  **********************--->
		<cffunction name="GetAllItemGroupsCats" returnType="Query" access="Public">
		   <cfargument name="GroupID" type="string" required="No">
		   <cfargument name="CategoryCode" type="string" required="No">
		   
		   <cfquery name="getallItemGroupsCats" datasource="#Instance.IpraDSN#">
		      Select C.CategoryCode, C.CategoryDescription, C.GroupID, C.IsActive, 
			    (Select CodeDesc 
				  From Lookup L
				  Where L.CodeGroup = 'COOPGROUP' AND 
				  L.Codevalue = C.GroupID) as GroupName
			
			  From CoopCategories C
			  Where C.IsActive = 1
			  <cfif IsDefined("Arguments.CategoryCode")>
			    AND C.CategoryCode = '#Arguments.categoryCode#'
			  </cfif>
			  <cfif IsDefined("Arguments.GroupID")>
			    AND C.GroupID = '#Arguments.GroupID#'
			  </cfif>
			  order By C.groupID, C.CategoryCode
		   </cfquery>
		
		   <cfreturn getallItemGroupsCats />
		</cffunction>
		
  <!--- ********************
     Add a Category
  **********************--->
		<cffunction name="AddCategory" returnType="void" access="Public">
		   <cfargument name="GroupID" type="string" required="YES">
		   <cfargument name="categoryName" type="string" required="YES">
		   
		   <cfset catCode = GetnewCatCode(Arguments.categoryName)>
		   
		   <cfquery name="AddCat" datasource="#Instance.IpraDSN#">
		     Insert Into CoopCategories(CategoryCode, CategoryDescription, GroupID, IsActive)
			 Values('#UCASE(CatCode)#', '#Trim(Arguments.categoryName)#', '#Arguments.GroupID#', 1)
		   </cfquery>
		   
		   <!--- <cfreturn getallItemGroupsCats /> --->
		</cffunction> 
  <!--- ********************
     Update IsActive
  **********************--->
		<cffunction name="UpdateCategory" returnType="void" access="Public">
		   <cfargument name="CatID" type="string" required="YES">
		   <cfargument name="MakeActive" type="numeric" required="YES">
		   
		   
		   <cfquery name="UpdateCat" datasource="#Instance.IpraDSN#">
		     Update CoopCategories
			 Set IsActive = #Arguments.MakeActive#
			 Where CategoryCode = '#trim(arguments.CatID)#'
		   </cfquery>
		   
		   <!--- <cfreturn getallItemGroupsCats /> --->
		</cffunction>
		
		
  <!--- ********************
     Add a Category
  **********************--->
		<cffunction name="DeleteCategory" returnType="void" access="Public">
		   <cfargument name="categoryID" type="string" required="YES">
		   
		   <cfquery name="deleteCat" datasource="#Instance.IpraDSN#">
		     Delete From CoopCategories
			 Where CategoryCode = '#trim(arguments.categoryID)#'
		   </cfquery>
		   
		   <!--- <cfreturn getallItemGroupsCats /> --->
		</cffunction>
			
		<!--- ***********
		Get a new CategoryCode 
		****************--->
		<cffunction name="GetnewCatCode" returnType="String" access="Private">
		  <cfargument name="CategoryName" required="YES" Type="String">
		  <cfset NewCatCode = Left(CategoryName, 1)>
		  
		  <cfset CheckCatCodeExists = CheckCatCode(NewCatCode)>
		  
		  <cfif CheckCatCodeExists>
		     <cfset NewCatCode = Left(CategoryName, 2)> 
			 
			 <cfset CheckCatCodeExists2 = CheckCatCode(NewCatCode)>
			 
			 <cfif CheckCatCodeExists2>
			   <cfset NewCatCode = Left(CategoryName, 3)>
			 </cfif>
		  </cfif>
		  
		  <cfreturn NewCatCode />
		</cffunction>
		
		<!--- ************************
		Check to see if the category Code Exists
		************************** --->
		<cffunction name="CheckCatCode" returnType="Boolean" access="Public">
		  <cfargument name="CategoryName" required="YES" Type="String">
		  <cfquery name="CheckNewCode" datasource="#Instance.IPRADSN#">
		    Select CategoryCode
			From CoopCategories
			Where CategoryCode = '#CategoryName#'
		  </cfquery>
		  
		  <cfif CheckNewCode.recordcount EQ 0>
		    <cfset CatCodeExists = false>
		 <cfelse>
		   	<cfset CatCodeExists = true>
		  </cfif>
		  
		  <cfreturn CatCodeExists />
		</cffunction>  		
 
 <!--- /////////////////////////////////////////////
 
 
     Coop Reports Section
 ////////////////////////////////////////////////--->		
 
 
 
 <!--- Get Item Count--->
		<cffunction name="GetItemCount" returnType="query" access="Public">
		     <cfargument name="CoopID" type="numeric" required="Yes">
			 <cfargument name="ItemID" type="numeric" required="Yes">
			 
			  <cfquery name="GetItemCount" datasource="#Instance.IpraDSN#">
			    Select Sum(Quantity) as quantity
				From CoopOrderItems I, CoopOrders O
				Where O.OrderID = I.OrderID
				AND O.CoopYearID = #Arguments.CoopID#
				AND ProductID = #Arguments.ItemID#
			  </cfquery>
			   
			  <cfreturn GetItemCount />
		</cffunction>

<!--- Get The GetAgencyCountBy Items --->
		<cffunction name="GetAgencyCountByItem" returnType="query" access="Public">
		     <cfargument name="CoopID" type="numeric" required="Yes">
			 <cfargument name="ItemID" type="numeric" required="Yes">
			 
			  <cfquery name="AgencyCount" datasource="#Instance.IpraDSN#">
			    Select count(*) as quantity
				From CoopOrderItems I, CoopOrders O
				Where O.OrderID = I.OrderID
				AND O.CoopYearID = #Arguments.CoopID#
				AND ProductID = #Arguments.ItemID#
			  </cfquery>
			   
			  <cfreturn AgencyCount />
		</cffunction>
	    
		<cffunction name="getItemWinBidders" returnType="query" access="Public">
		     <cfargument name="CoopID" type="Numeric" required="yes">
		     <cfargument name="CategoryCode" type="string" required="yes">
		     <cfargument name="groupID" type="string" required="yes">
		   
			   <cfquery name="getitems" datasource="#Instance.IpraDSN#">
			      Select I.*, P.Cost, P.WinningVendorID, P.VendorProdName, P.ShippingTerms, 
				    (Select CodeDesc
					  From lookup
					   Where CodeGroup = 'CoopUOM'
					   AND Codevalue = I.UOM) as UnitofMeasure,
				    (Select CompanyName   
					  From CoopVendors
					  Where VendorID = P.WinningVendorID) as VendorName,
					(Select count(*)
				       From dbo.CoopVendorProducts VP
					   Where ItemID = I.ItemID
					   AND CoopID = #Arguments.CoopID#) as BidsReceived,	
					(Select ProdVote 
						From CoopProductPrice
						Where ItemID = I.ItemID
						AND CoopYearId = #Arguments.CoopID#) as ProdVote,	
					(Select VoteDesc 
						From CoopProductPrice
						Where ItemID = I.ItemID
						AND CoopYearId = #Arguments.CoopID#) as VoteDesc,		
				    (Select Rejected 
						From CoopProductPrice
						Where ItemID = I.ItemID
						AND CoopYearId = #Arguments.CoopID#) as Rejected,
					(Select RejectReason
						From CoopProductPrice
						Where ItemID = I.ItemID
						AND CoopYearId = #Arguments.CoopID#) as RejectReason,	
					(Select Cost 
					     From CoopProductPrice
					     Where ItemID = I.ItemID
					     AND CoopYearId = (Select Top 1 ConfigID
						                      From CoopConfig
										      Where CoopEndDate <= #CreateODBCDateTime(now())#
										       )) as PreviousCost	   
				  From CoopProducts I, CoopProductPrice P
				  Where I.ItemID = P.ItemID
				  AND P.CoopYearId = #Arguments.CoopID#
				  AND P.Rejected = 0
				  AND P.VendorAwarded IS NOT NULL
				  AND I.catID = '#Arguments.CategoryCode#'
				  AND I.groupID = '#Arguments.groupID#'
				  Order By ItemName, ItemCode 
			   </cfquery>
			
			   <cfreturn getItems />
		</cffunction>
	
		<cffunction name="getVotingItems" returnType="query" access="Public">
		     <cfargument name="CoopID" type="Numeric" required="yes">
			   <cfquery name="getitems" datasource="#Instance.IpraDSN#">
			      Select I.*, P.Cost,  P.VoteDesc,
				    (Select CodeDesc
					  From lookup
					   Where CodeGroup = 'CoopUOM'
					   AND Codevalue = I.UOM) as UnitofMeasure,
					(Select CategoryDescription 
						   From CoopCategories
						   Where CategoryCode = I.CatID) as CategoryName,
				 (Select CodeDesc
				           From lookup
				           Where CodeGroup = 'CoopGroup'
				           AND Codevalue = I.GroupID) as GroupName   
				  From CoopProducts I, CoopProductPrice P
				  Where I.ItemID = P.ItemID
				  AND P.CoopYearId = #Arguments.CoopID#
				  AND ProdVote = 1
				  Order By I.groupID, I.CatID, I.ItemCode
			   </cfquery>
			
			   <cfreturn getItems />
		</cffunction>
		
		<cffunction name="getRejectedItems" returnType="query" access="Public">
		     <cfargument name="CoopID" type="Numeric" required="yes">
			   <cfquery name="getitems" datasource="#Instance.IpraDSN#">
			      Select I.*, P.Cost,  P.RejectReason,
				    (Select CodeDesc
					  From lookup
					   Where CodeGroup = 'CoopUOM'
					   AND Codevalue = I.UOM) as UnitofMeasure,
					(Select CategoryDescription 
						   From CoopCategories
						   Where CategoryCode = I.CatID) as CategoryName,
				 (Select CodeDesc
				           From lookup
				           Where CodeGroup = 'CoopGroup'
				           AND Codevalue = I.GroupID) as GroupName   
				  From CoopProducts I, CoopProductPrice P
				  Where I.ItemID = P.ItemID
				  AND P.CoopYearId = #Arguments.CoopID#
				  AND Rejected = 1
				  Order By I.groupID, I.CatID, I.ItemCode
			   </cfquery>
			
			   <cfreturn getItems />
		</cffunction>
		
		<!--- Get The vendors By ID --->
		<cffunction name="GetAllAgencyInfo" returnType="query" access="Public">
		     
			  <cfquery name="GetAllRegisteredAgencies" datasource="#Instance.IpraDSN#">
			    Select Distinct C.memberID, M.*
				From dbo.CoopRegistration C, Members M
				Where C.MemberID = M.MemberID
				Order By M.Company, M.LastName, M.FirstName 
			  </cfquery>
			   
			  <cfreturn GetAllRegisteredAgencies />
		</cffunction>
		
		<!--- Get Agencies that Ordered an Item --->
		<cffunction name="getAgencyByItem" returnType="query" access="Public">
		     <cfargument name="CoopID" type="numeric" required="Yes">
			 <cfargument name="ItemID" type="numeric" required="Yes">
			 
			 <cfset var getAgItem ="">
			  <cfquery name="getAgItem" datasource="#Instance.IpraDSN#">
			    Select I.Quantity,
				  (Select Company
				    From Members
					Where MemberID = R.MemberID) as AgencyName
				  
				From CoopOrders O, CoopOrderItems I, CoopRegistration R
				Where R.RegistrationID = O.RegistrationID
				AND O.OrderID = I.OrderID
				AND O.CoopYearID = #Arguments.CoopID#
				AND I.productID   = #Arguments.ItemID#
				Order By Quantity, 2
			  </cfquery>
			   
			  <cfreturn getAgItem />
		</cffunction>
 <!--- /////////////////////////////////////////////
     Coop Products Section
 ////////////////////////////////////////////////--->		

   <!--- ********************
	 get the Item Groups from the Lookup Table
	**********************--->
		<cffunction name="getNextItemCode" returnType="string" access="Public">
		   <cfargument name="GroupID" type="string" required="No">
		   <cfargument name="CatID" type="string" required="No">
		   
		   <cfquery name="GetmaxCat" datasource="#Instance.IpraDSN#">
		     Select Max(ItemCodeInt) as NextCode
			 From CoopProducts
			 Where GroupID = '#Arguments.GroupID#' 
			 AND CatID = '#Arguments.CatID#'
		   </cfquery>
		   
		   <cfif GetMaxCat.recordcount GT 0>
		      <cfset ThisNextCode = GetMaxCat.NextCode + 1>
		   
			   <cfif Len(ThisNextCode) LT 3>
			     <cfif Len(ThisNextCode) EQ 2>
				    <cfset ThisNextCode = "0" & ThisNextCode> 
				 <cfelse>
				    <cfset ThisNextCode = "00" & ThisNextCode> 	
				 </cfif>
			   </cfif>
		   <cfelse>
		      <cfset ThisNextCode = 000>	   
		   </cfif>
		   
		   <cfset nextItemCode = CatID & ThisNextCode>
		   
		   
		   <cfreturn nextItemCode />
		</cffunction>
				 
   <!--- ********************
	 get the Item Groups from the Lookup Table
	**********************--->
		<cffunction name="GetItemGroups" returnType="Query" access="Public">
		   <cfargument name="GroupID" type="string" required="No">
		   <cfquery name="getGroup" datasource="#Instance.IpraDSN#">
		      Select LookupID, CodeGroup, CodeValue, CodeDesc, Ranking
			  From Lookup
			  Where CodeGroup = 'COOPGROUP'
			  <cfif IsDefined("Arguments.GroupID")>
			  AND CodeValue = '#Arguments.GroupID#'
			  </cfif>
			  Order By Ranking, CodeValue, CodeDesc
		   </cfquery>
		
		   <cfreturn getGroup />
		</cffunction>
		

		
		<!--- ********************
		  get the Unit Of measure
		 **********************--->
		<cffunction name="GetUOM" returnType="Query" access="Public">
		   <cfargument name="UOMID" type="string" required="No">
		   <cfquery name="getUOM" datasource="#Instance.IpraDSN#">
		      Select LookupID, CodeGroup, CodeValue, CodeDesc, Ranking
			  From Lookup
			  Where CodeGroup = 'COOPUOM'
			  <cfif IsDefined("Arguments.GroupID")>
			  AND CodeValue = '#Arguments.UOMID#'
			  </cfif>
			  Order By Ranking, CodeDesc, CodeValue
		   </cfquery>
		
		   <cfreturn getUOM />
		</cffunction>
		
		<!--- ********************
		  get the Items from the  table
		 **********************--->
		<cffunction name="getItems" returnType="Query" access="Public">
		   <cfargument name="CoopID" type="Numeric" required="yes">
		   <cfargument name="CategoryCode" type="string" required="yes">
		   <cfargument name="groupID" type="string" required="yes">
		   
		   <cfquery name="getitems" datasource="#Instance.IpraDSN#">
		      Select I.*, P.*,
			    (Select CodeDesc
				  From lookup
				   Where CodeGroup = 'CoopUOM'
				   AND Codevalue = I.UOM) as UnitofMeasure,  
			   (Select Cost 
					From CoopProductPrice
					Where ItemID = P.ItemID
					AND CoopYearId = (Select Top 1 ConfigID
						                 From CoopConfig
										 Where CoopEndDate <= #CreateODBCDateTime(now())#
										 Order By ConfigID desc
										 )) as PreviousCost
									 	   
			  From CoopProducts I, CoopProductPrice P
			  Where I.ItemID = P.ItemID
			  AND P.CoopYearId = #Arguments.CoopID#
			  AND I.IsActive = 1
			  AND I.catID = '#Arguments.CategoryCode#'
			  AND I.groupID = '#Arguments.groupID#'
			  Order By ItemName, ItemCode 
		   </cfquery>
		
		   <cfreturn getItems />
		</cffunction>
		
		<!--- Get All Items for a GroupID and CategoryID --->
		<cffunction name="getAllItems" returnType="Query" access="Public">
		   <cfargument name="CategoryCode" type="string" required="yes">
		   <cfargument name="groupID" type="string" required="yes">
		   
		   <cfquery name="getallitems" datasource="#Instance.IpraDSN#">
		      Select I.*, 
			    (Select CodeDesc
				  From lookup
				   Where CodeGroup = 'CoopUOM'
				   AND Codevalue = I.UOM) as UnitofMeasure
			  From CoopProducts I
			  Where I.groupID = '#Arguments.groupID#'
			  AND I.catID = '#Arguments.CategoryCode#'
			  Order By ItemName, ItemCode 
		   </cfquery>
		
		   <cfreturn getallitems />
		</cffunction>
		
		
		<!--- Get a Single  Item Info --->
		<cffunction name="getItemInfo" returnType="Query" access="Public">
		   <cfargument name="ItemID" type="numeric" required="yes">
		   
		   <cfquery name="getItemInfo" datasource="#Instance.IpraDSN#">
		      Select I.*, 
			    (Select CodeDesc
				  From lookup
				   Where CodeGroup = 'CoopUOM'
				   AND Codevalue = I.UOM) as UnitofMeasure
			  From CoopProducts I
			  Where I.ItemID = #Arguments.ItemID#
			  Order By ItemName, ItemCode 
		   </cfquery>
		
		   <cfreturn getItemInfo />
		</cffunction>
		
		<!--- Add a Product --->
		<cffunction name="AddProduct" returnType="Void" access="Public">
		   <cfargument name="ItemCode" type="String" required="yes">
		   <cfargument name="ItemNumber" type="Numeric" required="No">
		   
		   <cfargument name="CatID" type="String" required="yes">
		   <cfargument name="GroupID" type="String" required="yes">
		   <cfargument name="ItemName" type="String" required="yes">
		   <cfargument name="ItemUOM" type="String" required="yes">
		   <cfargument name="ItemDesc" type="String" required="yes">
		   
		   <cfquery name="AddItem" datasource="#Instance.IpraDSN#">
		      Insert CoopProducts(
			      ItemCode, 
				  ItemCodeInt,
				  CatID, 
				  GroupID, 
				  ItemName, 
				  UOM, 
				  ItemDesc, 
				  Isactive, 
				  ItemSince, 
				  DateAdded
				  )
			  Values(
			      '#Arguments.ItemCode#', 
				  #Arguments.ItemNumber#,
				  '#Arguments.CatID#', 
				  '#Arguments.GroupID#', 
				  '#Trim(Arguments.ItemName)#', 
				  '#Arguments.ItemUOM#', 
				  '#Trim(Arguments.ItemDesc)#', 
				  1, 
				  #CreateODBCDateTime(Now())#, 
				  #CreateODBCDateTime(Now())#
				  )
		   </cfquery>
		
		</cffunction>
		
		<!--- Update a Product --->
		<cffunction name="UpdateProduct" returnType="Void" access="Public">
		   <cfargument name="ItemID" type="numeric" required="yes">
		   <cfargument name="ItemName" type="String" required="yes">
		   <cfargument name="ItemUOM" type="String" required="yes">
		   <cfargument name="ItemDesc" type="String" required="yes">
		   <cfargument name="IsActive" type="numeric" required="yes">
		   
		   <cfquery name="AddItem" datasource="#Instance.IpraDSN#">
		      Update CoopProducts
				SET ItemName = '#Trim(Arguments.ItemName)#', 
				    UOM = '#Arguments.ItemUOM#', 
				    ItemDesc = '#Trim(Arguments.ItemDesc)#',
				    Isactive = '#Arguments.IsActive#',
				    DateModified = #CreateODBCDateTime(Now())#
			 Where ItemID = #Arguments.ItemID#
		   </cfquery>
		</cffunction>
		
		<!--- Add Winning Vendor --->
		<cffunction name="AddWinningBidder" returnType="Void" access="Public">
		   <cfargument name="ItemID" type="numeric" required="yes">
		   <cfargument name="CoopID" type="numeric" required="yes">
		   <cfargument name="WinningVendorID" type="numeric" required="yes">
		   <cfargument name="VendorProdName" type="String" required="yes">
		   <cfargument name="Cost" type="String" required="yes">
		   <cfargument name="ShippingTerms" type="String" required="yes">
		   
		   <cfquery name="CheckProdPrice" datasource="#Instance.IPRADSN#">
		      Select * From CoopProductPrice
			  Where ItemID = #Arguments.ItemID#
			  AND CoopYearID = #Arguments.CoopID#
		   </cfquery>
		   
		   <cfif CheckProdPrice.recordcount GT 0>
		      <cfquery name="UpdaProd" datasource="#Instance.IPRADSN#">
		      Update CoopProductPrice
			    Set WinningVendorID = #Arguments.WinningVendorID#,
		            VendorProdName  = '#Trim(Arguments.VendorProdName)#',
		            Cost            = #Arguments.Cost#,
		            ShippingTerms   = '#Trim(Arguments.ShippingTerms)#',
					VendorAwarded   = #CreateODBCDateTime(NOW())#
			  Where ItemID = #Arguments.ItemID#
			  AND CoopYearID = #Arguments.CoopID#
		   </cfquery>
		   <cfelse>
			    <cfquery name="InserBidWinner" datasource="#Instance.IPRADSN#">
		          Insert Into CoopProductPrice(
				    ItemID,
					CoopYearID,
					WinningVendorID,
		            VendorProdName,
		            Cost,
		            ShippingTerms,
					VendorAwarded,
					DateAdded
				  )
			    Values( #Arguments.ItemID#,
				        #Arguments.CoopID#,
						#Arguments.WinningVendorID#,
		               '#Trim(Arguments.VendorProdName)#',
		                #Arguments.Cost#,
		               '#Trim(Arguments.ShippingTerms)#',
					    #CreateODBCDateTime(NOW())#,
						#CreateODBCDateTime(NOW())#
						)
		   </cfquery>
		   </cfif>
		  <cfquery name="UpdVendorWinBid" datasource="#Instance.IPRADSN#">
		    Update CoopVendorProducts
			Set WinningBid = 1
			Where ItemID = #Arguments.ItemID#
			AND CoopID = #Arguments.CoopID#
			AND VendorID = #Arguments.WinningVendorID#
		  </cfquery>
		</cffunction>
		
		<!--- Reject a product --->
		<cffunction name="RejectProduct" returnType="Void" access="Public">
		   <cfargument name="ItemID" type="numeric" required="yes">
		   <cfargument name="CoopID" type="numeric" required="yes">
		   <cfargument name="Rejected" type="Numeric" required="yes">
		   <cfargument name="RejectComment" type="String" required="yes">
		   
		   <cfquery name="CheckProdPrice" datasource="#Instance.IPRADSN#">
		      Select * From CoopProductPrice
			  Where ItemID = #Arguments.ItemID#
			  AND CoopYearID = #Arguments.CoopID#
		   </cfquery>
		   
		   <cfif CheckProdPrice.recordcount GT 0>
		      <cfquery name="CheckProdPrice" datasource="#Instance.IPRADSN#">
		      Update CoopProductPrice
			    Set Rejected = #Rejected#,
				    RejectReason = <cfif Len(Trim(Arguments.RejectComment)) GT 0>'#Trim(Arguments.RejectComment)#'<cfelse>NULL</cfif>
			  Where ItemID = #Arguments.ItemID#
			  AND CoopYearID = #Arguments.CoopID#
		   </cfquery>
		   <cfelse>
			     <cfquery name="CheckProdPrice" datasource="#Instance.IPRADSN#">
			      Insert into CoopProductPrice (ItemID, CoopYearID,  Rejected,  RejectReason)
				  Values(#Arguments.ItemID#, #Arguments.CoopID#, #Rejected#, <cfif Len(Trim(Arguments.RejectComment)) GT 0>'#Trim(Arguments.RejectComment)#'<cfelse>NULL</cfif>) 
			   </cfquery>
		   </cfif>
		   
		</cffunction>
		
		<!--- Vote on a product --->
		<cffunction name="VoteProduct" returnType="Void" access="Public">
		      <cfargument name="ItemID" type="numeric" required="yes">
		   <cfargument name="CoopID" type="numeric" required="yes">
		   <cfargument name="Vote" type="Numeric" required="yes">
		   <cfargument name="VoteComment" type="String" required="yes">
		   
		   <cfquery name="CheckProdPrice" datasource="#Instance.IPRADSN#">
		      Select * From CoopProductPrice
			  Where ItemID = #Arguments.ItemID#
			  AND CoopYearID = #Arguments.CoopID#
		   </cfquery>
		   
		   <cfif CheckProdPrice.recordcount GT 0>
		      <cfquery name="UpdProVote" datasource="#Instance.IPRADSN#">
		      Update CoopProductPrice
			    Set ProdVote = #Vote#,
				    VoteDesc = <cfif Len(Trim(Arguments.VoteComment)) GT 0>'#Trim(Arguments.VoteComment)#'<cfelse>NULL</cfif>
			  Where ItemID = #Arguments.ItemID#
			  AND CoopYearID = #Arguments.CoopID#
		   </cfquery>
		   <cfelse>
			     <cfquery name="INSProdVote" datasource="#Instance.IPRADSN#">
			      Insert into CoopProductPrice (ItemID, CoopYearID,  ProdVote,  VoteDesc)
				  Values(#Arguments.ItemID#, #Arguments.CoopID#, #Vote#, <cfif Len(Trim(Arguments.VoteComment)) GT 0>'#Trim(Arguments.VoteComment)#'<cfelse>NULL</cfif>) 
			   </cfquery>
		   </cfif>
		   
		</cffunction>
		
		<!--- Get Bidders for an item --->
		<cffunction name="GetBidder" returnType="Query" access="Public">
		   <cfargument name="CoopID" type="numeric" required="yes">
		   <cfargument name="ItemID" type="numeric" required="yes">
		  
		   <cfquery name="GetBidder" datasource="#Instance.IpraDSN#">
		     Select V.VendorID, V.CompanyName, P.VendorProdName, P.VendorPrice, P.ShippingTerms, P.BidComment
			 From dbo.CoopVendors V, CoopVendorProducts P
			 Where V.VendorID = P.VendorID
			 AND P.CoopID = #Arguments.CoopID#
			 AND P.ItemID = #Arguments.ItemID#
			 Order By VendorPrice asc
		   </cfquery>
		   
		   <cfreturn getbidder />
		</cffunction>
		
		<!--- Get WinningBid --->
		<cffunction name="GetWinningBid" returnType="Void" access="Public">
		   <cfargument name="CoopID" type="numeric" required="yes">
		   <cfargument name="ItemID" type="numeric" required="yes">
		  
		   <cfquery name="GetWinBidder" datasource="#Instance.IpraDSN#">
		     Select WinningVendorID
			 From CoopProductPrice
			 Where CoopYearId = #Arguments.CoopID#
			 AND ItemID = #Arguments.ItemID#
			 AND WinningVendorID IS NOT NULL
		   </cfquery>
		   
		   <cfreturn GetWinBidder />
		</cffunction>
		
		<!--- Get WinningBid --->
		<cffunction name="GetProductItem" returnType="Query" access="Public">
		   <cfargument name="CoopID" type="numeric" required="yes">
		   <cfargument name="ItemID" type="numeric" required="yes">
		  
		   <cfset var qgetproductItem = "">
		   
		   <cfquery name="qgetproductItem" datasource="#Instance.IpraDSN#">
		     Select *
			 From CoopProductPrice
			 Where CoopYearId = #Arguments.CoopID#
			 AND ItemID = #Arguments.ItemID#
		   </cfquery>
		   
		   <cfreturn qgetproductItem />
		</cffunction>
		
		<!--- Delete a Product --->
		<cffunction name="DeleteProduct" returnType="Void" access="Public">
		   <cfargument name="ItemID" type="String" required="yes">
		  
		   <cfquery name="AddItem" datasource="#Instance.IpraDSN#">
		      Delete From CoopProducts
			 Where ItemID = #Arguments.ItemID#
		   </cfquery>
		</cffunction>
		
		<!--- GetInvoices for a particular period --->
		<cffunction name="getInvoices" returnType="query" access="Public">
		   <cfargument name="CoopID" type="numeric" required="yes">
		  
		   <cfquery name="Invoice" datasource="#Instance.IpraDSN#">
		      Select T.PoNumber, T.Ordernum, T.Amount, T.DateAuthorized, M.FirstName, M.LastName, M.Company, M.Address1, M.Address2, M.City, M.State, M.ZipCode
			  From Transactions T, Members M, CoopRegistration R
				Where T.purchaseCode = 'COO'
				AND T.TransType = 'PO'
                AND T.MemberID = M.MemberID
				AND R.MemberID = T.MemberID
				AND R.CoopID = #Arguments.CoopID#
				Order By M.Company, T.DateAuthorized
		   </cfquery>
		   <cfreturn Invoice />
		</cffunction>
		
</cfcomponent>