<cfsavecontent variable="votepdf">
<cfif IsDefined("URL.configID")>
    <table border="0" cellpadding="5" cellspacing="0" width="100%">
       <tr>
         <td><h3>Cooperative Purchase Program: Reports > Product Voting</h3></td>
       </tr>
   </table>
   <cfset GetVotes = request.coopAdminComponent.getVotingItems(URL.ConfigID)>
    <table border="0" cellpadding="4" cellspacing="1" width="100%" bgcolor="#666666" style="font-family:verdana,arial; font-size:8px;">
      <cfoutput query="GetVotes" group="GroupID">
	    <tr bgcolor="##ffffff">
		  <td colspan="4"><strong style="font-size:14px;">#GroupName#</strong></td> 
		</tr>
		
	     <cfoutput group="CatID">
	        <tr bgcolor="##ffffff">
		      <td colspan="4"><strong style="font-size:10px;">#CategoryName#</strong></td> 
		    </tr>
		
		    <tr bgcolor="##ffffff">
               <td><strong>Item ID</strong></td>
               <td><strong>Item</strong></td>
               <td><strong>Unit of measure</strong></td>
            </tr>
	       <cfoutput>
	        <tr bgcolor="##ffffff">
               <td>#getVotes.ItemCode#</td>
               <td>#getVotes.ItemName#<br>#getVotes.ItemDesc#</td>
               <td>#getVotes.Unitofmeasure#</td>
            </tr>
			<tr bgcolor="##ffffff">
			   <td>&nbsp;</td>
			   <td colspan="2"><strong>Voting Comment:</strong> #VoteDesc#</td>
			</tr>
	  </cfoutput>
	  </cfoutput>
	  <tr bgcolor="##ffffff">
	    <td colspan="3">&nbsp;</td>
	  </tr>
	  </cfoutput>
               </table>
  </cfif>
</cfsavecontent>


<cfdocument  format="PDF" pagetype="letter" orientation="landscape" unit="in" encryption="none" fontembed="Yes" backgroundvisible="yes"><cfoutput>#votePDF#</cfoutput></cfdocument>