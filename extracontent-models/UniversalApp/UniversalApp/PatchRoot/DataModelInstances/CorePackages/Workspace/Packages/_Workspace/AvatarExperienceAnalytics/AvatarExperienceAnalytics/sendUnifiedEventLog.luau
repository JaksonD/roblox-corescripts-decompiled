local v0 = require(script.Parent.AnalyticsService);
local v1 = require(script.Parent.UnifiedEventLogConstants);
return function(v2) --[[ Line: 4 ]]
    -- upvalues: v0 (copy), v1 (copy)
    v0.EventStream:sendTelemetryEvent(v1.EVENT_NAME, v1.EVENT_NAME, v2);
end;