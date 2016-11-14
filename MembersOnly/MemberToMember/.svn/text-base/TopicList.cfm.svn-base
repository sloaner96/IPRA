<cfmodule template="#Application.header#" section="0" sectiontitle="Maintaining Certification">
  <cfoutput>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="150"><br>
	         <cfmodule template="#Application.tagdir#/MemberonlyNav.cfm">
		   </td>
		   <td valign="top"><br>
			  <table border="0" cellpadding="5" cellspacing="0">
		        <tr>
		          <td><h3>IPRA Topic List</h3></td>
		        </tr>
		      </table>
<CFQUERY NAME="gettopic" DATASOURCE="#Application.dsn#">
  SELECT *
  FROM Code
  ORDER BY Topic
</CFQUERY>

<cfform action="topiclist.cfm" scriptsrc="/scripts/cfform.js">
<table border="0" cellpadding="0" cellspacing="0" width="100%" class="regtext">
  <tr>
    <td height="42"><strong>Select the IPRA Topic from the pulldown below.</strong></td>
  </tr>
   <tr>
     <td height="49"><select name="Topic">
	      <option value="">-- Select an IPRA Topic --</option>
		  <cfloop query="gettopic">
		    <option value="#gettopic.Code#">#gettopic.topic#</option>
		  </cfloop>
		</select>
	</td>
  </tr>
  <tr>
    <td><input type="submit"></td>
  </tr>
</table>
</cfform>
<cfif IsDefined("form.Topic")>
	<hr noshade size=1>
	<CFQUERY NAME="topicInfo" DATASOURCE="#Application.dsn#">
		SELECT C.Code, C.Topic, M.IpraMemberID, M.Lastname+' '+ M.Firstname as Full_Name, M.TITLE, M.COMPANY, M.MainPhone, M.EMAIL
		FROM Code C, CodeMaster CM, Members M
		Where CM.Code = C.Code 
		AND CM.Code = '#Form.Topic#'
		AND CM.Member_Number = M.IpraMemberID
		order By M.Lastname, M.Firstname
	</CFQUERY>
	
	
	
	<table width="100%" border="0" cellspacing="2" cellpadding="2">

	  <tr>
	     <td colspan=6><strong>#TopicInfo.Topic#</strong></td>
	  </tr>
	<tr>
	 <td align="right" colspan=6>This topic has <strong>#topicInfo.recordcount#</strong> people associated with it.</td>
	</tr>

	<tr bgcolor="##6699cc">
	    <td align="center"><strong>CODE</strong></td>
	    <td align="center"><strong>NAME</strong></td>
	    <td align="center"><strong>TITLE</strong></td>
	    <td align="center"><strong>COMPANY</strong></td>
	    <td align="center"><strong>WORK PHONE</strong></td>
	    <td align="center"><strong>E-MAIL</strong></td>
	  </tr>
	<cfloop query="topicInfo">
	<tr <cfif topicinfo.currentrow Mod(2) EQ 1>bgcolor="eeeee"</cfif>>
	    <td>#topicInfo.Code#</td>
	    <td>#topicInfo.Full_Name#</td>
	    <td>#topicInfo.TITLE#</td>
	    <td>#topicInfo.COMPANY#</td>
	    <td>#topicInfo.mainPHONE#</td>
	    <td><a href="mailto:#topicInfo.EMAIL#">#topicInfo.EMAIL#</a></td>
		
	  </tr>
	</cfloop>
	</table>
</cfif>
     <br><br>
		 </td>
     </tr>
</table>  
</cfoutput>
<cfmodule template="#Application.footer#">	  