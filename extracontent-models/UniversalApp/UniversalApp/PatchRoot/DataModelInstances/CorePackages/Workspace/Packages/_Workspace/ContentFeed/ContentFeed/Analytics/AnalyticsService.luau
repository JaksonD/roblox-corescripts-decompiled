local l_Parent_0 = script.Parent.Parent.Parent;
local l_EventIngestService_0 = game:GetService("EventIngestService");
local v2 = require(l_Parent_0.Analytics);
local v3 = require(l_Parent_0.LoggingProtocol);
local l_getPlatformTarget_0 = v2.getPlatformTarget;
return {
    EventStream = {
        setRBXEventStream = function(_, v6, v7, v8) --[[ Line: 13 ]] --[[ Name: setRBXEventStream ]]
            -- upvalues: l_EventIngestService_0 (copy), l_getPlatformTarget_0 (copy)
            local v9 = v8 or {};
            l_EventIngestService_0:SetRBXEventStream(l_getPlatformTarget_0(), v6, v7, v9);
        end
    }, 
    Telemetry = v3.default
};