<cfquery name="getS" datasource="#Application.dsn#">
select *
from Surveys
where sPublished=1
AND siteConfigKey= #siteConfigurationKey#
order by sPublish_date asc
</cfquery>

<cfmodule template="#Application.header#" section="0" sectiontitle="IPRA Surveys">
  <cfoutput>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="150"><br>
	         <cfmodule template="#Application.tagdir#/MemberonlyNav.cfm">
		   </td>
		   <td valign="top"><br>
			  <table border="0" cellpadding="5" cellspacing="0">
		        <tr>
		          <td><h3>IPRA Surveys</h3></td>
		        </tr>
		      </table>
				<table bgcolor="black" cellspacing="0" align="center">
				<tr>
					<td>
				
				<table bgcolor="white" cellspacing="0" border="0" cellpadding="5" align="center" width="450">
					<tr>
						<td colspan="3" align="center"><br><font class="bigfont"><strong>Currently Available Surveys:</strong><hr width="275"></font></td>
					</tr>
					<cfloop query="getS">
					<tr>
						<td colspan="3">&nbsp;</td>
					</tr>
					<tr>	
						<td width="30">&nbsp;</td>
						<td width="520" align="left"><a href="survey_Full.cfm?sid=#sid#"><strong>#sName#</strong></a> - #dateFormat(sPublish_date, 'MM/DD/YYYY')#</td>
						<td width="30">&nbsp;</td>
					</tr>
					</cfloop>
					<tr>
						<td colspan="3">&nbsp;</td>
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