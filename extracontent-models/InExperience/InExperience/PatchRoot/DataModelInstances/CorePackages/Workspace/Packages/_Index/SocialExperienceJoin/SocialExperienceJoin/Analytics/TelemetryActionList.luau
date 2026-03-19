local l_Parent_0 = script:FindFirstAncestor("SocialExperienceJoin").Parent;
local l_SupportedTelemetryBackends_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.SupportedTelemetryBackends;
local v2 = require(script.Parent.EventNames);
return {
    defaults = {
        throttlingThousandths = game:DefineFastInt("SocialExperienceJoinAnalyticsThrottlingThousandths", 1000), 
        links = ""
    }, 
    [v2.JoinExperience] = {
        description = "Join Experience Attempt from other user", 
        lastUpdated = {
            24, 
            7, 
            17
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter, 
                dynamicCustomFields = {
                    status = function(v3) --[[ Line: 20 ]] --[[ Name: status ]]
                        return v3;
                    end
                }
            }
        }
    }, 
    [v2.PurchaseExperienceAttempt] = {
        description = "Purchase Experience Attempt Status after requesting", 
        lastUpdated = {
            24, 
            7, 
            17
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter, 
                dynamicCustomFields = {
                    status = function(v4) --[[ Line: 34 ]] --[[ Name: status ]]
                        return v4;
                    end
                }
            }
        }
    }, 
    [v2.PurchaseExperience] = {
        description = "Purchase Experience Button click", 
        lastUpdated = {
            24, 
            7, 
            17
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v2.CancelPurchaseExperience] = {
        description = "Cancel Purchase Experience Attempt from other user", 
        lastUpdated = {
            24, 
            7, 
            17
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v2.UnableToJoinViewDetails] = {
        description = "Unable to Join Experience View Details", 
        lastUpdated = {
            24, 
            7, 
            17
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v2.UnableToJoinCancel] = {
        description = "Unable to Join Experience Cancel", 
        lastUpdated = {
            24, 
            7, 
            17
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }
};