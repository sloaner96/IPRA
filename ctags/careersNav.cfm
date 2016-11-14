<cfquery name="GetJobCats" datasource="#Application.dsn#">
   Select Distinct J.JobType, J.Category, L.CodeDesc as JobCategory,
     (Select CodeDesc
	   From Lookup
	    Where J.JobType= CodeValue
		AND CodeGroup = 'OrderCat') as JobTypeDesc
   From JobPostings J, lookup L
   Where J.category = L.Codevalue
    AND L.CodeGroup = 'OrderSubCat'
    AND Approved = 1
    AND EndDate >= #CreateODBCDateTime(now())#
   Order BY JobType
</cfquery>


<TABLE cellSpacing=0 cellPadding=1 width=154 border=0>
   <TBODY>
       <TR>
          <TD bgColor=#656565>
             <TABLE cellSpacing=0 cellPadding=0 width=152 bgColor=#ffffff border=0>
                <TBODY>
                     <TR>
                        <TD><A href=""><IMG height=41 src="/images/AboutUs_SecNavHead.jpg" width=155 border=0></A><BR>
							  <IMG height=1 src="/images/sec_nav_dline.gif" width=156><BR>
                              <DIV class=sec-nav>
							    <A href="/careers/careers.cfm">Job Opportunities</A>
							   </DIV>
							   <IMG height=1 src="/images/sec_nav_dline.gif" width=156><BR>
							   <cfoutput query="GetJobCats" group="JobType">
							     <DIV class=tert-nav>
							        <strong>#GetJobCats.JobTypeDesc#</strong><br>
							     </DIV> 
								 <cfoutput>
								  <DIV class=tert-nav>
								   <a href="Careers.cfm?Jtype=#GetJobCats.JobType#&CatID=#GetJobCats.Category#">#JobCategory#</a>
					              </div> 
								 </cfoutput>
					               <cfif GetJobCats.currentrow NEQ getjobcats.recordcount><IMG height=1 src="/images/sec_nav_dline.gif" width=156><BR></cfif>
		                         </cfoutput> 	
                         </TD>
					</TR>
			    </TBODY>
		    </TABLE>
		  </TD>
	    </TR>
	</TBODY>
</TABLE>
