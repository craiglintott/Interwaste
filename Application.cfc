<cfcomponent>


<cfscript>
       this.name = "Interwaste_1";
       this.applicationTimeout = createTimeSpan(0,8,0,0);
       this.sessionmanagement = "yes";
       this.sessiontimeout = createTimeSpan(0,1,5,0);
	   this.setDomainCookies = "no";
       this.scriptProtect = "all";
</cfscript>

   <cffunction name="onApplicationStart" output="false">
   	   <cfset Application.DataSource = "Interwaste">
       <cfset Application.Webmaster = "craig@fr.co.za">
       <cfset Application.ServerEmail = "noreply@interwaste.co.za">
       <cfset Application.LoadingMes='<img src="/Images/loading.gif"> loading...'>

       <cfreturn True>
   </cffunction>


   <cffunction name="onApplicationEnd" output="false">
      <cfargument name="applicationScope" required="true">
   </cffunction>



   <cffunction name="onSessionStart" output="false">
   		<cfset Session.FlightSearchID = 0>
    </cffunction>

   <cffunction name="onSessionEnd" output="false">
       <cfargument name = "sessionScope" required=true/>
       <cfargument name = "applicationScope" required=true/>

   </cffunction>

   <cffunction name="onRequestStart" output="true">
       <cfargument name="requestname" required=true/>




   </cffunction>



   <cffunction name="onRequestEnd" output="false">
       <cfargument name="requestname" required=true/>

   </cffunction>




   <cffunction name="onError" output="true">
       <cfargument name="exception" required=true/>
       <cfargument name="eventName" type="String" required=true/>
       			<cfdump var="#arguments.exception#">
                <!---<cfdump var="#session#">--->
       			<cfmail to="#Application.Webmaster#" from="#Application.ServerEmail#" subject="Interwaste ERROR" type="HTML">
					<cfdump var="#arguments.exception#">
                    <cfdump var="#session#">
                    <cfdump var="#cgi#">
                    <cfif IsDefined('form')>
                    <cfdump var="#form#">
                    </cfif>
                </cfmail>


                <cfheader statuscode="400" statustext="Gone">
	  			<cfoutput>ERROR:#arguments.exception.Message#</cfoutput>
				<cfabort>
	</cffunction>

</cfcomponent>
