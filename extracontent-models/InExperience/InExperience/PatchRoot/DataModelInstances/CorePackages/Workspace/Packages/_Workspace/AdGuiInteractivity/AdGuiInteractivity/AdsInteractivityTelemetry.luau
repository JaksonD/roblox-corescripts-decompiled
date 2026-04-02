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
local v7 = {
    eventName = "ImmersiveBrandedAdLinkingFailedEvent", 
    backends = {
        v1.TelemetryBackends.Counter
    }, 
    lastUpdated = {
        26, 
        3, 
        24
    }, 
    description = "This event is fired when a user tries to click one of the immersive branded ad menu/dialog links, but LinkingProtocol fails.", 
    links = ""
};
return {
    logAdMenuEvent = function(v8) --[[ Line: 72 ]] --[[ Name: logAdMenuEvent ]]
        -- upvalues: l_default_0 (copy), v3 (copy)
        l_default_0:logRobloxTelemetryCounter(v3, 1, {
            state = v8
        });
    end, 
    logWhyThisAdEvent = function() --[[ Line: 78 ]] --[[ Name: logWhyThisAdEvent ]]
        -- upvalues: l_default_0 (copy), v4 (copy)
        l_default_0:logRobloxTelemetryCounter(v4, 1);
    end, 
    logReportAdEvent = function(v9) --[[ Line: 88 ]] --[[ Name: logReportAdEvent ]]
        -- upvalues: l_default_0 (copy), v5 (copy)
        l_default_0:logRobloxTelemetryCounter(v5, 1, {
            state = v9
        });
    end, 
    logImmersiveBrandedAdButtonClickCounter = function(v10) --[[ Line: 94 ]] --[[ Name: logImmersiveBrandedAdButtonClickCounter ]]
        -- upvalues: l_default_0 (copy), v6 (copy)
        l_default_0:logRobloxTelemetryCounter(v6, 1, {
            buttonName = v10
        });
    end, 
    logImmersiveBrandedAdLinkingFailedCounter = function(v11) --[[ Line: 102 ]] --[[ Name: logImmersiveBrandedAdLinkingFailedCounter ]]
        -- upvalues: l_default_0 (copy), v7 (copy)
        l_default_0:logRobloxTelemetryCounter(v7, 1, {
            linkName = v11
        });
    end
};