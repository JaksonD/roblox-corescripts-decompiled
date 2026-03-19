local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Dash);
local l_SupportedTelemetryBackends_0 = require(l_CorePackages_0.Workspace.Packages.SocialLuaAnalytics).Analytics.Enums.SupportedTelemetryBackends;
local v3 = require(script.Parent.EventNames);
local function v5(v4) --[[ Line: 8 ]]
    if v4 then
        return "True";
    else
        return "False";
    end;
end;
local l_identity_0 = v1.identity;
return {
    defaults = {
        throttlingThousandths = game:DefineFastInt("ShareLinksAnalyticsThrottlingThousandths", 10000), 
        links = ""
    }, 
    [v3.ShareLinkLatency] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryStat, 
                dynamicCustomFields = {
                    linkStatus = l_identity_0, 
                    linkType = l_identity_0
                }
            }
        }
    }, 
    [v3.ShareLinkResolveLink] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter, 
                dynamicCustomFields = {
                    linkStatus = l_identity_0, 
                    linkType = l_identity_0
                }
            }
        }
    }, 
    [v3.StaticShareLinkLatency] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryStat, 
                dynamicCustomFields = {
                    staticLinkType = l_identity_0, 
                    didSucceed = v5
                }
            }
        }
    }, 
    [v3.StaticShareLinkResolveLink] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter, 
                dynamicCustomFields = {
                    staticLinkType = l_identity_0, 
                    didSucceed = v5
                }
            }, 
            {
                type = l_SupportedTelemetryBackends_0.EventIngest, 
                dynamicCustomFields = {
                    staticLinkType = l_identity_0, 
                    linkId = l_identity_0, 
                    extraProps = l_identity_0, 
                    didSucceed = v5
                }
            }
        }
    }
};