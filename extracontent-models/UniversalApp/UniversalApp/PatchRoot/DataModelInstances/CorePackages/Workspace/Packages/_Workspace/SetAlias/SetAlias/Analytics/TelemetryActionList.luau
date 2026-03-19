local l_script_FirstAncestor_0 = script:FindFirstAncestor("SetAlias");
local v1 = require(script.Parent.Enums.EventNames);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_SupportedTelemetryBackends_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.SupportedTelemetryBackends;
return {
    defaults = {
        throttlingThousandths = game:DefineFastInt("SetAliasAnalyticsThrottlingThousandths", 1000), 
        links = ""
    }, 
    [v1.CustomizeNameLoadingStage] = {
        description = "Set Alias View Opened", 
        lastUpdated = {
            24, 
            6, 
            10
        }, 
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryStat, 
                dynamicCustomFields = {
                    status = function(v4) --[[ Line: 20 ]] --[[ Name: status ]]
                        return v4;
                    end
                }
            }
        }
    }
};