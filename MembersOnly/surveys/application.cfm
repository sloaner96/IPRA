<cfinclude template="../../application.cfm">
<cfset survey_email="Tom@ilipra.org">
<cfset survey_address="#Application.Baseurl#/MembersOnly/surveys">
<cfset sitehome="#Application.Baseurl#">

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
	<cfset ds="ILipra">
		<!--- name of the users table --->
		<cfset table_Users="Members">
			<!--- name of the users fieldnames --->
			<cfset user_ID = "memberid"><!--- IMPORTANT! This is the primary key. It must be a unique value and a NUMBER. It should be the same number used to identify the user in other sections of the restricted-access area --->
			<cfset user_userName="email"> <!--- should be a text field --->
			<cfset user_First="firstname"> <!--- should be a text field --->
			<cfset user_Last="LASTname"> <!--- should be a text field --->
			<cfset user_Email="EMAIL"> <!--- should be a text field --->
			<cfset user_Password="password"> <!--- should be a text field --->
			 <!--- optional field, to help categorize respondents --->
			 <cfset user_sub1="COMPANY">
			  <cfset user_sub2="TITLE">
<!--- siteConfigurationKey is mandatory, set to 1 --->
<cfset siteConfigurationKey=1>