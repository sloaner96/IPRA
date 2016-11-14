<cfapplication name="IPRA" sessionmanagement="Yes">
<cfsetting enablecfoutputonly="YES">
<cfif Not IsDefined("application.sysinfo")>
<cflock timeout="#Createtimespan(0,0,0,10)#" throwontimeout="No" type="EXCLUSIVE" scope="APPLICATION"> 
	<cfset Application.dsn = "ILIPRA">
	
	<cfset Application.Baseurl = "http://www.ilipra.org">
	<cfset Application.SecureUrl = "https://www.ilipra.org">
	<cfset Application.Sitepath = "D:\iNetPub\WWWUsers\RPNetSolutions\Ilipra_org\">
	<cfset Application.TagDir = "/IPRA">
	<cfset Application.mailserver = "mail.ilipra.org">
	
	<cfset Application.EnKey = "IPRA13105xY">
	<cfset Application.Header = "#Application.TagDir#/header.cfm">
	
	<cfset Application.Footer = "#Application.TagDir#/footer.cfm">

<cfquery name="GetSysInfo" datasource="#Application.dsn#">
  Select *
  From SystemInfo
  Where Active = 1
</cfquery>

<cfset application.sysinfo = GetSysInfo>
</cflock>
</cfif>
<cfif findnocase("MembersOnly", CGI.PATH_INFO, 1) GT 0>
  <cfif Not IsDefined("session.Userinfo") AND 
       (findnocase("Login.cfm", CGI.SCRIPT_NAME, 1) EQ 0 
	       AND findnocase("Authorize.cfm", CGI.SCRIPT_NAME, 1) EQ 0 
		   AND findnocase("Logout.cfm", CGI.SCRIPT_NAME, 1) EQ 0)>
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

<!--- @@@@@@@@ THIS IS ALL THE FORUMS CRAP, WE WILL EVENTUALLY NEED TO REMOVE IT @@@@@@@@@ --->
<cfif findnocase("forums", CGI.PATH_INFO, 1) GT 0>
		<!---------------------------------------------------------------------------------->
		<!---- Set the following global variables to integrate your member database -------->
		<!------- Please refer to the comments for clarification and instruction ----------->
		<!---------------------------------------------------------------------------------->
		
		<!--- general variables --->
		<cfset home="#application.baseurl#/MembersOnly/forums">
		<!--- these variables are for integrating an external users database. All are required, UNLESS otherwise specified --->
			
			<!--- URL of login page. Set to "login.cfm" to use native login (native login is the built-in login screen that comes with these forums) This value can be an absolute or relative URL--->
			<!--- the native login form is a form that macthes the forum interface and redirects a person who logs in to the topics.cfm page. Although having your own existing user database is mandatory, this form is optional and is designed to integrate with your user database --->
			<cfset logURL="#application.baseurl#/MembersOnly/forums">
				<!--- set these only if you are using the native login form, set these variables to the fieldnames which the login should use to authenticate the user. If you are not using the native login, you don't need to set these 2 variables --->
				<cfset username="LAST">
				<cfset user_password="ID">
				
			<!--- The following settings apply to both foreign and native login screens. They are all required. --->
			
			<!--- name of a login type. Use "session" or "cookie" --->
			<cfset logType="cookie">
			<!--- name of a session or cookie variable. This is used in conjuntion with logType (above) to test login status.--->
			<cfset logVar="id">
			<!--- name of the users datasource --->
			<cfset dsUsers="ILIPRA">
				<!--- name of the users table --->
				<cfset table_Users="Members">
					<!--- name of the users fieldnames --->
					<cfset user_ID="MemberID"> <!-- IMPORTANT! This is the primary key. It must be a unique value and a NUMBER. It should be the same number used to identify the user in other sections of the restriced-access area --->
					<cfset user_First="firstname"> <!--- should be a text field --->
					<cfset user_Last="Lastname"> <!--- should be a text field --->
					<cfset user_Email="email"> <!--- should be a text field --->
		
		<!--- the name of the forum datasource - the database that comes with this application --->
		
		<cfset ds="ILipra">
		
		<!--- 
		
		Other database field names, key info and data types (output by query): 
		
		Select * FROM tblTopics: 
			tID - Primary Key, integer
			tName - text255
			tUsrID - Foreign Key for #tblUsers#, integer
			tDateTime - date/time
			
		Select * FROM tblThreads: 
			thID - Primary Key, integer
			thTID - Foreign Key for tblTopics, integer
			thName - text255
			thUsrID - Foreign Key for #tblUsers#, integer
			thDateTime - date/time
			
		Select * FROM tblMessages: 
			msgID - Primary Key, integer
			msgThID - Foreign Key for tblTopics, integer
			msgName - text255
			msgUsrID - Foreign Key for #tblUsers#, integer
			msgDateTime - date/time
			msgMessage - Memo
			
		--->
		
		<!----------------------------------------------------------->
		<!---------- DON"T alter anything below this line!!! -------->
		<!----------------------------------------------------------->
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