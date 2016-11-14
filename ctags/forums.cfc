<cfcomponent displayname="Forum" output="Yes">
		

		<cfset instance = StructNew()>
		
		<cfset Instance.IpraDSN = "ILIPRA">
		
		
		<cfset Instance.mailserver = "smtp.sbcglobal.yahoo.com">
		<cfset Instance.MailUser = "********">
		<cfset Instance.MailPassword = "********">
		
		<!--- <cfset Instance.mailserver = "mail.ilipra.org">
		<cfset Instance.MailUser = "webuser">
		<cfset Instance.MailPassword = "raDJa8756()3@"> --->
		

		<cfset Instance.Lock = "forum_lock">
		
		<cfset init()> 
		

		<cffunction name="init" returnType="Void" access="Private">
		  <cfset Initialized = True>
		</cffunction>
		
		<!--- //// Message Functions --->
		<cffunction name="getMessage" returnType="query" access="Public">
		  <cfargument name="PostID" required="YES" Type="Numeric">
		  <cfset var getmsg = "">
		   
		   <cfquery name="getmsg" datasource="#Instance.IpraDSN#">
		      Select P.*,
			    (Select firstName+' '+Lastname as name
				   From members
				   Where MemberID = P.CreatedBy)as MemberName
			  From ForumPostings P
			  Where P.PostingID = #Arguments.PostID#
			  AND P.Status = 1
		   </cfquery>
		   
		   <cfreturn getmsg />
		</cffunction>
		
		<cffunction name="getMemberMessages" returnType="query" access="Public">
		  <cfargument name="MemberID" required="YES" Type="Numeric">
		  <cfset var getmemmsg = "">
		   
		   <cfquery name="getmemmsg" datasource="#Instance.IpraDSN#">
		      Select P.*,
			    (Select CategoryName
				  From ForumCategories
				  Where CategoryID = P.CategoryID)as CatName,
				 (Select Max(DateAdded) as maxPost
				    From ForumPostings
					Where ParentID = P.postingid) as LastPost,
				 (Select Count(*) as NumPost
				    From ForumPostings
					Where ParentID = P.postingid) as NumReplies 
			  From ForumPostings P
			  Where P.CreatedBy = #Arguments.MemberID#
			  AND P.Status = 1
			  Order by DateAdded desc, CategoryID
		   </cfquery>
		   
		   <cfreturn getmemmsg />
		</cffunction>
		
		<cffunction name="getThreads" returnType="query" access="Public">
		  <cfargument name="PostID" required="YES" Type="Numeric">
		  <cfset var getmsg = "">
		   
		   <cfquery name="getmsg" datasource="#Instance.IpraDSN#">
		      Select P.*,
			    (Select firstName+' '+Lastname as name
				   From members
				   Where MemberID = P.CreatedBy)as MemberName
			  From ForumPostings P
			  Where P.ParentID = #Arguments.PostID# 
			  AND P.Status= 1
			  Order By DateAdded, LastUpdated
		   </cfquery>
		   
		   <cfreturn getmsg />
		</cffunction>
		
		<cffunction name="searchThreads" returnType="query" access="Public">
		  <cfargument name="keywords" required="YES" Type="String">
		  <cfargument name="Category" required="No" Type="Numeric">
		  
		  <cfset var getsrch = "">
		   
		   <cfquery name="getsrch" datasource="#Instance.IpraDSN#">
		      Select P.*,
			    (Select firstName+' '+Lastname as name
				   From members
				   Where MemberID = P.CreatedBy)as MemberName,
				 (Select CategoryName
				   From ForumCategories
				   Where CategoryID = P.CategoryID) as CatName,
				 (Select Max(DateAdded) as maxPost
				    From ForumPostings
					Where ParentID = P.postingid) as LastPost,
				 (Select Count(*) as NumPost
				    From ForumPostings
					Where ParentID = P.postingid) as NumReplies,   
				 (Select GroupName
				   From ForumCategories C, ForumGroups G
				   Where  C.GroupID = G.GroupID
				   AND CategoryID = P.CategoryID) as GroupName  
			  From ForumPostings P
			  Where ((P.msgsubject like '%#Arguments.keywords#%' or P.msgbody like '%#Arguments.keywords#%')
			  <cfif ISDefined("Arguments.Category")>
			   AND P.categoryID = #Arguments.Category#
			  </cfif>
			  AND P.Status= 1)
			  Order By DateAdded, LastUpdated
		   </cfquery>
		   
		   <cfreturn getsrch />
		</cffunction>
		
		<cffunction name="IncrementThread" returnType="void" access="Public">
		  <cfargument name="PostID" required="YES" Type="Numeric">
		  <cfset var getcount = getMessage(Arguments.postid)>
		  <cfset var newcount = 1>
		  
		  <cfset newcount = (getcount.ViewNum + newcount)>
		   
		   <cfquery name="setcount" datasource="#Instance.IpraDSN#">
		     Update ForumPostings
			 Set ViewNum = #newcount#
			 Where postingid = #Arguments.postid#
		   </cfquery>   
		   
		</cffunction>
		
		<cffunction name="AddMessage" returnType="Void" access="Public">
		  <cfargument name="CategoryID" required="YES" Type="Numeric">
		  <cfargument name="ParentID" required="NO" Type="Numeric">
		  <cfargument name="Status" required="YES" Type="Numeric">
		  <cfargument name="IsSticky" required="NO" Type="Numeric">
		  <cfargument name="MsgSubject" required="YES" Type="String">
		  <cfargument name="MsgBody" required="YES" Type="String">
		  <cfargument name="CreatedBy" required="YES" Type="Numeric">
		  <cfargument name="AdminPost" required="NO" Type="Numeric">
		  
		  <cfset var getmsg = "">
		   
		   <cfquery name="getmsg" datasource="#Instance.IpraDSN#">
		      Insert Into ForumPostings(
			    CategoryID,
				ParentID,
				Status,
				IsSticky,
				MsgSubject,
				MsgBody,
				DateAdded,
				CreatedBy,
				AdminPost
			  )
			  Values(
			    #arguments.CategoryID#,
				<cfif IsDefined("arguments.ParentID")>#arguments.ParentID#<cfelse>NULL</cfif>,
				#arguments.Status#,
				<cfif IsDefined("arguments.IsSticky")>#arguments.IsSticky#<cfelse>0</cfif>,
				'#arguments.MsgSubject#',
				'#arguments.MsgBody#',
				#Createodbcdatetime(now())#,
				#arguments.CreatedBy#,
				<cfif IsDefined("arguments.AdminPost")>#arguments.AdminPost#<cfelse>0</cfif>
			  )
		   </cfquery>  
		</cffunction>
		
		<cffunction name="EditMessage" returnType="void" access="Public">
		   <cfargument name="CategoryID" required="YES" Type="Numeric">
		  <cfargument name="ParentID" required="NO" Type="Numeric">
		  <cfargument name="Status" required="YES" Type="Numeric">
		  <cfargument name="IsSticky" required="NO" Type="Numeric">
		  <cfargument name="MsgSubject" required="YES" Type="String">
		  <cfargument name="MsgBody" required="YES" Type="string">
		  <cfargument name="UpdatedBy" required="YES" Type="Numeric">
		  <cfargument name="AdminUpdated" required="NO" Type="Numeric">
		  <cfargument name="PostID" required="YES" Type="Numeric">
		  
		  <cfset var updmsg = "">
		   
		   <cfquery name="updmsg" datasource="#Instance.IpraDSN#">
		      Update ForumPostings
			    SET CategoryID =#arguments.CategoryID#,
				    <cfif IsDefined("arguments.parentID")>ParentID =#arguments.ParentID#,</cfif>
				    Status =#arguments.Status#,
				    <cfif IsDefined("arguments.ISSticky")>IsSticky =#arguments.IsSticky#,</cfif>
				    MsgSubject ='#arguments.MsgSubject#',
				    MsgBody ='#arguments.MsgBody#',
				    LastUpdated = #Createodbcdatetime(now())#,
					<cfif IsDefined("arguments.AdminUpdated")>AdminUpdated = #Arguments.AdminUpdated#,</cfif>
				    UpdatedBy = #Arguments.UpdatedBy#
			  Where PostingID =  #Arguments.PostID#		
		   </cfquery> 
		</cffunction>
		
		<cffunction name="DeleteMessage" returnType="void" access="Public">
		  <cfargument name="PostID" required="YES" Type="Numeric">
		   <cfquery name="deletemsg" datasource="#Instance.IpraDSN#">
		      Delete From ForumPostings
			  Where PostingID =  #PostID#		
		   </cfquery>
		   
		   <cfquery name="Delchildren" datasource="#Instance.IpraDSN#">
		      Delete From ForumPostings
			  Where ParentID =  #PostID#	
		   </cfquery>
		   
		</cffunction>
		
		<cffunction name="GetMemberInfo" returnType="Query" access="public">
		  <cfargument name="MemberID" required="YES" Type="Numeric">
		  <cfset var getMem = "">
		  
		  <cfquery name="getMem" datasource="#Instance.IpraDSN#">
		     Select M.*,
			   (Select Count (*)
			      From ForumPostings
				  Where CreatedBy = M.MemberID
				  AND AdminPost = 0) as PostCount
			 From Members M
			 Where MemberID = #arguments.MemberID#
		  </cfquery>
		  
		  <cfreturn getMem />
		</cffunction>
		
		<cffunction name="GetAdminInfo" returnType="Query" access="public">
		  <cfargument name="AdminID" required="YES" Type="Numeric">
		  <cfset var getAdmin = "">
		  
		  <cfquery name="getAdmin" datasource="#Instance.IpraDSN#">
		     Select *,
			   (Select Count (*)
			      From ForumPostings
				  Where CreatedBy = U.UserID
				  AND AdminPost = 1) as PostCount
			 From SiteUsers U
			 Where UserID = #arguments.AdminID#
		  </cfquery>
		  
		  <cfreturn getAdmin />
		</cffunction>
		
		<!--- //// group Functions --->
		<cffunction name="GetGroups" returnType="query" access="Public">
		  <cfargument name="groupID" required="no" type="numeric">
		  <cfset var getForumGroups = "">
		   
		   <cfquery name="getForumGroups" datasource="#Instance.IpraDSN#">
		      Select G.*,
			    (Select Count(*)
				  From forumCategories
				  Where groupID = G.GroupID) as CatCount
			  From ForumGroups G
			  Where Status = 1
			  <cfif isDefined("Arguments.GroupID")>
			   AND GroupID = #Arguments.GroupID#
			  </cfif>
			  Order By GroupName, DateAdded
		   </cfquery>
		   
		   <cfreturn getForumGroups />
		</cffunction>
		
		<cffunction name="AddGroups" returnType="void" access="Public">
		   <cfargument name="GroupName" required="YES" Type="String">
		   <cfargument name="Status" required="YES" Type="Numeric">
		   <cfargument name="AddedBY" required="YES" Type="Numeric">
		   
		   <cfset var getForumGroups = "">
		   
		   <cfquery name="getForumGroups" datasource="#Instance.IpraDSN#">
		      Insert Into ForumGroups(
			    GroupName,
				Status,
				CreatedBy,
				DateAdded
			  ) Values (
			    '#Arguments.GroupName#',
				#Arguments.Status#,
				#Arguments.AddedBY#,
				#CreateODBCDateTime(Now())#
			  )
		   </cfquery>
		</cffunction>
		
		<cffunction name="UpdateGroups" returnType="void" access="Public">
		     <cfargument name="GroupID" required="YES" Type="Numeric">
			 <cfargument name="GroupName" required="YES" Type="String">
			 <cfargument name="UpdatedBy" required="YES" Type="Numeric">
			   
			   <cfset var UpdateForumGroups = "">
			   
			   <cfquery name="UpdateForumGroups" datasource="#Instance.IpraDSN#">
			      Update ForumGroups
				   SET GroupName = '#Arguments.GroupName#',
				       UpdatedBy = #Arguments.UpdatedBy#,
					   LastUpdated = #CreateODBCDateTime(Now())#
				  WHERE groupID = #Arguments.GroupID#
			   </cfquery>
		</cffunction>
		
		<cffunction name="InactivateGroups" returnType="void" access="Public">
		     <cfargument name="GroupID" required="YES" Type="Numeric">
			   <cfset var UpdateForumGroups = "">
			   <cfset var delCategories = "">
			   <cfquery name="DeleteForumGroups" datasource="#Instance.IpraDSN#">
			      Update ForumGroups
				   SET Status = 0
				  WHERE groupID = #Arguments.GroupID#
			   </cfquery>
			   
			   <cfset delCategories = GetCategories(Arguments.GroupID)>
			   
			   <cfif delCategories.recordcount GT 0>
				   <cfquery name="DeleteForumCats" datasource="#Instance.IpraDSN#">
				      Update ForumCategories
					   SET CategoryStatus = 0
					  WHERE groupID = #Arguments.GroupID#
				   </cfquery>
				   
				   <cfquery name="DeleteForumPosts" datasource="#Instance.IpraDSN#">
				      Update Forumpostings
					   SET Status = 0
					  WHERE CategoryID IN (#ValueList(delCategories.CategoryID)#)
				   </cfquery>
			   </cfif>
			   
		</cffunction>
		
		
		<!--- //// Category Functions --->
		<cffunction name="GetCategories" returnType="query" access="Public">
		  <cfargument name="GroupID" required="NO" type="Numeric">
		  <cfset var getForumCat = "">
		   
		   <cfquery name="getForumCat" datasource="#Instance.IpraDSN#">
		      Select C.*,
			   (Select Count(*)
			     From ForumPostings
				 Where CategoryID =  C.CategoryID
				 AND ParentID IS NULL 
				 AND Status = 1)as ThreadCount,
			   (Select Count(*)
			     From ForumPostings
				 Where CategoryID =  C.CategoryID
				 AND Status = 1)as PostingCount,
			   (Select Max(PostingID)
			     From ForumPostings
				 Where CategoryID =  C.CategoryID
				 AND Status = 1) as LastPostID	 
			  From ForumCategories C
			  Where C.CategoryStatus = 1 
			  <cfif ISDefined("arguments.GroupID")>AND C.GroupID = #Arguments.GroupID#</cfif>
			  Order By GroupID, CategoryName, DateAdded
		   </cfquery>
		   
		   <cfreturn getForumCat />
		</cffunction>
		
		<cffunction name="GetCategoryInfo" returnType="query" access="Public">
		  <cfargument name="CategoryID" required="YES" type="Numeric">
		  <cfset var getCatInfo = "">
		   
		   <cfquery name="getCatInfo" datasource="#Instance.IpraDSN#">
		      Select C.*,
			    (Select GroupName 
				From ForumGroups
				Where GroupID = C.GroupID)as GroupName 
			  From ForumCategories C
			  Where C.CategoryID = #Arguments.CategoryID# 
			  AND C.CategoryStatus = 1
		   </cfquery>
		   
		   <cfreturn getCatInfo />
		</cffunction>
		
		
		<cffunction name="getCategoryMessages" returnType="query" access="Public">
		   <cfargument name="CategoryID" required="YES" type="Numeric">
		  <cfset var getCatMsg = "">
		   
		   <cfquery name="getCatMsg" datasource="#Instance.IpraDSN#">
		       Select P.*,
			     (Select Max(DateAdded) as maxPost
				    From ForumPostings
					Where ParentID = P.PostingID) as LastPost,
				 (Select Count(PostingID) as NumPost
				    From ForumPostings
					Where ParentID = P.PostingID) as NumReplies
			   From ForumPostings P
			   Where Status = 1
			   AND  CategoryID = #Arguments.CategoryID#
			   AND ParentID IS NULL
			   Order By IsSticky desc, DateAdded
		   </cfquery>
		   
		   <cfreturn getCatMsg />
		</cffunction>
		
		
		<cffunction name="AddCategory" returnType="void" access="Public">
		     <cfargument name="GroupID" required="YES" type="Numeric">
			 <cfargument name="CategoryStatus" required="YES" type="Numeric">
			 <cfargument name="CategoryName" required="YES" type="String">
			 <cfargument name="CategoryDesc" required="YES" type="String">
			 <cfargument name="CreatedBy" required="YES" type="Numeric">
			 
			 <cfquery name="addCat" datasource="#instance.IPRADSN#">
			    Insert Into ForumCategories(
				    GroupID,
				    CategoryStatus,
				    CategoryName,
				    CategoryDesc,
				    Dateadded,
				    CreatedBy
				  )Values(
				    #Arguments.GroupID#,
					#Arguments.CategoryStatus#,
					'#Arguments.CategoryName#',
					'#Arguments.CategoryDesc#',
					#CreateODBCDateTime(Now())#,
					#Arguments.CreatedBy#
				  )
			 </cfquery>
			 
		</cffunction>
		
		<cffunction name="EditCategory" returnType="void" access="Public">
		     <cfargument name="CategoryID" required="YES" type="Numeric">
		     <cfargument name="GroupID" required="YES" type="Numeric">
			 <cfargument name="CategoryName" required="YES" type="String">
			 <cfargument name="CategoryDesc" required="YES" type="String">
			 <cfargument name="UpdatedBy" required="YES" type="Numeric">
			 
			 <cfquery name="UpdateCat" datasource="#instance.IPRADSN#">
			    Update ForumCategories(
				    GroupID = #Arguments.GroupID#,
				    CategoryName = '#Arguments.CategoryName#',
				    CategoryDesc = '#Arguments.CategoryDesc#',
				    LastUpdated= #CreateODBCDateTime(Now())#,
				    UpdatedBy = #Arguments.UpdatedBy#
				 Where CategoryID = #Arguments.categoryID#
			 </cfquery>
		</cffunction>
		<cffunction name="InactivateCategory" returnType="void" access="Public">
		       <cfargument name="CategoryID" required="YES" type="Numeric">
			   
			   <cfquery name="DeleteForumCats" datasource="#Instance.IpraDSN#">
			      Update ForumCategories
				   SET CategoryStatus = 0
				  WHERE categoryID = #Arguments.CategoryID#
			   </cfquery>
			   
			   <cfquery name="DeleteForumPosts" datasource="#Instance.IpraDSN#">
			      Update Forumpostings
				   SET Status = 0
				  WHERE CategoryID = #Arguments.CategoryID#
			   </cfquery>
		</cffunction>
		
		<!---///// TODO: Future Use. Subscription Functions --->
		<cffunction name="getSubscription" returnType="query" access="Public">
		  
		</cffunction>
		
		<cffunction name="SubscribeToThread" returnType="query" access="Public">
		  
		</cffunction>
		<cffunction name="EmailThread" returnType="Void" access="Public">
		  
		</cffunction>
		<cffunction name="EmailSubscription" returnType="query" access="Public">
		  
		</cffunction>
		 
</cfcomponent>		