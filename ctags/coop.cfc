<cfcomponent displayname="Coop">
		
		<!--- Create Instance Structure --->
		<cfset instance = StructNew()>
		
		<!--- Set Datasource --->
		<cfset Instance.IpraDSN = "ILIPRA">
		<cfset Instance.mailserver = "mail.ilipra.org">
		<cfset Instance.MailUser = "webuser">
		<cfset Instance.MailPassword = "raDJa8756()3@">
		
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
<!--- #################################################
     This is the Coop Configuration Section

################################################## --->			
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
		  Check Coop Enrollment Date, 
		  Pass in a date and this will tell you whether the Enrollment Period is going On. 
		  Useful if someone tries to bookmark the Enrollment page 
		 **********************--->
		<cffunction name="ChkCoopEnrollmentDate" returnType="Boolean" access="Public">
		  <cfset Initialized = True>
		</cffunction>
		
		<!--- ********************
		  Check Coop Configuration, 
		  Pass in a date and this will tell you whether the Enrollment Period is going On 
		 **********************--->
		<cffunction name="ChkOrderCutoff" returnType="Boolean" access="Public">
		  <cfset Initialized = True>
		</cffunction>
		
		
<!--- #################################################
     This is the Registration Functionalities

################################################## --->		

        <!--- ********************
		  Check to see if I am enrolled in the Coop, 
		  Pass the CoopID and My MemberID to see if I am enrolled in the coop 
		 **********************--->
		<cffunction name="ChkCoopEnrollment" returnType="query" access="Public">
		  <cfargument name="memberID" type="numeric" required="yes">
		  <cfargument name="CoopID" type="numeric" required="yes">
		  
		  <cfquery name="getReg" datasource="#Instance.IpraDSN#">
		     Select M.Firstname, M.Lastname, M.Email, R.*
			 From CoopRegistration R, members M
			 Where R.MemberID = M.MemberID
			 AND R.MemberID = #arguments.MemberID#
			 AND R.CoopID = #Arguments.CoopID#
		  </cfquery>
		  <cfreturn getReg />
		</cffunction>
		 
		<!--- ********************
		  Get Eav for Registration Form, 
		  This will be set into a Session Variable
		 **********************--->
		<cffunction name="GetEAV" returnType="Query" access="Public">
		  <cfquery name="getEav" datasource="#Instance.IpraDSN#">
		     Select ProductID, ProductName, MemberPrice, QuantityMeasure
			 From dbo.Products
			 Where ProductType = '08'
			 order By MemberPrice
		  </cfquery>
		  <cfreturn getEAV />
		</cffunction>
		
		<!--- ********************
		  Get Specific Eav for Registration Form, 
		  This will be set into a Session Variable
		 **********************--->
		<cffunction name="GetEAVInfo" returnType="Query" access="Public">
		  <cfargument name="productID" type="numeric" required="Yes">
		  
		  <cfquery name="getEav" datasource="#Instance.IpraDSN#">
		     Select ProductID, ProductName, MemberPrice, QuantityMeasure
			 From dbo.Products
			 Where ProductType = '08'
			 AND productID = <cfqueryparam value="#Arguments.productID#" cfsqltype="CF_SQL_INTEGER">
			 order By MemberPrice
		  </cfquery>
		  <cfreturn getEAV />
		</cffunction>
		
		<!--- ********************
		  Get Specific Eav for Registration Form, 
		  This will be set into a Session Variable
		 **********************--->
		<cffunction name="GetAgencyEAV" returnType="Query" access="Public">
		  <cfargument name="AgencyID" type="numeric" required="Yes">
		  
		  <cfquery name="getAgEav" datasource="#Instance.IpraDSN#">
		     Select E.ProductID, ProductName
			 From CoopAgencyEAV E, dbo.Products P, Agencies A
			 Where E.ProductID = P.ProductID 
			 AND A.AgencyID = E.AgencyID
			 AND A.IPRAAgencyID = #Arguments.AgencyID#
		  </cfquery>
		  <cfreturn getagEAV />
		</cffunction>
		
 <!--- ********************
  Update the registration with the transactionID
 **********************--->
		<cffunction name="UpdateRegWTransID" returnType="void" access="Public">
		  <cfargument name="TransID" type="numeric" required="Yes">
		  <cfargument name="RegistrationID" type="numeric" required="Yes">
		  
		  <cfquery name="UpdReg" datasource="#Instance.IpraDSN#">
		     Update CoopRegistration
			 Set TransactionID = #Arguments.TransID#
			 Where RegistrationID = #Arguments.RegistrationID#
		  </cfquery>

		</cffunction>
		
		
  <!--- ********************
	Insert Registration
	This will be set into a Session Variable
	**********************--->
		<cffunction name="InsertRegistration" returnType="Query" access="Public">
		  <cfargument name="MemberID" type="numeric" required="Yes">
		  <cfargument name="AgencyID" type="numeric" required="No">
		  <cfargument name="RegistrationDate" type="date" required="Yes">
		  <cfargument name="RegEAV" type="numeric" required="Yes">
		  <cfargument name="CoopID" type="Numeric" required="Yes">
		  <cfargument name="SecFirstame" type="string" required="No">
		  <cfargument name="Seclastname" type="string" required="No">
		  <cfargument name="SecEmail" type="string" required="No">
		  <cfargument name="SecPassword" type="string" required="No">
		  <cfargument name="SecPhone" type="string" required="No">
		  <cfargument name="SecFax" type="string" required="No">
		  <cfargument name="AgreedMOU" type="numeric" required="Yes">
		  
		   <cfquery name="InsertReg" datasource="#Instance.IpraDSN#">
		     Insert Into CoopRegistration (
			 	MemberID,
				AgencyID,
				RegistrationDate,
				RegEAV,
				CoopID,
				SecFirstname,
				SecLastName,
				SecEmail,
				SecPhone,
				SecFax,
				SecPassword,
				AgreedMOU
			 )
			 Values(
			   <cfqueryparam value="#Arguments.memberID#" cfsqltype="CF_SQL_INTEGER">,
			   <cfqueryparam value="#Arguments.AgencyID#" cfsqltype="CF_SQL_INTEGER">,
			   <cfqueryparam value="#Arguments.RegistrationDate#" cfsqltype="CF_SQL_TIMESTAMP">,
			   <cfqueryparam value="#Arguments.RegEAV#" cfsqltype="CF_SQL_INTEGER">,
			   <cfqueryparam value="#Arguments.CoopID#" cfsqltype="CF_SQL_INTEGER">,
			   <cfif IsDefined("Arguments.SecFirstame")>
			   		<cfqueryparam value="#Arguments.SecFirstame#" cfsqltype="CF_SQL_VARCHAR">,
			   <cfelse>
			        NULL,
			   </cfif>
			   <cfif IsDefined("Arguments.Seclastname")>
			   		<cfqueryparam value="#Arguments.Seclastname#" cfsqltype="CF_SQL_VARCHAR">,
			   <cfelse>
			        NULL,
			   </cfif>
			   <cfif IsDefined("Arguments.SecEmail")>
			   		<cfqueryparam value="#Arguments.SecEmail#" cfsqltype="CF_SQL_VARCHAR">,
			   <cfelse>
			        NULL,
			   </cfif>
			   <cfif IsDefined("Arguments.SecPhone")>
			   		<cfqueryparam value="#Arguments.SecPhone#" cfsqltype="CF_SQL_VARCHAR">,
			   <cfelse>
			        NULL,
			   </cfif>
			   <cfif IsDefined("Arguments.SecFax")>
			   		<cfqueryparam value="#Arguments.SecFax#" cfsqltype="CF_SQL_VARCHAR">,
			   <cfelse>
			        NULL,
			   </cfif>
			   <cfif IsDefined("Arguments.SecPassword")>
			   		<cfqueryparam value="#Arguments.SecPassword#" cfsqltype="CF_SQL_VARCHAR">,
			   <cfelse>
			        NULL,
			   </cfif>
			   <cfqueryparam value="#Arguments.AgreedMOU#" cfsqltype="CF_SQL_BIT">
			 )
		  </cfquery>
		  
		  <cfset GetRegID = ChkCoopEnrollment(Arguments.memberID, Arguments.CoopID)>
		  <cfif IsDefined("Arguments.SecEmail")>
		     <cfif getRegID.Recordcount GT 0>
			    <cfset SendSecUserInfo = SendSecUseremail(GetRegID)>
			 </cfif> 
		  </cfif>
		  <cfreturn getRegID />
		</cffunction>
		
  <!--- ********************
	Send Registration Confirmation Emails
   This will be set into a Session Variable
		 **********************--->
		<cffunction name="SendConfirmationEmail" returnType="void" access="Public">
		  <cfargument name="senderEmail" type="string" required="YES">
		  <cfargument name="EmailSubject" type="string" required="YES">
		  <cfargument name="CoopDesc" type="string" required="YES">
		  <cfargument name="orderBegin" type="string" required="YES">
		  <cfargument name="orderEnds" type="string" required="YES">
		  <cfargument name="CoopEndDate" type="string" required="YES">
		  
