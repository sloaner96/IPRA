<cfmodule template="#Application.header#" section="0" sectiontitle="IPRA Members Forum">

	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <!--- <td valign="top"><br>
	         <cfmodule template="#Application.tagdir#/certnav.cfm">
		   </td> --->
		   <td valign="top"><br>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>IPRA Members Forum</h3></td>
		        </tr>
		      </table>
			  <table border="0" cellpadding="6" cellspacing="0" width="100%">
		        <tr>
		           <td align="center" class="regtext">
<cfset user= Session.Userinfo.MemberID>
<cftransaction>

<cfquery datasource="#ds#" name="getID">
SELECT MAX(tID) as maxID
FROM tblTopics
</cfquery>

<cfif getID.maxID eq "">
	<cfset newID=1>
<cfelse>
	<cfset newID=#getID.maxID#+1>
</cfif>

<CFquery datasource="#ds#" name="insertQ">
INSERT INTO tblTopics
(tName,tUsrID,tDateTime)
VALUES
('#form.tName#',#user#,#CreateODBCDateTime(now())#)
</CFQUERY>

</cftransaction>
<br><br><br>
<div align="center">Topic Added
<br><br>
<meta http-equiv="refresh" content="0;url=topics.cfm">
</div>
				   </td>
		        </tr>
		       </table>
			   <br><br>
		 </td>
     </tr>
</table>  

<cfmodule template="#Application.footer#">