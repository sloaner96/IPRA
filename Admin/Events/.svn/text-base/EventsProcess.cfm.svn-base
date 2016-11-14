<CFIF NOT IsDefined("Form.Heading")>
	<!--- <CFLOCATION URL="/Admin/index.cfm"> --->
	<meta http-equiv="refresh" content="0;url=/Admin/index.cfm">
</CFIF>

<cfmodule template="#Application.header#" section="0" sectiontitle="Events Admin">

	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="160"><br>
		    <cfmodule template="#Application.tagdir#/adminnav.cfm" level="1">
		   </td>
		   <td valign="top"><br>
			 
			<cfset ErrorList = ArrayNew(1)>
			
			<CFIF #Form.Heading# is "">
				<cfset x = ArrayAppend(ErrorList, "No value specified for the <b>Event Name</b> field")>
			</CFIF>
			
			<CFIF #Form.Description# is "">
				<cfset x = ArrayAppend(ErrorList, "No <b>Description</b> has been provided for this Event!")>
			</CFIF>
			
			<CFIF #Form.SDate# is not "" and NOT #IsDate(Form.SDate)#>
				<cfset x = ArrayAppend(ErrorList, "Invalid value specified for the <b>Starting Date & Time</b> field")>
			</CFIF>
			
			<CFIF #Form.EDate# is not "" and NOT #IsDate(Form.EDate)#>
				<cfset x = ArrayAppend(ErrorList, "Invalid value specified for the <b>Ending Date & Time</b> field")>
			</CFIF>
			
