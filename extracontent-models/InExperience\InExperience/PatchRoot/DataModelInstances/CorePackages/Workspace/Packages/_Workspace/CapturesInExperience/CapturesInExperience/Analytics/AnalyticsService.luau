local l_Parent_0 = script.Parent.Parent.Parent;
local l_EventIngestService_0 = game:GetService("EventIngestService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v3 = require(l_Parent_0.Analytics);
local v4 = require(l_Parent_0.LoggingProtocol);
local v5 = v3.Analytics.new(l_RbxAnalyticsService_0);
local l_getPlatformTarget_0 = v3.getPlatformTarget;
return {
    Diag = v5.Diag, 
    EventStream = {
        setRBXEventStream = function(_, v8, v9, v10) --[[ Line: 15 ]] --[[ Name: setRBXEventStream ]]
            -- upvalues: l_EventIngestService_0 (copy), l_getPlatformTarget_0 (copy)
            local v11 = v10 or {};
            l_EventIngestService_0:SetRBXEventStream(l_getPlatformTarget_0(), v8, v9, v11);
        end
    }, 
    Telemetry = v4.default
};