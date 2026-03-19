local l_Parent_0 = script.Parent.Parent.Parent;
local l_EventIngestService_0 = game:GetService("EventIngestService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v3 = require(l_Parent_0.Analytics);
local v4 = v3.Analytics.new(l_RbxAnalyticsService_0);
local l_getPlatformTarget_0 = v3.getPlatformTarget;
return {
    Diag = v4.Diag, 
    EventStream = {
        setRBXEventStream = function(_, v7, v8, v9) --[[ Line: 14 ]] --[[ Name: setRBXEventStream ]]
            -- upvalues: l_EventIngestService_0 (copy), l_getPlatformTarget_0 (copy)
            local v10 = v9 or {};
            l_EventIngestService_0:SetRBXEventStream(l_getPlatformTarget_0(), v7, v8, v10);
        end, 
        sendEventDeferred = function(_, v12, v13, v14) --[[ Line: 19 ]] --[[ Name: sendEventDeferred ]]
            -- upvalues: l_EventIngestService_0 (copy), l_getPlatformTarget_0 (copy)
            local v15 = v14 or {};
            l_EventIngestService_0:SendEventDeferred(l_getPlatformTarget_0(), v12, v13, v15);
        end
    }
};