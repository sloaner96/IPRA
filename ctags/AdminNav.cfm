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
                        <td><A href="/admin/index.cfm"><img src="/images/AdminNavHead.jpg" alt="" width="155" height="41" border="0"></A><br>
							  <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
                             <cfif Session.Admininfo.AllowAdmin EQ 1>
							 <div class=sec-nav>
							    <A href="/admin/index.cfm">Site Maintenance</A>
							   </div>
							   <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
							 <cfif attributes.level EQ 1>
							  <div class=tert-nav>
							        <strong><a href="/Admin/Banners.cfm">Maintain Banners</a></strong><br>
							   </div> 
							   <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
							
							   <div class=tert-nav>
							        <strong><a href="/Admin/Articles.cfm">Maintain News</a></strong><br>
							   </div> 
							   <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
							
							   <div class=tert-nav>
							        <strong><a href="/Admin/Events/eventsearch.cfm">Maintain Events</a></strong><br>
							   </div> 
							   <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
							   <div class=tert-nav>
							        <strong><a href="/Admin/forums/index.cfm">Maintain Forums</a></strong><br>
							   </div> 
							   <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
							   <div class=tert-nav>
							        <strong><a href="/Admin/Surveys/index.cfm">Maintain Surveys</a></strong><br>
							   </div> 
							   <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
							   <div class=tert-nav>
							        <strong><a href="/Admin/Categories/index.cfm">Maintain LookUps</a></strong><br>
							   </div> 
							   <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
							   <div class=tert-nav>
							        <strong><a href="/Admin/Resources/">Maintain Resources</a></strong><br>
							   </div> 
							   <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
							   <div class=tert-nav>
							        <strong><a href="/Admin/Users/index.cfm">Site Users</a></strong><br>
							   </div> 
							   <!--- <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
							   <div class=tert-nav>
							        <strong><a href="/Admin/AuditLog.cfm">Audit Log</a></strong><br>
							   </div>  --->
							   <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
							 </cfif>  
							 <div class=sec-nav>
							    <A href="/Admin/JobPostings/Index.cfm">Job Postings</A>
							   </div>
							   <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
							 <cfif attributes.level EQ 2>
							   <div class=tert-nav>
							        <strong><a href="/Admin/JobPostings/index.cfm">Approve New Postings</a></strong><br>
							   </div> 
							   <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
							   <div class=tert-nav>
							        <strong><a href="/Admin/JobPostings/SearchJobs.cfm">Maintain Existing Postings</a></strong><br>
							   </div> 
							    <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
							   <div class=tert-nav>
							        <strong><a href="/Admin/JobPostings/searchResume.cfm">Search Resumes</a></strong><br>
							   </div> 
							 </cfif> 
							 </cfif>
							 <cfif Session.AdminInfo.AllowMember EQ 1>
							 <div class=sec-nav>
							    <A href="/Admin/Membership/MbrSearch.cfm">Membership</A>
							   </div>
							   <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
							 <cfif attributes.level EQ 3>
							   <div class=tert-nav>
							        <strong><a href="/Admin/Membership/MbrSearch.cfm">Search Members</a></strong><br>
							   </div> 
							  <!---  <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
							   <div class=tert-nav>
							        <strong><a href="/Admin/Membership/AgencySearch.cfm">Search Agencies</a></strong><br>
							   </div> --->
						
							   <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
							   <!--- <div class=tert-nav>
							        <strong><a href="/Admin/Membership/LoadMembers.cfm">Upload New Member Roster</a></strong><br>
							   </div> 
							   <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
							   <div class=tert-nav>
							        <strong><a href="/Admin/Membership/LoadAgency.cfm">Upload New Agency Roster</a></strong><br>
							   </div> 
							   <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
							   <div class=tert-nav>
							        <strong><a href="/Admin/Membership/LoadCeu.cfm">Upload New CEU List</a></strong><br>
							   </div> 
							   <img height=1 src="/images/sec_nav_dline.gif" width=156><br> --->
							 </cfif> 
							 </cfif>
							 <cfif Session.AdminInfo.AllowFinance EQ 1>
							 <div class=sec-nav>
							    <A href="/Admin/Store/index.cfm">Store/Ecommerce</A>
							   </div>
							   <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
							 <cfif attributes.level EQ 4>
							   <div class=tert-nav>
							        <strong><a href="/Admin/Store/ProductMaint.cfm">Maintain Products</a></strong><br>
							   </div> 
							   <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
							   <div class=tert-nav>
							        <strong><a href="/Admin/Store/Orders.cfm">View Orders</a></strong><br>
							   </div> 
							   <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
							   <div class=tert-nav>
							        <strong><a href="/Admin/Store/Donors.cfm">Search for Contributions</a></strong><br>
							   </div>
							   <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
							   <div class=tert-nav>
							        <strong><a href="/Admin/Store/TransactionLog.cfm">Search for Transactions</a></strong><br>
							   </div> 
							   <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
							 </cfif> 	
							 </cfif>
							 <div class=sec-nav>
							    <A href="/admin/Coop/index.cfm">Cooperative Purchase</A>
							   </div>
							   <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
							    <cfif attributes.level EQ 5>
								 <div class=tert-nav>
							        <strong><a href="/Admin/Coop/CoopConfig.cfm">Maintain Purchasing Cycle</a></strong><br>
								 </div> 
								 <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
								 <div class=tert-nav>
							        <strong><a href="/Admin/Coop/AgencyMaint.cfm">Maintain Agencies</a></strong><br>
								 </div> 
								 <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
								 <div class=tert-nav>
								        <strong><a href="/Admin/Coop/Products/ProductMaint.cfm">Maintain Products</a></strong><br>
								 </div> 
								   <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
								   <div class=tert-nav>
								        <strong><a href="/Admin/Coop/Vendors/VendorMaint.cfm">Maintain Vendors</a></strong><br>
								   </div> 
								   <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
								   <div class=tert-nav>
								        <strong><a href="/Admin/Coop/CatMaint.cfm">Maintain Categories</a></strong><br>
								   </div> 
								   <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
								   <div class=tert-nav>
								        <strong><a href="/Admin/Coop/Reports/index.cfm">Reports</a></strong><br>
								   </div>
								   <img height=1 src="/images/sec_nav_dline.gif" width=156><br>
								 </cfif> 
							 <div class=sec-nav>
							    <A href="/Admin/Logout.cfm">Logout</A>
							   </div>
							  
                         </td>
					</tr>
			    </tbody>
		    </table>
		  </td>
	    </tr>
	</tbody>
</table>

</cfoutput>