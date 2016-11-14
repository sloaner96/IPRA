<cfmodule template="#Application.header#" section="0" sectiontitle="Home">
<!---  <SCRIPT LANGUAGE="JAVASCRIPT" TYPE="TEXT/JAVASCRIPT">
<!-- Hide script from old browsers

adImages = new Array("images/staff/Conference07animated.gif")
adURL = new Array("ilipra.org/podcast/podcast.cfm")
thisAd = 0
imgCt = adImages.length

function rotate() {
	if (document.images) {
		if (document.adBanner.complete) {
			thisAd++
			if (thisAd == imgCt) {
				thisAd = 0
			}
			document.adBanner.src=adImages[thisAd]
		}
	  	setTimeout("rotate()", 1 * 4300)
  	}
}

function newLocation() {
	document.location.href = "http://www." + adURL[thisAd]
}

// End hiding script from old browsers -->
</SCRIPT>	--->

<body>
<script src="http://www.google-analytics.com/urchin.js" type="text/javascript">
</script>
<script type="text/javascript">
_uacct = "UA-554740-2";
urchinTracker();
</script>
</body>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
       <tr>
          <td width="178" valign="top">
	      <cfif IsDefined("cookie.Username")>
		    <cfset MyUsername = cookie.username>
		 <cfelse>
		   <cfset MyUsername = "">
		  </cfif>
	      <cfform name="login" action="MembersOnly/Authorize.cfm" method="POST" scriptsrc="/scripts/cfform.js"> 
		      <table border="0" cellpadding="3" cellspacing="0" width="100%" bgcolor="#003366">
				<tr bgcolor="#003366">
                   <td colspan=2><img src="images/MemberLogin.gif" alt="" border="0"></td>
                </tr>
				<tr bgcolor="#003366">
                   <td colspan=2><img src="images/username.gif" alt="" border="0"></td>
                </tr>
				<tr bgcolor="#003366">
				   <td width=10>&nbsp;</td>
                   <td><cfinput type="text" name="user" size="18" class="logininput" required="Yes" value="#MyUsername#" Message="Your username is required to enter the members only area."></td>
                </tr>
				<tr bgcolor="#003366">
                   <td colspan=2><img src="images/password.gif" alt="" border="0"></td>
                </tr>
				<tr bgcolor="#003366">
				  <td width=10>&nbsp;</td>
                   <td><cfinput type="password" name="password" size="18" class="logininput" required="Yes" Message="A password is required to enter the members only area."></td>
                </tr>
				<tr bgcolor="#003366">
				   <td width="10">&nbsp;</td>
				   <td valign="center" class="rememberme"><input type="checkbox" class="logininput" name="RememberMe" value="1" <cfif MyUsername NEQ "">Checked</cfif>> Remember my Username</td>
				</tr>
				<tr bgcolor="#003366">
                   <td colspan=3 valign="bottom"><div align="left"><a href="/sendpassword.cfm" style="color:ffffff; font-family:arial; size:10px;">Forgot Password?</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="image" value="login" src="images/LoginButton.gif" alt="Login to the IPRA Members only area" border="0" align="middle" onMouseOver="this.src='images/login_ovr.gif';" onMouseOut="this.src='images/loginbutton.gif';"></div><div align="left">
<a href="/Articles.cfm?AID=17" style="color:ffffff; font-family:arial; size:10px;">Login Assistance?</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="https://www.ilipra.org/Members/MemberApp.cfm"><img src="images/LoginButton2.gif" alt="Join IPRA!!" border="0" align="middle" onMouseOver="this.src='images/login_ovr2.gif';" onMouseOut="this.src='images/loginbutton2.gif';"></a>
</div></td>
                </tr>
              
		  </cfform>
		  <cfset NextSixty = DateAdd("m", 2, now())>
		  
		  <cfquery name="GetEvents" datasource="#Application.dsn#">
		    Select Top 14 *
			From Events e
			Where e.EndDate >= #CreateODBCDateTime(now())#
		    AND e.EndDate <= #NextSixty#
			AND Highlight = 1
			Order By BeginDate, EndDate
		  </cfquery>
		  
		  <tr bgcolor="#ffffff">
			   <td colspan=2><a href="/Events/ListEvents.cfm"><img src="/images/UpcomingEventsBanner.jpg" alt="Upcoming Events" border="0"></a><div align="left">&nbsp;&nbsp;<a href="eventrequest.cfm" style="color:0000ff; font-family:arial; size:10px; color:006699;">Post an IPRA Section Event</a>
