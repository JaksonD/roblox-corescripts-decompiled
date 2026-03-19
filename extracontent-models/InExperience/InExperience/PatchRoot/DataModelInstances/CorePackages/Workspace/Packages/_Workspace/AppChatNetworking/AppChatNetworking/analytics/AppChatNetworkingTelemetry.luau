local l_Parent_0 = script:FindFirstAncestor("AppChatNetworking").Parent;
local v1 = require(l_Parent_0.LoggingProtocol);
return require(l_Parent_0.SocialLuaAnalytics).Telemetry.createEmitter({
    telemetryImpl = v1.default, 
    defaultTelemetryConfig = {
        throttlingThousandths = game:DefineFastInt("AppChatNetworkingTelemetryThrottlingThousandths", 800), 
        links = ""
    }, 
    getSharedInfo = function() --[[ Line: 13 ]] --[[ Name: getSharedInfo ]]
        return {};
    end
});