<cfmodule template="#Application.header#" section="0" sectiontitle="Site Admin">

	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="160"><br>
		    <cfmodule template="#Application.tagdir#/adminnav.cfm" level="1">
		   </td>
		   <td valign="top"><br>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>Category Administration</h3></td>
		        </tr>
		      </table>
			  <cfquery name="Cats" datasource="#Application.dsn#">
			    Select Distinct CodeGroup,
				  (Select Count(*) as groupCount
				     From Lookup
					 Where CodeGroup = L.CodeGroup) as NRecs
				From Lookup L
				Order BY CodeGroup
			  </cfquery>
			  <table border="0" cellpadding="6" cellspacing="0" width="100%">
		        <tr>
		           <td class="RegText">
				      <table border="0" cellpadding="0" cellspacing="0" width="100%">
                          <tr>
                            <td>
							  <blockquote>
							<p>Search the online database for links that you may want to modify or delete by using the form below.</p>
							
							<form action="ListCodes.cfm" method="GET">
							<table border="1" cellspacing="0" cellpadding="3" align="right" bordercolor="Black" bgcolor="#eeeeee">
							<tr valign=center>
								<td align=center>
								<font face="Verdana" size="-1"><b>New Category:</b></font><br>
								<input type="text" name="CG" value="" size=15 maxlength=15><br>
								<input type="submit" value="Add it">
								</td>
							</tr>
							</table>
							</form>
							
							<cfif Cats.RecordCount gt 0>
								<font face="Tahoma,Arial" size="+1" color="Navy">Category Types<hr size=1 align=left width=60%></font><br>
							
								<font face="Verdana" size="-1">
								<table width=250 border=0 cellspacing=3>
								<cfoutput query="Cats">
								<tr>
									<td width=150 align=left><a href="ListCodes.cfm?CG=#CodeGroup#">#UCase(CodeGroup)#</a></td>
									<td width=100 align=center>#NRecs#</td>
								</tr>
								</cfoutput>
								</table>
								</font>
							
							<cfelse>
								<font face="Tahoma,Arial" size="+1" color="Navy">No Categories currently defined</fpnt><br>
							
							</cfif>
							
							</blockquote>
							
							
							
							</td>
                          </tr> 
                      </table>
				   </td>
		        </tr>
		       </table>
			   <br><br>
		 </td>
     </tr>
</table>  

<cfmodule template="#Application.footer#">