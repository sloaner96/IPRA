<!--- 
INPUT: #usrID# (user ID) 
OUTPUT: #usrID#, #usrFirst#, #usrLast#, #usrEmail# for specified user
--->
<cfquery name="user" datasource="#dsUsers#">
SELECT #user_ID# as usrID,#user_First# as usrFirst,#user_Last# as usrLast,#user_Email# as usrEmail FROM [#table_Users#]
WHERE #user_ID#=#usrID#
</cfquery>