<cfif Findnocase("@", Arguments.SenderEmail, 1) GT 0>		  
<cfmail to="#Arguments.SenderEmail#" from="webmaster@ilipra.org" subject="#Arguments.EmailSubject#" server="#Instance.mailserver#" username="#Instance.MailUser#" password="#Instance.MailPassword#">
Welcome to the #Arguments.CoopDesc#!

Now that you have registered you may begin filling out your order form online by going to http://www.ilipra.org/MembersOnly/Coop/ on or after #Arguments.orderBegin#

Please note the following dates as they relate to orders and purchases.

Online Ordering Begins: #Arguments.orderBegin#
Online Ordering Ends: #Arguments.orderEnds#
Cooperative Purchase Program Ends: #Arguments.CoopEndDate#

Sincerely,


Heather Weishaar
Corporate Relations Manager


*********************************************************
This email was automatically generated, 
please do not respond to it.
**********************************************************
</cfmail>
</cfif>
		</cffunction>
		
  <!--- ********************
	Send Registration Confirmation Emails
   This will be set into a Session Variable
		 **********************--->
		<cffunction name="SendSecUseremail" returnType="void" access="Public">
		  <cfargument name="RegID" type="query" required="yes">
		  
<cfif Arguments.RegID.SecEmail NEQ "">		  
<cfmail to="#Arguments.RegID.SecEmail#" from="webmaster@ilipra.org" subject="Welcome to the IPRA Cooperative Purchase Program" server="#Instance.mailserver#" username="#Instance.MailUser#" password="#Instance.MailPassword#">
Welcome to the IPRA Cooperative Purchase Program #Arguments.RegID.SecFirstname# #Arguments.RegID.seclastname#,

