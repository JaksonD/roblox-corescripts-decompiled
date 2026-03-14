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
        29, 
        10
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
        29, 
        10
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
        29, 
        10
    }, 
    description = "        This event is fired when a user interacts with the \"Report this ad\" button.\n    ", 
    links = "https://roblox.atlassian.net/browse/ADS-6383"
};
return {
    logAdMenuEvent = function(v6) --[[ Line: 50 ]] --[[ Name: logAdMenuEvent ]]
        -- upvalues: l_default_0 (copy), v3 (copy)
        l_default_0:logRobloxTelemetryCounter(v3, 1, {
            state = v6
        });
    end, 
    logWhyThisAdEvent = function() --[[ Line: 56 ]] --[[ Name: logWhyThisAdEvent ]]
        -- upvalues: l_default_0 (copy), v4 (copy)
        l_default_0:logRobloxTelemetryCounter(v4, 1);
    end, 
    logReportAdEvent = function(v7) --[[ Line: 66 ]] --[[ Name: logReportAdEvent ]]
        -- upvalues: l_default_0 (copy), v5 (copy)
        l_default_0:logRobloxTelemetryCounter(v5, 1, {
            state = v7
        });
    end
};