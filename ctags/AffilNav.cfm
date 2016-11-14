<cfparam name="attributes.level" default="0">
<cfparam name="attributes.sublevel" default="0">
<cfoutput>
 <table cellSpacing=0 cellPadding=1 width=154 border=0>
   <tbody>
       <tr>
          <td bgColor="##656565">
             <table cellSpacing=0 cellPadding=0 width=152 bgColor="##ffffff" border=0>
                <tbody>
                     <tr>
                        <td><A href=""><img height=41 src="/images/Affiliations_Secnavhead.jpg" width=155 border=0></A><br>
							 <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
                             <div class=sec-nav>
							    <a href="#Application.baseurl#/Affiliations/index.cfm">Affiliates</a>
							 </div>
							 <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
							 <cfif attributes.level EQ 1>
							   <div class=tert-nav>
							        <strong><a href="/Affiliations/ilrta.cfm">ILRTA</a></strong><br>
							   </div> 
							   <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
							   <div class=tert-nav>
							        <strong><a href="/Affiliations/mipe.cfm">MIPE</a></strong><br>
							   </div> 
							   <img height=1 src="/images/sec_nav_dline.gif" width=156><br><div class=tert-nav>
							        <strong><a href="/Affiliations/nsrt.cfm">NSRT</a></strong><br>
							   </div> 
							   <img height=1 src="/images/sec_nav_dline.gif" width=156><br><div class=tert-nav>
							        <strong><a href="/Affiliations/ssprpa.cfm">SSPRPA</a></strong><br>
							   </div> 
							   <img height=1 src="/images/sec_nav_dline.gif" width=156><br><div class=tert-nav>
							        <strong><a href="/Affiliations/sipra.cfm">SIPRA</a></strong><br>
							   </div> 
							   <img height=1 src="/images/sec_nav_dline.gif" width=156><br><div class=tert-nav>
							        <strong><a href="/Affiliations/spra.cfm">SPRA</a></strong><br>
							   </div> 
							   <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
							 </cfif> 
							 <div class=sec-nav>
							    <a href="#Application.baseurl#/Affiliations/ambassadors.cfm">Ambassador's Club</a>
							  </div>
							 <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
						      <div class=sec-nav>
							    <a href="#Application.baseurl#/Affiliations/Committees/index.cfm">Committees</a>
							  </div>
							 <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
						      <div class=sec-nav>
							    <a href="#Application.baseurl#/Affiliations/Foundation/index.cfm">Foundation</a>
							 </div>
							 <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
							 <cfif attributes.level EQ 3>
							   <div class=tert-nav>
							        <strong><a href="/Affiliations/Foundation/Committees.cfm">Foundation Committees</a></strong><br>
							   </div> 
							   <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
							   <div class=tert-nav>
							        <strong><a href="/Affiliations/Foundation/Donors.cfm">Donors</a></strong><br>
							   </div> 
							   <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
							   <div class=tert-nav>
							        <strong><a href="/Affiliations/Foundation/Vendors.cfm">Contributing Vendors</a></strong><br>
							   </div> 
							   <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
							   <div class=tert-nav>
							        <strong><a href="/Affiliations/Foundation/Scholarships.cfm">Scholarships</a></strong><br>
							   </div> 
							   <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
							   <div class=tert-nav>
							        <strong><a href="/Affiliations/Foundation/Silent_auction.cfm">Silent Auction</a></strong><br>
							   </div> 
							   <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
							   <div class=tert-nav>
							        <strong><a href="#Application.secureurl#/Affiliations/Foundation/Contribute.cfm">Make a Contribution</a></strong><br>
							   </div> 
							   <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
							 </cfif> 
							 <div class=sec-nav>
							    <a href="#Application.baseurl#/Affiliations/Sections/index.cfm">Sections</a>
							 </div>
							 <cfif attributes.level EQ 4>
  							   <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
							   <div class=tert-nav>
							        <strong><a href="http://af.ilipra.org" target="_blank">Administration & Finance</a></strong><br>
							   </div> 
							   <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
							   <div class=tert-nav>
							        <strong><a href="http://cm.ilipra.org" target="_blank">Communications & Marketing</a></strong><br>
							   </div> 
							   <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
							   <div class=tert-nav>
							        <strong><a href="/Affiliations/Sections/ems_section.cfm">Ethnic Minority Section</a></strong><br>
							   </div> 
							   <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
							   <div class=tert-nav>
							        <strong><a href="/Affiliations/Sections/fac_section.cfm">Facility Management</a></strong><br>
							   </div> 
							   <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
							   <div class=tert-nav>
							        <strong><a href="/Affiliations/Sections/pn_section.cfm">Parks & Natural Resources</a></strong><br>
							   </div> 
							   <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
							   <div class=tert-nav>
							        <strong><a href="/Affiliations/Sections/rec_section.cfm">Recreation</a></strong><br>
							   </div> 
							   <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
							   <div class=tert-nav>
							        <strong><a href="/Affiliations/Sections/Trec_section.cfm">Therapeutic Recreation</a></strong><br>
							   </div> 
							   <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
							   <div class=tert-nav>
							        <strong><a href="/Affiliations/Sections/Stu_info.cfm">Student</a></strong><br>
							   </div> 
							 </cfif> 							
                         </td>
					</tr>
			    </tbody>
		    </table>
		  </td>
	    </tr>
	</tbody>
</table>

</cfoutput>
