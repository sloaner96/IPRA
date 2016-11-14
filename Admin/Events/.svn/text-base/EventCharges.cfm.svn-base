<CFIF NOT IsDefined("URL.EventID")>
	<!--- <CFLOCATION URL="EventSearch.cfm"> --->
	<meta http-equiv="refresh" content="0;url=EventSearch.cfm">
</CFIF>
<cfparam name="url.action" default="Add">
<cfparam name="url.e" default="0">
<CFQUERY Name="GetEvent" Datasource="#Application.DSN#">
	SELECT * from Events
		WHERE EventID = #URL.EventID#
</CFQUERY>


<cfmodule template="#Application.header#" section="0" sectiontitle="Site Admin">
  <cfoutput>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="160"><br>
		    <cfmodule template="#Application.tagdir#/adminnav.cfm" level="1">
		   </td>
		   <td valign="top"><br>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>Modify Event Charges</h3></td>
		        </tr>
		      </table>
			  <table border="0" cellpadding="3" cellspacing="1" width="100%" bgcolor="eeeeee">
                 <tr>
                   <td bgcolor="##003366" width="50%"><strong><a href="UpdEvent.cfm?EventID=#GetEvent.EventID#" style="color:ffffff;">Event Information</a></strong></td>
				   <cfif GetEvent.CanRegister EQ 1><td bgcolor="##6699cc"><strong><a href="EventCharges.cfm?EventID=#GetEvent.EventID#"  style="color:ffffff;">Event Charges</a></strong></td><cfelse><td><strong  style="color:eeeeee;">Event Charges</strong></td></cfif>
                 </tr>
              </table>
			  <table border="0" cellpadding="4" cellspacing="0" width="100%">
                <tr>
                   <td>Maintaining Charges for <strong>#GetEvent.EventName#</strong> on <strong>#DateFormat(getEvent.BeginDate, 'MM/DD/YYYY')#</strong></td>
                </tr>
              </table><br>
			  
			  <table border="0" cellpadding="6" cellspacing="0" width="100%">
		        <tr>
		           <td class="RegText">
				   
				   
				     <cfform name="newcharge" action="EvtCharge_Action.cfm?Action=#url.action#&EventID=#url.eventid#" Method="POST" scriptsrc="/scripts/cfform.js">
					     <table border="0" cellpadding="4" cellspacing="0" width="100%">
							<tr bgcolor="eeeeee">
	                          <td colspan=2><strong>#Url.action# Charge</strong></td>
	                        </tr> 
						  </table>
						  <cfif url.e EQ 1>
						    <p><strong style="color:##990000;">Error! You must include a Title for this charge.</strong></p>
						  <cfelseif url.e EQ 2>
						    <p><strong style="color:##990000;">Error! You must include a Cost for this charge.</strong></p>
						  <cfelseif url.e EQ 3>
						    <p><strong style="color:##990000;">Error! Your Cost must be a numeric value formatted 0.00.</strong></p>
						  </cfif>
						  <table border="0" cellpadding="4" cellspacing="0">
	                          
							  <cfif url.action EQ "Add">
								  <tr>
								    <td><strong>Charge Title:</strong></td>
									<td><input type="text" name="ChargeTitle" value="" size="25" maxlength="60"></td>
								  </tr>
								  <tr>
								    <td><strong>Description:</strong></td>
									<td><input type="text" name="ChargeDesc" value="" size="40" maxlength="160"></td>
								  </tr>
								  <tr>
								    <td><strong>Charge:</strong></td>
									<td>$ <input type="text" name="Charge" value=""></td>
								  </tr>
								  <tr>
								    <td><strong>Primary Charge</strong></td>
									<td><input type="checkbox" name="IsPrimary" value="1"></td>
								  </tr>
							  <cfelseif url.action EQ "Update">
							  	 <cfquery name="GetThisCharge" datasource="#Application.dsn#">
								   Select EventDetailID, DetailLabel, DetailCost, Description, ISPrimary
									 From EventDetail
									 Where EventId = #url.EventId#
									 AND EventDetailID = #url.DetailID#
								 </cfquery> 
								  <input type="hidden" name="detailID" value="#GetThisCharge.EventDetailID#">
								  <tr>
								    <td><strong>Charge Title:</strong></td>
									<td><input type="text" name="ChargeTitle" value="#GetThisCharge.DetailLabel#"></td>
								  </tr>
								  <tr>
								    <td><strong>Description:</strong></td>
									<td><input type="text" name="ChargeDesc" value="#GetThisCharge.Description#" size="40" maxlength="160"></td>
								  </tr>
								  <tr>
								    <td><strong>Charge:</strong></td>
									<td>$ <input type="text" name="Charge" value="#Numberformat(GetThisCharge.DetailCost, 0.00)#" size="7" maxlength="7"></td>
								  </tr>
								  <tr>
								    <td><strong>Primary Charge</strong></td>
									<td><input type="checkbox" name="IsPrimary" value="1" <cfif GetThischarge.IsPrimary EQ 1>Checked</cfif>></td>
								  </tr>
							  </cfif>
							  <tr>
							    <td colspan=2><input type="submit" name="submit" value="#url.action# Charge"></td>
							  </tr>
	                      </table>
					  </cfform>
					  <br>
					  <cfquery name="GetCharges" datasource="#Application.dsn#">
					     Select EventDetailID, DetailLabel, Description, DetailCost, IsPrimary
						 From EventDetail
						 Where EventId = #url.EventId#
						 order By IsPrimary desc, DetailLabel, DetailCost
					  </cfquery>
					  <table border="0" cellpadding="4" cellspacing="0" width="100%">
                          <tr bgcolor="666666">
                            <td><strong style="color:ffffff;">Current Charges</strong></td>
                          </tr>
						 
                      </table>
					  <table border="0" cellpadding="3" cellspacing="0">
                        <cfif GetCharges.recordcount GT 0>
					       <cfloop query="GetCharges">	
						    <tr>
							   <td><a href="EventCharges.cfm?action=Update&EventID=#Url.EventId#&DetailID=#GetCharges.EventDetailID#" style="color:##009900;">[Edit]</a>&nbsp;<a href="EvtCharge_action.cfm?Action=Remove&EventID=#Url.EventId#&DetailID=#GetCharges.EventDetailID#" style="color:##990000;">[Delete]</a></td>
							   <td><strong>#GetCharges.DetailLabel#</strong></td>
							   <td><strong>#DollarFormat(GetCharges.DetailCost)#</strong> <cfif GetCharges.Isprimary EQ 1>(Primary)</cfif></td>
							</tr>
							<tr>
							  <td></td>
							  <td colspan=2>#GetCharges.Description#</td>
							</tr>
					       </cfloop>
						  <cfelse> 
						    <tr>
						       <td>There are currently no charges for this Event</td>
						    </tr>
						  </cfif>  
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