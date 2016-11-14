<cfparam name="url.e" default="0">
<cfmodule template="#Application.header#" section="0" sectiontitle="Site Admin">
  <cfoutput>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="160"><br>
		    <cfmodule template="#Application.tagdir#/adminnav.cfm" level="1">
		   </td>
		   <cfquery name="GetAllBanners" datasource="#Application.dsn#">
		       Select * 
			   From BannerAds
			   Order BY AdName             
		   </cfquery>
		   <cfparam name="url.action" default="Add">
		   <td valign="top"><br>
			  <table border="0" cellpadding="5" cellspacing="0" width="100%">
		        <tr>
		          <td><h3>IPRA Banner Ads</h3></td>
		        </tr>
		      </table>
			  <table border="0" cellpadding="6" cellspacing="0" width="100%">
		        <tr>
		           <td class="RegText">
				      <cfif Url.E EQ 1>
					    <strong class="errorText">Error! You Must Include a Name for this Banner Ad</strong>
					  <cfelseif Url.E EQ 2>
					    <strong class="errorText">Error! You Must Include a Url for this Banner Ad</strong>
					  <cfelseif Url.E EQ 3>
					    <strong class="errorText">Error! You Must Include an Image for this Banner Ad</strong>
					  <cfelseif Url.E EQ 4>
					    <strong class="errorText">Error! You Must Include a Start Date for this Banner Ad</strong>
					  <cfelseif Url.E EQ 5>
					    <strong class="errorText">Error! You Must Include a End Date for this Banner Ad</strong>
					  <cfelseif Url.E EQ 6>
					    <strong class="errorText">Error! There was a problem saving this Banner Ad</strong>
					  </cfif>
				      <cfform name="bannerupd" action="UpdateBanner.cfm?action=#url.action#" Method="POST" enctype="multipart/form-data" scriptsrc="/scripts/cfform.js">
					  <cfif url.action EQ "Add">
					      <table border="0" cellpadding="3" cellspacing="0">
	                          <tr bgcolor="##003366">
							    <td colspan=2><strong style="color:##ffffff">Add New Banner</strong></td>
							  </tr>
							  <tr>
	                            <td><strong>Name</strong></td>
								<td><input type="text" name="adName" value="" size="30" maxlength="50"></td>
	                          </tr>  
							  <tr>
	                            <td><strong>Url</strong></td>
								<td><input type="text" name="adURL" value="" size="30" maxlength="150"></td>
	                          </tr> 
							  <tr>
	                            <td><strong>Image:</strong><br><font face="arial" color="656565" size="-2">(MAX 455 X 60)</font></td>
								<td><input type="file" name="adImage" value="" size="30"></td>
	                          </tr> 
							  <tr>
	                            <td><strong>Start Date</strong></td>
								<td><input type="text" name="adStart" value="#DateFormat(now(), 'MM/DD/YYYY')#" size="15" maxlength="15"></td>
	                          </tr> 
							  <tr>
	                            <td><strong>End Date</strong></td>
								<td><input type="text" name="adFinish" value="#DateFormat(DateAdd('d', 365, now()), 'MM/DD/YYYY')#" size="15" maxlength="15"></td>
	                          </tr> 
							  <tr>
							    <td colspan=2><input type="submit" name="submit" value="Add >>"></td>
							  </tr>
	                      </table>
					  <cfelseif url.action EQ "Edit">
					     <cfquery name="GetThisBanner" datasource="#Application.dsn#">
						   Select *
						   From BannerAds
						   Where BannerID = #url.bannerID#
						 </cfquery>
						 <input type="hidden" name="BannerID" value="#GetThisBanner.BannerID#"
					      <table border="0" cellpadding="3" cellspacing="0">
	                          <tr bgcolor="##003366">
							    <td  colspan=2><strong style="color:##ffffff">Edit Banner</strong></td>
							  </tr>
							  <tr>
	                            <td><strong>Name</strong></td>
								<td><input type="text" name="adName" value="#GetThisBanner.AdName#" size="30" maxlength="50"></td>
	                          </tr>  
							  <tr>
	                            <td><strong>Url</strong></td>
								<td><input type="text" name="adURL" value="#GetThisBanner.AdUrl#" size="30" maxlength="150"></td>
	                          </tr> 
							  <tr>
							    <td colspan=2><strong>Existing Image: </strong><a href="/images/bannerAds/#GetThisBanner.AdImage#" target="_blank">View image</a></td>
							  </tr>
							  <tr>
	                            <td><strong>New Image:</strong><br><font face="arial" color="656565" size="-2">(MAX 455 X 60)</font></td>
								<td><input type="file" name="adImage" value="" size="30"></td>
	                          </tr> 
							  <tr>
	                            <td><strong>Start Date</strong></td>
								<td><input type="text" name="adStart" value="#DateFormat(GetThisBanner.AdStart, 'MM/DD/YYYY')#" size="15" maxlength="15"></td>
	                          </tr> 
							  <tr>
	                            <td><strong>End Date</strong></td>
								<td><input type="text" name="adFinish" value="#DateFormat(GetThisBanner.AdFinish, 'MM/DD/YYYY')#" size="15" maxlength="15"></td>
	                          </tr> 
							  <tr>
							    <td colspan=2><input type="submit" name="submit" value="Update >>"></td>
							  </tr>
	                      </table>
					  </cfif>
					  </cfform>
					  <br><br>
					  <table border="0" cellpadding="3" cellspacing="1" width="100%" bgcolor="656565">
                        <tr bgcolor="eeeeee">
                          <td></td>
						  <td>AdName</td>
						  <td>Image</td>
						  <td>URL</td>
						  <td>Dates</td>
						  <td align="center">Click-Thru</td>
                        </tr>
						<cfloop query="GetAllbanners">
							<tr bgcolor="ffffff">
	                          <td><a href="Banners.cfm?Action=Edit&BannerID=#GetAllbanners.BannerID#">[EDIT]</a><br><br> <a href="UpdateBanner.cfm?action=Remove&bannerID=#GetAllBanners.BannerID#" style="color:##cc0000;">[REMOVE]</a></td>
							  <td>#GetAllBanners.AdName#</td>
							  <td align="center"><a href="/images/bannerAds/#GetAllBanners.AdImage#" target="_blank">View Image</a></td>
							  <td>#GetAllBanners.adURL#</td>
							  <td>#DateFormat(GetAllBanners.AdStart, 'MM/DD/YYYY')# - #DateFormat(GetAllBanners.AdFinish, 'MM/DD/YYYY')#</td>
							  <td align="right">#GetAllBanners.HitCount#</td>
	                        </tr>
						</cfloop>
                      </table>
				   </td>
		        </tr>
		       </table>
			   <br><br>
		 </td>
     </tr>
</table>  
</cfoutput>
<cfmodule template="#Application.footer#">