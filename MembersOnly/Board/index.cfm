<cfquery name="GetBoard" datasource="#Application.dsn#">
   Select *
   From Board
   Where MbrID = #Session.UserInfo.IPRAMemberID#
</cfquery>

<cfmodule template="#Application.header#" section="0" sectiontitle="Board information Page">
  <cfoutput>
	 <table border="0" cellpadding="3" cellspacing="0" width="100%">
	    <tr>
           <td valign="top" width="150"><br>
	         <cfmodule template="#Application.tagdir#/MemberonlyNav.cfm">
		   </td>
		   <td valign="top"><br>
		   <cfif GetBoard.recordcount GT 0>
			  <table border="0" cellpadding="5" cellspacing="0">
		        <tr>
		          <td><h3>IPRA Board of Directors</h3></td>
		        </tr>
		      </table>
            <table border="0" cellpadding="4" cellspacing="1" width="100%" align="center">
              <tr>
			    <td colspan=2 align="left"><h4>Last Updated: 10/19/2006 12:49:11 PM</h4></td>
			  </tr>
			  <tr class="RegText">
                <td valign="top" >
				 <div><strong>Calendars</strong></div>
				  <div>
                    <a href="/forms/2007BODMeetings.pdf" target="_blank">2007 Board Meeting Schedule</a><br>
                    <a href="files/mac_web.PDF" target="_blank">Master Activity Calendar</a><br>
                  </div>
				  <br>
				  <div><strong>Correspondence</strong><br>
				  NULL!
				  </div>
				  
				  <br>
				  <div><strong>Strategic Planning</strong></div>
				  <div>
				  <a href="files/IPRAStrategicPlanRevised6906.pdf" target="_blank"><strong>UPDATED</strong> Strategic Plan</a>&nbsp;(254 KB)<br>
				  <a href="files/StrategicPlan20607.pdf" target="_blank">2006/2007 Strategic Plan</a><br>
