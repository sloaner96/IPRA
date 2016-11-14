
<CFMODULE Template="#Application.Header#" Heading="Online Job Posting">

<cfset ErrorList = ArrayNew(1)>
<!--- Check For General Content Errors --->

<!--- Check Agency --->
<CFIF Form.AgencyName is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Agency Name</b> field")>
</CFIF>
<CFIF Form.agaddr1 is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Agency Address</b> field")>
</CFIF>
<CFIF Form.agcity is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Agency City</b> field")>
</CFIF>
<CFIF Form.agState is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Agency State</b> field")>
</CFIF>
<CFIF Form.agZip is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Agency ZipCode</b> field")>
</CFIF>

<!--- Check Contact --->
<CFIF Form.Contact is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Contact</b> field")>
</CFIF>
<CFIF Form.Email is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Email</b> field")>
</CFIF>

<CFIF FindNocase("@", Form.Email, 1) eq 0>
	<cfset x = ArrayAppend(ErrorList, "The value specified for the <b>Email</b> field is not valid")>
</CFIF>

<CFIF Form.Phone is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Phone</b> field")>
</CFIF>




<!--- Check Job Posting  --->
<CFIF Form.JobType is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Type of Posting</b> field")>
</CFIF>

<CFIF Form.JobCategory is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Job Category</b> field")>
</CFIF>

<CFIF Form.Qualifications is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Qualifications</b> field")>
</CFIF>

<CFIF Form.JobDuties is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Job Duties</b> field")>
</CFIF>

<CFIF Form.JobTitle is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Job Title</b> field")>
</CFIF>

<CFIF Form.salary is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Salary</b> field")>

</CFIF>
<CFIF Form.ClosingDate is "">
	<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Closing Date</b> field")>

</CFIF>


<!--- Check that PayType Content --->
<CFIF Form.Paytype EQ "C">
       <CFIF Form.BillAddress is "">
			<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Billing Address</b> field")>
		</CFIF>
		
		<CFIF Form.BillCity is "">
			<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Billing City</b> field")>
		</CFIF>
		
		<CFIF Form.BillState is "">
			<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Billing State</b> field")>
		</CFIF>
		
		<CFIF Form.BillZip is "">
			<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Billing Zip</b> field")>
		</CFIF>
		
		<CFIF Form.CardType is "*">
			<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Credit Card</b> field")>
		</CFIF>
		
		<CFIF Form.CardNbr is "">
			<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Card Number</b> field")>
		</CFIF>
		
		<CFIF Form.CardName is "">
			<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Card Holder</b> field")>
		</CFIF>
		
		<CFIF Form.XMonth is "">
			<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Expiration Month</b> field")>
		</CFIF>
		
		<CFIF Form.XYear is "">
			<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Expiration Year</b> field")>
		</CFIF>
	
<cfelseif Paytype EQ "P">
    <CFIF Form.PONumber is "">
			<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Purchase Order</b> field")>
	</CFIF>	
</CFIF>


 <cfset NErrors = ArrayLen(ErrorList)> 




<!--- Get The Cost --->
<cfquery name="GetProduct" datasource="#Application.dsn#">
  Select *
  From Products
  Where ProductID = #form.JobType#
</cfquery>

<cfif Getproduct.Recordcount GT 0>
   <cfset ProductName = GetProduct.ProductName>
   <cfset ProductCat = GetProduct.ProductCategory>
   <cfif form.MemberID NEQ "">   
      <cfset ProductCost = GetProduct.MemberPrice>
   <cfelse>
      <cfset ProductCost = GetProduct.NonMemberPrice>	  
   </cfif>
<cfelse>
   <cfset x = ArrayAppend(ErrorList, "There was a problem with the Type of Job Posting you chose, Please correct and resubmit")>
</cfif> 

