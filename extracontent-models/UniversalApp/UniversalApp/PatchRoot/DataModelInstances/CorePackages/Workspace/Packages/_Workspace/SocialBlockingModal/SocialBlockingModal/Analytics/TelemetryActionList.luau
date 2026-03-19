local l_Parent_0 = script:FindFirstAncestor("SocialBlockingModal").Parent;
local v1 = require(l_Parent_0.SocialLuaAnalytics);
local l_SupportedTelemetryBackends_0 = v1.Analytics.Enums.SupportedTelemetryBackends;
local l_EventTypes_0 = v1.Analytics.Enums.EventTypes;
local l_Contexts_0 = v1.Analytics.Enums.Contexts;
local v5 = require(script.Parent.EventNames);
return {
    defaults = {
        throttlingThousandths = game:DefineFastInt("SocialBlockingModalAnalyticsThrottlingThousandths", 10000), 
        links = ""
    }, 
    [v5.SocialBlockingModalSeen] = {
        description = "Social blocking modal mounted", 
        lastUpdated = {
            25, 
            6, 
            25
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.EventIngest, 
                overrideName = function() --[[ Line: 22 ]] --[[ Name: overrideName ]]
                    -- upvalues: l_EventTypes_0 (copy)
                    return l_EventTypes_0.UserSeen;
                end, 
                staticCustomFields = {
                    eventContext = l_Contexts_0.SocialBlockingModal
                }
            }, 
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v5.SocialBlockingModalBlockPressed] = {
        description = "Social blocking modal block button pressed", 
        lastUpdated = {
            25, 
            6, 
            25
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.EventIngest, 
                overrideName = function() --[[ Line: 40 ]] --[[ Name: overrideName ]]
                    -- upvalues: l_EventTypes_0 (copy)
                    return l_EventTypes_0.ButtonClick;
                end, 
                staticCustomFields = {
                    eventContext = l_Contexts_0.SocialBlockingModal, 
                    btn = "Block"
                }
            }, 
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v5.SocialBlockingModalBlockAndReportPressed] = {
        description = "Social blocking modal block and report button pressed", 
        lastUpdated = {
            25, 
            6, 
            25
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.EventIngest, 
                overrideName = function() --[[ Line: 59 ]] --[[ Name: overrideName ]]
                    -- upvalues: l_EventTypes_0 (copy)
                    return l_EventTypes_0.ButtonClick;
                end, 
                staticCustomFields = {
                    eventContext = l_Contexts_0.SocialBlockingModal, 
                    btn = "BlockAndReport"
                }
            }, 
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v5.SocialBlockingModalCancelPressed] = {
        description = "Social blocking modal cancel button pressed", 
        lastUpdated = {
            25, 
            6, 
            25
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.EventIngest, 
                overrideName = function() --[[ Line: 78 ]] --[[ Name: overrideName ]]
                    -- upvalues: l_EventTypes_0 (copy)
                    return l_EventTypes_0.ButtonClick;
                end, 
                staticCustomFields = {
                    eventContext = l_Contexts_0.SocialBlockingModal, 
                    btn = "Cancel"
                }
            }, 
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }
};