local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.SocialLuaAnalytics);
local v2 = require(l_Parent_0.LoggingProtocol);
local v3 = require(script.Parent.Logger);
return function(v4) --[[ Line: 8 ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy)
    return v1.Telemetry.createEmitter({
        telemetryImpl = v2.default, 
        loggerImpl = v3, 
        defaultTelemetryConfig = {
            throttlingThousandths = 10000, 
            links = "example.com"
        }, 
        getSharedInfo = v4
    });
end;