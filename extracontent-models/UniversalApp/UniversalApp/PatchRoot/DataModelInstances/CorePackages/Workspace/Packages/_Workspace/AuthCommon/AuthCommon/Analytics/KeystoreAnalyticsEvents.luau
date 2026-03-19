local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local v2 = require(script.Parent.KeystoreEventConstants);
local l_EventIngestService_0 = game:GetService("EventIngestService");
local v4 = v1.Analytics.AnalyticsReporters.EventIngest.new(l_EventIngestService_0);
return {
    sendPageLoadEvent = function(v5, v6) --[[ Line: 8 ]] --[[ Name: sendPageLoadEvent ]]
        -- upvalues: v4 (copy), v2 (copy)
        v4:sendEventDeferred(v2.ctx.keystoreLogin, v2.eventNames.pageLoad, {
            origin = v5, 
            state = v6 or ""
        });
    end
};