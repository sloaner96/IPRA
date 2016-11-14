<cfmodule template="#Application.header#" section="0" sectiontitle="Cooperative Purchase Reports">
  
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
		  <cfif Not Isdefined("form.configID")>
           <td valign="top" width="160"><br>
		    <cfmodule template="#Application.tagdir#/adminnav.cfm" level="5">
		   </td>
		   </cfif>
		   <td valign="top"><br>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>Cooperative Purchase Program: Reports > Rejected Items</h3></td>
		        </tr>
		      </table>
			   <cfif Not Isdefined("form.configID")>
			   
			     <p>Use the form below to display the items that were were Rejected for a particular Coop Period. Select the period you would like to view and the page will refresh with the products that were rejected.</p>
			    <cfoutput>
				<cfset getconfigs = request.CoopAdminComponent.getAllConfigs()>
     		   <form name="coopItems" action="RejectedItems.cfm" method="post"> 
		       <table border="0" cellpadding="4" cellspacing="0">
			     <tr>
			        <td><strong>Coop Period:</strong> 
				      <select name="ConfigID" onchange="this.form.submit();">
					     <option value="">--select one --</option>
						 <cfloop query="GetConfigs">
				           <option value="#getConfigs.ConfigID#">#getconfigs.CoopYear#</option>
					     </cfloop>
					  </select>
				    </td>
			     </tr>
		       </table>
			   </form>
			   </cfoutput>
			   </cfif>
			   <cfif IsDefined("form.configID")>
			      <cfset GetVotes = request.coopAdminComponent.getRejectedItems(form.ConfigID)>
				   <div align="right"><a href="index.cfm"><< Back to Reports Home</a><br><br>
				     <cfoutput>
					  <a href="RejectedItems_PDF.cfm?ConfigID=#form.ConfigID#&r=#RandRange(1,10000)#" target="_blank"><img src="/images/pdficon.gif" width="22" height="24" alt="" border="0" align="absmiddle">  Print as PDF</a></td>
	                 </cfoutput>
				   </div><br>
				    <cfif getvotes.recordcount GT 0>
						<table border="0" cellpadding="4" cellspacing="1" width="100%" bgcolor="#666666">
					      <cfoutput query="GetVotes" group="GroupID">
						    <tr bgcolor="##003366">
							  <td colspan="4"><strong style="color:##ffffff;">#GroupName#</strong></td> 
							</tr>
							
						     <cfoutput group="CatID">
						        <tr bgcolor="##c5cfda">
							      <td colspan="4"><strong style="color:##ffffff;">#CategoryName#</strong></td> 
							    </tr>
							
							    <tr bgcolor="##9dabc4">
					               <td><strong style="color:##ffffff;">Item ID</strong></td>
					               <td><strong style="color:##ffffff;">Item</strong></td>
					               <td><strong style="color:##ffffff;">Unit of measure</strong></td>
					            </tr>
						       <cfoutput>
						        <tr bgcolor="##ffffff">
					               <td>#getVotes.ItemCode#</td>
					               <td>#getVotes.ItemName#<br>#getVotes.ItemDesc#</td>
					               <td>#getVotes.Unitofmeasure#</td>
					            </tr>
								<tr bgcolor="##eeeeee">
								   <td>&nbsp;</td>
								   <td colspan="2"><strong>Rejection Reason:</strong> #RejectReason#</td>
								</tr>
						  </cfoutput>
						  </cfoutput>
						  <tr bgcolor="##ffffff">
						    <td colspan="3">&nbsp;</td>
						  </tr>
						  </cfoutput>
	                   </table>
				   <cfelse>
				       <table border="0" cellpadding="0" cellspacing="0" width="100%">
                          <tr>
                             <td class="errorText">There are currently no Rejected items for this Coop Period.<br><br><a href="RejectedItems.cfm">Click here</a> to go back and look at another period. </td>
                          </tr>
                       </table>	   
				   </cfif>
			   </cfif>
			   <br><br>
		 </td>
     </tr>
</table>  

<cfmodule template="#Application.footer#">