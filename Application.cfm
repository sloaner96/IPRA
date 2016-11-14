<cfapplication name="IPRA" sessionmanagement="Yes">
<cfsetting enablecfoutputonly="YES">
<!--- 
<cfinclude template="maint.cfm">
<cfabort> --->
<cfif Not IsDefined("application.sysinfo") or IsDefined("url.Reint")></cfif>
<cflock timeout="#Createtimespan(0,0,0,10)#" throwontimeout="No" type="EXCLUSIVE" scope="APPLICATION"> 
	<cfset Application.dsn = "ILIPRA">
	
	<cfset Application.Baseurl = "http://#CGI.SERVER_NAME#">
	<cfset Application.SecureUrl = "https://#CGI.SERVER_NAME#">
	<cfset Application.Sitepath = "e:\websites\IPRA">
	<cfset Application.TagDir = "/IPRA">
	<cfset Application.mailserver = "mail.ilipra.org">
	<cfset Application.MailUser = "webuser">
	<cfset Application.MailPassword = "********>
	
	<cfset Application.EnKey = "ENTER_YOUR_KEY">
	<cfset Application.Header = "#Application.TagDir#/header.cfm">
	
	<cfset Application.Footer = "#Application.TagDir#/footer.cfm">
    
	<cfobject name="Application.coopCom" component="ipra.coop">
	<cfobject name="Application.coopAdmin" component="ipra.coopAdmin">
	<cfobject name="Application.PaymentCom" component="ipra.payment">
	<cfobject name="Application.Careers" component="IPRA.Careers">
	<cfobject name="Application.Forum" component="IPRA.Forums">
	
<cfquery name="GetSysInfo" datasource="#Application.dsn#">
  Select *
  From SystemInfo
  Where Active = 1
</cfquery>

<cfset application.sysinfo = GetSysInfo>
</cflock>

<cflock scope="APPLICATION" type="READONLY" timeout="10" throwontimeout="NO">
	<!--- These are the CFCs used throughout the system --->
	<cfset request.CoopComponent = Application.CoopCom>
	<cfif IsDefined("Session.AdminLogin")>
	  <cfset request.CoopAdminComponent = Application.coopAdmin>
	</cfif>
	<cfset request.PaymentComponent = Application.PaymentCom>
	<cfset request.CareersComponent = Application.Careers>
	<cfif IsDefined("session.Userinfo") OR IsDefined("session.AdminInfo")>
	  <cfset request.forumComponent = Application.Forum>
	</cfif>
</cflock>
<cfif findnocase("MembersOnly", CGI.PATH_INFO, 1) GT 0>
  <cfif Not IsDefined("session.Userinfo") AND 
       (findnocase("Login.cfm", CGI.SCRIPT_NAME, 1) EQ 0 
	       AND findnocase("Authorize.cfm", CGI.SCRIPT_NAME, 1) EQ 0 
		   AND findnocase("Logout.cfm", CGI.SCRIPT_NAME, 1) EQ 0)>
		   <cfset thisservername = "http://#CGI.SERVER_NAME#">
	 <cfset thisscript = "#CGI.SCRIPT_NAME#">
	 <!--- If there is a query string grab it, otherwise make that null--->
	 <cfif LEN(TRIM(CGI.QUERY_STRING)) GT 0>
		<cfset thisquery = "?#CGI.QUERY_STRING#">
	 <cfelse>
		<cfset thisquery = "">
	 </cfif>
	 <!--- Set the session url --->
	 <cfset session.outurl = thisservername & thisScript & thisquery> 
     <cfinclude template="MembersOnly/Login.cfm"><cfabort>
  </cfif>
</cfif>

<cfif findnocase("Admin", CGI.PATH_INFO, 1) GT 0>
  <cfif Not IsDefined("session.AdminLogin") AND 
       (findnocase("Login.cfm", CGI.SCRIPT_NAME, 1) EQ 0 
	       AND findnocase("Authorize.cfm", CGI.SCRIPT_NAME, 1) EQ 0 
		   AND findnocase("Logout.cfm", CGI.SCRIPT_NAME, 1) EQ 0)>
     <cfinclude template="Admin/Login.cfm"><cfabort>
  </cfif>
</cfif>


<!--- @@@@@@@@ THIS IS ALL THE Surveys CRAP, WE WILL EVENTUALLY NEED TO REMOVE IT @@@@@@@@@ --->
<cfif findnocase("admin/Surveys", CGI.PATH_INFO, 1) GT 0>
<cfset survey_email="dean@il-ipra.org">
<cfset survey_address="http://www.il-ipra.org/MembersOnly/members/surveys">
<cfset sitehome="http://www.il-ipra.org">

<!---------------------------------------------------------------------------------->
<!---- Set the following global variables to integrate your member database -------->
<!------- Please refer to the comments for clarification and instruction ----------->
<!---------------------------------------------------------------------------------->

<!--- these variables are for integrating an external users database. All are required, UNLESS otherwise specified --->
	
	<!--- URL of login page. Set to "login.cfm" to use native login (native login is the built-in login screen that comes with these surveys) This value can be an absolute or relative URL--->
	<!--- the native login form is a form that matches the survey interface and redirects a person who logs in to the topics.cfm page. Although having your own existing user database is mandatory, this form is optional and is designed to integrate with your user database --->
	<cfset logURL="../index.cfm">
	<!--- set these only if you are using the native login form, set these variables to the fieldnames which the login should use to authenticate the user. If you are not using the native login, you don't need to set these 2 variables  --->
	<!--- The following settings apply to both foreign and native login screens. They are all required.  --->
	<!--- name of the datasource --->
	<cfset ds="ilipra">
		<!--- name of the users table --->
		<cfset table_Users="members">
			<!--- name of the users fieldnames --->
			<cfset user_ID = "memberid"><!--- IMPORTANT! This is the primary key. It must be a unique value and a NUMBER. It should be the same number used to identify the user in other sections of the restricted-access area --->
			<cfset user_userName="LASTname"> <!--- should be a text field --->
			<cfset user_First="firstname"> <!--- should be a text field --->
			<cfset user_Last="LASTname"> <!--- should be a text field --->
			<cfset user_Email="EMAIL"> <!--- should be a text field --->
			<cfset user_Password="password"> <!--- should be a text field --->
			 <!--- optional field, to help categorize respondents --->
			 <cfset user_sub1="COMPANY">
			  <cfset user_sub2="TITLE">
<!--- siteConfigurationKey is mandatory, set to 1 --->
<cfset siteConfigurationKey=1>
</cfif>
<cfsetting enablecfoutputonly="NO">