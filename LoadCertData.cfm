<cfquery name="GetCert" datasource="#Application.dsn#">
   Select * From mayceu06
</cfquery>
<cfquery name="DeleteCerts" datasource="#Application.dsn#">
  Delete From Certifications
</cfquery>
<cfoutput query="GetCert">
		<cfquery name="LoadCert" datasource="#Application.dsn#">
		  Insert Into Certifications(
		    MemberID,
			OCE1,
			Description,
			CourseHrs,
			BeginDate,
			NRPA,
			ACAD,
			CERTYEAR,
			TOTAL,
			CERTTYPE
		  )
		  Values(
		    <cfif getCert.MemberID NEQ "">'#GetCert.MemberID#'<cfelse>NULL</cfif>,
			<cfif getCert.OCE NEQ "">#GetCert.OCE#<cfelse>NULL</cfif>,
			<cfif getCert.DESCRIPTION NEQ "">'#GetCert.DESCRIPTION#'<cfelse>NULL</cfif>,
			<cfif getCert.COURSEHRS NEQ "">#GetCert.COURSEHRS#<cfelse>NULL</cfif>,
			<cfif getCert.BeginDate NEQ ""><cfif IsDate(GetCert.BEGINDATE)>#CreateODBCDate(GetCert.BEGINDATE)#<cfelse>NULL</cfif><cfelse>NULL</cfif>,
			<cfif getCert.NRPA NEQ "">'#GetCert.NRPA#'<cfelse>NULL</cfif>,
			<cfif getCert.ACAD NEQ "">'#GetCert.ACAD#'<cfelse>NULL</cfif>,
			<cfif getCert.CERTYEAR NEQ "">'#GetCert.CERTYEAR#'<cfelse>NULL</cfif>,
			<cfif getCert.TOTAL NEQ "">#GetCert.TOTAL#<cfelse>NULL</cfif>,
			<cfif getCert.CERTTYPE NEQ "">'#GetCert.CERTTYPE#'<cfelse>NULL</cfif>
		  )
		</cfquery>
</cfoutput>