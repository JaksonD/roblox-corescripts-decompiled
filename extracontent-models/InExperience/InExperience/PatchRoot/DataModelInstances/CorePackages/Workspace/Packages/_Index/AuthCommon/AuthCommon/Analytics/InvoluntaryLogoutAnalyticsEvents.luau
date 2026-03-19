local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_EventIngestService_0 = game:GetService("EventIngestService");
local v4 = v2.Analytics.AnalyticsReporters.EventIngest.new(l_EventIngestService_0);
local l_EventStreamConstants_0 = require(l_Parent_0.AuthAnalytics).EventStreamConstants;
return {
    sendImmediatelyPageLoadEvent = function(v6, v7) --[[ Line: 10 ]] --[[ Name: sendImmediatelyPageLoadEvent ]]
        -- upvalues: l_EventStreamConstants_0 (copy), v4 (copy)
        local v8 = {
            origin = v6, 
            state = v7 or "", 
            [l_EventStreamConstants_0.EventTimingKeys.OsClock] = tostring(os.clock()), 
            [l_EventStreamConstants_0.EventTimingKeys.OsTime] = tostring(os.time())
        };
        v4:sendEventImmediately(l_EventStreamConstants_0.Context.InvoluntaryLogout, l_EventStreamConstants_0.AuthEventName.AuthPageLoad, v8);
    end
};