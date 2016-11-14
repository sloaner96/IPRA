<!--- This tests for Login status --->
<cfif not isdefined('#logType#.#logVar#')>
	<!--- <cflocation url="#logURL#"> --->
	<meta http-equiv="refresh" content="0;url=#logURL#">
</cfif>