<cfquery name="qVerify" datasource="ipra">
    SELECT             *
    FROM                board
    WHERE              LOGIN = '#user_name#'
                     AND PASSWORD = '#user_pass#'
</cfquery>

<cfif qVerify.RecordCount EQ 1>
    <!--- This user has logged in correctly, change the value of the session.allowin value --->
    <cfset session.allowin = "True">
	<cfset session.userinfo.firstname = qVerify.FIRST>
	<cfset session.userinfo.lastname = qVerify.LAST>
	
    <!--- Now welcome user and redirect to "members_only.cfm" --->
    <script>
         alert("Welcome, your login was successful.");
         self.location="login2.cfm";
    </script>
< cfelse>
    <!--- this user did not log in correctly, alert and redirect to the login page --->
    <script>
        alert("Your Username and/or Password could not be verified, please try again.");
        self.location=("Javascript:history.go(-1)");
    </script>
</cfif>


