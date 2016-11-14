<cfmodule template="#Application.header#" section="0" sectiontitle="Home">
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
	                   <td colspan=3 valign="bottom"><div align="right"><a href="/sendpassword.cfm" style="color:ffffff; font-family:arial; size:10px;">Forgot Password?</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="image" value="login" src="images/LoginButton.gif" alt="Login to the IPRA Members only area" border="0" align="middle" onMouseOver="this.src='images/login_ovr.gif';" onMouseOut="this.src='images/loginbutton.gif';"></div><div align="left">
&nbsp;<a href="/Articles.cfm?AID=17" style="color:ffffff; font-family:arial; size:10px;">Need Login Help?</a>
</div></td>
	                </tr>
	              </table><br>
			  </cfform>
			  <cfset NextSixty = DateAdd("m", 2, now())>
			  
			  <cfquery name="GetEvents" datasource="#Application.dsn#">
			    Select Top 5 *
				From Events e
				Where e.EndDate >= #CreateODBCDateTime(now())#
			    AND e.EndDate <= #NextSixty#
				AND Highlight = 1
				Order By BeginDate, EndDate
			  </cfquery>
			  <table border="0" cellpadding="3" cellspacing="0" color="ffffff">
				<tr>
				   <td colspan=2><a href="/Events/ListEvents.cfm"><img src="/images/UpcomingEventsBanner.jpg" alt="Upcoming Events" border="0"></a><div align="left">
&nbsp;&nbsp;<a href="eventrequest.cfm" style="color:0000ff; font-family:arial; size:10px;">Want to Post an Event?</a>
</div></td>
				</tr>
				<cfoutput query="GetEvents">
				  <tr>
				    <td valign="top" width="16"><img src="/images/mock3Arrow.gif" alt="" border="0"></td>
					<td width="99%"><span class="NewsText">#DateFormat(GetEvents.BeginDate, 'MM/DD/YY')#</span><br><span class="NewsHead"><a href="/Events/ViewEvent.cfm?EventID=#EventID#">#EventName#</a></span></td>
				  </tr>
				</cfoutput>
				</table><br>
				<cfquery name="GetSubArticle" datasource="#Application.dsn#">
			      Select Top 5 *
				  From Articles
				   Where PostingDate <= #CreateODBCDateTime(now())#
				    AND Approved = 1
					AND Highlight = 0
				  order by PostingDate Desc
			    </cfquery>
				<table border="0" cellpadding="3" cellspacing="0" color="ffffff">
				<tr>
				   <td colspan=2><a href="articles.cfm"><img src="/images/inthenews.gif" alt="" border="0"></a><div align="left">
