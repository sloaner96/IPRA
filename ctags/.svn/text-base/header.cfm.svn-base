<cfparam name="attributes.section" default="">
<cfparam name="attributes.sectiontitle" default="">
<cfparam name="attributes.texteditor" default="False">
<cfoutput>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"> 
		<META HTTP-EQUIV="Expires" CONTENT="Sun, 12 May 1996 00:36:05 GMT">
		<meta http-equiv="Pragma" content="no-cache" />
	    <meta http-equiv="Cache-Control" content="no-cache" />
		<LINK REV=made href="mailto:webmaster@ilipra.org.com">
		<meta HTTP-EQUIV="Content-language" CONTENT="en-US">
		<META NAME="keywords" CONTENT="Parks, Recreation, Illinois, IPRA, Fun, Membership">
		<META NAME="description" CONTENT="">
		<META NAME="rating" CONTENT="Business">
		<META NAME="ROBOTS" CONTENT="ALL">
		<title>The Illinois Park and Recreation Association<cfif attributes.sectiontitle NEQ "">: #attributes.sectiontitle#</cfif></title>
		
		<link rel="STYLESHEET" type="text/css" href="#application.baseurl#/main.css">
		<cfif findnocase("forums", CGI.PATH_INFO, 1) GT 0>
		  <link rel="STYLESHEET" type="text/css" href="#application.baseurl#/forum.css">
		</cfif>
		<cfif attributes.texteditor EQ "True">
			<script language="javascript" type="text/javascript" src="/tinymce/jscripts/tiny_mce/tiny_mce.js"></script>
			<script language="javascript" type="text/javascript">
			tinyMCE.init({
				mode : "textareas",
				theme : "simple"

			});
			</script>
		</cfif>
		<cfinclude template="#Application.tagdir#/menus.cfm">
		<script language="JavaScript1.2" src="#Application.baseurl#/mm_menu.js"></script>
</head>
<body topmargin="0" bgcolor="##f5f5f5">
<script language="JavaScript1.2">mmLoadMenus();</script>
<div align="center">
<table border="0" cellpadding="0" cellspacing="1" width="800" bgcolor="ffffff">
  <tr>
    <td bgcolor="ffffff">
	  <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td><a href="#Application.baseurl#"><img src="#Application.Baseurl#/images/Mainlogo.gif" alt="It is the mission of the Illinois Park and Recreation Association to be an advocate in providing quality park, recreation and conservation education, resources and services to professionals and citizens throughout the state of Illinois." border="0"></a></td>
			<td align="Right" valign="top">
			  
			   <table border="0" cellpadding="3" cellspacing="0" class="topnav">
                  <tr>
				  <td class="ipratopnav">eNewsletter</td>
				  <td><a href="javascript: function OpenGM(){window.open('http://www.graphicmail.com/rwcode/subscribe.asp?SiteID=6898&Mode=subscribe','','top=259,left=312,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=400,height=250');} OpenGM()"><img src='http://www.graphicmail.com/rwcode//webadmin/images/subscribe01.gif' border=0></a></td>
					<td>|</td>
                    <td><a href="/index.cfm" class="topnav">Home</a></td>
					<td>|</td>
					<td><a href="/help.cfm" class="topnav">Help</a></td>
					<td>|</td>
					<td><a href="/sitemap.cfm" class="topnav">Site Map</a></td>
					<td>|</td>
					<td><a href="/sitesearch.cfm" class="topnav">Search</a></td>


                  <cfif IsDefined("Session.userinfo.MemberID")>
				    <td>|</td>
					<td><a href="#Application.Baseurl#/MembersOnly/Logout.cfm" class="logout">Logout</a></td>
				  </cfif>
				  </tr>
                </table><br>
				<cfquery name="GetBanner" datasource="#Application.dsn#" cachedwithin="#CreateTimeSpan(0,1,0,0)#">
				  Select *
				  From BannerAds
				  Where AdStart <= #CreateODBCDateTime(now())#
				  AND AdFinish >= #CreateODBCDateTime(now())#
				  order by adRanking
				</cfquery>
				<cfif GetBanner.recordcount GT 0>
					<cfset currentImg = RandRange(1, getbanner.RecordCount)>
	
					<table border="0" cellpadding="0" cellspacing="0" width="100%">
					  <tr>
		                 <td align="center"><a href="/redirector.cfm?Link=#GetBanner.BannerID[currentImg]#" target="_blank"><img src="#Application.Baseurl#/images/BannerAds/#GetBanner.adImage[currentImg]#" alt="Click to Visit #GetBanner.AdName[currentImg]#" border="0"></a></td>
		               </tr>
	                </table>
				</cfif>
			</td>
        </tr>
      </table><br>
	  <table border="0" cellpadding="0" cellspacing="0" width="100%" background="/images/grnavbg.jpg">
        <tr class="NavText">
            <td><img src="/images/blank.gif" height="20" width="5" border="0"></td>
			<td align="center"><a name="AboutUs" href="#Application.Baseurl#/AboutUS/index.cfm" target="_self" onMouseOut="MM_startTimeout();" 
			onMouseOver="MM_showMenu(window.mm_menu_1122134612_1,0,18,null,'AboutUs');" class="navtext">About Us</a></td>
			<td><img src="/images/navseperator.gif" width="5" height="20" alt="" border="0"></td>
			<td align="center"><a name="Resources" href="#Application.Baseurl#/Resources/Library.cfm" target="_self" onMouseOut="MM_startTimeout();" 
			onMouseOver="MM_showMenu(window.mm_menu_1122193557_0,0,18,null,'Resources');" class="navtext">Resources</a></td>
			<td><img src="/images/navseperator.gif" width="5" height="20" alt="" border="0"></td>
			<td align="center"><a name="MbrServices" href="#Application.Baseurl#/Members/" target="_self" onMouseOut="MM_startTimeout();" 
			onMouseOver="MM_showMenu(window.mm_menu_1122195451_2,0,18,null,'MbrServices');"  class="navtext">Member Services</a></td>
			<td><img src="/images/navseperator.gif" width="5" height="20" alt="" border="0"></td>
			<td align="center"><a name="Affiliations" href="#Application.Baseurl#/Affiliations/" target="_self" onMouseOut="MM_startTimeout();" 
			onMouseOver="MM_showMenu(window.mm_menu_1122195913_1,0,18,null,'Affiliations');" class="navtext">Affiliations</a></td>
			<td><img src="/images/navseperator.gif" width="5" height="20" alt="" border="0"></td>
			<td align="center"><a name="Certs" href="#Application.Baseurl#/Certification/iprcb.cfm" target="_self" onMouseOut="MM_startTimeout();" 
			onMouseOver="MM_showMenu(window.mm_menu_1122200232_0,0,18,null,'Certs');"  class="navtext">Certification</a></td>
			<td><img src="/images/navseperator.gif" width="5" height="20" alt="" border="0"></td>
			 <td align="center"><a name="MemberLogin" href="#Application.Baseurl#/MembersOnly/" class="navtext">Member Login</a></td>
          
		</tr>
      </table>
	  
</cfoutput>