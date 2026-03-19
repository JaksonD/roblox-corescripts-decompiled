local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfileBackground");
local v1 = require(script.Parent.Enums.EventNames);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_SupportedTelemetryBackends_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.SupportedTelemetryBackends;
return {
    defaults = {
        throttlingThousandths = game:DefineFastInt("EditProfileBackgroundAnalyticsThrottlingThousandths", 1000), 
        links = ""
    }, 
    [v1.EditProfileBackgroundOpened] = {
        description = "Edit Profile Background Page Opened", 
        lastUpdated = {
            25, 
            7, 
            30
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v1.EditProfileBackgroundLoadingStage] = {
        description = "Edit Profile Background Loading Stage", 
        lastUpdated = {
            25, 
            7, 
            30
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryStat, 
                dynamicCustomFields = {
                    status = function(v4) --[[ Line: 29 ]] --[[ Name: status ]]
                        return v4;
                    end
                }
            }
        }
    }, 
    [v1.BackgroundSelected] = {
        description = "Background Selected", 
        lastUpdated = {
            25, 
            7, 
            30
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter, 
                dynamicCustomFields = {
                    backgroundId = function(v5) --[[ Line: 43 ]] --[[ Name: backgroundId ]]
                        return v5;
                    end
                }
            }
        }
    }, 
    [v1.EditProfileBackgroundFailure] = {
        description = "Edit Profile Background Failure", 
        lastUpdated = {
            25, 
            8, 
            4
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter, 
                dynamicCustomFields = {
                    errorType = function(v6) --[[ Line: 57 ]] --[[ Name: errorType ]]
                        return v6;
                    end, 
                    errorCode = function(v7) --[[ Line: 60 ]] --[[ Name: errorCode ]]
                        return v7;
                    end
                }
            }
        }
    }
};