You have been assigned as a secondary contact to the IPRA Cooperative Purchase Program by #Arguments.RegID.Firstname# #Arguments.RegID.Lastname#

To login to the system you must go to the special login area located at http://www.ilipra.org/CoopLogin . This will be your login area using the following username and password.

Username: #Arguments.RegID.SecEmail#
Password: #Arguments.RegID.SecPassword#

Once you login you will be able to maintain your agency's orders along with the member that assigned you. If you have any questions please contact IPRA at (630) 376-1911.

Sincerely,


Heather Weishaar
Corporate Relations Manager


*********************************************************
This email was automatically generated, 
please do not respond to it.
**********************************************************
</cfmail>
</cfif>
		</cffunction>
				
<!--- ********************
  Generate Unique Passwords for the Secondary user.
**********************--->
		<cffunction name="GeneratePassword" access="public" returntype="string">
	        <cfset Password = "z"&"#RandRange(1,9)##RandRange(1,9)##chr(RandRange(65,90))##RandRange(1,9)##chr(RandRange(65,90))##RandRange(1,9)##chr(RandRange(65,90))##chr(RandRange(65,90))#">
	      <cfreturn Password />
	    </cffunction>
		
<!---//////////////////////////////////

      Order Functions 

////////////////////////////////// --->	
  <!--- ********************
  get all orders for all years, other than this year
 **********************--->
		<cffunction name="CheckOrderExists" returnType="Boolean" access="Public">
		   <cfargument name="MemberID" type="NUMERIC" required="YES">
		   
		   <cfquery name="CheckOrder" datasource="#Instance.IpraDSN#">
		       Select Top 1 O.OrderID
			   From CoopOrders O, CoopRegistration R
			   Where R.RegistrationID = O.RegistrationID
			   AND R.MemberID = #Arguments.MemberID#
		   </cfquery>
		   
		   <cfif CheckOrder.recordcount GT 0>
		     <cfset orderExists = True>
		   <cfelse>
		   	 <cfset orderExists = False>
		   </cfif>
		   <cfreturn orderExists />
		</cffunction>
		
  <!--- ********************
  get all orders for all years, other than this year
 **********************--->
		<cffunction name="GetallOrders" returnType="Query" access="Public">
		   <cfargument name="MemberID" type="NUMERIC" required="YES">
		   
		   <cfquery name="getAllorders" datasource="#Instance.IpraDSN#">
		       Select O.OrderID, O.CoopYearID, C.ConfigID, C.CoopYear, R.MemberID,
			     (Select Count(*)
				   From CoopOrderItems
				   Where OrderID = O.OrderID) as TotalItems,
				 (Select Sum(P.Cost)
				   From CoopOrderItems I, CoopProductPrice P
				   Where I.OrderID = O.OrderID
				   AND I.ProductID = P.ItemID) as TotalCost
			   From CoopConfig C, CoopOrders O, CoopRegistration R
			   Where C.ConfigID = R.CoopID
			   AND R.RegistrationID = O.RegistrationID
			   AND R.MemberID = #Arguments.MemberID#
		   </cfquery>
		
		   <cfreturn getAllorders />
		</cffunction>
		
 <!--- ********************
  Get the Current Order Info
 **********************--->
		<cffunction name="getCurrentorderInfo" returnType="Query" access="Public">
		   <cfargument name="orderID" type="NUMERIC" required="YES">
		   
		   <cfquery name="GetInfo" datasource="#Instance.IpraDSN#">
		       Select O.*, C.*
			   From CoopOrders O, CoopConfig C
		       Where O.CoopYearID = C.ConfigID
			   AND O.OrderID = #Arguments.OrderID#
		   </cfquery>	 
		     
		   <cfreturn GetInfo />
		</cffunction>
		
   <!--- ********************
  Set the Order Completed Flag
 **********************--->
		<cffunction name="CompleteOrder" returnType="void" access="Public">
		   <cfargument name="orderID" type="NUMERIC" required="YES">
		   
		   <cfquery name="GetInfo" datasource="#Instance.IpraDSN#">
		       Update CoopOrders
			   Set orderComplete = #CreateODBCDateTime(Now())#
		       Where OrderID = #Arguments.OrderID#
		   </cfquery>	   

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
			  Order By Ranking, CodeValue, CodeDesc
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
		      Select I.*, 
			    (Select CodeDesc
				  From lookup
				   Where CodeGroup = 'CoopUOM'
				   AND Codevalue = I.UOM) as UnitofMeasure,
			   (Select Cost 
					From CoopProductPrice
					Where ItemID = I.ItemID
					AND CoopYearId = #Arguments.CoopID#) as Cost,
			   (Select WinningVendorID 
					From CoopProductPrice
					Where ItemID = i.ItemID
					AND CoopYearId = #Arguments.CoopID#) as WinningVendorID,
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
			   (Select count(*)
				     From dbo.CoopVendorProducts VP
					 Where ItemID = I.ItemID
					 AND CoopID = #Arguments.CoopID#) as BidsReceived,								   
			   (Select Cost 
					From CoopProductPrice
					Where ItemID = I.ItemID
					AND CoopYearId = (Select Top 1 ConfigID
						                 From CoopConfig
										 Where CoopEndDate <= #CreateODBCDateTime(now())#
										 )) as PreviousCost	   
			  From CoopProducts I
			  Where I.IsActive = 1
			  AND I.catID = '#Arguments.CategoryCode#'
			  AND I.groupID = '#Arguments.groupID#'
			  Order By ItemName, ItemCode
		   </cfquery>
		
		   <cfreturn getItems />
		</cffunction>
		
		<!--- ********************
		  get the Items from the  table
		 **********************--->
		<cffunction name="getRejectDesc" returnType="string" access="Public">
		   <cfargument name="CoopID" type="Numeric" required="yes">
		   <cfargument name="ItemID" type="Numeric" required="yes">
		   
		   
		   <cfquery name="RejectDesc" datasource="#Instance.IpraDSN#">
		      Select RejectReason 
			  From CoopProductPrice
			  Where ItemID = #Arguments.ItemID#
			  AND CoopYearId = #Arguments.CoopID#
		   </cfquery>
		
		   <cfreturn RejectDesc.RejectReason />
		</cffunction>
		
		<!--- ********************
		  get the Items from the  table
		 **********************--->
		<cffunction name="getVoteDesc" returnType="string" access="Public">
		   <cfargument name="CoopID" type="Numeric" required="yes">
		   <cfargument name="ItemID" type="Numeric" required="yes">
		   
		   
		   <cfquery name="VoteDesc" datasource="#Instance.IpraDSN#">
		      Select VoteDesc 
			  From CoopProductPrice
			  Where ItemID = #Arguments.ItemID#
			  AND CoopYearId = #Arguments.CoopID#
		   </cfquery>
		
		   <cfreturn VoteDesc.VoteDesc />
		</cffunction>
		
		<!--- ********************
		  get the Items from the  table that have a quantity
		 **********************--->
		<cffunction name="getItemswithQuantity" returnType="Query" access="Public">
		   <cfargument name="CoopID" type="Numeric" required="yes">
		   <cfargument name="CategoryCode" type="string" required="yes">
		   <cfargument name="groupID" type="string" required="yes">
		   
		   <cfquery name="getitemsQ" datasource="#Instance.IpraDSN#">
		      Select p.*,
				  (Select CodeDesc
				     From lookup
				     Where CodeGroup = 'CoopUOM'
				     AND Codevalue = P.UOM) as UnitofMeasure,
				  <!--- (Select Cost 
					From CoopProductPrice
					Where ItemID = I.ItemID
					AND CoopYearId = #Arguments.CoopID#) as Cost,
			   (Select WinningVendorID 
					From CoopProductPrice
					Where ItemID = i.ItemID
					AND CoopYearId = #Arguments.CoopID#) as WinningVendorID,
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
					AND CoopYearId = #Arguments.CoopID#) as RejectReason,	 --->	 
				  (Select count(*)
				     From dbo.CoopVendorProducts VP
					 Where ItemID = P.ItemID
					 AND CoopID = #Arguments.CoopID#) as BidsReceived
				From CoopProducts P
				Where P.catID = '#Arguments.CategoryCode#'
				AND P.GroupID = '#Arguments.groupID#' 
				AND Exists (Select Top 1 productID
				                From dbo.CoopOrderItems I, dbo.CoopOrders O
				                Where I.orderID = O.orderID
						        AND I.productID = P.ItemID
						        AND O.CoopYearID = #Arguments.CoopID#)
				order By P.ItemName, P.ItemCode		
		   </cfquery>
		
		   <cfreturn getItemsQ />
		</cffunction>
		
		<!--- ********************
		  Create order ID
		 **********************--->
		<cffunction name="CreateOrderID" returnType="numeric" access="Public">
		   <cfargument name="RegID" type="numeric" required="yes">
		   <cfargument name="CoopID" type="numeric" required="yes">
		   
		   <cfquery name="createOrderID" datasource="#Instance.IpraDSN#">
		      INSERT INTO CoopOrders(
			      RegistrationID,
				  CoopYearID,
				  DateCreated
			  )
			  VALUES(
			      #Arguments.RegID#,
				  #Arguments.CoopID#,
				  #CreateODBCDateTime(now())#
			  )
		   </cfquery>
		   
		   <cfset NeworderID = this.getOrderID(RegID, CoopID)>
		   <cfset NewOrderID = NewOrderID.orderID>
		   <cfreturn NeworderID />
		</cffunction>
		
		<!--- ********************
		  get Order ID
		 **********************--->
		<cffunction name="getOrderID" returnType="Query" access="Public">
		   <cfargument name="RegID" type="numeric" required="yes">
		   <cfargument name="CoopID" type="numeric" required="yes">
		   
		   <cfquery name="getOrderID" datasource="#Instance.IpraDSN#">
		      Select OrderID, RegistrationID, CoopYearID, orderComplete
			  From CoopOrders
			  Where RegistrationID = #Arguments.RegID#
			  AND CoopYearID = #Arguments.CoopID#
		   </cfquery>
		
		   <cfreturn getOrderID />
		</cffunction>
		
		<!--- ********************
		  get All Order Items
		 **********************--->
		<cffunction name="getAllOrderItemsByVendor" returnType="Query" access="Public">
		   <cfargument name="orderID" type="numeric" required="yes">
		   
		   <cfquery name="getOrdersByVendor" datasource="#Instance.IpraDSN#">
		      Select I.orderItemID, I.OrderID, I.Quantity, P.ItemID, 
			         P.ItemCode, P.CatID, P.GroupID, P.ItemName,
					 P.ItemDesc, V.VendorID, V.CompanyName, V.Firstname, V.Lastname,
					 V.Address, V.Address2, V.City, V.State, V.Zip, V.Phone, V.Fax, 
					 V.Email, V.Website, V.Extension, PP.VendorProdName, PP.Cost,
				(Select CodeDesc
				           From lookup
				           Where CodeGroup = 'CoopUOM'
				           AND Codevalue = P.UOM) as UnitofMeasure,
				(Select Cost 
						   From CoopProductPrice
						   Where ItemID = P.ItemID
						   AND CoopYearId = (Select Top 1 ConfigID
						                        From CoopConfig
												Where CoopEndDate <= #CreateODBCDateTime(now())#
												AND ConfigID <> O.CoopYearID)) as PreviousCost,
				(Select Company
				           From Members M, CoopRegistration R
						    Where M.MemberId = R.MemberID
							ANd R.RegistrationID = O.RegistrationID) as AgencyName   										   	 
			  From CoopOrderItems I, CoopOrders O, CoopProducts P, CoopProductPrice PP, CoopVendors V
			  Where O.OrderID = I.OrderID
			  AND O.OrderID = #Arguments.OrderID#
			  AND I.ProductID = P.ItemID	 
		      AND PP.ItemID = P.ItemID
			  AND PP.WinningVendorID = V.VendorID
			  Order By V.CompanyName, P.Itemname, P.ItemID
		   </cfquery>
		
		   <cfreturn getOrdersByVendor />
		</cffunction>
		
		<!--- ********************
		  get All Order Items
		 **********************--->
		<cffunction name="getAllOrderItems" returnType="Query" access="Public">
		   <cfargument name="orderID" type="numeric" required="yes">
		   
		   <cfquery name="getAllOrders1" datasource="#Instance.IpraDSN#">
		      Select I.orderItemID, I.OrderID, I.Quantity, P.ItemID, 
			         P.ItemCode, P.CatID, P.GroupID, P.ItemName,
					 P.ItemDesc, 
			     (Select Cost 
						   From CoopProductPrice
						   Where ItemID = P.ItemID
						   AND CoopYearId = (Select Top 1 ConfigID
						                        From CoopConfig
												Where CoopEndDate <= #CreateODBCDateTime(now())#
												AND ConfigID <> O.CoopYearID)) as PreviousCost,
				 (Select Cost 
						   From CoopProductPrice
						   Where ItemID = P.ItemID
						   AND CoopYearId = O.CoopYearID) as CurrentCost,
				 								
			     (Select CodeDesc
				           From lookup
				           Where CodeGroup = 'CoopUOM'
				           AND Codevalue = P.UOM) as UnitofMeasure,
			     (Select CategoryDescription 
						   From CoopCategories
						   Where CategoryCode = P.CatID) as CategoryName,
				 (Select CodeDesc
				           From lookup
				           Where CodeGroup = 'CoopGroup'
				           AND Codevalue = P.GroupID) as GroupName,
				 (Select Company
				           From Members M, CoopRegistration R
						    Where M.MemberId = R.MemberID
							ANd R.RegistrationID = O.RegistrationID) as AgencyName   
			 From CoopOrderItems I, CoopOrders O, CoopProducts P
			 Where O.OrderID = I.OrderID
			 AND O.OrderID = #Arguments.OrderID#
			 AND I.ProductID = P.ItemID   
			 Order By P.GroupID, P.CatID, P.ItemName, P.ItemCode
		   </cfquery>
		
		   <cfreturn getAllOrders1 />
		</cffunction>
		
		<!--- ********************
		  get Order Items
		 **********************--->
		<cffunction name="getOrderItems" returnType="Query" access="Public">
		   <cfargument name="ItemID" type="numeric" required="yes">
		   <cfargument name="orderID" type="numeric" required="yes">
		   
		   <cfquery name="getOrders2" datasource="#Instance.IpraDSN#">
		      Select I.orderItemID, I.OrderID, I.Quantity, P.ItemID, 
			         P.ItemCode, P.CatID, P.GroupID, P.ItemName, P.UOM, 
					 P.ItemDesc, C.Cost,
						 (Select Cost
						   From CoopProductPrice
						   Where ItemID = I.ItemID
						   AND CoopYearId = (Select Top 1 ConfigID
						                        From CoopConfig
												Where CoopEndDate <= #CreateODBCDateTime(now())#
												AND ConfigID <> O.CoopYearID)) as PreviousCost	 
			  From CoopOrderItems I, CoopOrders 0, CoopProducts P, CoopProductPrice C
			  Where I.ItemID = P.ItemID
			  AND P.ItemID = C.ItemID
			  AND C.CoopYearId = O.CoopYearID
			  AND I.OrderID = #Arguments.OrderID#
			  AND I.orderItemID = #Arguments.ItemID#
			  order By P.GroupID, P.CatID, P.ItemName, P.ItemCode
		   </cfquery>
		
		   <cfreturn getOrders2 />
		</cffunction>
		
		<!--- ********************
		  get Order Items by Category for Editing
		 **********************--->
		<cffunction name="getItemsByCategory" returnType="Query" access="Public">
		   <cfargument name="orderID" type="numeric" required="yes">
		   <cfargument name="CategoryID" type="string" required="yes">
		   
		   
		   <cfquery name="getOrdersbyCat" datasource="#Instance.IpraDSN#">
		      		      Select I.orderItemID, I.OrderID, I.Quantity, P.ItemID, 
			         P.ItemCode, P.CatID, P.GroupID, P.ItemName,
					 P.ItemDesc, 
			     (Select Cost 
						   From CoopProductPrice
						   Where ItemID = P.ItemID
						   AND CoopYearId = (Select Top 1 ConfigID
						                        From CoopConfig
												Where CoopEndDate <= #CreateODBCDateTime(now())#
												AND ConfigID <> O.CoopYearID)) as PreviousCost,
				 (Select Rejected
				    From CoopProductPrice
					Where ItemID = I.ProductID
					AND CoopYearId = O.CoopYearID
					AND Rejected = 1) as ItemRejected,								
				 (Select Cost 
						   From CoopProductPrice
						   Where ItemID = P.ItemID
						   AND CoopYearId = O.CoopYearID) as CurrentCost,
				 								
			     (Select CodeDesc
				           From lookup
				           Where CodeGroup = 'CoopUOM'
				           AND Codevalue = P.UOM) as UnitofMeasure,
			     (Select CategoryDescription 
						   From CoopCategories
						   Where CategoryCode = P.CatID) as CategoryName,
				 (Select CodeDesc
				           From lookup
				           Where CodeGroup = 'CoopGroup'
				           AND Codevalue = P.GroupID) as GroupName
			 From CoopOrderItems I, CoopOrders O, CoopProducts P
			 Where O.OrderID = I.OrderID
			 AND O.OrderID = #Arguments.OrderID#
			 AND I.ProductID = P.ItemID   
			 AND P.CatID = '#arguments.CategoryID#'
			 Order By P.GroupID, P.CatID, P.ItemName, P.ItemCode
		   </cfquery>
		
		   <cfreturn getOrdersbyCat />
		</cffunction>
 <!--- ********************
    get Order Items
   **********************--->
		<cffunction name="getItemInOrder" returnType="Query" access="Public">
		   <cfargument name="ItemID" type="numeric" required="yes">
		   <cfargument name="orderID" type="numeric" required="yes">
		   
		   <cfquery name="getIteminOrders" datasource="#Instance.IpraDSN#">
		      Select I.orderItemID, I.OrderID, I.Quantity, I.ProductID
			  From CoopOrderItems I
			  Where I.OrderID = #Arguments.OrderID#
			  AND I.ProductID = #Arguments.ItemID#
		   </cfquery>
		
		   <cfreturn getIteminOrders />
		</cffunction>
  <!--- ********************
   Update Order Updated Date
  **********************--->
		<cffunction name="UpdateOrderLastModified" returnType="Void" access="Private">
		   <cfargument name="orderID" type="numeric" required="yes">
		   
		   <cfquery name="UpdateLastModDate" datasource="#Instance.IpraDSN#">
		       Update dbo.CoopOrders
			   Set LastUpdated = #CreateODBCDateTime(now())#
			   Where OrderID = #Arguments.OrderID#
		   </cfquery>
		
		   
		</cffunction>
		    
		<!--- ********************
		  Insert Order Items and Quantities
		 **********************--->
		<cffunction name="AddOrder" returnType="Boolean" access="Public">
		   <cfargument name="orderID" type="numeric" required="yes">
		   <cfargument name="prodID" type="numeric" required="yes">
		   <cfargument name="Quantity" type="numeric" required="yes">
		   
		   <cfset CommitIt = "true">
		   <cftransaction action="begin">
			   <cftry>
				   <cfquery name="InsertOrder" datasource="#Instance.IpraDSN#">
				      Insert Into CoopOrderItems(
					  		OrderID,
							productID,
							Quantity,
							DateAdded
					  )
					  Values(
					  		#Arguments.orderID#,
							#Arguments.ProdID#,
							#Arguments.Quantity#,
							#CreateODBCDateTime(now())#
					  )
				   </cfquery>
			   
				   <cfcatch type="database">
					   <cfset CommitIT = False>
				   </cfcatch>
			   </cftry>
		   
		   <cfif CommitIt>
		     <cftransaction action="COMMIT" />
		   <cfelse>
		     <cftransaction action="ROLLBACK" />
		   </cfif>
		   
		   </cftransaction>
		   <cfset UpdateLastModDate = UpdateOrderLastModified(Arguments.orderID)>
		   <cfreturn CommitIt />
		</cffunction>
		
		<!--- ********************
		  Update Order Items and Quantities
		 **********************--->
		<cffunction name="UpdateOrder" returnType="Boolean" access="Public">
		   <cfargument name="orderID" type="numeric" required="yes">
		   <cfargument name="prodID" type="numeric" required="yes">
		   <cfargument name="Quantity" type="numeric" required="yes">
		   
		   <cfset CommitIt = "true">
		   
		   <cftransaction action="begin">
			   <cftry>
				   <cfquery name="InsertOrder" datasource="#Instance.IpraDSN#">
				      Update CoopOrderItems
					  	Set	Quantity = #Arguments.Quantity#,
							DateModified = #CreateODBCDateTime(now())#
                        Where OrderID = #Arguments.orderID#
						AND productID = #Arguments.ProdID#
				   </cfquery>
			   
				   <cfcatch type="database">
					   <cfset CommitIT = False>
				   </cfcatch>
			   </cftry>
		   
		   <cfif CommitIt>
		     <cftransaction action="COMMIT" />
		   <cfelse>
		     <cftransaction action="ROLLBACK" />
		   </cfif>
		   
		   </cftransaction>
		   <cfset UpdateLastModDate = UpdateOrderLastModified(Arguments.orderID)>
		   <cfreturn CommitIt />
		</cffunction>
		
		<!--- ********************
		  Delete Order Items
		 **********************--->
		<cffunction name="DeleteOrderItem" returnType="Boolean" access="Public">
		   <cfargument name="orderID" type="numeric" required="yes">
		   <cfargument name="ItemID" type="numeric" required="yes">
		   
		   <cfset CommitIt = "true">
		   
		   <cftransaction action="begin">
			   <cftry>
				   <cfquery name="DeleteOrderItem" datasource="#Instance.IpraDSN#">
				      Delete From CoopOrderItems
					  	Where orderItemID = #Arguments.ItemID#
						AND OrderID = #Arguments.orderID#
				   </cfquery>
			   
				   <cfcatch type="database">
					   <cfset CommitIT = False>
				   </cfcatch>
			   </cftry>
		   
		   <cfif CommitIt>
		     <cftransaction action="COMMIT" />
		   <cfelse>
		     <cftransaction action="ROLLBACK" />
		   </cfif>
		   
		   </cftransaction>
		   <cfset UpdateLastModDate = UpdateOrderLastModified(Arguments.orderID)>
		   <cfreturn CommitIt />
		</cffunction>
<!---/////////////////////////////////

Vendor Functions 

//////////////////////////////// --->	
<cffunction name="GetVendorID" access="public" returntype="numeric">
  <cfargument name="vendorname" required="Yes" type="string">
  <cfargument name="Email" required="Yes" type="string">
  
  <cfquery name="GetvendorID" datasource="#Instance.IpraDSN#">
    Select VendorID
	From CoopVendors
	Where CompanyName = '#Arguments.VendorName#'
	AND Email = '#Arguments.Email#'
  </cfquery>
  <cfif GetVendorID.RecordCount GT 0>
   <cfset VendorID = getVendorID.VendorID>
  <cfelse>
    <cfset VendorID = 0> 
  </cfif>
  
  <cfreturn  VendorID/>
</cffunction>

<cffunction name="GetVendorInfo" access="public" return="Query">
  <cfargument name="VendorID" required="Yes" type="numeric">
  
  <cfquery name="GetvendorInfo" datasource="#Instance.IpraDSN#">
    Select *
	From CoopVendors
	Where VendorID= '#Arguments.VendorID#'
  </cfquery>
  
  <cfreturn getVendorInfo />
</cffunction>

<cffunction name="InsertVendor" access="Public" return="Void">
   <cfargument name="SendVendorEmail" required="Yes" type="Numeric">
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
   <cfargument name="RecdBy" required="NO" type="string">
   <cfargument name="SpecSent" required="NO" type="date">
   <cfargument name="VendorSince" required="NO" type="date">
   <cfargument name="VendorNotes" required="NO" type="string">
   <cfargument name="IsActive" required="NO" type="String">
   <cfargument name="BondRcvd" required="NO" type="String">
   <cfargument name="ContractRcvd" required="NO" type="numeric">
   
   <cfquery name="InsertVendor" datasource="#Instance.IpraDSN#">
     Insert Into CoopVendors(
	     CompanyName, 
	     Prefix,
		 Firstname,
		 Lastname,
		 MI,
		 VenPosition, 
		 Address, 
		 Address2, 
		 City, 
		 State, 
		 Zip, 
		 Phone, 
		 Extension,
		 Fax,
		 Email,
		 Website,
		 ProductGroup,
		 RecvBy,
		 SpecSent,
		 VendorSince,
		 VendorNotes,
		 IsActive,
		 BondRcvd,
		 ContractRcvd,
		 DateAdded,
		 AddedBy
	  )
	  VALUES(
	     '#Trim(Arguments.VendorName)#', 
		 <cfif IsDefined("Arguments.VendorPrefix")>
		 '#Trim(Arguments.VendorPrefix)#',
	     <cfelse>
		   NULL,
		 </cfif>
		 '#Trim(Arguments.VendorFirstname)#',
		 '#Trim(Arguments.VendorLastname)#',
		 <cfif IsDefined("Arguments.VendorMI")>
		 '#Trim(Arguments.VendorMI)#',
		 <cfelse>
		   NULL,
		 </cfif>
		 <cfif IsDefined("Arguments.VendorTitle")>
		 '#Trim(Arguments.VendorTitle)#',
		  <cfelse>
		   NULL,
		 </cfif>
		 '#Trim(Arguments.Address)#', 
		 <cfif IsDefined("Arguments.Address2")>
		 '#Trim(Arguments.Address2)#', 
		 <cfelse>
		   NULL,
		 </cfif>
		 '#Trim(Arguments.City)#', 
		 '#Trim(Arguments.State)#', 
		 '#Trim(Arguments.Zip)#', 
		 '#ReplaceList(Trim(Arguments.Phone), "/,(,),.,-,\", "")#', 
		 <cfif ISDefined("Arguments.PhoneExt")>
		  '#Trim(Arguments.PhoneExt)#',
		 <cfelse>
		   NULL,
		 </cfif>
		 <cfif ISDefined("Arguments.Fax")>
		 '#ReplaceList(Trim(Arguments.Fax), "/,(,),.,-,\", "")#',
		 <cfelse>
		   NULL,
		 </cfif>
		 '#Trim(Arguments.Email)#',
		 <cfif ISDefined("Arguments.Website")>
		 '#Trim(Arguments.Website)#',
		 <cfelse>
		   NULL,
		 </cfif>
		 '#Arguments.ProductInterest#',
		 <cfif IsDefined("Arguments.RecdBy")>'#Arguments.RecdBy#'<cfelse>'I'</cfif>,
		 <cfif IsDefined("Arguments.SpecSent")>#CreateODBCDateTime(Arguments.SpecSent)#<cfelse>NULL</cfif>,
		 <cfif IsDefined("Arguments.VendorSince")>#CreateODBCDateTime(Arguments.VendorSince)#<cfelse>NULL</cfif>,
		 <cfif IsDefined("Arguments.VendorNotes")>'#Arguments.VendorNotes#'<cfelse>NULL</cfif>,
		 <cfif IsDefined("Arguments.IsActive")>#Arguments.IsActive#<cfelse>0</cfif>,
		 <cfif IsDefined("Arguments.BondRcvd")>#Arguments.BondRcvd#<cfelse>0</cfif>,
		 <cfif IsDefined("Arguments.ContractRcvd")>#Arguments.ContractRcvd#<cfelse>0</cfif>,
		 #CreateODBCDateTime(Now())#,
		 <cfif IsDefined("Arguments.AddedBy")>#Arguments.AddedBy#<cfelse>0</cfif>
	  )
	   	 
   </cfquery>
   
   <cfif Arguments.SendVendorEmail EQ 1>
	   <cfset ThisvendorID = getVendorID(Arguments.VendorName, Arguments.Email)>
	   
	   <cfset SendVendorThankyou = SendvendorEmailResponse(ThisvendorID)>
   </cfif>
</cffunction>	

<cffunction name="SendVendorEmailResponse" access="private" return="Void">
	<cfargument name="VendorID" type="Numeric" required="YES">
	
	<cfset getVendor = getVendorInfo(Arguments.VendorID)>
<cfmail to="#GetVendor.Email#" from="webmaster@ilipra.org" subject="Thank you for your Inquiry" server="#Instance.mailserver#" username="#Instance.MailUser#" password="#Instance.MailPassword#">
Thank you for Submitting the Following Information to the IPRA for Inclusion into the Cooperative Purchase Program.

Company Name: #GetVendor.CompanyName# 
Contact: #GetVendor.Firstname# #GetVendor.Lastname# 
Address: #GetVendor.Address# 
         #GetVendor.Address2# 
         #GetVendor.City#, #GetVendor.State# #GetVendor.Zip#   
Phone: #GetVendor.Phone# 
Fax: #GetVendor.Fax# 
Email: #GetVendor.Email# 
Website: #GetVendor.Website# 

You will contacted shortly by one of our representative.



Sincerely,


Heather Weishaar
Corporate Relations Manager


*********************************************************
This email was automatically generated, 
please do not respond to it.
**********************************************************
</cfmail>
</cffunction>	

<cffunction name="SendIPRAEmailInquiry" access="private" return="Void">
	<cfargument name="VendorID" type="Numeric" required="YES">
	<cfset getVendor = getVendorInfo(Arguments.VendorID)>
<cfmail to="dean@ilipra.org" from="webmaster@ilipra.org" subject="Coop Vendor Inquiry" server="#Instance.mailserver#" username="#Instance.MailUser#" password="#Instance.MailPassword#">
A user submitted a Coop Vendor Inquiry via the IPRA website. Below is the information about this user. 
You may also view this information via the Website admin.

Vendor Name: #GetVendor.vendorName# 
Contact: #GetVendor.Firstname# #GetVendor.Lastname#
Address: #GetVendor.Address# 
         #GetVendor.Address2# 
         #GetVendor.City#, #GetVendor.State# #GetVendor.Zip#   
Phone: #GetVendor.Phone# 
Fax: #GetVendor.Fax# 
Email: #GetVendor.Email# 
Website: #GetVendor.Website# 



*********************************************************
This email was automatically generated, 
please do not respond to it.
**********************************************************
</cfmail>
</cffunction>	

<cffunction name="updateSecondaryAdmin" access="public" return="Void">
   <cfargument name="CoopID" type="Numeric" required="Yes">
   <cfargument name="RegistrationID" type="Numeric" required="Yes">
   <cfargument name="memberID" type="Numeric" required="Yes">
   <cfargument name="SecFirstame" type="string" required="Yes">
   <cfargument name="Seclastname" type="string" required="Yes">
   <cfargument name="SecEmail" type="string" required="Yes">
   <cfargument name="SecPassword" type="string" required="Yes">
   <cfargument name="SecPhone" type="string" required="No">
   <cfargument name="SecFax" type="string" required="No">
   
   <cfquery name="UpdateSecUser" datasource="#Instance.IpraDSN#">
      Update CoopRegistration
	  Set SecFirstname = '#Arguments.SecFirstame#',
	      SecLastname = '#Arguments.Seclastname#',
		  SecEmail = '#Arguments.SecEmail#',
		  SecPassword = '#Arguments.SecPassword#',
		  SecPhone = '#Arguments.SecPhone#',
		  SecFax = '#Arguments.SecFax#'
	  Where RegistrationID = #Arguments.RegistrationID#	  
   </cfquery>
   
   <cfset GetRegID = ChkCoopEnrollment(Arguments.memberID, Arguments.CoopID)>
   <cfif IsDefined("Arguments.SecEmail")>
	 <cfif getRegID.Recordcount GT 0>
		<cfset SendSecUserInfo = SendSecUseremail(GetRegID)>
	 </cfif> 
	</cfif>
</cffunction>

</cfcomponent> 