&nbsp;&nbsp;<a href="mailto:matt@ilipra.org?subject=Press Release Posting" style="color:0000ff; font-family:arial; size:10px;">E-mail Your Press Releases!</a>
</div></td>
				</tr>
				<cfoutput query="GetSubArticle">
				 <tr>
				    <td valign="top" width="16"><img src="images/mock3Arrow.gif" alt="" border="0"></td>
					<td width="99%"><span class="Newstext">#DateFormat(GetSubArticle.PostingDate, 'MM/DD/YY')#</span><br><span class="NewsHead"> <a href="Articles.cfm?AID=#GetsubArticle.ArticleID#">#GetSubArticle.Headline#</a></span></td>
				 </tr>
				</cfoutput>
				</table><br>
				<br>
		   </td>
		   <td bgcolor="#000000" width="1" valign="top"><img src="images/blank.gif" width="1" alt="" border="0"></td>
		   <td width="400" valign="top">
		     <cfquery name="GetArticle" datasource="#Application.dsn#">
			    Select Top 3 *
				From Articles
				Where PostingDate <= #CreateODBCDateTime(now())#
				AND Approved = 1
				AND Highlight= 1
				order by Highlight desc, PostingDate Desc
			 </cfquery>
			 <cfset RandImg = RandRange(2,9)>
		     <table border="0" cellpadding="0" cellspacing="0" width="100%">
              <cfoutput>
			   <tr>
                  <td><img src="/images/#RandImg#Banner.jpg" alt="" border="0"></td>
               </tr>
               </cfoutput>
			 </table>
			 <table border="0" cellpadding="4" cellspacing="0" width="95%">
				<cfoutput query="GetArticle">
				<tr>
				  <td><span class="Newsdate">#DateFormat(GetArticle.PostingDate, 'mmmm dd, yyyy')#&nbsp;&nbsp;</span>
				      <span class="Newshead">#GetArticle.Headline#</span><br>
					  <cfif GetArticle.currentrow EQ 1>
					  <span class="NewsText"><cfif GetArticle.ImgPath NEQ ""><img src="#Application.baseurl#/images/Articles/#GetArticle.ImgPath#" alt="#GetArticle.ImgAltText#" align="#GetArticle.ImgPosition#"></cfif>
					    #ArticleText#
					  </span>
					  <cfelse>
					    <span class="NewsMore">#SpanExcluding(GetArticle.Articletext, Chr(13))# ... <a href="Articles.cfm?AID=#GetArticle.ArticleID#" style="color:##cc0000;">Read more >></a></span>
				      </cfif>
				  </td>
				</tr>
				<tr><td>&nbsp;</td></tr>
				</cfoutput>
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
				    <td align="center"><a href="careers/index.cfm"><img src="images/jobopps.jpg" alt="Click here for the Job Opportunities Bulletin" border="0"></a></td>
				 </tr>
			  </table><br>
		      <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
				  <td class="topnav">Sponsors:</td>
				</tr>
				<tr>
				 <td background="/images/sec_nav_dline.gif"><img src="/images/blank.gif" height="1" width="0" border="0"></td>
				</tr>
				<tr>
				  <td align="center">
				    <table border="0" cellpadding="3" cellspacing="0">
                       <tr>
                         <td valign="top"><a href="http://www.awesomeamusements.com" target="_blank"><img src="images/awesome2.gif" alt="A-Awesome Amusements" border="0"></a></td>
						 <td valign="top"><a href="http://www.outdoormoviemania.com" target="_blank"><img src="images/outdoormovie.gif" alt="Outdoor Movie Mania" border="0"></a></td>
                       </tr>
					   <tr>
					     <td colspan=2 align="center"><a href="http://www.celebrationauthority.com" blank="_blank"><img src="images/BannerAds/clownaround.jpg" alt="Clowning Around/Celebration Authority" border="0"></a></td>
					   </tr>
                    </table>
				  </td>
				</tr>
              </table><br>
			  <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
				  <td class="topnav">Strategic Partners:</td>
				</tr>
				<tr>
				 <td background="/images/sec_nav_dline.gif"><img src="/images/blank.gif" height="1" width="0" border="0"></td>
				</tr>
				<tr>
				  <td height="150" align="center">
				    <table border="0" cellpadding="3" cellspacing="0">
					   <tr>
					     <td valign="top">
						   <table border="0" cellpadding="0" cellspacing="0">
                              <tr>
                                  <td><a href="http://www.nrpa.org" target="_blank"><img src="images/npra_2.gif" alt="National Park & Recreation Asscoiation" border="0"></a></td>
                               </tr>
							   <tr>
							     <td>&nbsp;</td>
							   </tr>
							   <tr>
                                  <td><a href="http://www.ilparks.org" target="_blank"><img src="images/iapd_2.gif" alt="Illinois Association of Park Districts" border="0"></a></td>
                               </tr>
							   
                            </table>
						 </td>
						 <td align="right" valign="top"><a href="http://www.westerngolfassociation.com" target="_blank"><img src="images/wga_2.gif" alt="Western Golf Association" border="0"></a></td>
					   </tr>
					                       </table>
				  </td>
				</tr>
				<tr>
                                  <td align="center"><a href="http://www.ipdlaf.org" target="_blank"><img src="images/ipdlaflogo.jpg" alt="Illinois Park District Liquid Asset Fund" border="0"></a></td>
                               </tr>
							   <tr>
							     <td>&nbsp;</td>
							   </tr>
							   <tr>
							     <td>&nbsp;</td>
							   </tr>
				<tr>
                                  <td align="center"><a href="http://www.microtrain.net/form1.php" target="_blank"><img src="images/microtrain.jpg" alt="Microtrain" border="0"></a></td>
                               </tr>
							   <tr>
							     <td>&nbsp;</td>
							   </tr>
							   <tr>
							     <td>&nbsp;</td>
							   </tr>
							   <tr>
                                  <td align="center"><a href="/forms/licenseplaterenewal.pdf" target="_blank"><img src="images/licenseplate.gif" alt="IL Vanity License Plate" border="0"></a></td>
                               </tr>
              </table><br>
		   </td>
        </tr>
      </table>
<cfmodule template="#Application.Footer#" section="0">
