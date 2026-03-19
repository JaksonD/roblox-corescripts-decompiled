local l_TelemetryService_0 = game:GetService("TelemetryService");
local v1 = {
    "addOSInfo", 
    "addSessionInfo", 
    "addSessionId"
};
local v2 = {
    eventName = "PlayWithRewardAdRequested", 
    backends = {
        "EventIngest", 
        "Points"
    }, 
    throttlingPercentage = game:DefineFastInt("PlayWithRewardAdRequestedTelemetryThrottleHundredthsPercent", 0), 
    lastUpdated = {
        25, 
        9, 
        24
    }, 
    description = "        This is fired when a Play with Reward ad is requested.\n    "
};
local v3 = {
    eventName = "PlayWithRewardAdReceived", 
    backends = {
        "EventIngest", 
        "Points"
    }, 
    throttlingPercentage = game:DefineFastInt("PlayWithRewardAdReceivedTelemetryThrottleHundredthsPercent", 0), 
    lastUpdated = {
        25, 
        9, 
        24
    }, 
    description = "        This is fired when a Play with Reward ad is received.\n    "
};
local v4 = {
    eventName = "PlayWithRewardButtonShown", 
    backends = {
        "EventIngest", 
        "Points"
    }, 
    throttlingPercentage = game:DefineFastInt("PlayWithRewardButtonShownTelemetryThrottleHundredthsPercent", 0), 
    lastUpdated = {
        25, 
        9, 
        24
    }, 
    description = "        This is fired when a Play with Reward button is shown on an EDP.\n    "
};
local v5 = {
    eventName = "PlayWithRewardButtonClicked", 
    backends = {
        "EventIngest", 
        "Points"
    }, 
    throttlingPercentage = game:DefineFastInt("PlayWithRewardButtonClickedTelemetryThrottleHundredthsPercent", 0), 
    lastUpdated = {
        25, 
        9, 
        24
    }, 
    description = "        This is fired when a Play with Reward button is clicked on an EDP.\n    "
};
local v6 = {
    eventName = "PlayWithRewardAdPlaybackAttempted", 
    backends = {
        "EventIngest", 
        "Points"
    }, 
    throttlingPercentage = game:DefineFastInt("PlayWithRewardAdPlaybackAttemptedTelemetryThrottleHundredthsPercent", 0), 
    lastUpdated = {
        25, 
        9, 
        24
    }, 
    description = "        This is fired when a Play with Reward ad starts playing.\n    "
};
local v7 = {
    eventName = "PlayWithRewardAdPlaybackStopped", 
    backends = {
        "EventIngest", 
        "Points"
    }, 
    throttlingPercentage = game:DefineFastInt("PlayWithRewardAdPlaybackStoppedTelemetryThrottleHundredthsPercent", 0), 
    lastUpdated = {
        25, 
        9, 
        24
    }, 
    description = "        This is fired when a Play with Reward ad stops playing.\n    "
};
local v8 = {
    eventName = "PlayWithRewardGameJoinInitiated", 
    backends = {
        "EventIngest", 
        "Points"
    }, 
    throttlingPercentage = game:DefineFastInt("PlayWithRewardGameJoinInitiatedTelemetryThrottleHundredthsPercent", 0), 
    lastUpdated = {
        25, 
        9, 
        24
    }, 
    description = "        This is fired when a Play with Reward game join is initiated from an EDP.\n    "
};
local v9 = {
    eventName = "PlayWithRewardAdRequestedCounter", 
    backends = {
        "RobloxTelemetryCounter"
    }, 
    lastUpdated = {
        25, 
        9, 
        24
    }, 
    description = "\t        Counter for PlayWithRewardAdRequested events.\n\t    "
};
local v10 = {
    eventName = "PlayWithRewardAdReceivedCounter", 
    backends = {
        "RobloxTelemetryCounter"
    }, 
    lastUpdated = {
        25, 
        9, 
        24
    }, 
    description = "\t        Counter for PlayWithRewardAdReceived events with status.\n\t    "
};
local v11 = {
    eventName = "PlayWithRewardButtonShownCounter", 
    backends = {
        "RobloxTelemetryCounter"
    }, 
    lastUpdated = {
        25, 
        9, 
        24
    }, 
    description = "\t        Counter for PlayWithRewardButtonShown events.\n\t    "
};
local v12 = {
    eventName = "PlayWithRewardButtonClickedCounter", 
    backends = {
        "RobloxTelemetryCounter"
    }, 
    lastUpdated = {
        25, 
        9, 
        24
    }, 
    description = "\t        Counter for PlayWithRewardButtonClicked events.\n\t    "
};
local v13 = {
    eventName = "PlayWithRewardAdPlaybackAttemptedCounter", 
    backends = {
        "RobloxTelemetryCounter"
    }, 
    lastUpdated = {
        25, 
        9, 
        24
    }, 
    description = "\t        Counter for PlayWithRewardAdPlaybackAttempted events.\n\t    "
};
local v14 = {
    eventName = "PlayWithRewardAdPlaybackStoppedCounter", 
    backends = {
        "RobloxTelemetryCounter"
    }, 
    lastUpdated = {
        25, 
        9, 
        24
    }, 
    description = "\t        Counter for PlayWithRewardAdPlaybackStopped events with status.\n\t    "
};
local v15 = {
    eventName = "PlayWithRewardGameJoinInitiatedCounter", 
    backends = {
        "RobloxTelemetryCounter"
    }, 
    lastUpdated = {
        25, 
        9, 
        24
    }, 
    description = "\t        Counter for PlayWithRewardGameJoinInitiated events.\n\t    "
};
local v16 = {
    eventName = "PlayWithRewardAdReceivedSuccessfully", 
    backends = {
        "RobloxTelemetryStat"
    }, 
    lastUpdated = {
        25, 
        9, 
        24
    }, 
    description = "\t        Stats for successful PlayWithRewardAdReceived events.\n\t    "
};
return {
    logPlayWithRewardAdRequested = function(v17, v18) --[[ Line: 186 ]] --[[ Name: logPlayWithRewardAdRequested ]]
        -- upvalues: l_TelemetryService_0 (copy), v2 (copy), v1 (copy), v9 (copy)
        local v19 = {
            playWithRewardFlowId = v17, 
            universeId = v18
        };
        l_TelemetryService_0:LogEvent(v2, {
            standardizedFields = v1, 
            customFields = v19
        });
        l_TelemetryService_0:LogCounter(v9, {
            standardizedFields = v1, 
            customFields = {}
        }, 1);
    end, 
    logPlayWithRewardAdReceived = function(v20, v21, v22, v23, v24) --[[ Line: 206 ]] --[[ Name: logPlayWithRewardAdReceived ]]
        -- upvalues: l_TelemetryService_0 (copy), v3 (copy), v1 (copy), v10 (copy), v16 (copy)
        local v25 = {
            playWithRewardFlowId = v20, 
            universeId = v21, 
            isSuccessful = v22, 
            adAvailabilityResult = v23, 
            fetchLatencyMs = v24
        };
        l_TelemetryService_0:LogEvent(v3, {
            standardizedFields = v1, 
            customFields = v25
        });
        l_TelemetryService_0:LogCounter(v10, {
            standardizedFields = v1, 
            customFields = {
                isSuccessful = v22, 
                adAvailabilityResult = v23
            }
        }, 1);
        if v22 then
            l_TelemetryService_0:LogStat(v16, {
                standardizedFields = v1, 
                customFields = {
                    adAvailabilityResult = v23
                }
            }, v24);
        end;
    end, 
    logPlayWithRewardButtonShown = function(v26, v27) --[[ Line: 247 ]] --[[ Name: logPlayWithRewardButtonShown ]]
        -- upvalues: l_TelemetryService_0 (copy), v4 (copy), v1 (copy), v11 (copy)
        local v28 = {
            playWithRewardFlowId = v26, 
            universeId = v27
        };
        l_TelemetryService_0:LogEvent(v4, {
            standardizedFields = v1, 
            customFields = v28
        });
        l_TelemetryService_0:LogCounter(v11, {
            standardizedFields = v1, 
            customFields = {}
        }, 1);
    end, 
    logPlayWithRewardButtonClicked = function(v29, v30) --[[ Line: 267 ]] --[[ Name: logPlayWithRewardButtonClicked ]]
        -- upvalues: l_TelemetryService_0 (copy), v5 (copy), v1 (copy), v12 (copy)
        local v31 = {
            playWithRewardFlowId = v29, 
            universeId = v30
        };
        l_TelemetryService_0:LogEvent(v5, {
            standardizedFields = v1, 
            customFields = v31
        });
        l_TelemetryService_0:LogCounter(v12, {
            standardizedFields = v1, 
            customFields = {}
        }, 1);
    end, 
    logPlayWithRewardAdPlaybackAttempted = function(v32, v33) --[[ Line: 287 ]] --[[ Name: logPlayWithRewardAdPlaybackAttempted ]]
        -- upvalues: l_TelemetryService_0 (copy), v6 (copy), v1 (copy), v13 (copy)
        local v34 = {
            playWithRewardFlowId = v32, 
            universeId = v33
        };
        l_TelemetryService_0:LogEvent(v6, {
            standardizedFields = v1, 
            customFields = v34
        });
        l_TelemetryService_0:LogCounter(v13, {
            standardizedFields = v1, 
            customFields = {}
        }, 1);
    end, 
    logPlayWithRewardAdPlaybackStopped = function(v35, v36, v37) --[[ Line: 307 ]] --[[ Name: logPlayWithRewardAdPlaybackStopped ]]
        -- upvalues: l_TelemetryService_0 (copy), v7 (copy), v1 (copy), v14 (copy)
        local v38 = {
            playWithRewardFlowId = v35, 
            universeId = v36, 
            adPlaybackStatus = v37
        };
        l_TelemetryService_0:LogEvent(v7, {
            standardizedFields = v1, 
            customFields = v38
        });
        l_TelemetryService_0:LogCounter(v14, {
            standardizedFields = v1, 
            customFields = {
                adPlaybackStatus = v37
            }
        }, 1);
    end, 
    logPlayWithRewardGameJoinInitiated = function(v39, v40) --[[ Line: 328 ]] --[[ Name: logPlayWithRewardGameJoinInitiated ]]
        -- upvalues: l_TelemetryService_0 (copy), v8 (copy), v1 (copy), v15 (copy)
        local v41 = {
            playWithRewardFlowId = v39, 
            universeId = v40
        };
        l_TelemetryService_0:LogEvent(v8, {
            standardizedFields = v1, 
            customFields = v41
        });
        l_TelemetryService_0:LogCounter(v15, {
            standardizedFields = v1, 
            customFields = {}
        }, 1);
    end
};