</div></td>
			</tr>
			<cfoutput query="GetEvents">
			  <tr bgcolor="##ffffff">
			    <td valign="top" width="16"><img src="/images/mock3Arrow.gif" alt="" border="0"></td>
				<td width="99%"><span class="NewsText">#DateFormat(GetEvents.BeginDate, 'MM/DD/YY')#</span><br><span class="NewsHead"><a style="text-decoration:none; color:006699;" href="/Events/ViewEvent.cfm?EventID=#EventID#">#EventName#</a></span></td>
			  </tr>
			</cfoutput>
			</table><br>
			<!---  <cfquery name="GetSubArticle" datasource="#Application.dsn#">
		      Select Top 3 *
			  From Articles
			   Where PostingDate <= #CreateODBCDateTime(now())#
			    AND Approved = 1
				AND Highlight = 0
			  order by PostingDate Desc
		    </cfquery>--->
			<table border="0" cellpadding="3" cellspacing="0" color="ffffff">
			<tr>
			   <td colspan=2 align="center"><!--- <a href="http://ipra.blogspot.com" target="_blank"><img src="/images/blogspotnews.jpg" alt="" border="0"></a> ---><div align="left"><!---  &nbsp;&nbsp;
<a href="mailto:&#109;&#97;&#116;&#116;&#64;&#105;l&#105;&#112;&#114;&#97;.o&#114;&#103;&#63;&#115;&#117;&#98;je&#99;t&#61;&#80;&#114;&#101;&#115;&#115;&#32;R&#101;&#108;&#101;a&#115;&#101;&#32;&#80;&#111;s&#116;&#105;n&#103;" style="color:0000ff; font-family:arial; size:10px;">E-mail Your Press Releases!</a>--->
</div></td>
			</tr>
			<!---  <cfoutput query="GetSubArticle">--->
			 <tr>
			    <td valign="top" width="16"><!---  <img src="images/mock3Arrow.gif" alt="" border="0">---></td>
				<td width="100%"><div align="left" class="feedburnercode" id="IPRAtheBlogSpot338912"><!--- <script src="http://feeds.feedburner.com/IPRAtheBlogSpot?format=sigpro" type="text/javascript"></script> ---></td>
			 </tr></div>
			<!---  </cfoutput>--->
			</table><br>
			<br>
	   </td>
	   <td bgcolor="#000000" width="1" valign="top"><img src="images/blank.gif" width="1" alt="" border="0"></td>
	   <td width="400" valign="top">
	     <cfquery name="GetArticle" datasource="#Application.dsn#">
		    Select Top 5 *
			From Articles
			Where PostingDate <= #CreateODBCDateTime(now())#
			AND Approved = 1
			AND Highlight= 1
			order by Highlight desc, PostingDate Desc
		 </cfquery>
		  <!---  <body onLoad="rotate()">--->
		 <table border="0" cellpadding="0" cellspacing="0" width="100%">
		   <tr>
                 <td><A HREF="/Members/Education/index.cfm"><IMG SRC="images/staff/Fall06workshops.gif" WIDTH="400" HEIGHT="104" NAME="adBanner" BORDER="0" ALT="What's New at IPRA!!!"></A></td>
              </tr>
		 </table>
		 </body>
		 <br>
		 <table border="0" cellpadding="4" cellspacing="0" width="95%">
			<!--- <cfoutput query="GetArticle"> --->
			<tr>&nbsp;&nbsp;<img src="/images/blogspotnews.jpg" alt="" border="0" align="center">&nbsp;<a href="http://feeds.feedburner.com/IPRAtheBlogSpot" title="Subscribe to my feed, IPRA...The Blog Spot" rel="alternate" type="application/rss+xml"><img src="http://www.feedburner.com/fb/images/pub/feed-icon16x16.png" alt="" style="border:0"/></a>&nbsp;&nbsp;<a href="http://blog.ilipra.org/comments/feed/" title="Subscribe to blog comments, IPRA...The Blog Spot"><img src="/images/rss_comments1.gif" border="0"></a><br><font size="1" color="#006699">&nbsp;&nbsp;The following news stories are from IPRA's blog, <a href="http://blog.ilipra.org" target="_blank">The Blog Spot</a>.</font>
			  <td><div align="left" class="feedburnercode" id="IPRAtheBlogSpot338912"><script src="http://feeds.feedburner.com/IPRAtheBlogSpot?format=sigpro" type="text/javascript"></script>
			      <!--- </cfif> --->
			  </td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			<!--- </cfoutput> --->
		  </table><br>
		  <table border="0" cellpadding="4" cellspacing="0" width="100%">	
			<tr>
			  <td align="center">
			     <table border="0" cellpadding="3" cellspacing="1" width="100%">
                       <tr>
					  <td colspan=3 align="center" class="topnav">Hover over the text to view our mission and our vision</td>
					</tr>
					<tr>
			          <td><a href="/aboutus/missionvision.cfm"><img src="/images/mission.jpg" alt="It is the mission of the Illinois Park and Recreation Association to be an advocate in providing quality park, recreation and conservation education, resources and services to professionals and citizens throughout the state of Illinois" border="0"></a></td>
					  <td><img src="/images/blank.gif" height=1 width="5" border="0"></td>
			          <td><a href="/aboutus/missionvision.cfm"><img src="/images/purpose.jpg" alt="It is the vision of the Illinois Park and Recreation Association to be a state and national leader in advancing parks, recreation and conservation" border="0"></a></td>
			        </tr>
					
                    </table>
			  </td>
			</tr> 
            </table>
		 <br><br>
	   </td>
	   <td bgcolor="#000000" width="1" valign="top"><img src="images/blank.gif" width="1" alt="" border="0"></td>
	   <td width="225" valign="top">
	       
		  <table border="0" cellpadding="0" cellspacing="0" width="100%">
			 <tr>
			    <td align="center"><img src="images/quicklinks.jpg" alt="" border="0"></td>

			 </tr>
			 
		  </table><br>
		  &nbsp;<img src="images/mock3arrow.gif">&nbsp;<a href="careers/index.cfm"><img src="images/parkrecJOBS.jpg" border="0"></a><br>