<CFIF ArrayLen(ErrorList) is 0>
<!--- Check For Specific Erros Based On Pay Type --->
     <cfset OrderNumber = "JOB-#RandRange(1,9)##RandRange(1,9)##chr(RandRange(65,90))##RandRange(1,9)##chr(RandRange(65,90))#">
	 <cfset userPassword = "r"&"#RandRange(1,9)##RandRange(1,9)##chr(RandRange(65,90))##RandRange(1,9)##chr(RandRange(65,90))##RandRange(1,9)##chr(RandRange(65,90))##chr(RandRange(65,90))#">			
      <!--- Payment Is Via Credit Card --->
	<cfif form.PayType EQ "C">
			
			
			
			<cfset AuthResponse = "">
			<cfset AuthReasonText = "">
			
			
			   
				  <cfset FormattedCC = ReplaceList(Form.CardNbr, "-,/, ,\", "")>
				  
				
					<CFMODULE Template="#Application.TagDir#/Skipjack.cfm"
								Server = "#Application.SysInfo.SysURL#" 
								SJName = "#form.CardName#" 
								Email = "#Form.Email#"
								StreetAddress = "#Form.BillAddress#" 
								City = "#Form.BillCity#" 
								State = "#Form.BillState#" 
								Zipcode = "#form.BillZip#" 
								OrderNumber = "#OrderNumber#" 
								AccountNumber = "#FormattedCC#" 
								Month = "#form.XMonth#" 
								Year = "#Form.XYear#" 
								SerialNumber = "#Application.SysInfo.SerialNumber#" 
								Transactionamount = "#NumberFormat(ProductCost, 0.00)#" 
								OrderString = "1~IPRA Job Posting:#ProductName#~#ProductCost#~||" 
								ShipToPhone = "#form.Phone#">
							
						 <cfif Response.ISApproved EQ "0">
							<cfset x = ArrayAppend(ErrorList, "Your Credit transaction failed with the Reason: '<b>#Response.AuthDeclinedMessage#</b>' (Code #Response.ReturnCode#).  Please review the information you provided on the previous page and try again.")>
							<cfmail to="webmaster@sloanerweb.com" from="webmaster@ilipra.org" bcc="webmaster@x2-interactive.com"  Subject="Credit Authorization Failure on ILIPRA.ORG" server="#Application.mailserver#" username="#Application.MailUser#" password="#Application.MailPassword#">
							Date: #DateFormat(now(), 'mm/dd/yyyy')#
							Time: #TimeFormat(now(), 'hh:mm:ss TT')#
					
							#Form.CardType# Payment for #Form.AgencyName#
							Name: #Form.CardName#
							Card: #Form.CardNbr#  expires: #Form.XMonth#/#Form.XYear#
							Amount: #DollarFormat(ProductCost)#
					
							Error: #Response.ReturnCode# - #Response.AuthDeclinedMessage#
							AVS Response Code: #Response.AVSResponseCode# 
							Transaction FileID: #Response.TransFileName#
							</cfmail>
							
							
							
					     </cfif> 
						 <cfif Response.ReturnCode LT 1>
							   <cfset x = ArrayAppend(ErrorList, "Your Transaction encountered a the following problem: (Error Code: #Response.ReturnCode#) <strong>#Response.AuthDeclinedMessage2#</strong>")> 
						 <cfelseif Response.ReturnCode EQ 1 AND Response.AuthCode EQ "EMPTY" AND Response.AuthDeclinedMessage NEQ "">
							   <cfset x = ArrayAppend(ErrorList, "Your Transaction encountered a the following problem: (Error Code: #Response.ReturnCode#) #Response.AuthDeclinedMessage#")> 
						 </cfif>
						 <cfif ArrayLen(ErrorList) gt 0 OR Response.ISApproved EQ "0">
								<font face="Verdana,Arial" size="-1">
								<h4><font color="Maroon">Problem(s) were encountered with your online payment transaction</font></h4>
								<p>Your transaction could not be completed because:</p>
								<ol>
								<cfloop INDEX="i" FROM="1" TO="#ArrayLen(ErrorList)#">
								<cfoutput><li><p>#ErrorList[i]#</p></li></cfoutput>
								</cfloop>
								</ol>
								<div align=center><form><input type="Button" name="" value="Click here to correct Errors Now" align="ABSMIDDLE" onclick="history.back()"></form></div>
								</font>
							
						 <cfelse>
							
								
								<!--- Add Job Posting --->
								<CFQUERY Name="AddRec" Datasource="#Application.DSN#">
									INSERT into JobPostings
										(AgencyID,
										 MemberID,
										 Category,
										 JobType,
										 Approved,
										 JobTitle,
										 JobSalary,
										 JobClosing,
										 JobQualifications,
										 JobDuties,
										 DateEntered,
										 ProductID,
										 ContactName,
										 ContactEmail,
										 ContactPhone,
										 ContactFax,
										 AgencyName,
										 AgencyAddr,
										 AgencyAddr2,
										 AgencyZip,
										 AgencyCity,
										 AgencyState,
										 AgencyURL,
										 AllowApp,
										 AgreedTerms,
										 username,
										 password,
										 LastUpdated
										)
									VALUES
										(<cfif form.AgencyID NEQ "">#form.AgencyID#<cfelse>0</cfif>,
										 <cfif form.MemberID NEQ "">#form.MemberID#<cfelse>0</cfif>,
										 '#GetProduct.ProductCategory#',
										 '#form.JobCategory#',
										 0,
										 '#form.JobTitle#',
										 '#form.Salary#',
										 <cfif form.closingDate NEQ "">'#form.ClosingDate#',<cfelse>Null,</cfif>
										 '#form.Qualifications#',
										 '#form.jobDuties#',
										 #CreateODBCDate(Now())#,
										 #GetProduct.ProductID#,
										 '#form.Contact#',
										 '#form.Email#',
										 '#form.Phone#',
										 <cfif form.fax EQ "">'#form.Fax#'<cfelse>NULL</cfif>,
										 '#form.AgencyName#',
										 '#form.agAddr1#',
										 <cfif form.agaddr2 NEQ "">'#form.agAddr2#'<cfelse>NULL</cfif>,
										 '#form.agZip#',
										 '#form.agCity#',
										 '#form.agState#',
										 <cfif form.agWebsite NEQ "">'#form.agWebsite#'<cfelse>NULL</cfif>,
										 <cfif IsDefined("form.AllowApp")>1<cfelse>0</cfif>,
										 1,
										 '#form.Email#',
										 '#userPassword#',
										 #CreateODBCDateTime(Now())#
									
										)
								</CFQUERY>
								
								<cfquery name="GetID" datasource="#Application.DSN#">
									SELECT TOP 1 JobID From JobPostings
										WHERE DateEntered = #CreateODBCDate(Now())#
											AND ProductID = #GetProduct.ProductID#
											AND ContactName = '#Form.Contact#'
											AND AgencyName = '#form.AgencyName#'
											AND JobTitle = '#Form.JobTitle#'
								</cfquery>
							
								 
								<CFQUERY Name="AddTran" Datasource="#Application.DSN#">
									INSERT into Transactions
										(JOBID,
										 TransType,
										 PurchaseCode,
										 OrderNum,
										 CardHolder,
										 CardAddress,
										 CardCity,
										 CardState,
										 CardZip,
										 CardType,
										 CardNbr,
										 CardExpMonth,
										 CardExpYear,
										 Amount,
										 Status,
										 AuthResponse,
										 AuthTransID,
										 DateAuthorized
										)
									VALUES
										(#GetID.JobID#,
										 'Credit',
										 'JOB',
										 '#OrderNumber#', 
										 '#Form.CardName#',
										 '#Form.BillAddress#',
										 '#Form.BillCity#',
										 '#Form.BillState#',
										 '#Form.BillZip#',
										 '#Form.CardType#',
										 '#FormattedCC#',
										 #Form.XMonth#,
										 #Form.XYear#,
										 #ProductCost#,
										 '#Response.ReturnCode#',
										 '#Response.AVSResponseMessage#',
										 '#Response.TransFileName#',
										 #now()#
										)
								</CFQUERY>
							    
								<cfquery name="GetTransID" datasource="#Application.dsn#">
								  Select TransID 
								  From Transactions
								  Where AuthTransID = '#Response.TransFileName#'
								</cfquery>
								
								<cfquery name="UpdatePosting" datasource="#Application.dsn#">
								  Update JobPostings
								    Set TransID = #GetTransID.TransID# 
								  Where JobID = #GetID.JobID#
								</cfquery>
								
								
<cfmail to="elizabeth@ilipra.org" from="Webmaster@ilipra.org" subject="New Job Posting Via CreditCard" server="#Application.mailserver#" username="#Application.MailUser#" password="#Application.MailPassword#">
   The following information was received via the ILIPRA.org website. The user submitted payment for a Job Posting with a payment type of Credit Card.
   Name:#Form.Contact#
   Company:#Form.AgencyName#
   Email: #Form.Email#
   Phone: #Form.Phone#
   
   Job Title: #form.JobTitle#
   Duration: #ProductName#
   
   Total Cost: #DollarFormat(ProductCost)#
   
   PAYMENT VIA Credit Card: #Form.CardType#
</cfmail>

<cfmail to="#form.email#" from="Webmaster@ilipra.org" subject="Thank You for Posting a Job" server="#Application.mailserver#" username="#Application.MailUser#" password="#Application.MailPassword#">
Thank you for Posting a Job on the IPRA Website. All Job Posting must be reviewed and approved by the IPRA, prior to being posted on our site. 
Below is you reciept for this purchase. If you have any questions please contact the IPRA at webmaster@ilipra.org 

*******************************************
RESUME SEARCH LOGIN INFORMATION
*******************************************
Upon Approval of your posting you may login and utilize the IPRA's Resume Search feature, for the duration of your job posting. This is a secure area for employers such as yourself to find today's best talent. The Resume Search is a unique tool that allows employers and job seekers to connect via the web. Below you will find your login information for the Resume Search area of the site, simply click the link or cut and paste the link into your browsers address window. 

Please note: For each job you post, you will receive a separate password in order to access resumes for the individual job you posted.
 
Login URL: #Application.SecureUrl#/careers/ResLogin.cfm
Login: #form.Email#
Password: #userPassword# (You will be prompted to change this upon your first login)

-----------------------------------------
Name:#Form.Contact#
Company:#Form.AgencyName#
Email: #Form.Email#
Phone: #Form.Phone#

Job Title: #form.JobTitle#
Duration: #ProductName#


Total Cost: #DollarFormat(ProductCost)#

PAYMENT VIA Credit Card: #Form.CardType#

</cfmail>
								<CFMODULE Template="#Application.TagDir#/AuditLog.cfm" Action="JobPost" Message="CreditCard of #DollarFormat(ProductCost)# for '#Form.AgencyName#' has been processed for Job Posting (#GetID.JobID#) #Form.JobTitle#">
							    <cfoutput><meta http-equiv="refresh" content="0;url=/Careers/PaymentConfirmation.cfm?JobID=#GetID.JobID#"></cfoutput>
								<!--- <cflocation url="/Careers/PaymentConfirmation.cfm?JobID=#GetID.JobID#" addtoken="No"> --->
							
							</cfif>
						 
				 	 
			<cfelse>
				    <!--- Payment is Via Purchase Order --->	
								<!--- Add Job Posting --->
								<CFQUERY Name="AddRec" Datasource="#Application.DSN#">
									INSERT into JobPostings
										(AgencyID,
										 MemberID,
										 Category,
										 JobType,
										 Approved,
										 JobTitle,
										 JobSalary,
										 JobClosing,
										 JobQualifications,
										 JobDuties,
										 DateEntered,
										 ProductID,
										 ContactName,
										 ContactEmail,
										 ContactPhone,
										 ContactFax,
										 AgencyName,
										 AgencyAddr,
										 AgencyAddr2,
										 AgencyZip,
										 AgencyCity,
										 AgencyState,
										 AgencyURL,
										 AllowApp,
										 AgreedTerms,
										 username,
										 password,
										 LastUpdated
										)
									VALUES
										(<cfif form.AgencyID NEQ "">#form.AgencyID#<cfelse>0</cfif>,
										 <cfif form.MemberID NEQ "">#form.MemberID#<cfelse>0</cfif>,
										 '#GetProduct.ProductCategory#',
										 '#form.JobCategory#',
										 0,
										 '#form.JobTitle#',
										 '#form.Salary#',
										 <cfif form.closingDate NEQ "">'#form.ClosingDate#',<cfelse>NULL,</cfif>
										 '#form.Qualifications#',
										 '#form.jobDuties#',
										 #CreateODBCDate(Now())#,
										 #GetProduct.ProductID#,
										 '#form.Contact#',
										 '#form.Email#',
										 '#form.Phone#',
										 <cfif form.fax EQ "">'#form.Fax#'<cfelse>NULL</cfif>,
										 '#form.AgencyName#',
										 '#form.agAddr1#',
										 <cfif form.agaddr2 NEQ "">'#form.agAddr2#'<cfelse>NULL</cfif>,
										 '#form.agZip#',
										 '#form.agCity#',
										 '#form.agState#',
										 <cfif form.agWebsite NEQ "">'#form.agWebsite#'<cfelse>NULL</cfif>,
										 <cfif IsDefined("form.AllowApp")>1<cfelse>0</cfif>,
										 1,
										 '#form.Email#',
										 '#userPassword#',
										 #CreateODBCDateTime(Now())#
									
										)
								</CFQUERY>
								
								<cfquery name="GetID" datasource="#Application.DSN#">
									SELECT TOP 1 JobID From JobPostings
										WHERE DateEntered = #CreateODBCDate(Now())#
											AND ProductID = #GetProduct.ProductID#
											AND ContactName = '#Form.Contact#'
											AND AgencyName = '#form.AgencyName#'
											AND JobTitle = '#Form.JobTitle#'
								</cfquery>
							
								 
								<CFQUERY Name="AddTran" Datasource="#Application.DSN#">
									INSERT into Transactions
										(JOBID,
										 TransType,
										 PurchaseCode,
										 OrderNum,
										 CardHolder,
										 CardAddress,
										 CardCity,
										 CardState,
										 CardZip,
										 PONumber,
										 Amount,
										 Status,
										 AuthResponse,
										 AuthTransID,
										 DateAuthorized
										)
									VALUES
										(#GetID.JobID#,
										 'PO',
										 'JOB',
										 '#OrderNumber#', 
										 '#Form.AgencyName#',
										 '#Form.AgAddr1#',
										 '#Form.AgCity#',
										 '#Form.AgState#',
										 '#Form.AgZip#',
										 '#form.PONumber#',
										 #ProductCost#,
										 NULL,
										 NULL,
										 NULL,
										 #now()#
										)
								</CFQUERY>
							
						        <cfquery name="GetTransID" datasource="#Application.dsn#">
								  Select TransID 
								  From Transactions
								  Where OrderNUm= '#OrderNUmber#'
								</cfquery>
								
								<cfquery name="UpdatePosting" datasource="#Application.dsn#">
								  Update JobPostings
								    Set TransID = #GetTransID.TransID# 
								  Where JobID = #GetID.JobID#
								</cfquery>
					
<cfmail to="elizabeth@ilipra.org" from="Webmaster@ilipra.org" subject="New Job Posting via Purchase Order" server="#Application.mailserver#" username="#Application.MailUser#" password="#Application.MailPassword#">
   The following information was received via the ILIPRA.org website. The user submitted payment for a Job Posting with a payment type of Purchase Order.
   Name:#Form.Contact#
   Company:#Form.AgencyName#
   Email: #Form.Email#
   Phone: #Form.Phone#
   
   Job Title: #form.JobTitle#
   Duration: #ProductName#
   
   Total Cost: #DollarFormat(ProductCost)#
   
   PAYMENT VIA Purchase Order: #Form.PONUMBER#
</cfmail>

<cfmail to="#form.email#" from="Webmaster@ilipra.org" subject="Thank You for Posting a Job" server="#Application.mailserver#" username="#Application.MailUser#" password="#Application.MailPassword#">
Thank you for Posting a Job on the IPRA Website. All Job Posting must be reviewed and approved by the IPRA, prior to being posted on our site. 
Below is you reciept for this purchase. If you have any questions please contact the IPRA at webmaster@ilipra.org 

*******************************************
RESUME SEARCH LOGIN INFORMATION
*******************************************
Upon Approval of your posting you may login and utilize the IPRA's Resume Search feature, for the duration of your job posting. This is a secure area for employers such as yourself to find today's best talent. The Resume Search is a unique tool that allows employers and job seekers to connect via the web. Below you will find your login information for the Resume Search area of the site, simply click the link or cut and paste the link into your browsers address window.  

Please note: For each job you post, you will receive a separate password in order to access resumes for the individual job you posted.

Login URL: #Application.SecureUrl#/careers/ResLogin.cfm
Login: #form.Email#
Password: #userPassword# (You will be prompted to change this upon your first login)
-----------------------------------------
Name:#Form.Contact#
Company:#Form.AgencyName#
Email: #Form.Email#
Phone: #Form.Phone#

Job Title: #form.JobTitle#
Duration: #ProductName#

Total Cost: #DollarFormat(ProductCost)#
 
PAYMENT VIA Purchase Order: #Form.PONUMBER#


</cfmail>

								
				    <CFMODULE Template="#Application.TagDir#/AuditLog.cfm" Action="JobPost" Message="Purchase Order Payment (PO NUMBER #Form.PONumber# of #DollarFormat(ProductCost)# for '#Form.AgencyName#' has been processed for Job Posting (#GetID.JobID#) #Form.JobTitle#">	
					
					<cfoutput><meta http-equiv="refresh" content="0;url=/Careers/PaymentConfirmation.cfm?JobID=#GetID.JobID#"></cfoutput>    
					<!--- <cflocation url="/Careers/PaymentConfirmation.cfm?JobID=#GetID.JobID#" addtoken="No"> --->
							
					
			</cfif>
<cfelse>
  <font face="Verdana,Arial" size="-1">
	<h4><font color="Maroon">Problem(s) were encountered with your online payment transaction</font></h4>
	<p>Your transaction could not be completed because:</p>
	<ol>
	<cfloop INDEX="i" FROM="1" TO="#NErrors#">
	<cfoutput><li><p>#ErrorList[i]#</p></li></cfoutput>
	</cfloop>
	</ol>
	<div align=center><form><input type="Button" name="" value="Click here to correct Errors Now" align="ABSMIDDLE" onclick="history.back()"></form></div>
  </font>
</cfif>

 

<cfmodule template="#Application.tagdir#/footer.cfm">