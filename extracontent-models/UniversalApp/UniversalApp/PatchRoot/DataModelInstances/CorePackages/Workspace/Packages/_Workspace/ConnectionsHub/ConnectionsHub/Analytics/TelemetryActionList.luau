local l_Parent_0 = script:FindFirstAncestor("ConnectionsHub").Parent;
local v1 = require(l_Parent_0.SocialLuaAnalytics);
local l_SupportedTelemetryBackends_0 = v1.Analytics.Enums.SupportedTelemetryBackends;
local l_EventTypes_0 = v1.Analytics.Enums.EventTypes;
local l_Contexts_0 = v1.Analytics.Enums.Contexts;
local v5 = require(script.Parent.EventNames);
return {
    defaults = {
        throttlingThousandths = game:DefineFastInt("CoHubAnalyticsThrottlingThousandths", 10000), 
        links = ""
    }, 
    [v5.CoHubTabClicked] = {
        description = "CoHub tab clicked", 
        lastUpdated = {
            26, 
            1, 
            27
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.EventIngest, 
                overrideName = function() --[[ Line: 22 ]] --[[ Name: overrideName ]]
                    -- upvalues: l_EventTypes_0 (copy)
                    return l_EventTypes_0.ButtonClick;
                end, 
                staticCustomFields = {
                    eventContext = l_Contexts_0.ConnectionsHub
                }, 
                dynamicCustomFields = {
                    btn = function(v6) --[[ Line: 29 ]] --[[ Name: btn ]]
                        return "tabId_" .. v6;
                    end, 
                    subpage = function(v7) --[[ Line: 32 ]] --[[ Name: subpage ]]
                        return "tabId_" .. v7;
                    end
                }
            }, 
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter, 
                dynamicCustomFields = {
                    btn = function(v8) --[[ Line: 40 ]] --[[ Name: btn ]]
                        return v8;
                    end, 
                    subpage = function(v9) --[[ Line: 43 ]] --[[ Name: subpage ]]
                        return v9;
                    end
                }
            }
        }
    }
};