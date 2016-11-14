<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>The Illinois Park and Recreation Association: Search for an Agency</title>
		<cfoutput>
		<link rel="STYLESHEET" type="text/css" href="#application.baseurl#/main.css">
		</cfoutput>
	<base target="main">	
</head>

<cfquery name="GetAgency" datasource="#Application.dsn#">
  Select Distinct AgencyName, AgencyID
  from Agencies
  Order By AgencyName
</cfquery>
<body onload="window.focus();">
<h3>Agency Search</h3>
<form name="searchAgency" action="AgencySearchPop.cfm" method="POST" target="_self">
	<table border="0" cellpadding="3" cellspacing="0" width="100%">
	  <tr class="regtext">
	    <td colspan=2>Select an Agency/School from the DropDown below. Once you have found your Agency/School. Select it to populate the registration form below.</td>
	  </tr>
	  <tr class="regtext">
	    <td><strong>Agency School:</strong></td>
		<td><select name="AgencyFind" onchange="this.form.submit();">
		      <option value="">-- Select One --</option>
			  <cfoutput query="GetAgency" group="AgencyName">
			    <option value="#GetAgency.AgencyID#">#GetAgency.AgencyName#</option>
			  </cfoutput>
			</select>
	    </td>
	  </tr>
	</table>
</form>
<cfif IsDefined("form.AgencyFind")>
  <cfquery name="AgencySearch" datasource="#Application.dsn#">
	  Select *
	  from Agencies
	  Where AgencyID = #form.AgencyFind#
  </cfquery>

	  <form name="searchAgency" action="JobPostingApp.cfm" method="POST" onsubmit="self.close();">
		<table border="0" cellpadding="3" cellspacing="0">
		  <cfoutput query="AgencySearch">
		   <tr class="regtext">
		     <td valign="top"><input type="radio" name="AgencyFind" value="#AgencySearch.AgencyID#" checked></td>
			 <td valign="top">#AgencyName#<br>
			                  <cfif addr1 NEQ "">#Addr1#<br></cfif>
							  <cfif addr2 NEQ "">#Addr2#<br></cfif>
							  #City#, #State# #Zip#
							  <cfif phone NEQ ""><br>PH: #Phone#</cfif>
			 </td>
		  </tr>
		  </cfoutput>
		  <tr>
		    <td colspan=2><input type="submit" name="submit" value="Use this Agency" ></td>
		  </tr>
		</table>
	  </form>


</cfif>

</body>
</html>
