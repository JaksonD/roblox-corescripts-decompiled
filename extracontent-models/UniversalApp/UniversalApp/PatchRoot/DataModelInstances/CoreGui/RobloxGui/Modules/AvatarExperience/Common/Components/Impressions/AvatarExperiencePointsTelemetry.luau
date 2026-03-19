local l_CorePackages_0 = game:GetService("CorePackages");
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol).default;
local v2 = game:DefineFastInt("AXPointsEventHundredthsPercent", 0);
local function _(v3) --[[ Line: 7 ]] --[[ Name: generateEventConfig ]]
    -- upvalues: l_default_0 (copy), v2 (copy)
    return {
        eventName = "AvatarExperience" .. v3, 
        backends = {
            l_default_0.TelemetryBackends.Points
        }, 
        throttlingPercentage = v2
    };
end;
return {
    sendTelemetryEvent = function(v5, v6) --[[ Line: 19 ]] --[[ Name: sendTelemetryEvent ]]
        -- upvalues: l_default_0 (copy), v2 (copy)
        local v7 = {
            eventName = "AvatarExperience" .. v5, 
            backends = {
                l_default_0.TelemetryBackends.Points
            }, 
            throttlingPercentage = v2
        };
        l_default_0:logRobloxTelemetryEvent(v7, nil, v6);
    end
};