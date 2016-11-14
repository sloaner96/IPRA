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
		          <td><h3>IPRA Administrative Site</h3></td>
		        </tr>
		      </table>
			    <cfset FileToProcess = "#Application.SiteDir#/Admin/Uploads/Master.txt">
				<cfset NRecs = 0>
				<cfset NAdds = 0>
				<cfset NUpds = 0>
				<cfset LastCompany = "">
				<cfset TimeStamp = now()> 
				

				<cfif FileExists("")>
				
				  <cffile action="READ" file="#FileToProcess#" ariable="InData"> 
				  
					<cfif Left(InData,2) is "ID">
						<cfloop index="ImpRec" list="#InData#" delimiters="#chr(13)##chr(10)#">
							<cfset IPos  = 1>
							<cfif Left(ImpRec,8) neq "ID">
								<cfset NRecs = NRecs + 1>
								<cfloop condition="IPos gt 0">
									<cfset IPos = ReFind(',[$"0123456789/]', ImpRec, 1)>
									<cfif IPos gt 0>
										<cfset ImpRec = Left(ImpRec, IPos-1) & "|" & Right(ImpRec,Len(ImpRec)-IPos)>
									</cfif>
								</cfloop>
				
								<cfset DataFields = ListToArray(ImpRec, '|')>
								<cfloop index="i" from="1" to="#ArrayLen(DataFields)#">
									<cfset DataFields[i] = Trim(ReplaceList(DataFields[i], '"', ''))>
									<cfset DataFields[i] = Trim(Replace(DataFields[i], '/  /', '', "ALL"))>
								</cfloop>
				                <cfset IPRAMBRID = '#DataFields[1]#'>  
								<cfset FName	= '#DataFields[1]#'>
								<cfset LName	= '#DataFields[2]#'>
								<cfset Title	= '#DataFields[7]#'>
								<cfset WEmail	= LCase(ReplaceList(DataFields[11],"'",""))>
								<cfset HEmail	= LCase(ReplaceList(DataFields[12],"'",""))>
				
								<cfquery name="ChkMID" datasource="#Application.DSN#">
									SELECT MemberID From Members
										WHERE IPRAMemberID = #DataFields[1]#
								</cfquery>
								<cfif ChkMID.RecordCount is 1 AND LName neq "" AND ArrayLen(DataFields) eq 13>
									<cfquery name="ChkID" datasource="#Application.DSN#">
										SELECT RepID From CompanyReps
											WHERE RepID = #DataFields[4]#
									</cfquery>
									<cfif ChkID.RecordCount is 0>
										<cfquery name="AddIt" datasource="#Application.DSN#">
											INSERT INTO CompanyReps
												(FirstName, LastName, CCAssistID, RepID, Prefix, Suffix,
												 Title, Status, WorkEmail, PersEmail, JoinedOn, LastSync)
											VALUES
												('#FName#', '#LName#', #DataFields[3]#, #DataFields[4]#,
												 '#DataFields[5]#', '#DataFields[6]#', '#Title#', '#DataFields[9]#',
												 '#WEMail#', '#HEMail#',
												 <cfif IsDate(DataFields[13])>#CreateODBCDate(DataFields[13])#<cfelse>NULL</cfif>,
												 #TimeStamp#)
										</cfquery>
										<cfset NAdds = NAdds + 1>
									<cfelse>
										<cfquery name="UpdIt" datasource="#Application.DSN#">
											UPDATE CompanyReps
												SET
													FirstName	= '#FName#',
													LastName	= '#LName#',
													Prefix		= '#DataFields[5]#',
													Suffix		= '#DataFields[6]#',
													Title		= '#Title#',
													Status		= '#DataFields[9]#',
													WorkEMail	= '#WEMail#',
													PersEMail	= '#HEMail#',
												 	JoinedOn	= <cfif IsDate(DataFields[13])>#CreateODBCDate(DataFields[13])#<cfelse>NULL</cfif>,
													LastSync	= #TimeStamp#
													WHERE RepID = #DataFields[4]#
										</cfquery>
										<cfset NUpds = NUpds + 1>
									</cfif>
								<cfelse>
									<cfif ChkMID.RecordCount is 0>
										<cfoutput>-- Rep ###DataFields[4]#: No Company Found for '#FName# #LName#'  (Member ###DataFields[3]#)<br></cfoutput>
									<cfelseif LName neq "">
										<cfoutput>-- Rep ###DataFields[4]#: No Last Name for '#FName#' (Member ###DataFields[3]#)<br></cfoutput>
									<cfelse>
										<cfoutput>-- Rep ###DataFields[4]#: Format Error for '#FName# #LName#' (Member ###DataFields[3]#)<br></cfoutput>
									</cfif>
								</cfif>
							</cfif>
						</cfloop>
						<CF_LogFile SiteID="#Application.SiteNfo.SiteID#" Action="Upload" Status="OK" Message="#Session.FullName# transferred #NUpds# company rep updates and #NAdds# company rep additions to the database" User="#Session.UserID#">
					</cfif>
				  
				  
				  
				<cfelse>
				  <strong style="ErrorText">The File Does Not Exist</strong>
				</cfif>  




			  
			   <br><br>
		 </td>
     </tr>
</table>  
</cfoutput>
<cfmodule template="#Application.footer#">