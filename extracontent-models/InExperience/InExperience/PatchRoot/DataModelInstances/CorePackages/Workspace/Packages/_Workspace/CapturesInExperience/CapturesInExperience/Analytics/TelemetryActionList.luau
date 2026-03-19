local l_Parent_0 = script.Parent.Parent.Parent;
local l_SupportedTelemetryBackends_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.SupportedTelemetryBackends;
local v2 = require(script.Parent.EventNames);
return {
    defaults = {
        throttlingThousandths = game:DefineFastInt("CapturesTelemetryThrottlingThousandths", 1000), 
        links = ""
    }, 
    [v2.CapturesActivatedInGameMenu] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v2.CapturesActivatedChrome] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v2.CapturesCarouselOpened] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v2.CapturesCarouselVideoExpanded] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v2.CapturesCarouselVideoMuteButtonActivated] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v2.CapturesCarouselVideoShrank] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v2.CapturesDeactivatedInGameMenu] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v2.CapturesDeactivatedChrome] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v2.CapturesEntrypointActivated] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter, 
                dynamicCustomFields = {
                    entrypointType = function(v3) --[[ Line: 75 ]] --[[ Name: entrypointType ]]
                        return v3;
                    end
                }
            }
        }
    }, 
    [v2.CapturesEntrypointLatency] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryStat
            }
        }
    }, 
    [v2.CapturesLegacyVideoRecordingDuration] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryStat
            }
        }
    }, 
    [v2.CapturesPageOpenedInGameMenu] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v2.CapturesShareFromNonStandardServer] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v2.CapturesShareLatency] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryStat, 
                dynamicCustomFields = {
                    externalShareSource = function(v4) --[[ Line: 115 ]] --[[ Name: externalShareSource ]]
                        return v4;
                    end
                }
            }
        }
    }, 
    [v2.CapturesShareToastButtonActivated] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v2.CapturesVideoCaptureStarted] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter, 
                dynamicCustomFields = {
                    triggerType = function(v5) --[[ Line: 134 ]] --[[ Name: triggerType ]]
                        return v5;
                    end
                }
            }
        }
    }, 
    [v2.CapturesVideoCaptureStopped] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter, 
                dynamicCustomFields = {
                    triggerType = function(v6) --[[ Line: 146 ]] --[[ Name: triggerType ]]
                        return v6;
                    end
                }
            }
        }
    }, 
    [v2.ShareCaptureGenerateLinkFailed] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v2.ShareCapturePromptAccepted] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v2.ShareCapturePromptRejected] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v2.CapturePermissionsPromptAccepted] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v2.CapturePermissionsPromptRejected] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }, 
    [v2.CapturePermissionsPromptViewed] = {
        backendsList = {
            {
                type = l_SupportedTelemetryBackends_0.RobloxTelemetryCounter
            }
        }
    }
};