<!--- 			<cfif IsDefined("Form.CanRegister") AND (NOT IsNumeric(Form.Price) OR Form.Price lt 1.00)>
				<cfset x = ArrayAppend(ErrorList, "Invalid or missing value specified for the <b>Event Charge</b> field.  There must be a fee associated with an event in order for to allow online registration.")>
			</cfif> --->
			
			<cfset NErrors = ArrayLen(ErrorList)>
			<cfif NErrors gt 0>
			
				<cfoutput>
				<h4><font color="Maroon">#NErrors# problem(s) encountered with your Submission</font></h4>
				</cfoutput>
				<p>Errors have been found while processing your request.  Please return to the form, correct these errors, and resubmit.</p>
				<ol>
				<cfloop INDEX="i" FROM="1" TO="#NErrors#">
				<cfoutput><li><p>#ErrorList[i]#</p></li></cfoutput>
				</cfloop>
				</ol>
				<div align=center><form><input type="Button" name="" value="Correct Errors Now" align="ABSMIDDLE" onclick="history.back()"></form></div>
			
			<cfelse>
			
				<cfset SaveName = "">
				<cfif Form.PDFForm neq "" AND Left(Form.Cmd,6) neq "Delete">
					<CFSET SaveLocation = "#Application.sitepath#\Forms\Reg-#DateFormat(now(),'yymmdd')##TimeFormat(now(),'hhmm')#.pdf">
					<cffile action="upload"
				        filefield="Form.PDFForm"
				        destination="#SaveLocation#"
				        nameconflict="makeunique">
					<cfset SaveName = "#FILE.ServerFile#">
				</cfif>
			
				<CFIF Left(Form.Cmd, 4) is "Save">
				
					<CFQUERY Name="AddRec" Datasource="#Application.DSN#">
						INSERT into Events
							(EventName,
							 BeginDate,
							 Location,
							 EndDate,
							 Description,
							 Highlight,
							 Category,
							 Contact,
							 Contactemail,
							 ContactPhone,
							 CanRegister,
							 <!--- Charge, --->
							 AdminFee,
							 AllowQty,
							 MaxQuantity,
							 OnlineForm,
							 WebURL,
							 Approved,
							 LastUpdated
							)
						VALUES
							('#Form.Heading#',
							 <cfif Form.SDate neq "">#CreateODBCDateTime(Form.SDate)#<cfelse>NULL</cfif>,
							 '#Form.Location#',
						 	<cfif Form.EDate neq "">#CreateODBCDateTime(Form.EDate)#<cfelse>NULL</cfif>,
							 '#Form.Description#',
							 <cfif IsDefined("form.Highlight")>1<cfelse>0</cfif>,
							 <cfif Len(trim(form.Category)) GT 0>'#Form.Category#'<cfelse>NULL</cfif>,
							 <cfif Len(trim(form.Contact)) GT 0>'#form.Contact#'<cfelse>NULL</cfif>,
							 <cfif Len(trim(form.ContactEmail)) GT 0>'#form.ContactEmail#'<cfelse>NULL</cfif>,
							 <cfif Len(trim(form.ContactPhone)) GT 0>'#form.ContactPhone#'<cfelse>NULL</cfif>,
							 <cfif IsDefined("Form.CanRegister")>1<cfelse>0</cfif>,
							 <!--- #Form.Price#, --->
							 <cfif form.AdminPrice NEQ "">#Form.AdminPrice#<cfelse>NULL</cfif>,
							 <cfif IsDefined("form.AllowQty")>#Form.AllowQty#<cfelse>0</cfif>,
							 Null,
							 <cfif SaveName neq "">'#SaveName#'<cfelse>NULL</cfif>,
							 '#Form.WebURL#',
							 <cfif IsDefined("Form.CanRegister")>0<cfelse>1</cfif>,
							 #Createodbcdatetime(now())#
							)
					</CFQUERY>
					<cfquery name="GetEvtID" datasource="#Application.dsn#">
					  Select Top 1 EventID From Events
					  Where EventName = '#Form.Heading#'
					  AND BeginDate = <cfif Form.SDate neq "">#CreateODBCDateTime(Form.SDate)#<cfelse>NULL</cfif>
					  AND EndDate = <cfif Form.EDate neq "">#CreateODBCDateTime(Form.EDate)#<cfelse>NULL</cfif>
					  AND Location = '#Form.Location#'
					</cfquery> 
					
					<H3 align=center><FONT FACE="Verdana,Arial" COLOR="Blue" size="+1">Your Event has been Entered!</FONT></H3>
					<cfoutput>
					    <cfif IsDefined("Form.CanRegister")><p align="center"><strong><a href="UpdEvent.cfm?EventID=#GetEvtID.EventID#">Click Here</a> to add charges to this Event</strong></p></cfif>
				    </cfoutput>
				<CFELSEIF Left(Form.Cmd, "6") is "Delete">
					<CFQUERY Name="DelInfo" Datasource="#Application.DSN#">
						DELETE From Events
							WHERE EventID = #Form.EventID#
					</CFQUERY>
					
					<H3 align=center><FONT FACE="Verdana,Arial" COLOR="Blue" size="+1">Your Event has been Removed!</FONT></H3>
				<CFELSE>
					<CFQUERY Name="UpdRec" Datasource="#Application.DSN#">
						UPDATE Events
						SET
							EventName	= '#Form.Heading#',
							BeginDate	= <cfif Form.SDate neq "">#CreateODBCDateTime(Form.SDate)#<cfelse>NULL</cfif>,
							Location	= '#Form.Location#',
							EndDate		= <cfif Form.EDate neq "">#CreateODBCDateTime(Form.EDate)#<cfelse>NULL</cfif>,
							Description	= '#Form.Description#',
							Category    = '#Form.Category#',
							Highlight   = <cfif IsDefined("form.highlight")>1<cfelse>0</cfif>,
							Approved    = <cfif IsDefined("form.Approved")>1<cfelse>0</cfif>, 
							<cfif Len(Trim(form.Contact)) GT 0>
							Contact     = '#form.Contact#',
							ContactPhone= '#form.ContactPhone#',
							ContactEmail= '#form.ContactEmail#',
							<cfelse>
							Contact     = Null,
							ContactPhone= Null,
							ContactEmail= Null,
							</cfif>
							<cfif SaveName neq "">OnlineForm = '#SaveName#',</cfif>
							CanRegister	= <cfif IsDefined("Form.CanRegister")>1<cfelse>0</cfif>,
							AdminFee =<cfif form.AdminPrice NEQ "">#Form.AdminPrice#<cfelse>NULL</cfif>,
							AllowQty =<cfif IsDefined("form.AllowQty")>#Form.AllowQty#<cfelse>0</cfif>,
							 <!--- MaxQuantity = <cfif form.MaxQty NEQ "">#Form.MaxQty#<cfelse>Null</cfif>, --->
							WebURL		= '#Form.WebURL#'
						WHERE EventID = #Form.EventID#
					</CFQUERY>
					
					<H3 align=center><FONT FACE="Verdana,Arial" COLOR="Blue" size="+1">Your Event has been Updated!</FONT></H3>
				</CFIF>
			
			</cfif>
			
			<p align=center><a href="EventSearch.cfm"><font face="Tahoma" color="Maroon" size="+1">Return to Admin Page</font></a></p>

		 </td>
     </tr>
</table>
<cfmodule template="#Application.footer#">
