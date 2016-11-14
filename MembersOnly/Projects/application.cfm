<cfinclude template="../../application.cfm">
<!--- Create the application 
<cfapplication name="ILPROJSITE" clientmanagement="Yes"
                    sessionmanagement="Yes"
                    sessiontimeout="#CreateTimeSpan(0,0,15,0)#"
                    applicationtimeout="#CreateTimeSpan(0,2,0,0)#">

<!--- Now define that this user is logged out by default --->
<CFPARAM NAME="session.allowin" DEFAULT="false">--->

<!--- Now if the variable "session.allowin" does not equal true, send user to the login page --->
<!---
        the other thing you must check for is if the page calling this application.cfm is the "login.cfm" page 
        and the "Login_process.cfm" page since the Application.cfm is always called, if this is not checked 
        the application will simply Loop over and over. To check that, you do the following call 

--->
<!--- <cfif session.allowin neq "true">
      <cfif ListLast(CGI.SCRIPT_NAME, "/") EQ "login.cfm">
      <cfelseif ListLast(CGI.SCRIPT_NAME, "/") EQ "login_process.cfm">
      <cfelse>
      <!--- this user is not logged in, alert user and redirect to the login.cfm page --->
      <script>
              alert("You must login to access this area!");
              self.location="Javascript:history.go(-1)";
      </script>
      </cfif>
</cfif> --->

<cfquery name="GetBoard" datasource="#Application.dsn#">
   Select *
   From Board
   Where MbrID = #Session.UserInfo.IPRAMemberID#
</cfquery>

<cfif GetBoard.RecordCount EQ 0>
  <cfinclude Template="#Application.TagDir#/notauthorized.cfm">
  <cfabort>
</cfif>