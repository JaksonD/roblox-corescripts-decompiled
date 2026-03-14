local l_Parent_0 = script.Parent.Parent.Parent;
local l_SupportedTelemetryBackends_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.SupportedTelemetryBackends;
local v2 = require(script.Parent.EventNames);
return {
    defaults = {
        throttlingThousandths = game:DefineFastInt("ContentFeedTelemetryThrottlingThousandths", 1000), 
        links = ""
    }, 
    [v2.ContentFeedCloseShortcutPressed] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v2.ContentFeedDeleteCtaPressed] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v2.ContentFeedExitCtaPressed] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v2.ContentFeedInspectCtaPressed] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v2.ContentFeedInspectItemPressed] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v2.ContentFeedImageLatency] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryStat
            }
        }
    }, 
    [v2.ContentFeedImageLoadFailed] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v2.ContentFeedMoreMenuButtonPressed] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v2.ContentFeedPlayButtonPressed] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v2.ContentFeedPostViewed] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v2.ContentFeedReportCtaPressed] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v2.ContentFeedShareCtaPressed] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v2.ContentFeedVideoLatency] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryStat
            }
        }
    }, 
    [v2.ContentFeedVideoLoadFailed] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }
};