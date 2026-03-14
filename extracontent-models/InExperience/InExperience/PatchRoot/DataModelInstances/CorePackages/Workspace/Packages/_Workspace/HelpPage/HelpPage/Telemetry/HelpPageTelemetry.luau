local l_TelemetryService_0 = game:GetService("TelemetryService");
local v1 = require(script.Parent.StandardFieldEnum);
local v2 = game:DefineFastInt("HelpPageThrottleHundredthsPercent", 0);
local v3 = {};
v3.__index = v3;
v3.new = function() --[[ Line: 35 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy)
    return (setmetatable({}, v3));
end;
v3.telemetryConfigs = {
    helpPageInteraction = {
        eventConfig = {
            eventName = "ingame_menu_action", 
            backends = {
                "EventIngest"
            }, 
            throttlingPercentage = v2, 
            lastUpdated = {
                2025, 
                8, 
                25
            }, 
            description = "[[Event to track input type and screen orientation for the help page.]]"
        }, 
        standardizedFields = {
            v1.addUniverseId, 
            v1.addPlaySessionId, 
            v1.addPlaceId, 
            v1.addSessionInfo
        }
    }
};
v3.logHelpPageInteraction = function(_, v5, v6) --[[ Line: 59 ]] --[[ Name: logHelpPageInteraction ]]
    -- upvalues: v3 (copy), l_TelemetryService_0 (copy)
    local l_eventConfig_0 = v3.telemetryConfigs.helpPageInteraction.eventConfig;
    local l_standardizedFields_0 = v3.telemetryConfigs.helpPageInteraction.standardizedFields;
    l_TelemetryService_0:LogEvent(l_eventConfig_0, {
        eventContext = v5, 
        standardizedFields = l_standardizedFields_0, 
        customFields = v6
    });
end;
v3.default = v3.new();
return v3;