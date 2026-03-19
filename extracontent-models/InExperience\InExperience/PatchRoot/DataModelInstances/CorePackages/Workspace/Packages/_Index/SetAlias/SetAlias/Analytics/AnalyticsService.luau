local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_EventIngestService_0 = game:GetService("EventIngestService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_Analytics_0 = v1.Analytics;
local v5 = l_Analytics_0.Analytics.new(l_RbxAnalyticsService_0);
local l_getPlatformTarget_0 = l_Analytics_0.getPlatformTarget;
return {
    Diag = v5.Diag, 
    EventStream = {
        setRBXEventStream = function(_, v8, v9, v10) --[[ Line: 13 ]] --[[ Name: setRBXEventStream ]]
            -- upvalues: l_EventIngestService_0 (copy), l_getPlatformTarget_0 (copy)
            local v11 = v10 or {};
            l_EventIngestService_0:SetRBXEventStream(l_getPlatformTarget_0(), v8, v9, v11);
        end
    }
};