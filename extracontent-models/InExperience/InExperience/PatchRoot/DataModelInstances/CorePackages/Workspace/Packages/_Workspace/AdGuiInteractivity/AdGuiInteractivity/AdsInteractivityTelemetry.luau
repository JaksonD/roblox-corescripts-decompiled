local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LoggingProtocol);
local l_default_0 = v1.default;
local v3 = {
    eventName = "AdMenuEvent", 
    backends = {
        v1.TelemetryBackends.Counter
    }, 
    lastUpdated = {
        24, 
        10, 
        29
    }, 
    description = "        This event is fired when a user interacts with the ad menu.\n    ", 
    links = "https://roblox.atlassian.net/browse/ADS-6383"
};
local v4 = {
    eventName = "WhyThisAdEvent", 
    backends = {
        v1.TelemetryBackends.Counter
    }, 
    lastUpdated = {
        24, 
        10, 
        29
    }, 
    description = "        This event is fired when a user interacts with the \"Why this ad?\" button.\n    ", 
    links = "https://roblox.atlassian.net/browse/ADS-6383"
};
local v5 = {
    eventName = "ReportAdEvent", 
    backends = {
        v1.TelemetryBackends.Counter
    }, 
    lastUpdated = {
        24, 
        10, 
        29
    }, 
    description = "        This event is fired when a user interacts with the \"Report this ad\" button.\n    ", 
    links = "https://roblox.atlassian.net/browse/ADS-6383"
};
local v6 = {
    eventName = "ImmersiveBrandedAdButtonClickEvent", 
    backends = {
        v1.TelemetryBackends.Counter
    }, 
    lastUpdated = {
        26, 
        3, 
        11
    }, 
    description = "This event is fired when a user clicks one of the immersive branded ad buttons (disclosure, \"Why this ad?\", or \"Report this ad\").", 
    links = ""
};
return {
    logAdMenuEvent = function(v7) --[[ Line: 62 ]] --[[ Name: logAdMenuEvent ]]
        -- upvalues: l_default_0 (copy), v3 (copy)
        l_default_0:logRobloxTelemetryCounter(v3, 1, {
            state = v7
        });
    end, 
    logWhyThisAdEvent = function() --[[ Line: 68 ]] --[[ Name: logWhyThisAdEvent ]]
        -- upvalues: l_default_0 (copy), v4 (copy)
        l_default_0:logRobloxTelemetryCounter(v4, 1);
    end, 
    logReportAdEvent = function(v8) --[[ Line: 78 ]] --[[ Name: logReportAdEvent ]]
        -- upvalues: l_default_0 (copy), v5 (copy)
        l_default_0:logRobloxTelemetryCounter(v5, 1, {
            state = v8
        });
    end, 
    logImmersiveBrandedAdButtonClickCounter = function(v9) --[[ Line: 84 ]] --[[ Name: logImmersiveBrandedAdButtonClickCounter ]]
        -- upvalues: l_default_0 (copy), v6 (copy)
        l_default_0:logRobloxTelemetryCounter(v6, 1, {
            buttonName = v9
        });
    end
};