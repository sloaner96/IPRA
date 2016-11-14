<cfparam name="url.DonID" default="0">
<CFQUERY Name="GetEvents" Datasource="#Application.DSN#">
	Select D.*, T.*
	From Donors D, Transactions T
	Where D.TransactionID = T.TransID
	AND T.OrderNum = <cfqueryparam Value="#url.OID#" cfsqltype="CF_SQL_VARCHAR">
</CFQUERY>
<cfinclude template="#Application.TagDir#/Libraries/ccEscape.cfm">

<cfmodule template="#Application.header#" section="0" sectiontitle="Foundation Contributions">
  <cfoutput query="GetEvents">
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top"><br>
		    <cfmodule template="#Application.tagdir#/affilnav.cfm" level="3">
		   </td>
		   <td valign="Top"><br>
				 <!--- Show Confirmation --->
						  <table border="0" cellpadding="5" cellspacing="0" width="100%">
					        <tr>
					          <td><h3>Thank You for your Contribution</h3></td>
					        </tr>
					      </table>
						  <table border="0" cellpadding="6" cellspacing="0" width="100%">
					        <tr>
					           <td class="RegText"> 
							    
								
								<table border="0" cellpadding="4" cellspacing="0" class="regtext" width="100%">
			                      <tr>
								    <td><strong>Please look over the information you just entered and make sure that everything is correct.</strong></td>
								  </tr>
								  <tr bgcolor="##666666">
								    <td><strong style="color:##ffffff;">Donor Information:</strong></td>
								  </tr>
								  <tr>
								    <td>
									  <table border="0" cellpadding="4" cellspacing="0" class="regtext">
			                             <tr>
			                               <td><strong>Name:</strong> #donorname#</td>
			                             </tr>
										 <tr>
										   <td><strong>Address:</strong><br> #addr1#<br>
										      <cfif Len(Trim(Addr2)) GT 0>#Addr2#<br></cfif>
											  #City#, #StAbbr# #Zip#</td>
			                             </tr>
										 <tr>
			                               <td><strong>Phone:</strong> <cfif Len(Trim(Phone)) GT 0>#Phone#<cfelse>None Provided</cfif></td>
			                             </tr>
										  <tr>
			                               <td><strong>Email:</strong> #Email#</td>
			                             </tr>
										</table>
										<table border="0" cellpadding="4" cellspacing="0" class="regtext"> 
										<cfif ToRecognize NEQ "">
										  <tr>
										    <td><strong>Individual / Firm To Be Recognized:</strong><br>#ToRecognize#</td>
										  </tr>
										 </cfif>
										 
			                          </table>
									</td>
								  </tr>
								   <tr bgcolor="##666666">
								     <td><strong style="color:##ffffff;">Payment Information:</strong></td>
								   </tr>
								   <tr>
								     <td>
									   <table border="0" cellpadding="4" cellspacing="0" class="regtext">
									     <tr>
										   <td><strong>Contribution Amount: </strong>
										    <td>#DollarFormat(DonationAmt)#</td>  
										   </td>
										 </tr>
			                             <tr>
										     <td><strong>Payment:</strong></td>
											 <td>#CardType# #ccEscape(GetEvents.CardNbr)# Exp: #CardExpMonth#/#CardExpYear#</td>
										  </tr>
											
			                           </table>
									 </td>
								   </tr>
								   <tr>
								     <td>&nbsp;</td>
								   </tr>
								   
							    </table>
								
							   </td>
					        </tr>
					       </table>
				   <br><br>
		 </td>
     </tr>
</table>  
</cfoutput>
<cfmodule template="#Application.footer#">