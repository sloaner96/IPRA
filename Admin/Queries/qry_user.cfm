<!--- 
INPUT: #usrID# (user ID) 
OUTPUT: #usrID#, #usrFirst#, #usrLast#, #usrEmail# for specified user
--->
<cfquery name="user" datasource="#dsUsers#">
SELECT #user_ID# as usrID,#user_First# as usrFirst,#user_Last# as usrLast,#user_Email# as usrEmail FROM [#table_Users#]
WHERE #user_ID#=#usrID#
</cfquery>

<cfif user.recordcount EQ 0>
  <cfset user = Querynew('usrid,usrfirst, usrlast, usremail')>
  <cfset usrtmp = queryaddrow(user)>
  <cfset usrtmp = querysetcell(user, 'usrid', 0)>
  <cfset usrtmp = querysetcell(user, 'usrfirst', "IPRA")>
  <cfset usrtmp = querysetcell(user, 'usrlast', "Admin")>
  <cfset usrtmp = querysetcell(user, 'usremail', "webmaster@ilipra.org")>
</cfif>