<a href="files/2006BoardOrientation.PPT" target="_blank">2006 Board Orientation</a>&nbsp;(.ppt)&nbsp;(1.35 MB)<br></div>
				  <br>
				  <div><strong>Board Meeting Packets</strong>
                  <div>
				  <a href="files/sept06packet.pdf" target="_blank">September 2006 Board Packet</a>&nbsp;(542 KB)<br>
				  <a href="files/jun06packet.pdf" target="_blank">June 2006 Board Packet</a>&nbsp;(2 MB)<br>
				  <a href="files/mar06packet.pdf" target="_blank">March 2006 Board Packet</a>&nbsp;(2 MB)<br><br>
				  <!---  <a href="/forms/nov3005boardminutes.pdf" target="_blank">November 30, 2005 Board Minutes</a>&nbsp;(52 KB)<br><br>
				  <a href="files/nov05packet1.pdf" target="_blank">November 2005 Packet 1</a>&nbsp;(2 MB)<br>
                   <a href="files/nov05packet2.pdf" target="_blank">November 2005 Packet 2</a>
				   &nbsp;(2 MB)<br>
				   <a href="files/nov05packet3.pdf" target="_blank">November 2005 Packet 3</a>&nbsp;(2 MB)<br>
                   <a href="files/nov05packet4.pdf" target="_blank">November 2005 Packet 4</a>
				   &nbsp;(751 KB)<br><br>
				  <a href="files/sept05packet1.pdf" target="_blank">September 2005 Packet 1</a>&nbsp;(2 MB)<br>
                   <a href="files/sept05packet2.pdf" target="_blank">September 2005 Packet 2</a>
				   &nbsp;(1.6 MB)<br><br>
				  <a href="files/jun05packet1.pdf" target="_blank">June 2005 Packet 1</a>&nbsp;(2 MB)<br>
                   <a href="files/jun05packet2.pdf" target="_blank">June 2005 Packet 2</a>
				   &nbsp;(977 KB)<br><br>
				  <a href="files/mar05packet1.pdf" target="_blank">March 2005 Packet 1</a>&nbsp;(2 MB)<br>
                   <a href="files/mar05packet2.pdf" target="_blank">March 2005 Packet 2</a>
				   &nbsp;(2 MB)<br><br>
				   --->
				  </div>
				  <div><strong>Finance Committee</strong>
                  <div>
				  <a href="files/2007IPRAProposedBudget.pdf" target="_blank">2007 Proposed Budget</a>&nbsp;(500 K)&nbsp;<img src="/images/new_yell.gif" border="0"><br><br>
				  <a href="files/IPRAaudit05.pdf" target="_blank">2005 IPRA Audit Report</a>&nbsp;(1MB)<br>
				  <a href="files/2006BudgetGroup1.pdf" target="_blank">2006 Budget Information (Packet 1)</a>&nbsp;(2 MB)<br>
                   <a href="files/2006BudgetGroup2.pdf" target="_blank">2006 Budget Information (Packet 2)</a>&nbsp;(1 MB)<br>
				  <a href="files/2004Audit.pdf" target="_blank">2004 IPRA Audit</a>&nbsp;(893 KB)<br>
				  </div>
				  <br>
                  
				  <!---  <div><strong>Board Retreat</strong>
                   <div>
				   <a href="files/2005StrategicPlanningMatrix.xls" target="_blank">2005 Strategic Plan</a>&nbsp;(.xls)<br>
                   
				  </div>
				  <br>--->
				  <div><strong>Ethics</strong>
                 <br><br>
				  <div><strong>Website Information</strong></div>
				  <div>
				  <a href="files/websummary.cfm" target="_blank">Website Survey Results</a>&nbsp;<br>
				  </div>
				  
				</td>
                <td valign="top">
				
                  <div><strong>Policies &amp; Information</strong></div>
                  <div>
				  <a href="files/2006BODDirectory.doc" target="_blank">2006 Leadership Directory</a><br>
				  <a href="files/2006IPRAPersonnelManual.pdf" target="_blank">2006 IPRA Personnel Manual</a><br>
				  <a href="files/2005IPRACommitteeChairMatrix.pdf" target="_blank">2005 IPRA Committee Chair Matrix</a><br>
				    <a href="files/FinancialGuidelinesFinalPolicy.doc" target="_blank">Financial Policies</a><br>
                    <a href="files/IPRAByLawsFinalCopy.DOC" target="_blank">Bylaws</a><br>
                    <a href="files/2005FinanceCommittee.pdf" target="_blank">2005 Finance Committee</a><br>
                    <a href="/Resources/westernopenreg.cfm" target="_blank">Western Open Volunteer Form</a><br>
                    <a href="/Members/MemberApp.cfm" target="_blank">Membership Application</a><br>
                    <a href="files/certification_plan.doc" target="_blank">IPREA/IPRCB Certification Plan</a><br>
				  </div>
				  <br>
				  <div><strong>Board Articles &amp; Education</strong>
                  <div>
				  <a href="http://www.ag.state.il.us/charities/volunteers.html" target="_blank">Volunteer Board Member Responsibilities</a><br>
				  <a href="files/auditorattyreview06.pdf" target="_blank">Attorney &amp Auditor Review</a><br>
				  <a href="files/BoardSexualHarrassment.pdf" target="_blank">Sexual Harassment by Board Members</a><br>
				    <a href="files/association_predictions.pdf" target="_blank">What Will the Future Association Look Like?</a><br>
                    <a href="files/DiversityArticle.pdf" target="_blank">Diversity - Beyond the Rainbow</a><br>
                    <a href="files/GovernanceArticle.pdf" target="_blank">Association Governance-Best Practices</a><br>
                  </div>
				  <br>
				  
				  <div><strong>2006/2007 Elections</strong>
                  <div>
				    <a href="/forms/MembersOnly/2007_BOD_NominationForm.doc">2007 Board of Directors Nomination Application</a><br>
                   
				  </div>
				  <br>
				  <div><strong>Committee/Task Force</strong>
                  <div>
				  <a href="files/BoardMemberResponses.pdf" target="_blank">Board Member Responses</a> (836 KB)<br>
				    <a href="files/taskforcecmterecs.pdf" target="_blank">IPRA Committee/Task Force Recommendations</a><br>
                    <a href="files/iprasectionbylaws.pdf" target="_blank">IPRA Section By-Laws</a><br>
					<a href="files/iprasectionbylawtemplate.doc" target="_blank">IPRA Section By-Law Template</a>
				  </div>
				  <br>
				  <div><strong>Speaking Points</strong>
				  <div>
                   <a href="files/Environmental.doc" target="_blank">Environmental</a><br>
                   <a href="files/oslad_talking_points.pdf" target="_blank">OSLAD</a><br>
                   <a href="files/oslad_letter_to_legislators.doc" target="_blank">OSLAD Letter</a><br>
                   
				  </div>
				  <br>
				 </td>
              </tr>
			</table>
			<cfelse>
			   <table border="0" cellpadding="0" cellspacing="0" width="100%">
                  <tr>
                    <td class="ErrorHead" align="Center"><img src="/images/Error.gif" width="26" height="26" alt="" border="0"> YOU ARE NOT AUTHORIZED TO VIEW THIS PAGE</td>
                  </tr>
               </table>
			</cfif>
          <br><br>
		 </td>
     </tr>
</table>  
</cfoutput>
<cfmodule template="#Application.footer#">	  