&nbsp;<img src="images/mock3arrow.gif">&nbsp;<a href="MembersOnly/MyIPRA/CheckCEUS.cfm"><img src="images/ceu.jpg" border="0"></a><br>
&nbsp;<img src="images/mock3arrow.gif">&nbsp;<a href="Affiliations/sections/Index.cfm"><img src="images/sections.jpg" border="0"></a><br>
&nbsp;<img src="images/mock3arrow.gif">&nbsp;<a href="Resources/enews/ENewsletterOctober06.htm"><img src="images/enewsletter.jpg" border="0"></a><br>
&nbsp;<img src="images/mock3arrow.gif">&nbsp;<a href="events/listevents.cfm"><img src="images/calendar.jpg" border="0"></a><br>
&nbsp;<img src="images/mock3arrow.gif">&nbsp;<a href="members/education/index.cfm"><img src="images/workshops.jpg" border="0"></a><br>
&nbsp;<img src="images/mock3arrow.gif">&nbsp;<a href="/Conference/Conference.cfm" target="_blank"><img src="images/conference.jpg" border="0"></a><br>
&nbsp;<img src="images/mock3arrow.gif">&nbsp;<a href="help.cfm"><img src="images/help.jpg" border="0"></a><br>
<br>
		  <table border="0" cellpadding="0" cellspacing="0" width="100%">
               <tr>
			  <td class="topnav" align="center"><img src="/images/sponsors.jpg" alt="" border="0" align="center"></td>
			</tr>
			<tr>
			 <td background="/images/sec_nav_dline.gif"><img src="/images/blank.gif" height="1" width="0" border="0"></td>
			</tr>
			<tr>
			  <td align="center">
			    <table border="0" cellpadding="3" cellspacing="0">
                      <tr>
                        <td valign="top"><a href="http://www.theprintingsystem.com" target="_blank"><img src="images/printsystem.jpg" alt="The Printing System" border="0"></a></td>
					&nbsp;&nbsp;&nbsp; <td valign="top"><a href="http://www.outdoormoviemania.com" target="_blank"><img src="images/outdoormovie.gif" alt="Outdoor Movie Mania" border="0"></a></td>
                      </tr>
				 <tr>
				     <td colspan=2 align="center"><a href="http://www.getreil.com" target="_blank"><img src="images/parsi2.jpg" alt="Park & Recreation Supply" border="0"></a></td>
				   </tr> 
				   <tr>
						     <td>&nbsp;</td>
						   </tr>
                   </table>
			  </td>
			</tr>
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
               <tr>
			  <td class="topnav" align="center"><img src="/images/studio1815.jpg" alt="" border="0" align="center"></td>
			</tr>
			<tr>
			 <td background="/images/sec_nav_dline.gif"><img src="/images/blank.gif" height="1" width="0" border="0"></td>
			</tr>
			<tr>
			  <td align="center">
			    <table border="0" cellpadding="3" cellspacing="0">
                      <tr>
                        <td valign="top"><a href="/podcast/podcast.cfm"><img src="images/WIPRAlogo75x83.gif" alt="WIPRA-The Voice of Parks and Recreation..." border="0"></a></td>
					&nbsp;&nbsp;&nbsp; <td valign="middle"><a href="http://blog.ilipra.org" target="_blank"><img src="images/theblogspotanimatedad100x44.gif" alt="The Blog Spot" border="0"></a></td>
                      </tr>
				  
                   </table>
             </table><br>
		  <table border="0" cellpadding="0" cellspacing="0" width="100%">
               <tr>
			  <td class="topnav" align="center"><img src="images/stratpartners.jpg" border="0"></td>
			</tr>
			<tr>
			 <td background="/images/sec_nav_dline.gif"><img src="/images/blank.gif" height="1" width="0" border="0"></td>
			</tr>
			<tr>
			  <td height="100" align="center">
			    <table border="0" cellpadding="3" cellspacing="0">
				   <tr>
				     <td valign="top">
					   <table border="0" cellpadding="0" cellspacing="0">
                             <tr>
                                 <td valign="top"><a href="http://www.nrpa.org" target="_blank"><img src="images/nrpa_2.jpg" alt="National Park & Recreation Asscoiation" border="0"></a></td>
                              </tr>
						   </table>
					 </td>
					 <td align="right" valign="top"><a href="http://www.westerngolfassociation.com" target="_blank"><img src="images/wga_2.gif" alt="Western Golf Association" border="0"></a></td>
				   </tr>
				                       </table>
			  </td>
			</tr>
			<tr>
						     <td>&nbsp;</td>
						   </tr>
						   <tr>
                                 <td align="center"><a href="http://www.ipdlaf.org" target="_blank"><img src="images/ipdlaflogo.jpg" alt="Illinois Park District Liquid Asset Fund" border="0"></a></td>
                              </tr>
						   <tr>
						     <td>&nbsp;</td>
						   </tr>
						   <!---  <tr>
                                 <td align="center"><a href="http://www.ilparks.org" target="_blank"><img src="images/iapd_2.gif" alt="Illinois Association of Park Districts" border="0"></a></td>
                              </tr>--->
						   <tr>
						     <td>&nbsp;</td>
						   </tr>
						   <tr>
						     <td>&nbsp;</td>
						   </tr>
						  <!---   <tr>
                                 <td align="center"><a href="/forms/licenseplaterenewal.pdf" target="_blank"><img src="images/licenseplate.gif" alt="IL Vanity License Plate" border="0"></a></td>
                              </tr>--->
             </table><br>
	   </td>
       </tr>
     </table>
<cfmodule template="#Application.Footer#" section="0">
