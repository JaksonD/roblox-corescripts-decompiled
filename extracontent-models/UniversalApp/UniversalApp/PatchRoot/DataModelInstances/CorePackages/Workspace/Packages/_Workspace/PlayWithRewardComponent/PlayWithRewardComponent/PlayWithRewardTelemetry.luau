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
    eventName = "PlayWithRewardBlackoutCurtain", 
    backends = {
        "EventIngest", 
        "Points"
    }, 
    throttlingPercentage = game:DefineFastInt("PlayWithRewardBlackoutCurtainTelemetryThrottleHundredthsPercent", 0), 
    lastUpdated = {
        26, 
        4, 
        3
    }, 
    description = "        This is fired when the Play with Reward blackout curtain state changes (shown, hidden, or cleaned up on unmount).\n    "
};
local v10 = {
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
local v11 = {
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
local v12 = {
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
local v13 = {
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
local v14 = {
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
local v15 = {
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
local v16 = {
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
local v17 = {
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
    logPlayWithRewardAdRequested = function(v18, v19) --[[ Line: 199 ]] --[[ Name: logPlayWithRewardAdRequested ]]
        -- upvalues: l_TelemetryService_0 (copy), v2 (copy), v1 (copy), v10 (copy)
        local v20 = {
            playWithRewardFlowId = v18, 
            universeId = v19
        };
        l_TelemetryService_0:LogEvent(v2, {
            standardizedFields = v1, 
            customFields = v20
        });
        l_TelemetryService_0:LogCounter(v10, {
            standardizedFields = v1, 
            customFields = {}
        }, 1);
    end, 
    logPlayWithRewardAdReceived = function(v21, v22, v23, v24, v25) --[[ Line: 219 ]] --[[ Name: logPlayWithRewardAdReceived ]]
        -- upvalues: l_TelemetryService_0 (copy), v3 (copy), v1 (copy), v11 (copy), v17 (copy)
        local v26 = {
            playWithRewardFlowId = v21, 
            universeId = v22, 
            isSuccessful = v23, 
            adAvailabilityResult = v24, 
            fetchLatencyMs = v25
        };
        l_TelemetryService_0:LogEvent(v3, {
            standardizedFields = v1, 
            customFields = v26
        });
        l_TelemetryService_0:LogCounter(v11, {
            standardizedFields = v1, 
            customFields = {
                isSuccessful = v23, 
                adAvailabilityResult = v24
            }
        }, 1);
        if v23 then
            l_TelemetryService_0:LogStat(v17, {
                standardizedFields = v1, 
                customFields = {
                    adAvailabilityResult = v24
                }
            }, v25);
        end;
    end, 
    logPlayWithRewardButtonShown = function(v27, v28, v29) --[[ Line: 260 ]] --[[ Name: logPlayWithRewardButtonShown ]]
        -- upvalues: l_TelemetryService_0 (copy), v4 (copy), v1 (copy), v12 (copy)
        local v30 = {
            playWithRewardFlowId = v27, 
            universeId = v28, 
            showState = v29
        };
        l_TelemetryService_0:LogEvent(v4, {
            standardizedFields = v1, 
            customFields = v30
        });
        l_TelemetryService_0:LogCounter(v12, {
            standardizedFields = v1, 
            customFields = {}
        }, 1);
    end, 
    logPlayWithRewardButtonClicked = function(v31, v32) --[[ Line: 281 ]] --[[ Name: logPlayWithRewardButtonClicked ]]
        -- upvalues: l_TelemetryService_0 (copy), v5 (copy), v1 (copy), v13 (copy)
        local v33 = {
            playWithRewardFlowId = v31, 
            universeId = v32
        };
        l_TelemetryService_0:LogEvent(v5, {
            standardizedFields = v1, 
            customFields = v33
        });
        l_TelemetryService_0:LogCounter(v13, {
            standardizedFields = v1, 
            customFields = {}
        }, 1);
    end, 
    logPlayWithRewardAdPlaybackAttempted = function(v34, v35) --[[ Line: 301 ]] --[[ Name: logPlayWithRewardAdPlaybackAttempted ]]
        -- upvalues: l_TelemetryService_0 (copy), v6 (copy), v1 (copy), v14 (copy)
        local v36 = {
            playWithRewardFlowId = v34, 
            universeId = v35
        };
        l_TelemetryService_0:LogEvent(v6, {
            standardizedFields = v1, 
            customFields = v36
        });
        l_TelemetryService_0:LogCounter(v14, {
            standardizedFields = v1, 
            customFields = {}
        }, 1);
    end, 
    logPlayWithRewardAdPlaybackStopped = function(v37, v38, v39) --[[ Line: 321 ]] --[[ Name: logPlayWithRewardAdPlaybackStopped ]]
        -- upvalues: l_TelemetryService_0 (copy), v7 (copy), v1 (copy), v15 (copy)
        local v40 = {
            playWithRewardFlowId = v37, 
            universeId = v38, 
            adPlaybackStatus = v39
        };
        l_TelemetryService_0:LogEvent(v7, {
            standardizedFields = v1, 
            customFields = v40
        });
        l_TelemetryService_0:LogCounter(v15, {
            standardizedFields = v1, 
            customFields = {
                adPlaybackStatus = v39
            }
        }, 1);
    end, 
    logPlayWithRewardGameJoinInitiated = function(v41, v42) --[[ Line: 342 ]] --[[ Name: logPlayWithRewardGameJoinInitiated ]]
        -- upvalues: l_TelemetryService_0 (copy), v8 (copy), v1 (copy), v16 (copy)
        local v43 = {
            playWithRewardFlowId = v41, 
            universeId = v42
        };
        l_TelemetryService_0:LogEvent(v8, {
            standardizedFields = v1, 
            customFields = v43
        });
        l_TelemetryService_0:LogCounter(v16, {
            standardizedFields = v1, 
            customFields = {}
        }, 1);
    end, 
    logPlayWithRewardBlackoutCurtainAction = function(v44, v45, v46) --[[ Line: 362 ]] --[[ Name: logPlayWithRewardBlackoutCurtainAction ]]
        -- upvalues: l_TelemetryService_0 (copy), v9 (copy), v1 (copy)
        local v47 = {
            playWithRewardFlowId = v44, 
            universeId = v45, 
            blackoutCurtainAction = v46
        };
        l_TelemetryService_0:LogEvent(v9, {
            standardizedFields = v1, 
            customFields = v47
        });
    end
};