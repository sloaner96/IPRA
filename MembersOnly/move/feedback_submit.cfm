<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- DW6 -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Member Feedback Submission</title>
<link rel="stylesheet" href="emx_nav_left.css" type="text/css">

<style type="text/css">
<!--
.style1 {color: #005FA9}
.style4 {color: #005FA9; font-weight: bold; }
.style5 {color: #333333}
-->
</style>
</head>
<body> 
<div class="skipLinks">skip to: <a href="#content">page content</a> | <a href="pageNav">links on this page</a> | <a href="#globalNav">site navigation</a> | <a href="#siteInfo">footer (site information)</a> </div>
<div id="masthead"> 
  <h1 id="siteName">IPRA Relocation Information Page </h1> 
  <div id="globalNav"> 
    <img alt="" src="gblnav_left.gif" height="32" width="4" id="gnl"> <img alt="" src="glbnav_right.gif" height="32" width="4" id="gnr"> 
    <div id="globalLink"> 
      <a href="/MembersOnly/" id="gl1" class="glink">Members Only </a><a href="faqs.cfm" id="gl2" class="glink">FAQ's</a><a href="whatsnew.cfm" id="gl3" class="glink">What's New? </a><a href="documents.cfm" id="gl4" class="glink">Related Documents </a><a href="contacts.cfm" id="gl5" class="glink">Contacts</a><a href="feedback.cfm" id="gl6" class="glink">Member Feedback </a><a href="#" id="gl7" class="glink"></a> 
    </div> 
    <!--end globalLinks--> 
  </div> 
  
</div> 
<!-- end masthead --> 
<div id="pagecell1"> 
  <!--pagecell1--> 
  <img alt="" src="tl_curve_white.gif" height="6" width="6" id="tl"> <img alt="" src="tr_curve_white.gif" height="6" width="6" id="tr">
  <div id="content"> 
    <div class="feature"> 
	<cfmail to="dean@ilipra.org" from="#form.email#" subject="Relocation Form Submission" type="html" username="#Application.MailUser#" password="#Application.MailPassword#">
<br><br>
<cfloop index="thefield" list="#form.fieldnames#">
    <cfset fields="#thefield# = #evaluate(thefield)#">
    <CFIF #fields# contains "submit" or #fields# contains "required"
            OR #FIELDS# contains "recipient" or #fields# contains "subject" 
            or #FIELDS# contains "redirect">

    <cfelse>
        #fields#<br>
    </cfif>
</cfloop>
</cfmail>
      <img src="feedback1.jpg" alt="" width="145" height="138"> 
     <cfoutput>
	  <h3> Member Feedback </h3> 
      <p>
       Thank you, #form.name#, your submission has been received by IPRA staff. At this time, it will be reviewed for content and if approved, will be posted to this site. If you have any questions, please contact <a href="mailto:dean@ilipra.org">Dean Comber</a>. <br>
       <br>
      </p></cfoutput>
      
    </div> 
    <div class="story"> 
      <h3>&nbsp;      </h3>
      <hr color="333333">
    </div> 
    <div class="story">
      <table width="100%" border="0" cellpadding="0" cellspacing="0" bordercolor="#333333" summary=""> 
        <tr valign="top"> 
          <td width="51%" class="storyLeft"> <p> 
            <a href="faqs.cfm" class="capsule">FAQ's</a> <strong>Q</strong>: What will happen to the donations?</p>
            <p><strong>A</strong>: Many board members and staff are contributors to the Partners for the Future initiative, and as such, are sensitive to the notion that contributions raised through this campaign should be respected as long-term, capital development funds to which donors pledged.</p>
            <p align="right"><br>
            <span class="style4"><a href="faqs.cfm">&gt;&gt;more..</a></span>            </p></td> 
          <td width="49%"> <p> 
            <a href="feedback.cfm" class="capsule">Member Feedback</a> <em>&quot;..The decision to relocate IPRA Headquarter's will provide the association with future resources for investments in all areas of membership..&quot;</em> -<strong>Bill Wald, CEO, IPRA</strong> <br>
            <br>
            </p>
          <p align="right" class="style1"><a href="feedback.cfm"><strong> <br>
            <br>
            &gt;&gt;more..</strong></a> </p></td> 
        </tr> 
      </table> 
    </div> 
  </div> 
   <div id="siteInfo">     <a href="mailto:dean@ilipra.org">Contact Us</a> | <span class="style1">&copy;2004 Illinois Park &amp; Recreation Association </span></div> 
</div> 
<!--end pagecell1--> 
<br> 

</body>
</html>
