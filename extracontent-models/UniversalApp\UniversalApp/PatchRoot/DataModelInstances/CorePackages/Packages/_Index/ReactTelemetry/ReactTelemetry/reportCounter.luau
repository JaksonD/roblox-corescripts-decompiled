local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.SafeFlags);
local v3 = require(l_Parent_0.ReactGlobals);
local v4 = v2.createGetFFlag("ReactTelemetryEnabled", false)();
return function(v5) --[[ Line: 19 ]] --[[ Name: reportCounter ]]
    -- upvalues: v4 (copy), l_TelemetryService_0 (copy), v3 (copy)
    if not v4 then
        return;
    else
        local v6 = {
            eventName = v5.eventName, 
            backends = {
                "RobloxTelemetryCounter"
            }, 
            lastUpdated = v5.lastUpdated, 
            description = v5.description, 
            links = v5.links
        };
        local v7 = {
            customFields = v5.customFields or {}
        };
        local l_status_0, l_result_0 = pcall(l_TelemetryService_0.LogCounter, l_TelemetryService_0, v6, v7, v5.value);
        if v3.__DEV__ and not l_status_0 then
            warn((("React telemetry collection is enabled but log failed: %*"):format(l_result_0)));
        end;
        return;
    end;
end;